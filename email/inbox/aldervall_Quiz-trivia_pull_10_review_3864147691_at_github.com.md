MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 15:42:48 -0800
Subject: Re: [aldervall/Quiz-trivia] Merge master into main (PR #10)
Message-ID: <aldervall/Quiz-trivia/pull/10/review/3864147691@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/10@github.com>
References: <aldervall/Quiz-trivia/pull/10@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0da78ab4b5_d9111028909a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This pull request merges approximately 65 commits from the `master` branch into `main`, bringing substantial new features and architectural changes to the Quiz-trivia project. The merge transforms the application from a single-session model to a multi-room architecture with significant UX improvements.

**Changes:**
- Multi-room support with 4-letter room codes and per-room game state management
- Complete UI redesign featuring a unified landing page, lobby system, TV display view, and dedicated per-game player views
- New features: player category voting, True/False question type support, live standings sidebar, E2E test suite
- Security enhancement: custom in-memory rate limiter for dynamic HTML routes
- Architecture refactor: moved from global game instance to room-based architecture with lazy-loaded game instances

### Reviewed changes

Copilot reviewed 17 out of 18 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| server.js | Complete refactor to room-based architecture; adds WebSocket routing, rate limiting, room management, and multi-room support |
| game.js | Adds reconnection state handling (FETCHING, COUNTDOWN) and answer tracking in reveal payload |
| questions.js | Implements True/False question fetching with 10s time limit for T/F vs 15-25s for multiple-choice |
| local-db.js | Extends database download to fetch both multiple-choice and True/False questions per category |
| public/index.html | New landing page with room creation and join functionality |
| public/group/index.html | New unified lobby for players with ready system, game voting, and category selection |
| public/group/display.html | New TV display view showing lobby, live game state, and leaderboards |
| public/games/quiz/index.html | New dedicated quiz player view with enhanced score tracking and opponent visibility |
| public/games/shithead/index.html | Placeholder page for upcoming Shithead card game |
| public/player/index.html | Updated legacy player page with room code support and backward compatibility |
| tests/*.mjs | Three new E2E tests covering full game flow, restart, and continue scenarios |
| shithead-game.js | Removed (490 lines) - game logic moved to dedicated game pages |
| README.md | Simplified by removing architecture diagrams and contributing sections |
| package.json | Adds puppeteer-core for E2E testing |
</details>



<details>
<summary>Comments suppressed due to low confidence (5)</summary>

**tests/restart.mjs:1**
* Missing 'use strict' directive at the top of the file. According to the project's coding guidelines (copilot-instructions.md), all server-side .js files should include 'use strict' at the top. While .mjs files use ES modules which are automatically strict, this test file is server-side JavaScript and should follow the project convention for consistency.
```
import puppeteer from 'puppeteer-core';
```
**tests/continue.mjs:1**
* Missing 'use strict' directive at the top of the file. According to the project's coding guidelines (copilot-instructions.md), all server-side .js files should include 'use strict' at the top. While .mjs files use ES modules which are automatically strict, this test file is server-side JavaScript and should follow the project convention for consistency.
```
import puppeteer from 'puppeteer-core';
```
**README.md:42**
* The Architecture & Data Flow section and Contributing section were removed from the README, which were valuable documentation added in PR #8. While this is a merge from master to main, the documentation provides important context about the codebase structure and contribution guidelines. Consider re-adding these sections or ensuring they exist elsewhere (they appear to be in CONTRIBUTING.md according to the PR description).
```
## Stack

- Node.js + Express
- WebSockets (`ws`)
- Open Trivia DB API
```
**server.js:205**
* The `generateRoomCode` function could theoretically loop infinitely if all possible 4-letter codes are exhausted. With 24 characters (excluding easily confused ones like I, O, etc.) this gives 24^4 = 331,776 possible codes, which should be sufficient for most use cases. However, consider adding a safety counter to break after a reasonable number of attempts and throw an error, or increase the code length if the collision rate becomes problematic.
```
function generateRoomCode() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
  let code;
  do {
    code = Array.from({ length: 4 }, () =>
      chars[Math.floor(Math.random() * chars.length)]
    ).join('');
  } while (rooms.has(code));
  return code;
}
```
**tests/fullgame.mjs:1**
* Missing 'use strict' directive at the top of the file. According to the project's coding guidelines (copilot-instructions.md), all server-side .js files should include 'use strict' at the top. While .mjs files use ES modules which are automatically strict, this test file is server-side JavaScript and should follow the project convention for consistency.
```
import puppeteer from 'puppeteer-core';
```
</details>



> +const rateLimitMap = new Map();
+function rateLimit(maxReq, windowMs) {
+  return (req, res, next) => {
+    const key = req.ip;
+    const now = Date.now();
+    const entry = rateLimitMap.get(key) || { count: 0, start: now };
+    if (now - entry.start > windowMs) {
+      entry.count = 0;
+      entry.start = now;
+    }
+    entry.count += 1;
+    rateLimitMap.set(key, entry);
+    if (entry.count > maxReq) {
+      return res.status(429).send('Too Many Requests');
+    }

The rate limiter stores entries in `rateLimitMap` but never cleans them up. Over time, this will cause a memory leak as IPs accumulate indefinitely, especially in a long-running server. Consider adding periodic cleanup of old entries (e.g., remove entries older than the window duration) or implementing an LRU cache with a maximum size.
```suggestion
const rateLimitMap = new Map();
let lastRateLimitCleanup = 0;

function rateLimit(maxReq, windowMs) {
  return (req, res, next) => {
    const key = req.ip;
    const now = Date.now();
    const entry = rateLimitMap.get(key) || { count: 0, start: now };

    if (now - entry.start > windowMs) {
      entry.count = 0;
      entry.start = now;
    }

    entry.count += 1;
    rateLimitMap.set(key, entry);

    if (entry.count > maxReq) {
      return res.status(429).send('Too Many Requests');
    }

    // Periodically clean up stale entries to avoid unbounded memory growth.
    if (now - lastRateLimitCleanup > windowMs) {
      lastRateLimitCleanup = now;
      for (const [ip, value] of rateLimitMap.entries()) {
        if (now - value.start > windowMs) {
          rateLimitMap.delete(ip);
        }
      }
    }
```

>        const username = (msg.username || '').trim().slice(0, 20);
-      // Send JOIN_OK first so client can identify itself before receiving resync messages
-      const preCheck = !username ? { ok: false, code: 'INVALID_USERNAME', message: 'Username required.' } : null;
-      if (preCheck) {
-        ws.send(JSON.stringify({ type: 'ERROR', code: preCheck.code, message: preCheck.message }));
+      if (!username) {
+        sendTo(ws, { type: 'ERROR', code: 'INVALID_USERNAME', message: 'Username required.' });
         break;
       }
-      ws.send(JSON.stringify({ type: 'JOIN_OK', username }));
-      const result = game.addPlayer(ws, username);
+
+      // Assign admin if first player
+      if (room.players.size === 0) {
+        room.adminUsername = username;
+      }
+
+      const avatar = nameToAvatar(username);
+      room.players.set(username, { ws, isReady: false, avatar });
+      room.wsToUsername.set(ws, username);
+
+      // Lazy-create game instance
+      if (!room.game) {
+        room.game = new Game(room._broadcast);
+      }
+      const result = room.game.addPlayer(ws, username);
+
+      const isAdmin = username === room.adminUsername;
+      const gameRunning = !!(room.game && room.game.state !== 'LOBBY');
+      sendTo(ws, { type: 'JOIN_OK', username, isAdmin, roomCode: room.code, avatar, lang: room.language, gameRunning });

There's a potential race condition where a player joining with an existing username will overwrite the existing player's entry in `room.players` and `room.wsToUsername` without cleanup of the old WebSocket connection. This can lead to orphaned connections and confused state. Consider checking if the username is already taken and either rejecting the join or properly cleaning up the old connection first.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/10#pullrequestreview-3864147691
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/10/review/3864147691@github.com>