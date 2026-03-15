# Architecture Research: Small Hours Games

**Domain:** Real-time multiplayer party game platform (Display + Phones)
**Researched:** 2026-03-15
**Overall confidence:** HIGH — patterns well-established, Jackbox-style architecture documented, spec is precise

---

## System Components

The system has six distinct runtime components. Every component has a clearly bounded responsibility; crossing these boundaries goes through the message protocol.

| Component | Runtime Location | Responsibility |
|-----------|-----------------|----------------|
| **HTTP Server** | Server process | REST API, static file serving, room creation |
| **WebSocket Server** | Server process (same port) | Real-time bidirectional message transport |
| **Room Manager** | Server in-memory | Room lifecycle: create, lookup by code, idle cleanup |
| **GameController** (base + impls) | Per-room in-memory | Game state machine, tick loop, player action dispatch |
| **Persistence Layer** | Server filesystem | Question cache (JSON), game history (JSONL), player stats (JSON) |
| **Display Client** | Browser (TV/monitor) | Renders shared game state from GAME_STATE broadcasts |
| **Player Client** | Browser (phone) | Sends player actions, renders per-player UI |

The server process is a single Node.js process. There is no microservice split at this scale. All state is in-memory per room; the filesystem handles durability for questions/history/stats. This is the correct architecture for a local-gathering tool: simple, low-latency, no infrastructure overhead.

---

## Data Flow

### Inbound: Player Action → State Change

```
Phone Browser
  └─ WebSocket message (e.g., ANSWER, SHITHEAD_PLAY_CARDS)
       └─ WS Server receives frame
            └─ Room Manager routes by socket→room mapping
                 └─ GameController.handleMessage(player, message)
                      └─ Mutates in-memory game state
                           └─ (Tick will broadcast on next 100ms interval)
```

### Outbound: Tick → Client Render

```
setInterval (100ms)
  └─ Room.tick()
       └─ GameController.tick()
            ├─ Phase transition logic (timer countdown, condition checks)
            ├─ build sharedState (visible to all)
            └─ for each player:
                 ├─ broadcast GAME_STATE (sharedState) to ALL sockets in room
                 └─ send SHITHEAD_YOUR_STATE (private hand) to individual socket
```

### Room Connection Handshake

```
Client connects WS
  └─ sends JOIN_LOBBY {username} or implicit display connect at /host/:code
       └─ Room Manager resolves or creates room by code
            ├─ Player: assign role=player, emit JOIN_OK, add to room.players
            └─ Display: assign role=display, emit DISPLAY_OK with current state
```

### Lobby → Game Transition

```
Admin sends START_MINI_GAME {gameType, ...config}
  └─ Room validates: admin check, player count, game-specific min players
       └─ Room instantiates GameController subclass
            └─ broadcasts MINI_GAME_STARTING {gameType, url} to ALL room sockets
                 └─ all clients navigate to game URL
                      └─ clients reconnect via same room WS
                           └─ GameController receives state request → normal tick loop resumes
```

### Game → Lobby Return

```
Game reaches GAME_OVER phase
  └─ GameController emits final GAME_STATE
       └─ Room writes to game_history.jsonl
            └─ Room updates player_stats.json
                 └─ Admin sends RETURN_TO_LOBBY
                      └─ Room nulls active GameController
                           └─ broadcasts LOBBY_UPDATE to all sockets
```

---

## Component Boundaries

### What Crosses the WS Message Boundary

The WebSocket message protocol (Section 6 of SPEC.md) is the only interface between client code and server code. No shared types, no shared imports. This is the correct discipline — display and player clients are deployed as static HTML/JS and must be treated as untrusted.

### Room Manager ↔ GameController Boundary

The Room is the container; the GameController is a plugin. The Room:
- Calls `controller.tick()` on every 100ms interval
- Calls `controller.handleMessage(player, message)` for inbound player actions
- Calls `controller.getState(player)` to obtain broadcast payload
- Calls `controller.destroy()` on game end or room cleanup

The GameController never knows about WebSocket sockets directly — it mutates state and returns data. The Room handles all socket I/O. This separation keeps GameController unit-testable without a live WS server.

### Persistence Layer ↔ Room Boundary

The Room (not the GameController) writes to persistence. GameControllers are stateless with respect to disk. This keeps the extension pattern simple: new game authors implement only game logic, never I/O.

### HTTP Server ↔ Room Manager Boundary

HTTP endpoints (`/api/rooms`, `/api/stats`, `/health`) read from Room Manager and Persistence Layer but never mutate game state directly. Room creation via `POST /api/rooms` is the one creation path; all subsequent state changes go through WebSocket.

---

## Game Extension Pattern

The extension pattern from the spec maps cleanly onto a class hierarchy with a defined contract:

### Base Class Contract

```
GameController {
  abstract tick(): void
    // called every 100ms by Room
    // responsible for: timer countdown, phase transitions, emitting state

  abstract handleMessage(player: Player, type: string, payload: unknown): void
    // called when any in-game WS message arrives
    // responsible for: validating move, mutating state, error response

  abstract getSharedState(): GameState
    // returns state safe to broadcast to ALL clients (no hidden info)
    // called by Room before each broadcast

  getPlayerState(player: Player): PlayerState | null
    // returns per-player private state (card hands, spy word, etc.)
    // default: null (no private state needed by most games)

  getPlayerCount(): { min: number; max: number }
    // for lobby validation before START_MINI_GAME

  destroy(): void
    // cleanup: clear timers, free memory
    // base class provides default no-op
}
```

### Phase Management Pattern

Every GameController uses an internal phase state machine. The tick() method is the state machine driver:

```
tick() {
  this.elapsed += 100  // ms since phase start

  switch (this.phase) {
    case 'COUNTDOWN':
      if (this.elapsed >= 3000) this.transitionTo('QUESTION_ACTIVE')
      break
    case 'QUESTION_ACTIVE':
      if (this.elapsed >= this.phaseTimeout || this.allAnswered()) {
        this.transitionTo('REVEAL')
      }
      break
    // ...
  }
}
```

`transitionTo()` resets `this.elapsed = 0`, sets `this.phase`, and runs any entry logic (deal cards, assign spy, etc.). This pattern is consistent across all games and is what makes the base class meaningful.

### Registration Pattern

Adding a new game requires changes in exactly three places:

1. **Server:** New file `games/MyGame.js` extending GameController. Register in the Room's game factory (`gameType → constructor` map).
2. **Frontend:** New HTML file `public/games/mygame.html` that connects to the room WS and renders `GAME_STATE`.
3. **Lobby:** Add `gameType` string to the suggestion list.

No modifications to the Room, WS Server, Persistence Layer, or HTTP Server. This is the correct extension point discipline.

### Reference Implementation: Number Guess

Number Guess is the canonical reference for new game authors. It is intentionally trivial — 1 phase, 1 action type, shared state only (no per-player private state). Build it first; all other games extend from this baseline.

---

## Build Order

Dependencies determine sequencing. Each layer must be stable before the layer above it builds on it.

### Layer 0: Infrastructure (no dependencies)
- Project scaffolding: Node.js + Express + `ws` library
- Docker + Compose configuration
- Static file serving
- Helmet, rate limiting middleware

**Why first:** Everything else depends on the server being runnable.

### Layer 1: Connection Transport
- WebSocket server attached to HTTP server
- Socket registry (socket → room → player mapping)
- Message dispatch router (type → handler)
- Connection/disconnection lifecycle

**Why second:** Room Manager and GameControllers need a working WS layer to test against.

### Layer 2: Room Manager
- Room creation with 4-char code generation
- Room lookup, join, leave
- Player list management
- Admin promotion logic
- Room idle cleanup (4h / 30s zero-socket)
- Bot add/remove logic

**Why third:** The lobby is built on top of Room Manager. Games are built on top of the lobby flow.

### Layer 3: Lobby
- JOIN_LOBBY, SET_READY, SUGGEST_GAME messages
- LOBBY_UPDATE, PLAYER_JOINED, PLAYER_REMOVED broadcasts
- Chat (CHAT_MESSAGE with rate limiting)
- QR code generation for join URL
- Language selection

**Why fourth:** Players need a working lobby before games matter. Also validates the full WS round-trip before game complexity is added.

### Layer 4: Persistence
- Question cache (JSON file, OpenTrivia DB fetch, background download)
- Game history (JSONL append)
- Player stats (JSON aggregate)
- REST API endpoints for stats/history/db-management

**Why fourth (parallel with lobby):** Question cache must exist before Quiz is built. Stats/history must exist before any game completes. Can build in parallel with lobby after Layer 2 is stable.

### Layer 5: GameController Base + Tick Loop
- Base GameController class with tick/handleMessage/getSharedState contract
- Room integrates 100ms setInterval calling controller.tick()
- Room broadcast loop: GAME_STATE to all, per-player state to individuals
- START_MINI_GAME → MINI_GAME_STARTING flow
- RETURN_TO_LOBBY flow
- Number Guess reference implementation (validates entire pattern)

**Why fifth:** All games depend on this. Build once, correctly, before implementing any real game.

### Layer 6: Games (can parallelize across games)
Each game follows the same pattern. Suggested order by complexity:

| Order | Game | Rationale |
|-------|------|-----------|
| 1 | Number Guess | Already built in Layer 5, just fully flesh out |
| 2 | Quiz | External API dependency (OpenTrivia), shared state only, well-defined phases |
| 3 | Spy Game | Social deduction, round-based, per-player role assignment |
| 4 | Cards Against Humanity | Turn-based czar rotation, card deck management |
| 5 | Shithead | Most complex: per-player private hands, play-rule validation, deck burn logic |
| 6 | Lyrics Guessing | Depends on lyrics data source (TBD) |

### Layer 7: Frontend Polish
- Neon/glass theme
- Animations (fade transitions, confetti)
- Sound effects
- Offline detection + reconnection
- Safe area / notch handling

**Why last:** Core gameplay must be proven correct before investing in polish.

---

## Scaling Considerations

This platform targets a single local gathering — one server, one network. The architecture should optimize for simplicity and correctness at that scale.

| Concern | At target scale (1 gathering, 2-20 players) | At moderate scale (10 concurrent rooms) | At significant scale (100+ rooms) |
|---------|---------------------------------------------|----------------------------------------|-----------------------------------|
| State storage | In-memory, single process | In-memory, still fine | In-memory per process; add Redis + sticky sessions if multi-process |
| Tick loop | Single setInterval per room, trivial CPU | 10 intervals, ~10ms compute per interval — still single-process fine | Profile first; likely fine up to ~500 rooms on modern hardware |
| WS connections | 20 sockets, trivial | 200 sockets, trivial | 2000 sockets: monitor memory, `ws` handles ~10k sockets/process |
| Persistence | JSON file reads are fast for 1 room | File contention if concurrent writes spike — not an issue with JSONL append | Switch to SQLite if JSONL append becomes a bottleneck |
| External API | OpenTrivia with local cache: cache all categories on first deploy | Same; cache handles it | Same |

**Recommendation:** Do not design for horizontal scaling in the initial build. The Docker host-networking deployment model and in-memory state make multi-process coordination unnecessary for the target use case. If the platform ever needs multi-server scaling, the migration path is: add Redis for shared room state + sticky-session load balancer. Build to make that migration possible (don't scatter state everywhere), but do not build it now.

---

## Sources

- [Scalable WebSocket Architecture — Hathora](https://blog.hathora.dev/scalable-websocket-architecture/) — MEDIUM confidence (authoritative on stateful router patterns)
- [Party Box Framework — hammre/party-box](https://github.com/hammre/party-box) — MEDIUM confidence (direct Jackbox-style architecture reference)
- [Colyseus Multiplayer Framework](https://colyseus.io/) — HIGH confidence (authoritative docs; confirms room-session model as industry standard)
- [Real-Time Multiplayer Architecture — Rune](https://developers.rune.ai/blog/building-a-scalable-multiplayer-game-architecture) — MEDIUM confidence (architecture patterns)
- [WebSocket Use Cases in System Design — AlgoMaster](https://blog.algomaster.io/p/websocket-use-cases-system-design) — MEDIUM confidence (broadcast patterns)
- [Building Multiplayer Game with WebSockets — DEV](https://dev.to/sauravmh/building-a-multiplayer-game-using-websockets-1n63) — LOW confidence (tutorial-level, but confirms patterns)
- Small Hours Games SPEC.md — HIGH confidence (primary source; architecture decisions are prescribed)
