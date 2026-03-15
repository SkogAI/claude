# Research Summary: Small Hours Games

**Project:** Small Hours Games
**Domain:** Real-time multiplayer party game platform (Display + Phones architecture)
**Researched:** 2026-03-15
**Confidence:** HIGH

## Executive Summary

Small Hours Games is a Jackbox-style platform where a shared display (TV/monitor) runs alongside phone-as-controller clients — all connected over local Wi-Fi, zero accounts required, no native app install. Research confirms this architecture is well-understood and achievable with a lean Node.js stack. The core technical bet is a 100ms WebSocket tick loop broadcasting server-authoritative game state, which is the established pattern for this class of product. The spec is unusually precise, which means the main execution risk is not design decisions but implementation correctness: room lifecycle management, reconnection semantics, and the `GameController` extension pattern must be built right once before any games are layered on top.

The recommended stack is deliberately minimal: Node.js 22 LTS, Express 5, bare `ws` (not Socket.IO), Vite 6 + vanilla JS for the frontend, and `better-sqlite3` for stats. Every choice deliberately rejects complexity that would add overhead without payoff at the target scale of 5-20 players on a home server. This is a solo developer project with a complete spec — the right trade is iteration velocity and simplicity over architectural sophistication.

The highest-severity risks are operational, not feature-related. iOS requires real TLS for WebSocket connections (self-signed certs fail silently), the Docker memory ceiling (512MB) can trigger OOM kills if the question cache is unbounded, and the tick loop must use wall-clock time comparisons rather than counter-based phase management or timers will drift under load. These are not surprises — they are known failure modes with known fixes that must be built in from the start, not retrofitted.

---

## Key Findings

### Recommended Stack

The stack is a tight, dependency-light Node.js server with a vanilla JS frontend. Node.js 22 Active LTS is the clear runtime choice (Node 20 is now maintenance-only). Express 5 handles the thin HTTP surface (8 REST endpoints, static serving) and `ws@8` handles all real-time traffic — Socket.IO's rooms abstraction, polling fallback, and per-connection memory overhead are all unnecessary given the spec's custom room system and explicit WebSocket-only requirement.

On the frontend, Vite 6 with vanilla JS is preferred over React or Vue because the UI update model is purely `receive GAME_STATE → update DOM`. A virtual DOM framework adds overhead on every 100ms tick with no architectural benefit. The spec's dark neon/glass aesthetic is a CSS problem, not a component framework problem.

**Core technologies:**
- **Node.js 22 LTS:** Runtime — Active LTS with April 2027 maintenance window; `node:22-slim` Docker base avoids Alpine/musl native addon failures
- **Express 5.2.x:** HTTP layer — async error propagation, small REST surface; WS bypasses Express entirely on the hot path
- **ws@8:** WebSocket transport — 3KB/connection vs Socket.IO's 15KB; no abstraction overhead on 100ms tick broadcasts
- **Vite 6 + Vanilla JS:** Frontend build — multi-entry SPA, instant HMR, zero runtime framework overhead on phones
- **better-sqlite3@12.4.x:** Player stats — synchronous API is correct for post-game stat writes; handles queries (leaderboard) that flat JSON cannot
- **JSONL flat files:** Game history — append-only log, no library, survives restarts
- **Vitest@3.x:** Testing — native ESM, 10-20x faster than Jest in watch mode, shared Vite config
- **helmet@8 + express-rate-limit@7 + rate-limiter-flexible@9:** Security layer — HTTP headers, per-route limits, per-socket WS rate limiting

**Packages to avoid:** Socket.IO (memory + latency overhead), TypeScript (compile friction on solo project), Redis (infrastructure overkill for single-container), Alpine Docker image (musl breaks `better-sqlite3`), `ws-rate-limit` (9 years stale), `lowdb` (full-file load on every write).

---

### Expected Features

The genre baseline is established by Jackbox and AirConsole. Any missing table-stakes feature makes the product feel broken compared to the established norm.

**Must have (table stakes):**
- Join via 4-char room code — genre-defining; any friction kills party momentum
- Join via QR scan — required at gatherings; must be scannable at ~3m from TV
- Zero download, zero account — core value proposition; any install/login step kills it
- Shared display + phone controllers — the architectural split that defines the genre
- Lobby with player list and ready state — players need visual confirmation that join worked
- Reconnection with grace period — phones lose Wi-Fi; dropping mid-game breaks experience
- Mobile-first UI with iOS safe area handling — these are phone controllers
- Per-player private state (card hands) — Shithead and CAH are unplayable without it
- Admin start/stop/remove controls — first-joiner-as-admin is fine for local play
- Smooth game-to-lobby-to-game flow without rejoin — `RETURN_TO_LOBBY` message handles this

**Should have (differentiators over Jackbox):**
- Game suggestion voting in lobby — collective ownership of "what we play next"; Jackbox does not have this
- Category voting for quiz — players choose trivia categories, not just the host
- Power-ups in quiz (Double Points, Fifty-Fifty, Time Freeze) — strategic layer on top of recall
- Speed-weighted scoring with streak tracking — more competitive tension within question window
- Deterministic emoji avatars from username hash — instant visual identity, no upload required
- Bot auto-fill for solo play/testing — Jackbox requires minimum humans
- Persistent player stats + game history — cross-session identity without accounts
- Admin transfer on disconnect — host leaving must not break the room
- Language selection per room

**Defer to v2+:**
- Spectator/audience mode — no use case at local 5-12 person gatherings; Jackbox's audience mode targets 10k streamers
- Player-created custom content pipeline — requires moderation and abuse handling
- Remote/internet play — fundamentally different problem (NAT traversal, TURN servers)
- Native mobile app — destroys zero-friction join value proposition
- Binary WebSocket / MessagePack encoding — premature optimization at this scale

---

### Architecture Overview

The system is a single Node.js process with six runtime components separated by strict message-passing boundaries. The server side has: HTTP Server (REST + static files), WebSocket Server (same port, separate upgrade path), Room Manager (in-memory lifecycle), GameController instances (one per active game, pluggable per game type), and a Persistence Layer (JSON/JSONL/SQLite on disk). Clients split into Display (TV browser rendering shared state) and Player (phone browser sending actions and rendering per-player UI).

The tick loop is the heart of the system: every 100ms, `Room.tick()` calls `GameController.tick()`, which runs phase transition logic, then the Room broadcasts `GAME_STATE` to all sockets and optionally sends `PLAYER_STATE` messages to individual sockets for private information (card hands, spy word).

**Major components and build order:**
1. **HTTP Server + WS Transport** — project scaffolding, middleware, socket registry, message dispatch
2. **Room Manager** — room creation/lookup/cleanup, player list, admin logic, bot add/remove
3. **Lobby** — JOIN_LOBBY, chat, QR code, game suggestion voting, language selection
4. **Persistence Layer** — question cache (JSON), game history (JSONL), player stats (SQLite)
5. **GameController Base + Tick Loop** — base class contract, 100ms setInterval, broadcast loop, Number Guess reference implementation
6. **Games (ordered by complexity)** — Number Guess, Quiz, Spy Game, Cards Against Humanity, Shithead, Lyrics Guessing
7. **Frontend Polish** — neon/glass theme, animations, sound effects, offline detection

The `GameController` boundary is the critical abstraction: the Room calls `tick()`, `handleMessage()`, `getSharedState()`, and `getPlayerState()` — the controller never touches WebSocket sockets directly. This keeps game logic unit-testable without a live server and keeps new game authors focused on game logic only. Adding a new game requires exactly three changes: new `games/MyGame.js`, new `public/games/mygame.html`, and one line in the lobby game list.

---

### Critical Pitfalls

1. **Tick drift from counter-based phase timers** — `setInterval` in Node.js does not fire on exact intervals under event loop pressure. Phase transitions driven by an increment counter will drift, causing timers to visually freeze then jump. Prevention: track elapsed time with `Date.now()` deltas inside each tick callback. Bake this into the `GameController` base class before any game is built.

2. **iOS requires a real TLS certificate — self-signed certs fail silently for WebSocket** — iOS Safari does not show a cert bypass dialog for `wss://` connections. A self-signed cert causes the WebSocket to fail with no user-visible error. Players see an eternal spinner. Prevention: use Let's Encrypt (Caddy auto-cert) for production; use `mkcert` with an installed root cert for iOS device testing. This must be resolved before any iPhone testing.

3. **Reconnection storm and duplicate identity** — Without session tokens, a returning player is indistinguishable from a new join. Double-joins create two player records with the same username, routing game state to the wrong socket. Prevention: issue a `(roomCode, username, joinTimestamp)` HMAC-signed session token at `JOIN_OK` time; restore player state on reconnect with a valid token rather than treating as new join.

4. **Admin transfer race on reconnect** — Admin status stored on the player object causes a race: if the original admin reconnects after transfer, the server may restore their admin flag, creating two admins. Prevention: `room.adminUsername` is the single source of truth; admin check is re-evaluated at message-dispatch time, not at connection time.

5. **Docker OOM kill from unbounded question cache** — The 512MB container limit is a hard ceiling. Node.js does not self-limit heap growth. Background OpenTrivia DB downloads can push RSS past the limit, triggering an OOM kill that terminates all active games with no `SERVER_RESTARTING` message. Prevention: `--max-old-space-size=400` in Node.js startup args, LRU eviction on the question cache with a hard per-category cap.

6. **Shithead card deal before socket confirmation** — If cards are dealt during SETUP before all player sockets are confirmed open, a player who disconnects in that window receives a hand that is then orphaned — those cards vanish from the deck. Prevention: deal only after all expected player sockets confirm, and assert post-deal invariant: all 52 cards must be accounted for.

7. **Full state broadcast not pre-serialized** — Serializing `GAME_STATE` once per socket rather than once per tick creates O(players × rooms) JSON.stringify calls on every 100ms interval. Prevention: pre-serialize once per tick, pass the string to all socket sends.

---

## Implications for Roadmap

The build order is strictly dependency-driven. Each layer must be stable before the layer above it is built.

### Phase 1: Infrastructure Foundation
**Rationale:** Everything depends on the server being runnable, secure, and deployable. Docker and HTTPS must be proven before any phone testing can happen.
**Delivers:** A running Node.js + Express + `ws` server with Docker Compose, HTTPS (real cert or mkcert), Helmet, rate limiting middleware, static file serving.
**Avoids:** iOS WebSocket silent failure (HTTPS must be in place from day one); OOM kills (Node.js memory flag set in Dockerfile from the start).
**Research flag:** Standard patterns — skip phase research.

### Phase 2: WebSocket Transport + Connection Layer
**Rationale:** Room Manager and GameControllers need a working, correctly-instrumented WS layer to test against. The tick drift pitfall must be baked into the base pattern here.
**Delivers:** WS server attached to HTTP server, socket registry (socket → room → player mapping), message dispatch router, connection/disconnection/ping-pong lifecycle, per-socket rate limiting.
**Avoids:** Zombie socket accumulation (heartbeat built here), tick drift (wall-clock time pattern established here).
**Research flag:** Standard patterns — skip phase research.

### Phase 3: Room Manager
**Rationale:** The lobby and all games are built on top of Room Manager. Admin transfer, username uniqueness, reconnection semantics, and room code generation must be correct before anything else.
**Delivers:** 4-char room code generation (collision-safe, atomic), room create/lookup/join/leave, player list management, admin promotion (room-level single source of truth), grace period reconnection flow, idle cleanup (4h/30s), bot add/remove.
**Avoids:** Admin transfer race (room.adminUsername pattern), username collision (per-room case-insensitive uniqueness), reconnection storm (session token issuance at JOIN_OK), room code collisions (atomic insertion).
**Research flag:** Standard patterns, but reconnection token design warrants careful review during planning.

### Phase 4: Lobby
**Rationale:** Players need a working lobby before games matter. Lobby also validates the full WS round-trip (join → display update → chat → ready) before game complexity is added.
**Delivers:** JOIN_LOBBY, SET_READY, SUGGEST_GAME, CATEGORY_VOTE messages; LOBBY_UPDATE/PLAYER_JOINED/PLAYER_REMOVED broadcasts; chat with rate limiting; QR code generation; language selection; display screen at `/host/:code`, player screen at `/player/:code`.
**Avoids:** QR readability failure (white-on-dark rendering must be explicit); XSS via chat (sanitize at render, not just at receipt).
**Research flag:** Standard patterns — skip phase research.

### Phase 5: Persistence Layer
**Rationale:** Question cache must exist before Quiz is built; stats/history must exist before any game completes. Can be built in parallel with Lobby after Room Manager is stable.
**Delivers:** OpenTrivia DB fetch with local JSON cache (category-based, LRU-evicted), game history (JSONL append with atomic tmp-rename writes), player stats (better-sqlite3 with WAL mode), REST API endpoints (`/api/stats`, `/api/history`, `/api/questions/download`).
**Avoids:** OOM from unbounded cache (LRU eviction built here), JSONL corruption on shutdown (atomic write pattern).
**Research flag:** OpenTrivia DB API rate limits and category structure should be confirmed during phase planning.

### Phase 6: GameController Base Class + Tick Loop
**Rationale:** All games depend on this. Build once, correctly, before implementing any real game. The Number Guess reference validates the entire extension pattern end-to-end.
**Delivers:** `GameController` abstract base class with `tick()` / `handleMessage()` / `getSharedState()` / `getPlayerState()` contract; Room integrates 100ms setInterval calling controller.tick(); broadcast loop (pre-serialized shared state to all, individual state to named sockets); START_MINI_GAME → MINI_GAME_STARTING flow; RETURN_TO_LOBBY flow with drain window; Number Guess reference implementation.
**Avoids:** Tick drift (time-based phase transitions enforced in base class), full broadcast serialization cost (pre-serialize once per tick in base class), game-to-lobby orphaned messages (GAME_OVER drain window + gameId tagging).
**Research flag:** Standard patterns — skip phase research.

### Phase 7: Quiz Game
**Rationale:** First "real" game after Number Guess. Shared state only (no per-player private state), well-defined phases, depends on Persistence Layer (question cache). Validates the extension pattern under real complexity.
**Delivers:** Category voting, question fetch from cache, COUNTDOWN/QUESTION_ACTIVE/REVEAL phases, speed-weighted scoring with latency fairness (client-reported timestamp), power-ups (Double Points, Fifty-Fifty, Time Freeze), streak tracking, final leaderboard.
**Avoids:** Speed scoring latency bias (timestamp-in-broadcast pattern), cold cache failure (test cold-cache path before this phase is done).
**Research flag:** Power-up interaction edge cases may need planning-phase design review.

### Phase 8: Spy Game
**Rationale:** Social deduction — round-based, per-player role assignment (spy vs. team), no per-player private hand state (simpler than Shithead). Good intermediate complexity before card games.
**Delivers:** Word assignment, clue-giving phase, guess phase, round management, spy reveal.
**Avoids:** Bot timing predictability (non-uniform delay distribution for bot clues).
**Research flag:** Word pool quality and round pacing feel need playtest validation — flag for UAT.

### Phase 9: Cards Against Humanity
**Rationale:** Turn-based czar rotation, card deck management, blind submission shuffle. Introduces per-round "judge" role without the full per-player private hand complexity of Shithead.
**Delivers:** Card deck, czar rotation, black card prompt, blind submission shuffle, czar pick, scoring.
**Avoids:** Double-tap duplicate submission (disable-on-tap + idempotency guard per player per phase).
**Research flag:** Card content curation is a practical dependency — confirm card set source before planning.

### Phase 10: Shithead Card Game
**Rationale:** Most complex game: per-player private hands, play rule validation (2 as wild, 4-of-a-kind burn, face-down blind play), pile burn logic. Must come after the per-player private state pattern is proven.
**Delivers:** Full Shithead ruleset, private hand management, pile burn, face-up/face-down table cards, bot heuristics.
**Avoids:** Card deal before socket confirmation (deal-after-all-sockets-confirmed pattern), post-deal deck integrity assertion.
**Research flag:** Rule correctness for edge cases (4-of-a-kind burn with mixed cards, blind play to a burned pile) needs explicit unit test coverage — plan test suite alongside implementation.

### Phase 11: Lyrics Guessing
**Rationale:** Last game because the lyrics data source is TBD — this is the only game with an unresolved external dependency.
**Delivers:** Lyrics fetch/cache, display partial lyrics, guess input, scoring.
**Research flag:** Lyrics data source must be researched before this phase can be planned. Flag for `/gsd:research-phase`.

### Phase 12: Frontend Polish
**Rationale:** Core gameplay must be proven correct before investing in visual polish. Polish on a broken game wastes effort.
**Delivers:** Neon/glass theme applied consistently, CSS animations (fade transitions, confetti via `canvas-confetti`), sound effects (Web Audio API, iOS gesture unlock), offline detection, safe area / notch handling.
**Avoids:** iOS audio silent failure (AudioContext on first user gesture, never from WS handler), safe area button clipping (`viewport-fit=cover` + `env(safe-area-inset-bottom)`).
**Research flag:** Standard patterns — skip phase research.

---

### Phase Ordering Rationale

- Infrastructure and HTTPS come first because iOS testing is impossible without a real cert, and discovering this late means rebuilding the deployment setup after phone testing is already needed.
- Room Manager comes before Lobby because the lobby is entirely built on room semantics — reconnection tokens, admin logic, and username uniqueness must be correct before the lobby UI exposes them.
- Persistence Layer is parallel-eligible with Lobby (both depend only on Room Manager being stable) but the question cache is a hard dependency for Quiz, so it must complete before Phase 7.
- GameController Base comes before all games — retrofitting the tick pattern, broadcast model, or GAME_OVER drain window across five already-built games is a major risk.
- Games are ordered by ascending complexity: Number Guess (trivial reference) → Quiz (well-defined phases, shared state only) → Spy Game (role assignment) → CAH (czar rotation) → Shithead (per-player private hands, complex rules) → Lyrics (TBD data source).
- Frontend Polish is last by design. The spec's dark neon aesthetic is a dressing layer on top of correct game logic, not a prerequisite for it.

---

### Research Flags

Phases needing `/gsd:research-phase` during planning:
- **Phase 5 (Persistence):** OpenTrivia DB API — confirm category endpoint structure, rate limits, and terms before building the cache layer.
- **Phase 11 (Lyrics Guessing):** Lyrics data source is entirely unresolved. This phase cannot be planned until a source is identified (licensed API, static dataset, etc.).

Phases with well-documented patterns (skip research-phase):
- **Phase 1 (Infrastructure):** Docker + Node.js deployment patterns are fully standard.
- **Phase 2 (WebSocket Transport):** `ws` library patterns are well-documented.
- **Phase 3 (Room Manager):** Standard in-memory room lifecycle patterns.
- **Phase 6 (GameController Base):** The tick + phase state machine pattern is established; Number Guess validates it.
- **Phase 12 (Frontend Polish):** CSS safe area and Web Audio API patterns are well-documented.

Phases needing playtest validation (not code research):
- **Phase 8 (Spy Game):** Round pacing and bot clue quality need human playtest, not API research.
- **Phase 10 (Shithead):** Rule edge cases need explicit unit test planning, not research.

---

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | All package versions verified on npm; Node.js release schedule confirmed; Docker recommendation confirmed by Snyk |
| Features | HIGH | Derived from SPEC.md cross-referenced against Jackbox/AirConsole ecosystem; table stakes and anti-features well-established |
| Architecture | HIGH | Patterns confirmed by Colyseus docs (room-session model), Hathora architecture reference, and direct Jackbox-style framework analysis |
| Pitfalls | HIGH | All critical pitfalls confirmed against official sources: Node.js issue tracker, MDN, Apple Developer Forums, OWASP |

**Overall confidence:** HIGH

### Gaps to Address

- **Lyrics data source:** No decision made. Options include a licensed API (Musixmatch, Genius), a static Creative Commons lyrics dataset, or user-submitted lyrics via config file. This is a hard dependency for Phase 11 and should be resolved during overall planning, not deferred to the phase.
- **Question cache LRU eviction policy:** The 500-questions-per-category cap is a starting recommendation. The actual ceiling depends on how many categories are pre-cached and available heap. Should be validated against Node.js memory profiling during Phase 5.
- **Bot AI quality threshold:** The research flags that bots should not be obviously identifiable after 2 rounds. Whether the non-uniform delay distribution achieves this requires playtest, not further research. Flag for UAT acceptance criteria.
- **HTTPS certificate provisioning in CI/CD:** The spec mentions "auto-detected from cert files." The actual provisioning flow (Caddy reverse proxy, Certbot, or mkcert for local) needs a concrete decision before Phase 1 is planned.

---

## Sources

### Primary (HIGH confidence)
- SPEC.md and PROJECT.md — primary source for all platform-specific decisions
- [Node.js Releases — nodejs.org](https://nodejs.org/en/about/previous-releases) — Active LTS status
- [Express 5 Now Default — expressjs.com](https://expressjs.com/2025/03/31/v5-1-latest-release.html) — version status
- [ws npm package — npmjs.com](https://www.npmjs.com/package/ws) — version 8.18+
- [helmet npm — npmjs.com](https://www.npmjs.com/package/helmet) — version 8.1.0
- [better-sqlite3 npm — npmjs.com](https://www.npmjs.com/package/better-sqlite3) — version 12.4.1
- [Vite 6.0 announcement — vite.dev](https://vite.dev/blog/announcing-vite6) — version status
- [Choosing the best Node.js Docker image — snyk.io](https://snyk.io/blog/choosing-the-best-node-js-docker-image/) — slim vs alpine
- [MDN Audio for Web Games](https://developer.mozilla.org/en-US/docs/Games/Techniques/Audio_for_Web_Games) — iOS AudioContext restriction
- [Apple Developer Forums — iOS WS TLS](https://developer.apple.com/forums/thread/74152) — silent WSS failure
- [OWASP WebSocket Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/WebSocket_Security_Cheat_Sheet.html)
- [Colyseus Documentation](https://colyseus.io/) — room-session model as industry standard
- [Node.js setInterval drift issue](https://github.com/nodejs/node/issues/21822) — timer drift acknowledgement
- [ws broadcast performance issue](https://github.com/websockets/ws/issues/617) — synchronous broadcast cost

### Secondary (MEDIUM confidence)
- [Jackbox Party Pack — Wikipedia](https://en.wikipedia.org/wiki/The_Jackbox_Party_Pack) — genre baseline
- [Jackbox CTO interview — Shacknews](https://www.shacknews.com/article/135355/jackbox-party-pack-10-gdc-2023-interview) — design evolution
- [AirConsole — airconsole.com](https://www.airconsole.com/) — competitor pattern reference
- [Scalable WebSocket Architecture — Hathora](https://blog.hathora.dev/scalable-websocket-architecture/) — stateful router patterns
- [Party Box Framework — hammre/party-box](https://github.com/hammre/party-box) — Jackbox-style architecture reference
- [Vitest vs Jest — betterstack.com](https://betterstack.com/community/guides/scaling-nodejs/vitest-vs-jest/)
- [WebSockets vs Socket.IO — ably.com](https://ably.com/topic/socketio-vs-websocket)
- [How to Successfully Create Reconnect Ability — getgud.io](https://www.getgud.io/blog/how-to-successfully-create-a-reconnect-ability-in-multiplayer-games/)

---
*Research completed: 2026-03-15*
*Ready for roadmap: yes*
