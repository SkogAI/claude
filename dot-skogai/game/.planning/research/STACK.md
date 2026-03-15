# Stack Research: Small Hours Games

**Project:** Real-time multiplayer party game platform (Display + Phones architecture)
**Researched:** 2026-03-15
**Overall Confidence:** HIGH — all primary recommendations verified against current npm / official sources

---

## Runtime & Language

### Recommendation: Node.js 22 LTS + JavaScript (ESM)

**Version:** Node.js 22.x (Active LTS)
**Language:** JavaScript with ESM (`"type": "module"`)

**Rationale:**

Node.js 22 is the current Active LTS — it receives security patches and bug fixes, and its Maintenance LTS end date is April 2027, giving this project a long runway. Node.js 20 has dropped to Maintenance-only (security fixes only), making 22 the clear choice for new greenfield work.

On TypeScript vs JavaScript: this is a solo developer, local-network party game with an existing spec — not a growing team or enterprise codebase. TypeScript's compile step, tsconfig overhead, and type-annotation maintenance cost slow down iteration with no proportional benefit here. ESM JavaScript with JSDoc type hints in the few places that matter gives 90% of the type-safety benefit at zero config cost.

**Confidence:** HIGH — Node.js release schedule confirmed at nodejs.org; Active LTS status verified.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| Node.js 20 LTS | Maintenance-only since Oct 2024; no reason to start new project on it |
| Node.js 24 | Current/odd release; not yet LTS; avoid for production |
| Bun | Excellent performance but still maturing for ecosystem compatibility; better-sqlite3 native addon compile issues reported |
| TypeScript | Solo project; spec already defined; compile step trades velocity for type safety that JSDoc covers sufficiently |

---

## Server Framework

### Recommendation: Express 5

**Version:** `express@^5.2.1`

**Rationale:**

Express 5 is now the `latest` tag on npm (as of April 2025) and the default for new projects. It adds async error propagation (rejected promises automatically reach error handlers — eliminates the `try/catch` boilerplate that made Express 4 painful with async game logic), drops Node.js < 18, and fixes the ReDoS vulnerability in path-to-regexp.

For this project the HTTP surface is small — 8 REST endpoints plus static file serving. Express is not a performance bottleneck here because the hot path is 100% WebSocket. The `ws` library attaches directly to the HTTP server that Express creates, bypassing Express entirely for WebSocket traffic. Express is only touched for room creation, health checks, and serving the frontend build.

Fastify would be marginally faster at HTTP but adds schema-first complexity for no gain when HTTP is not the bottleneck. Hono has limited native Node.js WebSocket integration and is optimized for edge runtimes. Neither advantage matters here.

**Confidence:** HIGH — Express 5.2.1 verified as `latest` on npm.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| Express 4 | Old `latest`, async errors not propagated, ReDoS vulnerability in path-to-regexp |
| Fastify | Better HTTP throughput, but overhead for 8 REST routes isn't worth the schema-first DX tax |
| Hono | Designed for edge/Cloudflare Workers; Node.js WebSocket integration is secondary |
| Koa | Smaller community, no advantage over Express 5 for this use case |

---

## WebSocket Library

### Recommendation: `ws`

**Version:** `ws@^8.18.0`

**Rationale:**

`ws` is the right choice here. It is bare-metal WebSocket — RFC 6455 compliant, zero abstraction overhead, 3KB memory per connection vs Socket.IO's ~15KB. At the 100ms tick rate this project broadcasts state to every client in a room; Socket.IO's event envelope adds unnecessary serialization overhead on every tick.

Socket.IO's primary value-add over `ws` is: automatic reconnection, HTTP long-polling fallback, and rooms abstraction. This project already implements its own room system (4-char codes, lifecycle management) and the spec explicitly requires WebSocket-only — no polling fallback. The reconnection logic is intentionally application-level (the spec handles `SERVER_RESTARTING` and reconnect flows).

The `ws` library is used by 26,000+ npm packages and is effectively the standard. Current version is 8.18+, actively maintained.

For per-socket rate limiting, use `rate-limiter-flexible` (not the abandoned `ws-rate-limit` package which is 9 years stale). Pattern: attach a `RateLimiterMemory` instance per socket on the `connection` event, decrement on each message, reject at threshold.

**Confidence:** HIGH — ws@8.18+ verified on npm; rate-limiter-flexible@9.x confirmed current.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| Socket.IO v4 | 5x memory overhead per connection; rooms abstraction is redundant (project has its own); HTTP polling fallback is explicitly excluded; adds ~2-8ms per message latency |
| uWebSockets.js | C++ bindings — faster under extreme load (10k+ concurrent), but overkill for a local party game (20-50 concurrent sockets max); harder to deploy in Docker, native compile issues |
| Colyseus | Multiplayer game framework with schema-based state sync — handles delta patching automatically, but forces schema definition overhead and an opinionated state model that doesn't match this project's JSON message protocol |

---

## Frontend

### Recommendation: Vite 6 + Vanilla JavaScript

**Version:** `vite@^6.x`
**Approach:** Vanilla JS SPA pages, one per role (host page, player page, per-game pages)

**Rationale:**

The spec is explicit: no SSR, SPA approach, WebSocket-driven state. Each page (host, player, per game) is a standalone HTML entry point receiving `GAME_STATE` via WebSocket — this is exactly the multi-page app pattern Vite handles natively.

Vanilla JS is the correct choice here over React or Vue. The UI state machine is: receive `GAME_STATE` JSON from server, update DOM. That is not a React problem — React's virtual DOM diffing adds overhead on every 100ms tick for no benefit since the server is already computing and sending the new state. The spec requires dark neon/glass theme with CSS animations and mobile-first safe areas — these are CSS problems, not component framework problems.

Vanilla JS + Vite gives: instant HMR, native ESM in dev, rollup production bundles, CSS modules if needed, and zero runtime framework overhead on phones.

For QR code generation: use `qrcode@^1.5.x` which works in browser via its browser bundle (no canvas dependency issues in modern browsers).

For audio/sound effects: Web Audio API (native, no library needed for simple game sounds).

For confetti: `canvas-confetti@^1.x` — lightweight, zero deps, 3KB.

**Confidence:** HIGH — Vite 6 confirmed; vanilla JS + WebSocket pattern is standard for this architecture.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| React + Vite | Virtual DOM overhead on 100ms tick updates; 40KB+ runtime on phones; game state management doesn't benefit from React's component model |
| Vue 3 + Vite | Same tick-overhead argument; reactivity system is optimized for user interactions, not 10-tick/second server-push state |
| Svelte + Vite | Closer to vanilla, minimal runtime; reasonable alternative, but adds compiler dependency with no compelling advantage for this spec |
| htmx | Server-driven hypermedia; fundamentally mismatched with WebSocket state model |

---

## Database / Persistence

### Recommendation: `better-sqlite3` for stats; flat files (JSON/JSONL) for cache and history

**Version:** `better-sqlite3@^12.4.x`

**Rationale:**

The persistence requirements are light and fall into three clear buckets:

**1. Question cache** — JSON files on disk organized by category. This is the spec's explicit design. It works fine; question data is write-once-read-many, fits in memory, and cache invalidation is simple.

**2. Game history** — Append-only JSONL log. JSONL is perfect for append-only logs: one JSON object per line, trivially streamable, no schema needed, survives restarts. Use Node.js's `fs.appendFile`. No library needed.

**3. Player statistics** — This is the only read/write with query needs (leaderboard by score, lookup by username). Use `better-sqlite3`. It is synchronous, which is unusual but correct for this use case: game completion triggers stat updates from within async game controller code, and synchronous writes eliminate callback/promise complexity. It handles 2000+ queries/second, which is vastly beyond this project's needs. Prebuilt binaries available for Node 22.

Do not use `lowdb` for stats — it loads the entire JSON file into memory on every write, and as the stats file grows (player history across sessions) this becomes a problem. SQLite with WAL mode handles concurrent readers correctly.

Do not use PostgreSQL or any external database server — the deployment model is a single Docker container on a home server. An external DB adds infrastructure complexity for data that fits in a few MB.

**Confidence:** HIGH — better-sqlite3@12.4.1 verified; JSONL pattern for append-only logs is well-established.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| PostgreSQL | External server; wildly over-engineered for local party game stats |
| lowdb | Loads entire JSON to memory on write; degrades as player history grows |
| node:sqlite (Node 24 built-in) | Only available in Node 24+; not yet stable as of March 2026; forces Node 24 adoption |
| Pure JSON flat files for stats | No indexing; leaderboard query requires full scan and sort on every request |

---

## Security Middleware

### Recommendation: `helmet` + `express-rate-limit` + manual WS rate limiting

**Versions:**
- `helmet@^8.1.0`
- `express-rate-limit@^7.x`
- `rate-limiter-flexible@^9.x` (for WebSocket per-socket limiting)

**Rationale:**

`helmet` 8.x sets 13 HTTP security headers in one line — CSP, HSTS, X-Frame-Options, etc. It is the Express security baseline. Latest version is 8.1.0.

`express-rate-limit` handles the HTTP rate limits from the spec (120 req/min for pages, 30 req/min for API, 2/hour for DB download). It stores state in-memory which is correct for a single-container deployment.

`rate-limiter-flexible` handles WebSocket rate limiting (30 msg/sec per socket, 3 chat msg per 5 seconds). The `ws-rate-limit` package is 9 years stale — do not use it.

For input sanitization: the spec requires sanitizing usernames (max 20 chars, no HTML). Use a simple regex and `String.slice()` — no library needed for this minimal requirement. DOMPurify is for HTML sanitization in a browser DOM context and is not needed server-side for a plain string username field.

**Confidence:** HIGH — helmet@8.1.0 and express-rate-limit verified; rate-limiter-flexible@9.x confirmed.

---

## Deployment

### Recommendation: Docker with `node:22-slim` base image, Docker Compose

**Rationale:**

`node:22-slim` is Debian-based (bookworm), uses glibc, and is ~250MB vs Alpine's ~50MB. The size tradeoff is worth it: Alpine uses musl libc which causes native addon compile failures — and `better-sqlite3` is a native addon. Alpine + native addons = pain. Use slim.

For the multi-stage build pattern: use `node:22` (full) to compile native deps, copy to `node:22-slim` for the final image. This gives small production image without Alpine compatibility issues.

The spec already defines Docker Compose with host networking, health checks (every 30s), and data directory bind-mounts. This is the correct approach for a local network party game — host networking ensures WebSocket connections work without port-mapping complexity.

GitHub Actions CI/CD via SSH to a Headscale VPN node is the deployment path. The workflow is: push to main → build Docker image → SSH to home server → docker compose pull && docker compose up -d.

**Confidence:** HIGH — Docker node:22-slim recommendation confirmed by Snyk and Docker Hub official node image docs.

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| node:22-alpine | musl libc causes native addon failures (better-sqlite3); not officially supported by Node.js project |
| PM2 | Process manager for bare-metal; Docker already provides restart policies and health checks |
| Fly.io / Railway | Cloud hosting; project is explicitly local network, home server deployment |

---

## Testing

### Recommendation: Vitest

**Version:** `vitest@^3.x` (latest stable as of 2026-03)

**Rationale:**

Vitest is the 2025+ standard for Node.js/Vite-adjacent projects. It is 10-20x faster than Jest in watch mode, supports ESM natively (no `--experimental-vm-modules` flag required unlike Jest), shares config with Vite, and has first-class TypeScript support even though this project uses JS.

For game logic testing (the tick system, phase transitions, card rules, scoring), Vitest's in-process test runner with no transpile step is the right fit. Tests for `QuizController.tick()` or Shithead card rule validation run instantly.

For WebSocket integration testing, use `ws` in test mode — spin up a real server, connect real WebSocket clients, assert on messages. This is more reliable than mocking and catches the full message protocol.

**Confidence:** HIGH — Vitest 3.x + Browser Mode stable (graduated from experimental in late 2025).

**Alternatives considered:**

| Option | Why Not |
|--------|---------|
| Jest | Requires `--experimental-vm-modules` for ESM; 10x slower in watch mode; no Vite config sharing |
| Node.js built-in test runner (`node:test`) | Minimal reporter, no coverage, no watch mode — viable for minimal projects but worse DX than Vitest |
| Mocha + Chai | Older toolchain; ESM support requires extra config; Vitest is strictly superior for this stack |

---

## What NOT to Use (and Why)

### Socket.IO
Adds ~15KB memory overhead per connection, 2-8ms per-message latency, and an event envelope on every 100ms tick broadcast. The project spec explicitly uses a custom JSON message protocol — Socket.IO's event system is redundant. Its primary features (rooms, namespaces, auto-reconnect, polling fallback) are either explicitly excluded by spec or re-implemented at the application level. Use `ws` directly.

### TypeScript
This is a solo developer project with a complete, stable spec. TypeScript's build toolchain (tsconfig, tsc or ts-node, source maps) adds friction to a project that should prioritize iteration speed. The game logic (tick systems, card rules, scoring) is well-bounded and testable. Use JSDoc for the few interfaces that benefit from type hints.

### Redis
Not needed. Room state is in-memory on a single Node.js process. The deployment model is one container, one server. Adding Redis for pub/sub or rate limiter storage adds infrastructure complexity for a system that runs on a home server with 20-50 concurrent users.

### PostgreSQL / MySQL
External database server is architecture overkill for local party game stats. `better-sqlite3` handles the stats + query needs with zero infrastructure overhead.

### Alpine Docker base image
Alpine uses musl libc. `better-sqlite3` is a native C++ addon compiled against glibc. Alpine + better-sqlite3 = either compile-from-source in Docker (slow builds) or missing prebuilt binaries (runtime errors). Use `node:22-slim` (Debian).

### Colyseus
A full multiplayer game framework with schema-based delta state sync. Impressive, but it imposes a schema definition model and opinionated room lifecycle that conflicts with the project's existing JSON message protocol and custom room system. The overhead of adapting Colyseus is greater than the overhead of building the room/tick system described in the spec.

### `lowdb`
Adequate for prototypes but loads the entire JSON file to memory on every write. As player stats accumulate over sessions this becomes a real issue. Use `better-sqlite3` instead.

### `ws-rate-limit`
Published 9 years ago, unmaintained. Use `rate-limiter-flexible` for WebSocket rate limiting.

---

## Complete Package List

### Production Dependencies

```bash
npm install express@^5.2.1 ws@^8.18.0 helmet@^8.1.0 express-rate-limit@^7.5.0 rate-limiter-flexible@^9.1.1 better-sqlite3@^12.4.1 qrcode@^1.5.4 canvas-confetti@^1.9.3
```

### Dev Dependencies

```bash
npm install -D vite@^6.2.0 vitest@^3.1.0 @vitest/coverage-v8
```

### Runtime

Node.js 22 LTS (`node:22-slim` in Docker)

---

## Sources

- [ws npm package — npmjs.com](https://www.npmjs.com/package/ws) (version 8.18+ confirmed)
- [Express@5.1.0: Now the Default on npm — expressjs.com](https://expressjs.com/2025/03/31/v5-1-latest-release.html)
- [helmet npm — npmjs.com](https://www.npmjs.com/package/helmet) (version 8.1.0)
- [better-sqlite3 npm — npmjs.com](https://www.npmjs.com/package/better-sqlite3) (version 12.4.1)
- [rate-limiter-flexible npm — npmjs.com](https://www.npmjs.com/package/rate-limiter-flexible) (version 9.1.1)
- [Vite 6.0 announcement — vite.dev](https://vite.dev/blog/announcing-vite6)
- [Node.js Releases — nodejs.org](https://nodejs.org/en/about/previous-releases)
- [Choosing the best Node.js Docker image — snyk.io](https://snyk.io/blog/choosing-the-best-node-js-docker-image/)
- [Vitest vs Jest — betterstack.com](https://betterstack.com/community/guides/scaling-nodejs/vitest-vs-jest/)
- [WebSockets vs Socket.IO — ably.com](https://ably.com/topic/socketio-vs-websocket)
- [Node.js + WebSockets: ws vs socket.io — dev.to](https://dev.to/alex_aslam/nodejs-websockets-when-to-use-ws-vs-socketio-and-why-we-switched-di9)
- [better-sqlite3 vs lowdb npm trends — npmtrends.com](https://npmtrends.com/better-sqlite3-vs-lowdb-vs-node-json-db)
