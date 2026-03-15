# Pitfalls Research: Small Hours Games

**Domain:** Real-time multiplayer party game platform (WebSocket, Display + Phones)
**Researched:** 2026-03-15
**Overall confidence:** HIGH (confirmed against official Node.js docs, MDN, OWASP, multiple verified sources)

---

## WebSocket & Real-time

### CRITICAL: setInterval tick drift under load

**What goes wrong:** `setInterval` in Node.js does not guarantee execution at the specified interval. When the event loop is busy (JSON serialization, synchronous room iteration, or I/O callbacks), timer callbacks pile up and fire late or skip. At 100ms intervals across many rooms, drift compounds — a room that should tick at t=1000ms may fire at t=1120ms, causing visible game state lag and phase timer desync (a 15s question phase runs 17s).

**Why it happens:** Node.js timers run in the timers phase of the event loop. Any synchronous work in a prior phase delays them. The `setInterval` issue tracking shows acknowledged slippage in production: https://github.com/nodejs/node/issues/21822

**Consequences:** Phase transitions fire late. Speed-based scoring is unfair. Players see timers frozen then jump. In the worst case, rapid-fire game phases overlap.

**Prevention:**
- Track wall-clock elapsed time inside the tick callback (`Date.now()` delta), not iteration count
- Phase timers must use `startTime + duration <= Date.now()` comparisons, not a decrement counter
- Keep tick callbacks non-blocking: no synchronous file I/O, no heavy computation inline
- Offload any JSON serialization work to minimize event loop pressure per tick

**Detection:** Log tick actual vs expected interval. Alert if drift exceeds 20ms. Instrument with `performance.now()` pairs.

**Phase address:** Foundation/Core WebSocket layer. Bake the time-based phase pattern into the `GameController` base class before any game is built on top of it.

---

### CRITICAL: Full state broadcast on every tick, all rooms simultaneously

**What goes wrong:** Broadcasting the complete game state JSON to all sockets every 100ms is an O(rooms × players × state_size) operation. With 5 active rooms of 6 players each, every 100ms produces 30 JSON serializations and WS frame writes. As room count grows, this creates a CPU spike pattern on the event loop. The `ws` library's broadcast performance issue confirms synchronous iteration over all sockets blocks for the duration: https://github.com/websockets/ws/issues/617

**Why it happens:** The natural implementation iterates all sockets and sends the same payload. Each `ws.send()` call is queued but the serialization is synchronous before the send.

**Consequences:** Event loop stalls. Timer drift (see above). Mobile clients with weaker radios miss frames. At the 512MB/1CPU Docker constraint, this is a real ceiling.

**Prevention:**
- Pre-serialize the broadcast JSON once per tick, not once per socket: `const payload = JSON.stringify(state); room.sockets.forEach(s => s.send(payload));`
- Only broadcast if state actually changed from the previous tick (dirty flag per room)
- Player-specific state (Shithead card hands) must be sent individually only when that player's state changes, not on every tick
- Keep game state objects small — strip display-only computed fields and let clients derive them

**Detection:** Measure tick execution duration. Flag if a tick takes >20ms. Instrument with `process.hrtime()` pairs around the broadcast loop.

**Phase address:** Core architecture phase. Must be in the base `GameController` implementation, not retrofitted per game.

---

### Reconnection storm and duplicate identity

**What goes wrong:** A phone loses Wi-Fi for 3 seconds (common in gatherings), reconnects, and joins the same room — but the server already removed the player after the disconnect grace period. Or worse: two WebSocket connections exist for the same username simultaneously during a reconnect race, causing duplicate player state updates and two `GAME_STATE` broadcasts to the same client.

**Why it happens:** WebSockets offer no automatic reconnection. Each `ws.on('close')` is indistinguishable from a deliberate leave. Without a reconnection token, the server cannot tell "returning player" from "new join".

**Consequences:** Mid-game player count drops then spikes. Admin transferred prematurely. Cards dealt to a disconnected hand are orphaned in Shithead. Quiz streaks reset.

**Prevention:**
- Issue a session token (`JOIN_OK` payload) that persists client-side (sessionStorage, not localStorage — tabs should not share tokens)
- On reconnect with a valid token that matches an existing room slot, restore the player's state rather than treating as new join
- Implement a configurable grace period (recommended: 15-30s) before player is fully removed from active game
- Deduplicate by username within a room — reject a second connection with the same username unless the previous socket is confirmed closed

**Detection:** Log all disconnect/reconnect events with timestamps. Alert if the same username joins twice within 30s.

**Phase address:** Room management phase. Reconnection semantics must be defined before games are built — retrofitting is painful.

---

### Missing WebSocket heartbeat / zombie connection accumulation

**What goes wrong:** A phone screen locks or the user backgrounds the tab. The TCP connection appears open to the server but the client is unreachable. The room continues broadcasting to a zombie socket. Over a 4-hour session, zombie sockets accumulate and inflate player counts, delay room cleanup, and waste bandwidth.

**Why it happens:** TCP half-open states are not detected without application-level pings. The OS-level `TCP_KEEPALIVE` often has a 2-hour default timeout.

**Consequences:** Room player count shows stale players. Games start with ghost participants. Room cleanup timer never fires because "0 sockets" is never reached.

**Prevention:**
- Implement application-level ping/pong: server sends a ping every 30s, marks socket as dead if pong not received within 10s
- The `ws` library supports `ws.ping()` — use it, don't rely on the protocol-level keepalive alone
- On pong timeout, treat as graceful disconnect (trigger the same player-removal flow)

**Detection:** Monitor active socket count vs room player count. Alert on divergence.

**Phase address:** Core WebSocket infrastructure. Before any game logic.

---

## Room & State Management

### CRITICAL: Admin transfer race during game-in-progress

**What goes wrong:** The admin disconnects mid-game. The server promotes the next player as admin. The original admin reconnects 5 seconds later (within grace period) and sends a `RETURN_TO_LOBBY` message — which the server accepts because the reconnected socket has an admin session token. Now two players believe they are admin. Or the opposite: both promotion and reconnection fire simultaneously and the room enters an inconsistent state.

**Why it happens:** Admin state is per-player, checked at message-dispatch time. Reconnection restores the original player object without checking if admin has already been transferred.

**Consequences:** Admin commands rejected by the room. Two admins both try to start games. `REMOVE_PLAYER` messages come from an unauthorized socket.

**Prevention:**
- Admin status is a room-level property, not a player property. `room.adminUsername` is the single source of truth
- On reconnect, restore player state but check if `room.adminUsername === username` — do not assume the reconnecting player is still admin
- Admin transfer must be idempotent: if the original admin reconnects after transfer, they are a regular player
- All admin message handlers must re-check `room.adminUsername === message.senderUsername` at execution time, not at connection time

**Detection:** Invariant check: assert exactly one player in the room has admin capability at any tick. Log violations.

**Phase address:** Room management phase.

---

### Username collision and spoofing

**What goes wrong:** Two people arrive at the party and both type "Alex". The second join either silently overwrites the first player's socket reference (causing the first player's messages to be routed to the second), or both are admitted with the same username, causing game-state corruption in Shithead (two players receive the same hand) and scoring ambiguity in Quiz.

**Why it happens:** Sanitization (strip HTML, trim whitespace, max 20 chars) is not the same as uniqueness enforcement within a room.

**Consequences:** Card hands sent to the wrong person. Score attributed to the wrong player. Player stats written with ambiguous keys.

**Prevention:**
- Enforce per-room username uniqueness at `JOIN_LOBBY` time
- On collision: reject with a specific error code (`USERNAME_TAKEN`) and prompt the client to pick another
- Uniqueness check must be case-insensitive and strip leading/trailing whitespace before comparison
- The deterministic emoji avatar provides visual disambiguation but does not solve the server-side uniqueness requirement

**Detection:** Log all `JOIN_LOBBY` events. Alert if two active players share a username in the same room.

**Phase address:** Room management phase. Must be in place before any game uses `username` as a key.

---

### Room code collision probability underestimated

**What goes wrong:** 4-character codes from a ~30-character alphabet (excluding I, O, S, digits that look like letters) gives roughly 30^4 = 810,000 combinations — plenty for casual use. But if room cleanup is slow or rooms linger (4h idle timeout), the effective pool shrinks. At a public deployment with 100 simultaneous long-lived rooms, collisions become non-negligible for the subset of codes still active.

**Why it happens:** Code generation picks a random code and checks for active room conflicts. If the conflict check races with a concurrent room creation, two rooms can receive the same code.

**Consequences:** Players join the wrong room. In a worst case, a phone scanning a QR code joins a completely different party's game.

**Prevention:**
- Room creation must be atomic: generate code and insert into the rooms map in a single synchronous operation (Node.js single-thread helps here, but make it explicit)
- On code collision (the code already exists in the active rooms map), regenerate — do not fail silently
- Log the collision rate; if it exceeds 1%, review room cleanup aggressiveness

**Detection:** Log every code generation attempt and whether it collided. Alert on any collision.

**Phase address:** Room management phase.

---

### Game-to-lobby transition leaves orphaned game state

**What goes wrong:** A game ends. `RETURN_TO_LOBBY` is sent. The admin navigates back to lobby. One player's phone was slow to receive the redirect. Their client sends `SHITHEAD_PLAY_CARDS` against a game controller that has already been torn down. The server either crashes (null reference on the torn-down controller) or silently accepts the message against a new game's controller.

**Why it happens:** There is a window between "game declares over" and "all clients have acknowledged the transition". Messages in-flight from clients can arrive after the controller is disposed.

**Consequences:** Server crash or state corruption. Phantom card plays applied to the wrong game. Race between the last-place finisher's move and the admin's "return to lobby" command.

**Prevention:**
- Game controllers must remain in a `GAME_OVER` phase for a minimum drain period (recommend 5s) during which they accept incoming messages but ignore or log them as stale
- Tag all game messages with the current `gameId` — reject any message where `gameId` does not match the active game
- Room transitions must be a two-step protocol: `GAME_OVER` state → drain window → `RETURN_TO_LOBBY`

**Detection:** Log any game-specific message received during `GAME_OVER` phase.

**Phase address:** Base `GameController` design phase.

---

## Mobile UX

### CRITICAL: iOS audio requires user gesture — cannot be automated away

**What goes wrong:** Sound effects are wired to game events fired from WebSocket messages. When a question is revealed or a player scores, the code calls `audioContext.play()`. On iOS Safari, this silently fails because no user gesture has occurred on that specific audio context. The sound simply never plays. Auto-muting workaround is noted in the spec but the common mistake is implementing it incorrectly.

**Why it happens:** iOS requires that `AudioContext` be created or resumed inside a direct user interaction handler (tap, click). A WebSocket message callback is not a user gesture. This restriction has been in place since iOS 9 and is still enforced in 2025: https://developer.mozilla.org/en-US/docs/Games/Techniques/Audio_for_Web_Games

**Consequences:** All sounds silent on iOS. Players on iPhones miss audio cues (countdown beeps, correct answer sound). The dark neon aesthetic loses half its impact.

**Prevention:**
- Create the `AudioContext` on the very first user tap after page load (the "join game" button tap is ideal)
- Store the context reference globally and resume it on every subsequent user interaction: `audioContext.resume()`
- Pre-decode and buffer all sounds after context creation — do not decode on demand at play time
- Add a visible mute toggle so players can confirm sound is working or silence it deliberately
- Never call `audioContext.play()` from a WebSocket message handler directly — instead set a "pending sound" flag and play it on the next animation frame or user interaction

**Detection:** Test on a physical iOS device. iOS simulator does not accurately reproduce the restriction.

**Phase address:** Frontend audio system phase. Must be solved before sound effects are wired to game events.

---

### Safe area insets break phone controller layout on notched devices

**What goes wrong:** The phone controller UI places action buttons (answer choices, card play buttons) at the bottom of the viewport. On iPhone X and later (and many Android flagships), the home indicator and notch eat into that area. Buttons are partially hidden or have reduced tap targets, causing missed taps during timed actions (15s quiz questions).

**Why it happens:** Standard `padding-bottom: 20px` does not account for safe area insets. The CSS environment variables (`env(safe-area-inset-bottom)`) must be explicitly used with `viewport-fit=cover` in the meta tag.

**Consequences:** Players cannot tap answer buttons. Quiz answers submitted late or not at all. Card play buttons overlap the home indicator gesture area.

**Prevention:**
- Meta tag must include `viewport-fit=cover`: `<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">`
- All fixed bottom UI: `padding-bottom: calc(16px + env(safe-area-inset-bottom))`
- Test on physical devices with notches/dynamic islands, not just browser devtools device emulation
- The SPEC already flags safe area support — make it a first-class requirement in the component design phase, not an afterthought

**Detection:** Test on a physical iPhone with home indicator. Visual inspection with outline overlays.

**Phase address:** Mobile UI foundation phase. Set the CSS variables once in the global stylesheet before any game UI is built.

---

### Touch input latency and accidental double-tap

**What goes wrong:** Players rapidly tap answer buttons during a 15-second quiz countdown. A double-tap on a slow-to-respond UI triggers two `ANSWER` WebSocket messages. The second message arrives after the first is processed and may select a different answer (if the UI re-renders after the first tap) or trigger an error.

**Why it happens:** Touch events fire faster than UI re-renders. Without debouncing or button disable-after-tap, multiple messages are sent.

**Consequences:** Answer overridden by accidental second tap. Error messages confuse players. In Shithead, a double-tap on "Play Card" sends two `SHITHEAD_PLAY_CARDS` messages — the second one referencing cards already played.

**Prevention:**
- Disable action buttons immediately on first tap (before server confirmation)
- Re-enable only when the server's next `GAME_STATE` broadcast confirms the action was processed
- Apply `touch-action: manipulation` CSS to buttons to disable double-tap zoom behavior
- Server-side: validate that a player cannot submit the same action twice within a single phase (idempotency guard per player per phase)

**Detection:** Manual testing: rapid-tap all action buttons. Log duplicate action messages per player per phase.

**Phase address:** Game UI and message handling phases.

---

### QR code unreadable in dark neon theme

**What goes wrong:** The QR code for room join is rendered with the neon/glass color scheme — dark background, teal foreground. QR codes require sufficient contrast between the finder pattern and background. Dark-on-dark or colorized QR codes have reduced scanner compatibility, especially on older phone cameras.

**Why it happens:** Applying theme colors to the QR code element to match the aesthetic.

**Consequences:** Players cannot scan the QR code. Join by manual code entry becomes the only option, slowing the join flow.

**Prevention:**
- Always render QR codes with black modules on a white or very light background, regardless of surrounding theme
- Wrap the QR in a white padded container that provides the quiet zone (min 4 module widths on all sides)
- Test with multiple QR scanner apps (Google Lens, iOS Camera, dedicated scanners) under room lighting conditions

**Detection:** Physical test with phone cameras at arm's length.

**Phase address:** Lobby/display phase.

---

## Game Logic

### CRITICAL: Shithead card deal uses non-deterministic shuffle

**What goes wrong:** JavaScript's `Math.random()` is not a cryptographically random source, and a naive Fisher-Yates shuffle implementation may have biases in some JS engines. More critically: if the shuffle runs before all players have their sockets registered (during the `SETUP` phase), cards may be dealt to a player who then disconnects before receiving them, and the dealt hand is lost from the deck entirely.

**Why it happens:** Card deal and socket registration are separate events. The server may deal before confirming all target sockets are ready.

**Consequences:** Missing cards in the deck. Invalid game states mid-play. "No valid cards to play" errors that are actually server bugs.

**Prevention:**
- Deal only after all expected players have confirmed socket connections (not just username registration)
- Use a seeded shuffle so deals can be replicated/audited if debugging is needed
- Validate deck integrity post-deal: assert that all 52 cards are accounted for (3 hand + 3 face-up + 3 face-down) × n_players + remaining deck = 52
- Never discard cards from the tracking state — a "burned" pile should be recorded, not deleted

**Detection:** Post-deal invariant check: sum of all tracked card locations must equal 52.

**Phase address:** Shithead game implementation phase.

---

### Quiz speed scoring creates fairness problems with network latency variance

**What goes wrong:** Score is calculated as `f(time_to_answer)` where time is measured server-side as `answer_receipt_time - question_broadcast_time`. Players on the same local Wi-Fi with faster phones or lower-latency sockets consistently outperform players on older hardware, not because they're faster thinkers but because their WebSocket frames arrive 20-40ms earlier.

**Why it happens:** The 100ms tick means question broadcast time has up to 100ms of jitter already. Network transit adds more. Server-side receipt time penalizes phones with slower Wi-Fi radio or CPU.

**Consequences:** Systematic unfairness. Players perceive the game as rewarding phone quality, not knowledge.

**Prevention:**
- Include a `questionBroadcastTimestamp` in `GAME_STATE` and have clients report it back with their answer
- Calculate score from `client_answer_time - questionBroadcastTimestamp` as reported by client, then apply a sanity-check (reject answers claiming sub-50ms response — physiologically impossible)
- Alternatively, clamp scoring to coarse buckets (e.g., 0-3s = full points, 3-7s = half points, 7-15s = minimal points) to reduce network jitter impact

**Detection:** Log answer latencies per player. Alert on systematic per-player latency patterns (one player always 40ms ahead of all others).

**Phase address:** Quiz game implementation phase.

---

### Bot timing is predictably exploitable in social deduction games

**What goes wrong:** The Spy Game bot gives clues on a fixed simulated delay pattern. In a room where a human player has figured out the delay pattern, the bot becomes a giveaway — the spy can be identified by who responds at a mechanical cadence. More subtly, the bot's ~50% correct answer rate in Quiz is visible in the leaderboard, making it obvious which "player" is a bot.

**Why it happens:** Simple random delay implementations reuse the same range (500-1500ms) every time, creating a detectable pattern.

**Consequences:** Ruins social deduction game integrity. Bot presence becomes more obvious than intended (intended to feel like a real player).

**Prevention:**
- Vary bot delay with a non-uniform distribution (not flat random) — use a bell-curve-shaped delay centered around 2-4s with occasional fast/slow outliers
- Bot accuracy in Quiz should vary by question difficulty, not a flat 50%, to feel human
- In Spy Game, bot clues should be drawn from a small but non-trivial vocabulary per word category, not purely random

**Detection:** Playtest: can a player reliably identify the bot after 2 rounds? If yes, variance is insufficient.

**Phase address:** Bot system implementation phase.

---

## Deployment & Operations

### CRITICAL: iOS requires HTTPS for WebSocket — self-signed certs break it differently than expected

**What goes wrong:** The SPEC notes HTTPS is "optional, auto-detected from cert files" and "required for iOS WebSocket". The pitfall is that iOS Safari (and WKWebView) does not allow the user to bypass TLS errors for WebSocket connections. A self-signed certificate causes the WebSocket to fail silently — no browser error, no user prompt, just a failed connection. Players see a blank screen or a "connecting..." spinner forever.

**Why it happens:** HTTPS page loads show a cert warning that users can bypass. WebSocket connections (`wss://`) do not — they fail hard. This is documented by Apple: https://developer.apple.com/forums/thread/74152

**Consequences:** All iOS players cannot join. The gathering has iPhones. Game is unplayable for half the room.

**Prevention:**
- Use a real TLS certificate for production (Let's Encrypt via Certbot or Caddy auto-cert)
- For local development with iOS testing: use a local CA (mkcert) and install the root certificate on the test device
- Document the HTTPS setup requirement prominently in the deployment guide — it is not optional if iOS devices are expected
- The CI/CD deploy flow must validate that a valid cert is in place before the container starts

**Detection:** Test with a physical iPhone before any deployment. `wss://` connection failure on iOS is the canary.

**Phase address:** Deployment/infrastructure phase. Must be resolved before any external testing with iPhones.

---

### Docker resource limits cause OOM kills mid-game

**What goes wrong:** The SPEC specifies 512MB memory limit. Node.js heap + V8 overhead + WS frame buffers + in-memory question cache + JSONL game history can accumulate past this limit during peak play (multiple simultaneous rooms, large quiz question cache downloaded in background). Docker's OOM killer terminates the process mid-game with no graceful shutdown — all room state lost.

**Why it happens:** 512MB is a hard ceiling. Node.js does not automatically reduce its footprint when approaching the limit. Background question downloads expand the in-memory cache without eviction.

**Consequences:** All active games crash simultaneously. Players lose scores. Room codes become invalid. No `SERVER_RESTARTING` message is sent (OOM kill is immediate).

**Prevention:**
- Set `--max-old-space-size=400` in Node.js startup to trigger GC before hitting the Docker ceiling
- Implement an LRU eviction policy on the question cache with a hard maximum (e.g., 500 questions per category)
- Background question downloads must check available heap before starting
- Monitor `process.memoryUsage()` and emit a warning log when RSS exceeds 350MB
- Test with `stress` tool or multiple simultaneous quiz games to validate the memory ceiling

**Detection:** Add a `/health` response field for `memoryUsage.rss`. Alert when it exceeds 300MB.

**Phase address:** Infrastructure phase. Set the Node.js memory flag and LRU cache eviction before any production load testing.

---

### Graceful shutdown loses all in-progress game state

**What goes wrong:** The CI/CD deploy sends `SIGTERM` to the container. Docker's default shutdown timeout is 10 seconds. If 3 games are in progress, the server has 10 seconds to complete the shutdown sequence: flush JSONL history, send `SERVER_RESTARTING` to all clients, wait for acknowledgements, and close WebSocket connections gracefully. Under load, this window is too short and partial history writes corrupt the JSONL file.

**Why it happens:** JSONL append is non-atomic. A partial write (container killed mid-append) produces an invalid JSONL record. On restart, the history parser crashes on the malformed record.

**Consequences:** Game history loss. Corrupted history file prevents the history API from working. Player stats not updated for the interrupted game.

**Prevention:**
- Write game history to a `.tmp` file and atomically rename to the final path on completion (`fs.rename()` is atomic on Linux/same-filesystem)
- Increase Docker's stop timeout to 30s in `docker-compose.yml`: `stop_grace_period: 30s`
- On `SIGTERM`, immediately send `SERVER_RESTARTING` to all clients, stop accepting new messages, complete current game phase (or abort gracefully), then flush history
- Validate JSONL file integrity on startup: scan for truncated records and truncate the file at the last valid newline

**Detection:** Simulate a `docker stop` with active games. Verify history file is intact after restart.

**Phase address:** Infrastructure and persistence phase.

---

## Security

### No-auth + no origin validation = trivially abusable

**What goes wrong:** The WebSocket endpoint accepts any connection from any origin. A script kiddie at the party can open a browser console and write a loop that sends 1000 `CHAT_MESSAGE` messages per second to the room. The chat rate limiter (3/5s per player) is per-player — but the abuse vector is creating thousands of connections, each as a new username, each under the per-player limit.

**Why it happens:** Per-player rate limiting does not account for per-IP or per-connection amplification. The SPEC specifies 30 msg/sec per socket, but does not specify max simultaneous connections per IP.

**Consequences:** Chat floods. Room state broadcast queue backs up. Other players' messages are dropped. Server event loop stalled.

**Prevention:**
- Add per-IP connection rate limiting: max N concurrent WebSocket connections per IP (recommend 5-10 for a party game — one display + a few phones)
- Validate the `Origin` header during WebSocket upgrade to reject connections from unexpected origins
- The 30 msg/sec per-socket limit is good but needs to be paired with a circuit breaker: if a socket exceeds the limit, close the connection, not just drop the message
- Add a global room connection limit to prevent room flooding: max players + display + 2 spare connections per room code

**Detection:** Rate limiting violations should be logged with IP. Alert on any IP exceeding 10 simultaneous connections.

**Phase address:** Security/rate limiting phase. Must be in place before any public URL is shared.

---

### Username and chat input as XSS vector even without auth

**What goes wrong:** The spec mandates username sanitization (no HTML, max 20 chars). The actual pitfall is inconsistency: server sanitizes on `JOIN_LOBBY`, but chat messages (`CHAT_MESSAGE`) are sanitized differently or not at all. The username stored in the player object is clean, but if a chat message includes the raw text field without sanitization, a `<script>` tag in a chat message can execute in the Display client (which renders chat in the lobby).

**Why it happens:** Sanitization is applied at the point of username registration but not systematically at every text-rendering boundary.

**Consequences:** XSS on the shared display screen (TV). In a local party context, this is low severity but embarrassing. It also affects player-name rendering in game results.

**Prevention:**
- Treat every string from a WebSocket message as untrusted. Sanitize at the point of rendering, not just at the point of receipt
- Use a consistent sanitization library (e.g., `DOMPurify` on the frontend, a whitelist strip on the server) applied to all text fields: username, chat text, game clue text (Spy Game), guess text
- The server should strip HTML before storing or broadcasting any string field — not just usernames
- Content Security Policy headers (via Helmet) provide a defense-in-depth layer

**Detection:** Send `<img src=x onerror=alert(1)>` as a chat message from a test client. Verify it does not execute in the Display browser.

**Phase address:** Security foundation phase. Global sanitization must be in place before the chat or clue systems are built.

---

### Session token not bound to room — replay across rooms

**What goes wrong:** If a reconnection session token is implemented as a simple random string stored in `sessionStorage`, a player can copy that token from one tab and use it to claim another player's identity in a different room (or the same room after that player was removed). In a no-auth system, the token is the only identity assertion.

**Why it happens:** Session tokens are issued at join time and validated only by existence, not by binding to a specific `(roomCode, username)` tuple.

**Consequences:** A player removed by the admin can re-join claiming to be someone else. A player can steal another's card hand in Shithead.

**Prevention:**
- Session tokens must be bound to `(roomCode, username, joinTimestamp)` — validate all three on reconnect
- Tokens should be short-lived: invalidate if unused after the room's cleanup timeout (4h)
- Consider HMAC-signing the token with a server-side secret so the binding cannot be forged even if the token format is guessed

**Detection:** Attempt to use a token in a different room — server must reject. Test in integration testing.

**Phase address:** Room management / reconnection phase.

---

## Phase-Specific Warning Summary

| Phase Topic | Likely Pitfall | Mitigation |
|-------------|---------------|------------|
| GameController base class | Tick drift from event loop blocking | Time-based phase transitions, not counter-based |
| Room management | Admin race on reconnect | Room-level adminUsername, not player flag |
| Room management | Username collision | Per-room case-insensitive uniqueness check at JOIN |
| WebSocket infrastructure | Zombie socket accumulation | Application-level ping/pong, 30s interval |
| Frontend audio | iOS silent failure | AudioContext created on first user gesture only |
| Mobile UI foundation | Safe area button clipping | `viewport-fit=cover` + `env(safe-area-inset-bottom)` |
| Shithead implementation | Card deal before socket ready | Deal only after all player sockets confirmed |
| Quiz implementation | Latency-biased scoring | Timestamp in broadcast, client-reported receipt time |
| Deployment/infrastructure | OOM kill at 512MB | `--max-old-space-size=400`, LRU cache eviction |
| Deployment/infrastructure | iOS HTTPS silent WS failure | Real cert required, not self-signed |
| Security | Per-player rate limit bypass | Per-IP connection limit, Origin validation |
| Security | XSS via chat/clue text fields | Sanitize at render, not just at receipt |

---

## Sources

- Node.js Event Loop and Timer Documentation: https://nodejs.org/en/learn/asynchronous-work/event-loop-timers-and-nexttick
- setInterval drift issue (Node.js tracker): https://github.com/nodejs/node/issues/21822
- ws library broadcast performance issue: https://github.com/websockets/ws/issues/617
- MDN Audio for Web Games (iOS autoplay restrictions): https://developer.mozilla.org/en-US/docs/Games/Techniques/Audio_for_Web_Games
- Apple Developer Forums — iOS HTTPS/WKWebView WebSocket TLS: https://developer.apple.com/forums/thread/74152
- OWASP WebSocket Security Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/WebSocket_Security_Cheat_Sheet.html
- WebSocket Security Top Vulnerabilities: https://brightsec.com/blog/websocket-security-top-vulnerabilities/
- Node.js event loop blocking patterns: https://medium.com/voodoo-engineering/node-js-lots-of-ways-to-block-your-event-loop-and-how-to-avoid-it-b41f41deecf5
- Colyseus reconnection handling (reference pattern): https://docs.colyseus.io/faq
- Real-time card game architecture and server authority: https://developersvoice.com/blog/practical-design/realtime-card-games-net-architecture-guide/
- Node.js WebSocket scaling patterns: https://medium.com/@hadiyolworld007/node-js-scaling-websockets-without-burning-cpu-e9834b4e65c3
