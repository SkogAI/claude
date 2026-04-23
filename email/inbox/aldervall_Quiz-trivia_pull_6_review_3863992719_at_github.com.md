MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 14:54:24 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Vänd Tia (Shithead) card game (PR #6)
Message-ID: <aldervall/Quiz-trivia/pull/6/review/3863992719@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/6@github.com>
References: <aldervall/Quiz-trivia/pull/6@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0cf20d8eb4_f81110359fe"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Introduces a new multiplayer game mode (“Vänd Tia / Shithead”) alongside the existing quiz mode, using the same Express + WebSocket architecture with dedicated host/player views and a server-side game engine.

**Changes:**
- Added a server-side Shithead game engine with dealing, swap phase, turn play, pile burn/pickup, and win/shithead detection.
- Extended `server.js` with new HTTP routes and WebSocket paths to host and play the new mode.
- Added new host (TV) and player (mobile) UIs for the Shithead mode, plus updated landing page links.

### Reviewed changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 5 comments.

| File | Description |
| ---- | ----------- |
| `shithead-game.js` | Implements core Shithead/Vänd Tia game rules and state synchronization over WS. |
| `server.js` | Wires new Shithead routes/WS endpoints and routes messages to the new game engine. |
| `public/shithead/host/index.html` | Adds the TV host UI for lobby, swap progress, gameplay boards, and game over. |
| `public/shithead/player/index.html` | Adds the mobile player UI for joining, swapping, playing, and reconnection flow. |





> +        document.getElementById('join-error').textContent = msg.message || 'Något gick fel.';
+        if (!myUsername) show('join');

In `SHITHEAD_ERROR`, the UI only returns to the join screen when `!myUsername`, so errors that occur after `SHITHEAD_JOIN_OK` (e.g. game full / in progress) can be hidden while the user remains on the waiting screen. Consider clearing `myUsername` and always `show('join')` for join-related errors (similar to the quiz client’s `ERROR` handling).
```suggestion
        // Treat join-related errors similarly to a restart: clear local join state
        myUsername = null;
        myState = null;
        gameState = null;
        turnInfo = null;
        document.getElementById('join-error').textContent = msg.message || 'Något gick fel.';
        show('join');
```

> +    case 'SHITHEAD_PLAY_CARDS':
+      shitheadGame.playCards(ws, msg.cardIds);
+      break;
+    case 'SHITHEAD_PLAY_FACEDOWN':
+      shitheadGame.playFaceDown(ws, msg.cardId);
+      break;
+    case 'SHITHEAD_PICK_UP_PILE':
+      shitheadGame.pickUpPile(ws);
+      break;

`SHITHEAD_PLAY_CARDS` passes `msg.cardIds` straight into `shitheadGame.playCards`. If a client sends a malformed message (e.g. `cardIds` missing/not an array), `playCards` will throw when calling `.map/.every`, potentially crashing the server process. Validate the payload shape here (and/or disconnect the client) before calling into the game engine.

> +        ws.send(JSON.stringify({ type: 'SHITHEAD_JOIN_OK', username }));
+        const result = shitheadGame.addPlayer(ws, username);
+        if (!result.ok) {
+          ws.send(JSON.stringify({ type: 'SHITHEAD_ERROR', code: result.code, message: result.message }));
+        }

`SHITHEAD_JOIN` sends `SHITHEAD_JOIN_OK` before checking whether `shitheadGame.addPlayer` accepted the player. When the join is rejected (game full / in progress / invalid), the client can end up on the waiting screen with the error not visible. Either (1) only send `SHITHEAD_JOIN_OK` after a successful `addPlayer`, or (2) ensure the client clears its username and returns to the join screen on `SHITHEAD_ERROR` after a failed join.
```suggestion
        const result = shitheadGame.addPlayer(ws, username);
        if (!result.ok) {
          ws.send(JSON.stringify({ type: 'SHITHEAD_ERROR', code: result.code, message: result.message }));
          break;
        }
        ws.send(JSON.stringify({ type: 'SHITHEAD_JOIN_OK', username }));
```

> +  playCards(ws, cardIds) {
+    if (this.state !== SHITHEAD_STATE.PLAYING) return;
+    const username = this._findUsername(ws);
+    if (!username) return;
+    if (this.playerOrder[this.currentPlayerIndex] !== username) return;
+
+    const player = this.players.get(username);
+    const source = this._findCardSource(player, cardIds);
+    if (!source) return;
+
+    const cards = cardIds.map(id => source.find(c => c.id === id)).filter(Boolean);
+    if (cards.length === 0 || cards.length !== cardIds.length) return;

`playCards(ws, cardIds)` assumes `cardIds` is an array and immediately uses `.map()`/`.every()`. A malformed WS message (or a client bug) can throw a `TypeError` and take down the Node process. Add a defensive guard (e.g. `Array.isArray(cardIds)` and non-empty) and reject/ignore invalid inputs early.

> +    const t = document.getElementById('toast');
+    t.textContent = msg;
+    t.classList.add('show');
+    clearTimeout(toastTimer);
+    toastTimer = setTimeout(() => t.classList.remove('show'), duration);
+  }
+
+  // ── Join ───────────────────────────────────────────────────────────────────
+  document.getElementById('join-btn').addEventListener('click', doJoin);
+  document.getElementById('username-input').addEventListener('keydown', e => { if (e.key === 'Enter') doJoin(); });
+
+  function doJoin() {
+    const name = document.getElementById('username-input').value.trim();
+    if (!name) { document.getElementById('join-error').textContent = 'Ange ett namn.'; return; }
+    document.getElementById('join-error').textContent = '';
+    myUsername = name;

`doJoin()` sets `myUsername` before the server acknowledges the join. If the join is rejected, the client still considers itself joined (affects reconnect + error handling). Keep a separate pending name and only set `myUsername` on `SHITHEAD_JOIN_OK`.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/6#pullrequestreview-3863992719
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/6/review/3863992719@github.com>