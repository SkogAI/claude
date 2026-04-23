MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Fri, 06 Mar 2026 13:37:14 -0800
Subject: Re: [small-hours-games/small-hours] Fix spy game security, integration, and docs (PR #70)
Message-ID: <small-hours-games/small-hours/pull/70/review/3906155039@github.com>
In-Reply-To: <small-hours-games/small-hours/pull/70@github.com>
References: <small-hours-games/small-hours/pull/70@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69ab490aef9d9_aa111054105b"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR tightens Spy mini-game information exposure, integrates Spy into the room-based mini-game flow, updates deployment workflow targeting, and refreshes contributor documentation to match the current architecture.

**Changes:**
- Add `spy` as an allowed suggested/started mini-game type and start Spy games via `spyGame.onStartGame(room)` with a 3-player minimum.
- Change Spy server broadcasts to use per-player `getState(forUsername)` so the spy/word are hidden until reveal, and add `isSpy` in state.
- Update deploy workflow to trigger on `main`, and refresh `CONTRIBUTING.md` for the room-based architecture/testing.

### Reviewed changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 7 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| server/handlers.js | Adds `spy` to allowed suggestion/start flows and starts Spy game from the room handler. |
| games/spy/server/index.js | Switches Spy broadcasts to per-player state and adjusts `/api/spy/state` response. |
| games/spy/server/game.js | Adds `'use strict'` and updates `getState` to support per-viewer redaction + `isSpy`. |
| CONTRIBUTING.md | Updates project name/structure/testing/docs to reflect the current room-based platform. |
| .github/workflows/deploy.yml | Fixes workflow branch trigger to `main`. |
</details>



<details>
<summary>Comments suppressed due to low confidence (1)</summary>

**games/spy/server/index.js:169**
* `onStartGame` starts a new `setInterval` per call, but the stop condition only checks `games.has(room.code)`. If a new spy game is started for the same room while a previous interval is still running (or if the room returns to lobby early), the old interval will keep running and continue sending updates. Track the interval handle per room (e.g., store `{ game, interval }` in the map) and clear it explicitly on restart/return-to-lobby as well as on normal game end.
```
function onStartGame(room) {
  // Create new SpyGame instance
  const game = new SpyGame(room.players);

  // Store in games map
  games.set(room.code, game);

  // Start game loop (update every 100ms)
  let updateInterval = setInterval(() => {
    if (!games.has(room.code)) {
      clearInterval(updateInterval);
      return;
    }

    game.update();

    // Send per-player state to each player (hides word from spy)
    for (const socket of room.playerSockets) {
      const username = room.wsToUsername.get(socket);
      const state = game.getState(username);
      const message = {
        type: 'GAME_STATE',
        gameState: state
      };
      try {
        socket.send(JSON.stringify(message));
      } catch (e) {
        // Socket closed
      }
    }

    // Displays can see the word (no forUsername = not the spy)
    const displayState = game.getState(null);
    const displayMessage = {
      type: 'GAME_STATE',
      gameState: displayState
    };
    const displayStr = JSON.stringify(displayMessage);
    for (const socket of room.displaySockets) {
      try {
        socket.send(displayStr);
      } catch (e) {
        // Socket closed
      }
    }

    // Clean up when game ends
    if (!game.gameRunning) {
      clearInterval(updateInterval);
      games.delete(room.code);
    }
  }, 100);
```
</details>



> @@ -69,15 +88,15 @@ Key architectural decisions:
 - Use `const` / `let`; avoid `var`.
 - Prefer named functions over anonymous callbacks for anything non-trivial.

The Coding Standards section says "'use strict' at the top of every .js file", but the repo includes many browser `.js` files (e.g. `public/shared/utils.js`) that intentionally don’t use it. Consider scoping this guideline to server-side Node files to avoid contradicting existing conventions.

>  ## Testing
 
-There is currently no automated test suite. Manual testing procedure:
+**Automated tests:**
+
+```bash
+npm test        # Run tests via Node's built-in test runner (auto-discovers *.test.js files)
+npm run coverage  # Coverage report with nyc (outputs to coverage/)
+```
+
+E2E browser tests live in `tests/` and use puppeteer-core. These scripts (`fullgame.mjs`, `restart.mjs`, `continue.mjs`) automate the full player flow in a headless browser.
+

The Testing section implies `npm test` auto-discovers `*.test.js` files, but there don’t appear to be any `*.test.*` files in the repo right now, so `npm test` may run zero tests. Consider either adding/pointing to the actual unit test locations/patterns, or clarifying that current automated coverage is primarily via the E2E scripts in `tests/*.mjs`.

> +    // API endpoint should not leak the word; return state without spy context
+    res.json(game.getState(null));

`/api/spy/state` is intended to avoid leaking the secret word, but `game.getState(null)` currently sets `isSpy` to false and will include `word` during non-reveal phases. This exposes the word to any caller with a room code. Consider returning a dedicated public/sanitized state (no `word`/`spy` until reveal) or requiring a viewer identity and defaulting to hiding the word when no username is provided.
```suggestion
    // API endpoint should not leak the word or spy identity; sanitize state
    const state = game.getState(null);
    if (state && typeof state === 'object') {
      const { word, spy, ...publicState } = state;
      res.json(publicState);
    } else {
      // Fallback: return whatever was provided if it's not an object
      res.json(state);
    }
```

> +  getState(forUsername) {
     const round = this.getCurrentRound();
     const now = Date.now();
     const elapsed = Math.max(0, now - round.phaseStartTime);
     const phaseDuration = PHASE_DURATIONS[round.phase];
     const timeRemaining = Math.max(0, phaseDuration - elapsed);
 
+    // Hide the word from the spy (unless in reveal/score phase where it's public)
+    const isRevealPhase = round.phase === PHASES.REVEAL || round.phase === PHASES.SCORE;
+    const isSpy = forUsername === round.spy;
+    const showWord = !isSpy || isRevealPhase;
+

`getState(forUsername)` currently treats `undefined`/`null` as “not the spy”, so `showWord` becomes true and `isSpy` becomes false. Because callers can omit `forUsername` (or `wsToUsername.get(socket)` can be missing during initial connect/reconnect), this can leak the word to the spy/unknown clients and prevents the real spy from ever seeing `isSpy: true`. Make the default state safe (hide word unless a known non-spy username is provided, or use an explicit option for display/public views).

> +      // Send per-player state to each player (hides word from spy)
+      for (const socket of room.playerSockets) {
+        const playerName = room.wsToUsername.get(socket);
+        const state = game.getState(playerName);
+        const broadcast = {
+          type: 'CLUE_RECEIVED',

When broadcasting per-player state, `playerName` can be missing for sockets that have connected but haven’t sent JOIN yet; calling `game.getState(playerName)` will currently send the word (and `isSpy:false`). Skip sockets without an associated username or treat missing usernames as “public/unknown” and hide sensitive fields.

> @@ -258,6 +263,8 @@ function handleMessage(ws, role, msg, room) {
           room.cahGame.addPlayer(p.ws, uname);
         }
         room.cahGame.startGame(maxRounds);
+      } else if (gameType === 'spy') {
+        spyGame.onStartGame(room);
       }

Spy game WS messages (e.g. `SEND_CLUE`, `SEND_GUESS`) are not handled in `handleMessage`, so clients can start the spy mini-game but their actions will be ignored. Add dispatch for spy module handlers (for player/display roles as appropriate), ideally gated by `room.activeMiniGame === 'spy'` or by presence of an active spy game instance.

> @@ -18,7 +18,7 @@ Thank you for your interest in contributing! This document covers how to set up
 
 ## Getting Started
 
-**Prerequisites:** Node.js ≥ 18, npm, Docker (optional).
+**Prerequisites:** Node.js >= 18, npm, Docker (optional).

Prerequisites say Node.js >= 18, but `package.json` enforces `engines.node` as ">=20". Please align CONTRIBUTING with the actual supported Node version (and ideally mention the exact minimum required).
```suggestion
**Prerequisites:** Node.js >= 20 (minimum 20.0.0), npm, Docker (optional).
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/70#pullrequestreview-3906155039
You are receiving this because you authored the thread.

Message ID: <small-hours-games/small-hours/pull/70/review/3906155039@github.com>