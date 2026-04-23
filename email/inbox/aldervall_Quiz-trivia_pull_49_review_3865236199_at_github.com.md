MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 22:40:10 -0800
Subject: Re: [aldervall/Quiz-trivia] Big frontend overhaul: sounds, confetti, power-ups (PR #49)
Message-ID: <aldervall/Quiz-trivia/pull/49/review/3865236199@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/49@github.com>
References: <aldervall/Quiz-trivia/pull/49@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a13c4a9aa22_f41110268787"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Large frontend refresh across landing/lobby/display/quiz screens, plus a new player power-ups feature and a server-side rate limiter cleanup to prevent unbounded memory growth.

**Changes:**
- Add shared frontend theme/utilities plus synthesized SFX and a canvas confetti/particle system.
- Add quiz “power-ups” (Double Points, 50/50, Time Freeze) with new WS command handling.
- Remove legacy root modules (rooms/players/player-manager) and add periodic cleanup for the in-memory rate limiter map.

### Reviewed changes

Copilot reviewed 15 out of 15 changed files in this pull request and generated 7 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| server/handlers.js | Adds `USE_POWERUP` WS message handling and forwards failures to the client. |
| server.js | Adds periodic cleanup for `rateLimitMap` to prevent growth from abandoned IPs. |
| game.js | Introduces per-player power-up state, double-points scoring multiplier, and `usePowerup()` implementation. |
| package.json | Updates NYC include list to reflect server code living under `server/*.js` and removes legacy root files. |
| rooms.js | Removes legacy root room registry module (now handled under `server/`). |
| players.js | Removes legacy root player management module. |
| player-manager.js | Removes legacy root player manager module. |
| public/shared/utils.js | Adds shared frontend helper library (`window.GN`) for avatars, escaping, WS URLs, etc. |
| public/shared/theme.css | Adds shared theme palette/components/animations used by multiple pages. |
| public/shared/sounds.js | Adds Web Audio API synthesized SFX (`window.GNSound`). |
| public/shared/confetti.js | Adds canvas-based confetti/particles (`window.GNConfetti`). |
| public/index.html | Applies the new theme and adds landing-page particle background + click sounds. |
| public/group/index.html | Applies the new theme, adds sounds/haptics, and switches to shared utilities. |
| public/group/display.html | Applies the new theme, adds sounds/confetti, and switches to shared utilities. |
| public/games/quiz/index.html | Applies the new theme, adds sounds/haptics/confetti, and adds power-up UI + handling. |
</details>






>    </div>
 
   <button class="create-btn" id="create-btn">Create Room</button>
-
-  <button class="tv-btn" id="tv-btn" aria-label="Host on TV – create a room and open the big screen display">📺 Host on TV / Big Screen</button>
+  <button class="tv-btn" id="tv-btn">📺 Host on TV / Big Screen</button>

The TV/Big Screen button previously had an `aria-label` describing the action, but it was removed. Since the visible label includes emoji and a slash, the explicit aria-label helps screen readers and improves accessibility; consider restoring it (or adding equivalent accessible text).
```suggestion
  <button class="tv-btn" id="tv-btn" aria-label="Host game on TV or big screen">📺 Host on TV / Big Screen</button>
```

>      } else {
+      if (wasCorrect) { GNSound.correct(); GN.haptic('success'); }
+      else { GNSound.wrong(); GN.haptic('error'); }
       _showReveal(msg, myEntry, wasCorrect, didAnswer);

In the REVEAL flow, the client plays the "wrong" sound + error haptic whenever `wasCorrect` is false, including when the player didn’t answer at all (timeout). Gate the wrong/error feedback on `didAnswer` so non-answers don’t feel like an incorrect submission.

> +          // Extend the timer bar visually
+          const bar = document.getElementById('pq-timer-bar');
+          const currentWidth = parseFloat(getComputedStyle(bar).width);
+          const totalWidth = parseFloat(getComputedStyle(bar.parentElement).width);
+          const currentPct = totalWidth > 0 ? (currentWidth / totalWidth) * 100 : 0;
+          const extraPct = Math.min(100 - currentPct, 30);
+          bar.style.transition = 'none';
+          bar.style.width = Math.min(100, currentPct + extraPct) + '%';
+          bar.classList.remove('low-time');

When handling `POWERUP_ACTIVATED` for `timeFreeze`, the UI adjusts the timer bar width but does not update the underlying timer logic (`pqTimerTimeout`, `pqLowTimeTimeout`, and the `width ... linear` transition set in `handleQuestion`). This can cause the bar/low-time warnings to still hit zero at the original time even though the UI briefly “extends.” Consider recalculating remaining time and resetting the transition + timeouts when extra time is granted.
```suggestion
          // Visual effect for timeFreeze without desynchronising the timer bar logic
          const bar = document.getElementById('pq-timer-bar');
          if (bar) {
            bar.classList.remove('low-time');
          }
```

> +        }));
+      }
+      this._broadcast({
+        type: 'POWERUP_USED',
+        username,
+        powerupType: 'fiftyFifty',
+      });
+      return { ok: true };
+    }
+
+    if (powerupType === 'timeFreeze') {
+      if (ws.readyState === 1) {
+        ws.send(JSON.stringify({
+          type: 'POWERUP_ACTIVATED',
+          powerupType: 'timeFreeze',
+          extraTime: 10,

`timeFreeze` power-up currently only sends `POWERUP_ACTIVATED` to the client but does not affect server-side timing or scoring (question reveal still happens at `q.timeLimit`, and `receiveAnswer` always uses `Date.now() - this.questionStartTime`). As-is, players don’t actually get extra time, and late answers still won’t be accepted once the state changes. Implement the effect server-side (e.g., track per-player time bonus and apply it when computing `elapsed`/`timeFraction`, and/or adjust when answers are accepted) or remove/rename the power-up so behavior matches the UI.
```suggestion

```

> +    player.powerups[powerupType]--;
+    player.activePowerup = powerupType;
+

Power-ups are decremented here, but there’s no corresponding reset for a new game/round (e.g., `continueGame()` preserves player state and does not re-grant power-ups). The PR description says each player gets 1x of each per game; if a new round should refresh power-ups, they should be reset when starting/continuing a game (and possibly on restart/back-to-lobby).

> +  usePowerup(ws, powerupType) {
+    if (this.state !== STATE.QUESTION_ACTIVE) return { ok: false };
+
+    let username = null;
+    let player = null;
+    for (const [name, p] of this.players.entries()) {
+      if (p.ws === ws) { username = name; player = p; break; }
+    }
+    if (!player) return { ok: false };
+
+    const validTypes = ['doublePoints', 'fiftyFifty', 'timeFreeze'];
+    if (!validTypes.includes(powerupType)) return { ok: false };
+    if (!player.powerups || !player.powerups[powerupType] || player.powerups[powerupType] <= 0) {

`usePowerup()` returns `{ ok: false }` without an error `code/message` for several invalid cases (wrong state, invalid powerupType, unknown ws). Because the handler only forwards errors when `result.code` exists, many rejected power-up requests will fail silently on the client. Consider returning consistent `{ ok:false, code, message }` for these failure modes (or have the handler send a generic ERROR when `ok` is false).

> +      if (room.game && msg.powerupType) {
+        const result = room.game.usePowerup(ws, msg.powerupType);
+        if (!result.ok && result.code) {
+          sendTo(ws, { type: 'ERROR', code: result.code, message: result.message });
+        }
+      }

This handler only sends an ERROR if `game.usePowerup()` returns a `code`, so invalid/mis-timed `USE_POWERUP` requests can be silently dropped. If the client is expected to provide user feedback, consider sending an ERROR for missing/invalid `powerupType` and for any `{ ok:false }` result (or ensure `usePowerup()` always returns a code/message for rejections).
```suggestion
      // Validate that there is an active quiz game
      if (!room.game) {
        sendTo(ws, {
          type: 'ERROR',
          code: 'NO_ACTIVE_GAME',
          message: 'No active quiz game to use a powerup.'
        });
        break;
      }

      // Validate powerup type from client
      if (typeof msg.powerupType !== 'string' || !msg.powerupType) {
        sendTo(ws, {
          type: 'ERROR',
          code: 'INVALID_POWERUP',
          message: 'Invalid or missing powerup type.'
        });
        break;
      }

      const result = room.game.usePowerup(ws, msg.powerupType);

      // Always surface failures to the client, with sensible fallbacks
      if (!result || result.ok === false) {
        const code = result && result.code ? result.code : 'POWERUP_REJECTED';
        const message = result && result.message
          ? result.message
          : 'Powerup could not be used.';
        sendTo(ws, { type: 'ERROR', code, message });
      }
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/49#pullrequestreview-3865236199
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/49/review/3865236199@github.com>