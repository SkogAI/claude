# Features Research: Small Hours Games

**Domain:** Real-time multiplayer party game platform (Display + Phones architecture)
**Researched:** 2026-03-15
**Overall confidence:** HIGH (features derived from SPEC.md cross-referenced with Jackbox/AirConsole ecosystem)

---

## Table Stakes

Features users expect from a phone-as-controller party game platform. Missing any of these means the product feels broken or incomplete compared to Jackbox and AirConsole.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| Join via room code | Jackbox established this as the genre norm. Any friction here kills the product. | Low | 4-char codes in SPEC. Excluding I/O/S for legibility is a good call. |
| Join via QR scan | Expected at gatherings where someone doesn't want to type. Both Jackbox and AirConsole rely on this. | Low | Already in SPEC. Must be scannable from TV distance (~3m). |
| Zero download, zero account | Core value proposition of the genre. Any install/login step kills party momentum. | Low | SPEC is correct to exclude auth entirely. |
| Shared display screen | The genre-defining "big screen + phones" split. Without it, this is just a mobile game. | Medium | Split into `/host/:code` and `/player/:code` routes. |
| Lobby with player list | Players need to see who joined before starting. Absent = confusion about whether join worked. | Low | Ready status, avatar list — all in SPEC. |
| Player identity (no login) | Visual differentiation between players is necessary. Emoji/color avatars are the standard. | Low | Deterministic emoji from username hash is clever and sufficient. |
| Leaderboard / score display | After-game scoring is a social moment — the "who won" reveal is the emotional payoff of each game. | Low | In SPEC for quiz; should be consistent across all games. |
| Admin start/stop control | Someone has to orchestrate the room. Jackbox uses a "host" role with the game client; this platform uses a first-joiner admin. | Low | First-player-becomes-admin is fine for local play. |
| Reconnection handling | Phones lose Wi-Fi. If a dropped connection loses your spot, it breaks the experience. | Medium | SPEC mentions grace period. Server must hold player state for reconnect window. |
| Mobile-first UI | These are phone controllers. Any desktop-first layout breaks gameplay. | Medium | SPEC specifies mobile-first with safe area support. iOS notch handling is required. |
| Per-player private state | Card games are unplayable if hands are visible on the shared display. This is architectural, not cosmetic. | High | SPEC handles this with `SHITHEAD_YOUR_STATE` per-player messages — correct approach. |
| Multiple games in one session | The "party pack" model. One game is a demo; multiple games is a platform. | High | SPEC includes 5 content games + number guess template. |
| Smooth game-to-lobby-to-game flow | Players expect to return to lobby between games without rejoining. Drop-in/out mid-session is expected. | Medium | `RETURN_TO_LOBBY` message in SPEC handles this. |
| Rate limiting / abuse protection | Without it, one misbehaving player can break the room for everyone. | Medium | SPEC covers chat rate limiting and WS payload limits. |

---

## Differentiators

Features that are not expected by default but provide competitive advantage. Jackbox does not have all of these.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| Bot auto-fill for solo play | Lets a single player test games or play alone. Jackbox requires a minimum number of humans. | Medium | Spec auto-adds bot when only one human joins. Good for testing and single-player dev loops. |
| Game suggestion voting in lobby | Collective ownership of "what we play next" reduces host pressure and increases engagement. Jackbox does not have this — the host decides. | Medium | `SUGGEST_GAME` + `gameSuggestions` in SPEC. Genuinely differentiating for group dynamics. |
| Category voting for quiz | Players pick the trivia categories, not just the host. More buy-in from the group. | Medium | `CATEGORY_VOTE` in SPEC. Pairs well with game suggestion voting. |
| Power-ups in quiz | Adds strategic layer to what is otherwise pure recall trivia. Speed-based scoring + power-ups is more engaging than Jackbox's Trivia Murder Party variants. | Medium | Double Points, Fifty-Fifty, Time Freeze in SPEC. Good set to start with. |
| Speed-weighted scoring | Rewards reaction time, not just knowledge. Creates more competitive tension within each question window. | Low | Already in SPEC. Standard for digital quiz but more nuanced than flat right/wrong. |
| Streak tracking | Adds meta-game layer — consecutive correct answers feel rewarding. Visible streaks on display increase spectator engagement. | Low | In SPEC for quiz. Should surface on display screen prominently. |
| Deterministic emoji avatars | No upload required. Instant, consistent visual identity. Avoids the "who is purple square?" confusion of color-only systems. | Low | Username hash to emoji pool is the right call. Pool of 20 is sufficient for typical party size. |
| Social deduction (Spy Game) | Genre variety. Jackbox has social deduction in some packs (Fakin' It, etc.) but it is not universal. A word-based spy game distinguishes the platform's game mix. | High | 3+ players, clue-giving + word guessing in SPEC. Good counterpart to quiz and card games. |
| Cards Against Humanity style game | High social engagement ceiling at the right party. Content-sensitive but very popular. | Medium | 3-8 players, czar rotation, blind judging in SPEC. |
| Offline/cache fallback for quiz | Quiz still works when internet is spotty. AirConsole and Jackbox both require connectivity. | Medium | Local JSON cache from OpenTrivia DB in SPEC. Important for home LAN use cases. |
| Game extension base class | Not a user-visible feature but a platform multiplier — enables fast addition of new games. | Medium | `GameController` base class with tick/phase pattern. Essential for longevity. |
| Persistent game history + player stats | Cross-session identity without accounts. "You've won 12 games as 'Skogix'" is social glue. | Medium | JSONL log + per-username aggregates in SPEC. Only valuable if surfaced in lobby UI. |
| Language selection per room | Inclusivity for non-English rooms. Not present in most competitors without account settings. | Low | `SET_LANGUAGE` / `LANGUAGE_SET` in SPEC. Stored per room, not per player. |
| Admin transfer on disconnect | Host leaving doesn't break the room. Jackbox requires the host to hold the game client — this platform handles it in-session. | Low | Admin promotion after grace period in SPEC. Correct and necessary for longer sessions. |

---

## Anti-Features

Things to deliberately NOT build. These either add complexity without payoff, contradict the platform's architecture, or are known traps in this genre.

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| Native mobile app | Adds an App Store / Play Store install barrier, which destroys the "zero friction join" value prop. Jackbox is considering smart TV apps specifically because browser is already solved for their use case. | Web browser only. The phone opens a URL — done. |
| User accounts / authentication | Adds onboarding friction at exactly the worst moment (someone is trying to join a game at a party). Creates GDPR/data obligations. | Ephemeral sessions per room. Username is identity for the evening. |
| Persistent cross-session identity | Comes with auth, which is excluded above. Per-username stats work fine without session tokens — "Skogix" just means "whoever typed Skogix tonight." | Username-keyed stats with no auth. Accept the collision edge case — it is inconsequential at party scale. |
| Streaming / remote play over internet | The Display + Phones model assumes co-location. Latency, NAT traversal, and TURN servers for remote play are an entirely different problem set. | Optimize for local network (same subnet). Document as in-home / local LAN use. |
| Real-time leaderboard during long multi-round games | Mid-game rank shifts are distracting and anxiety-inducing in social settings. Jackbox learned this — they show score gates, not continuous standings. | Show standings at natural phase boundaries (between questions, end of round). |
| Player-created custom content pipeline | CAH-style card uploads, user quiz questions, etc. require moderation, storage, and abuse handling. Not warranted at this scale. | Use curated static card sets and OpenTrivia DB. Add content via config/data files, not player UI. |
| Spectator / audience mode | Jackbox's audience mode supports up to 10,000 for streamer events. For local gatherings of 5-12 people, there are no spectators — everyone plays. Adds significant complexity for a use case that does not exist in this platform's target scenario. | Everyone who joins is a player. Bot fills the gap for solo testing. |
| Binary WebSocket / MessagePack encoding | Premature optimization. At party game scale (sub-20 players, 100ms ticks), JSON overhead is negligible. Binary encoding adds debugging complexity and parsing overhead in browser JS. | JSON WebSocket messages throughout. Profile only if tick latency becomes an observed problem. |
| Server-side rendering | The platform is state-heavy and tick-driven. SSR adds hydration complexity for no SEO benefit (this is not a public web page). | SPA with WebSocket-driven state. HTTP only for management/health endpoints. |
| Per-player sound settings persistence | Overly complex. iOS auto-mutes anyway. | Single mute toggle per device, not persisted across sessions. |

---

## Feature Dependencies

```
Room System (room code, lifecycle)
  └── WebSocket Connection Management
        ├── Lobby (player list, ready, chat, QR)
        │     ├── Game Suggestion Voting
        │     ├── Category Voting (quiz only)
        │     └── Admin Controls (start, remove, language)
        ├── Player Identity (username, emoji avatar, admin flag)
        │     └── Bot System (auto-fill, auto-remove)
        └── Game Routing (MINI_GAME_STARTING redirect)
              ├── GameController Base Class (tick, phase, handlers)
              │     ├── Quiz Game
              │     │     ├── OpenTrivia DB + Local Cache
              │     │     ├── Power-ups
              │     │     └── Speed Scoring + Streaks
              │     ├── Shithead Card Game
              │     │     └── Per-player Private State (requires per-player WS send)
              │     ├── Spy Game
              │     ├── Cards Against Humanity
              │     ├── Lyrics Guessing
              │     └── Number Guess (template / reference)
              └── Game History + Player Stats
                    └── REST API (/api/stats, /api/history)

Rate Limiting + Security (cross-cutting, applies to all HTTP + WS)
Docker Deployment (wraps entire platform)
```

Key dependency constraints:

- **Per-player private state** requires the WebSocket send layer to differentiate between broadcast (all clients) and individual (one client). This must be built at the connection layer, not bolted on per-game. Shithead and CAH both depend on it.
- **Game extension pattern** must be stable before adding games 3-6. Retrofitting the base class after multiple games are built is painful.
- **OpenTrivia cache** must be built before quiz goes to production. External API failure at a party is a fatal user experience failure.
- **Room lifecycle management** (4h idle, 30s empty, grace periods) must be correct before any other feature. A room that dies mid-game or leaks memory will break everything above it.
- **Admin transfer** depends on disconnect detection, which depends on WebSocket lifecycle events — must be reliable before any session can be trusted.

---

## Complexity Assessment

| Feature Area | Complexity | Primary Risk | Notes |
|---|---|---|---|
| Room system + lifecycle | Medium | State leak / premature cleanup | Grace period logic is subtle. Test idle timeout, empty timeout, and transition edge cases explicitly. |
| WebSocket 100ms tick | Low | CPU overhead with many rooms | At party scale (sub-20 players, sub-10 rooms) this is not a concern. Benchmark if deploying at scale. |
| Per-player private state | Medium | Forgetting to send individual vs broadcast | Architectural decision — build it right once at connection layer. All card games depend on it. |
| Quiz game + power-ups | Medium | OpenTrivia API rate limits / downtime | Cache is the mitigation. Test cold-cache path explicitly before launch. |
| Shithead card game | High | Play rule correctness, pile burn logic | Complex rule set with multiple edge cases (4-of-a-kind burn, face-down blind play, 2 as wild). Needs unit tests for game rules, not just integration tests. |
| Spy Game | Medium | Word pool quality, timing feel | Core mechanic is simple but game feel depends on round pacing. 20s guess window may feel long or short — needs playtesting. |
| Cards Against Humanity | Medium | Card content curation, czar UX | Rotating czar must be clear on display. Blind shuffling of submissions is important for fairness. |
| Bot behavior | Low-Medium | Bots making obviously dumb/impossible moves | Simple heuristics (swap lowest hand card, answer with delay) are sufficient. Do not over-engineer bot AI. |
| Game extension pattern | Medium | Fragile base class if over-abstracted | Keep tick() and phase management simple. Games should override minimally. Number Guess as reference is the right approach. |
| Reconnection + grace periods | Medium | Race conditions during reconnect | Test: player disconnects during active turn, during phase transition, and during lobby. |
| Player stats + game history | Low | Stats corruption if write fails | Append-only JSONL is resilient. Stats aggregation can be derived from log if needed. |
| Mobile UI (phone controller) | Medium | iOS safe area, notch, viewport height bugs | iOS treats vh differently than Android. Test on real iOS device, not just browser devtools. |
| Docker + host networking | Low | HTTPS required for iOS WebSocket | iOS Safari requires WSS (secure WebSocket). Test HTTPS path early, not as a post-launch fix. |

---

## Sources

- [The Jackbox Party Pack — Wikipedia](https://en.wikipedia.org/wiki/The_Jackbox_Party_Pack) — genre history and feature baseline
- [How Audience Play-Along Differs In Each Jackbox Game](https://www.jackboxgames.com/blog/how-audience-play-along-differs-in-each-jackbox-game) — audience mode design reference (and why we exclude it)
- [AirConsole — Cloud-based video game console](https://www.airconsole.com/) — competitor pattern reference
- [Jackbox Games CTO reflects on 10 years of Jackbox Party Packs](https://www.shacknews.com/article/135355/jackbox-party-pack-10-gdc-2023-interview) — design evolution insights
- [Show HN: Gaming Couch – local multiplayer party game platform](https://news.ycombinator.com/item?id=46344573) — indie competitor and community discussion
- [How to Successfully Create a Reconnect Ability in Multiplayer Games](https://www.getgud.io/blog/how-to-successfully-create-a-reconnect-ability-in-multiplayer-games/) — reconnection best practices
- SPEC.md and PROJECT.md — primary source for all platform-specific feature decisions
