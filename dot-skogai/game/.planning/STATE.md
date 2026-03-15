# State: Small Hours Games

**Last updated:** 2026-03-15
**Session:** Roadmap creation

## Project Reference

**Core value:** Players at a local gathering can instantly join a shared game from their phones and play together on a big screen — zero downloads, zero accounts, just a room code.

**Current focus:** Phase 1 — Infrastructure Foundation

## Current Position

**Phase:** 1 — Infrastructure Foundation
**Plan:** None started
**Status:** Not started
**Next action:** Run `/gsd:plan-phase 1` to generate the execution plan

```
Progress: [░░░░░░░░░░░░░░░░░░░░░░░░] 0/12 phases complete
```

## Phase Status

| Phase | Name | Status |
|-------|------|--------|
| 1 | Infrastructure Foundation | Not started |
| 2 | WebSocket Transport | Not started |
| 3 | Room Manager | Not started |
| 4 | Lobby | Not started |
| 5 | Persistence Layer | Not started |
| 6 | Game Engine | Not started |
| 7 | Quiz Game | Not started |
| 8 | Spy Game | Not started |
| 9 | Cards Against Humanity | Not started |
| 10 | Shithead Card Game | Not started |
| 11 | Lyrics Guessing | Not started |
| 12 | Frontend Polish | Not started |

## Performance Metrics

- Phases complete: 0/12
- Plans complete: 0/?
- Requirements delivered: 0/83

## Accumulated Context

### Key Decisions
- Stack: Node.js 22 LTS, Express 5, bare `ws@8`, Vite 6 + vanilla JS, better-sqlite3
- No TypeScript — compile friction outweighs benefit on solo project
- No Socket.IO — custom room system makes its abstractions redundant
- Docker with host networking on Linux for local network WebSocket access
- 100ms tick loop using wall-clock `Date.now()` deltas (not counter-based) to prevent drift

### Critical Pitfalls (from research — must not skip)
- iOS requires real TLS cert — self-signed causes silent WS failure; HTTPS must be in from Phase 1
- Node.js memory flag `--max-old-space-size=400` must be set in Dockerfile from Phase 1
- Phase transitions must use `Date.now()` deltas in GameController base (Phase 6) — bake in before any games
- Pre-serialize GAME_STATE once per tick (not per socket) — bake into base class in Phase 6
- Shithead deal must occur only after all player sockets are confirmed; assert 52-card invariant post-deal
- Admin status stored as `room.adminUsername` (single source of truth) — not on player object

### Research Flags
- **Phase 5:** Confirm OpenTrivia DB category endpoint structure and rate limits before building cache layer
- **Phase 11:** Lyrics data source is entirely unresolved — must be decided before Phase 11 can be planned. Options: Musixmatch API, Genius API, static CC dataset, user-submitted config

### Todos
- [ ] Decide HTTPS certificate provisioning strategy (Caddy, Certbot, or mkcert for local) before Phase 1 is planned
- [ ] Resolve lyrics data source before Phase 11

## Session Continuity

### To Resume
1. Read this file to orient
2. Check current phase status in the Progress table above
3. Run `/gsd:plan-phase N` for the current phase to generate plans

### Files
- `.planning/ROADMAP.md` — phase structure and success criteria
- `.planning/REQUIREMENTS.md` — full requirement list with phase traceability
- `.planning/research/SUMMARY.md` — architecture decisions, stack choices, critical pitfalls

---
*State initialized: 2026-03-15*
