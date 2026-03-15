# Small Hours Games

## What This Is

A real-time multiplayer party game platform for local gatherings. One shared screen (TV/monitor) acts as the "display" showing game state, and players join from their phones via a short room code or QR scan. The platform hosts multiple games — quiz, card games, social deduction, and more — all played through a WebSocket-driven Display + Phones architecture.

## Core Value

Players at a local gathering can instantly join a shared game from their phones and play together on a big screen — zero downloads, zero accounts, just a room code.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Room system with 4-char codes, lifecycle management, and capacity handling
- [ ] WebSocket-based real-time communication with 100ms tick server broadcasts
- [ ] Display role (shared TV screen) showing game state, lobby, leaderboards
- [ ] Player role (phone controller) with per-player state
- [ ] Player identity — username, deterministic emoji avatar, no auth
- [ ] Admin system — first player becomes admin, can start games/remove players/set language
- [ ] Bot system — auto-added for solo play, auto-removed when second human joins
- [ ] Lobby — player list, ready status, game suggestion voting, QR code, chat
- [ ] Quiz game — OpenTrivia DB, categories, difficulty, power-ups, scoring by speed
- [ ] Shithead card game — 52-card deck, swap phase, play rules, 2-6 players
- [ ] Spy Game — social deduction, clue-giving, word guessing, 3+ players
- [ ] Cards Against Humanity — card czar, black/white cards, blind judging, 3-8 players
- [ ] Lyrics Guessing game — match/guess song lyrics
- [ ] Number Guess — reference/template game for extension pattern
- [ ] Question cache — local JSON file caching from OpenTrivia DB
- [ ] Game history — append-only JSONL log of completed games
- [ ] Player statistics — aggregate stats per username
- [ ] REST API — health, rooms, stats, history, DB management endpoints
- [ ] Rate limiting — per-IP for routes, per-socket for WS, per-player for chat
- [ ] Security — Helmet headers, input sanitization, payload limits
- [ ] Frontend — responsive mobile-first, dark neon/glass theme, animations, sound
- [ ] Docker deployment with health checks, HTTPS support, CI/CD via GitHub Actions
- [ ] Game extension pattern — base class, tick system, phase management

### Out of Scope

- Native mobile apps — web-first, phones use browser
- User accounts/authentication — players are ephemeral per session
- Persistent player identity across sessions — by design
- Server-side rendering — SPA approach with WebSocket state

## Context

This is a ground-up rewrite of an existing party game platform. The SPEC.md captures the complete functional specification of what the system does. The architecture follows a Display + Phones pattern where all real-time communication flows through WebSockets with JSON messages. The server broadcasts game state on a 100ms tick, with player-specific state (like card hands) sent individually.

The platform supports multiple simultaneous rooms, each identified by a 4-character code (excluding confusable characters I, O, S). Games follow a common extension pattern with a base GameController class implementing tick-based phase management.

Key technical decisions from the spec:
- WebSocket JSON protocol (not binary, not REST polling)
- 100ms server tick (not client-driven)
- Ephemeral players (no auth, no persistence)
- Docker deployment with host networking on Linux
- OpenTrivia DB as external dependency for quiz content

## Constraints

- **No auth**: Players are ephemeral — no login, no accounts, by design
- **Local network optimized**: Designed for same-network play (display + phones)
- **WebSocket-only real-time**: All game state via WS, HTTP only for management APIs
- **Docker deployment**: Must run in container with health checks
- **External API dependency**: Quiz relies on OpenTrivia DB with cache fallback
- **Mobile-first UI**: Phone controllers must work on all screen sizes with safe areas

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| WebSocket with 100ms tick | Consistent state broadcast, simpler than event-driven | — Pending |
| No authentication | Party game — friction-free join is core value | — Pending |
| Deterministic emoji avatars | No upload needed, instant visual identity | — Pending |
| OpenTrivia DB + local cache | Free question source with offline fallback | — Pending |
| Game extension via base class | Standardized tick/phase pattern for all games | — Pending |
| Docker with host networking | Simplest for local network WebSocket access | — Pending |

---
*Last updated: 2026-03-15 after initialization*
