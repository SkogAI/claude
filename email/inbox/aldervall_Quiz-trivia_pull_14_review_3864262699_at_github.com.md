MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 16:31:03 -0800
Subject: Re: [aldervall/Quiz-trivia] Implement server-side Shithead card game (PR #14)
Message-ID: <aldervall/Quiz-trivia/pull/14/review/3864262699@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/14@github.com>
References: <aldervall/Quiz-trivia/pull/14@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0e5c728277_b011101281af"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This pull request adds a standalone implementation of the Shithead card game to the Quiz-trivia application. The implementation includes a complete game state machine, WebSocket endpoints for host and player connections, and full game logic including card dealing, swapping, playing, and special card rules.

**Note:** The PR title "[WIP] Revert card game implementation changes" is misleading - this is actually adding new functionality, not reverting changes.

**Changes:**
- Added new `ShitheadGame` class with complete card game logic and state management
- Added WebSocket endpoints `/ws/shithead-host` and `/ws/shithead-player` 
- Added HTML routes for standalone Shithead game interface

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 19 comments.

| File | Description |
| ---- | ----------- |
| shithead.js | New file implementing complete Shithead card game logic with state machine (LOBBY → SWAP → PLAYING → GAME_OVER), card dealing, swap phase, play rules, and game-over detection |
| server.js | Added WebSocket upgrade handlers and HTML routes for standalone Shithead game, plus integration with ShitheadGame class |





> +      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Game already in progress.' });
+      return;
+    }
+    if (this.players.size >= 4) {
+      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Room full (max 4 players).' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'ROOM_FULL', message: 'Room full (max 4 players).' }`.
```suggestion
      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'GAME_IN_PROGRESS', message: 'Game already in progress.' });
      return;
    }
    if (this.players.size >= 4) {
      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'ROOM_FULL', message: 'Room full (max 4 players).' });
```

> +      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    const hasHand   = p.hand.length > 0;
+    const hasFaceUp = p.faceUp.length > 0;
+
+    let cards;
+    if (hasHand) {
+      cards = cardIds.map(id => p.hand.find(c => c.id === id)).filter(Boolean);
+    } else if (hasFaceUp) {
+      cards = cardIds.map(id => p.faceUp.find(c => c.id === id)).filter(Boolean);
+    } else {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'No valid cards to play.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'NO_VALID_CARDS', message: 'No valid cards to play.' }`.

> +
+    const hasHand   = p.hand.length > 0;
+    const hasFaceUp = p.faceUp.length > 0;
+
+    let cards;
+    if (hasHand) {
+      cards = cardIds.map(id => p.hand.find(c => c.id === id)).filter(Boolean);
+    } else if (hasFaceUp) {
+      cards = cardIds.map(id => p.faceUp.find(c => c.id === id)).filter(Boolean);
+    } else {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'No valid cards to play.' });
+      return;
+    }
+
+    if (!cards || cards.length === 0 || cards.length !== cardIds.length) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Invalid card selection.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'INVALID_CARD_SELECTION', message: 'Invalid card selection.' }`.

> +      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'No valid cards to play.' });
+      return;
+    }
+
+    if (!cards || cards.length === 0 || cards.length !== cardIds.length) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Invalid card selection.' });
+      return;
+    }
+
+    const rank = cards[0].rank;
+    if (!cards.every(c => c.rank === rank)) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'All cards must be the same rank.' });
+      return;
+    }
+    if (!this._canPlay(rank)) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Cannot play that card.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'INVALID_PLAY', message: 'Cannot play that card.' }`.
```suggestion
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NO_VALID_CARDS', message: 'No valid cards to play.' });
      return;
    }

    if (!cards || cards.length === 0 || cards.length !== cardIds.length) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'INVALID_CARD_SELECTION', message: 'Invalid card selection.' });
      return;
    }

    const rank = cards[0].rank;
    if (!cards.every(c => c.rank === rank)) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'MISMATCHED_RANK', message: 'All cards must be the same rank.' });
      return;
    }
    if (!this._canPlay(rank)) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'INVALID_PLAY', message: 'Cannot play that card.' });
```

> +      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    if (p.hand.length > 0 || p.faceUp.length > 0) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Must play hand or face-up cards first.' });
+      return;
+    }
+
+    const idx = p.faceDown.findIndex(c => c.id === cardId);
+    if (idx === -1) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Card not found.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' }`.
```suggestion
      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' });
      return;
    }
    const p = this.players.get(username);
    if (!p) return;

    if (p.hand.length > 0 || p.faceUp.length > 0) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'MUST_PLAY_HAND_OR_FACEUP_FIRST', message: 'Must play hand or face-up cards first.' });
      return;
    }

    const idx = p.faceDown.findIndex(c => c.id === cardId);
    if (idx === -1) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'CARD_NOT_FOUND', message: 'Card not found.' });
```

> +      this._broadcast({ type: 'SHITHEAD_PILE_BURNED' });
+    }
+
+    if (this._isPlayerDone(p)) {
+      this._playerFinished(username);
+      return;
+    }
+
+    this._afterPlay(playAgain);
+  }
+
+  pickUpPile(username) {
+    if (this.state !== 'PLAYING') return;
+    if (this._currentPlayer() !== username) {
+      const p = this.players.get(username);
+      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' }`.
```suggestion
      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' });
```

> +
+  ws.on('message', (raw) => {
+    let msg;
+    try { msg = JSON.parse(raw); } catch { return; }
+    const { type } = msg;
+
+    if (isHost) {
+      if (type === 'SHITHEAD_START')   { shitheadGame.startGame(); return; }
+      if (type === 'SHITHEAD_RESTART') { shitheadGame.restart();   return; }
+    } else {
+      if (type === 'SHITHEAD_JOIN')          { shitheadGame.addPlayer(ws, (msg.username || '').trim().slice(0, 20)); return; }
+      const u = shitheadGame.usernameByWs(ws);
+      if (!u) return;
+      if (type === 'SHITHEAD_CONFIRM_SWAP')  { shitheadGame.confirmSwap(u); return; }
+      if (type === 'SHITHEAD_SWAP_CARD')     { shitheadGame.swapCard(u, msg.handCardId, msg.faceUpCardId); return; }
+      if (type === 'SHITHEAD_PLAY_CARDS')    { shitheadGame.playCards(u, msg.cardIds); return; }

Missing input validation for cardIds parameter. The msg.cardIds should be validated to ensure it's an array before passing to playCards. Without this check, unexpected input types could cause runtime errors. Add validation such as: `if (!Array.isArray(msg.cardIds)) return;`
```suggestion
      if (type === 'SHITHEAD_PLAY_CARDS')    { if (!Array.isArray(msg.cardIds)) return; shitheadGame.playCards(u, msg.cardIds); return; }
```

> +  addPlayer(ws, username) {
+    if (this.players.has(username)) {
+      // Reconnect
+      const p = this.players.get(username);
+      p.ws = ws;
+      this._sendTo(ws, { type: 'SHITHEAD_JOIN_OK', username });
+      this._sendPlayerState(username);
+      this._sendTo(ws, this._buildGameState());
+      this._broadcastTurnInfo();
+      return;
+    }
+    if (this.state !== 'LOBBY') {
+      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Game already in progress.' });
+      return;
+    }
+    if (this.players.size >= 4) {
+      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Room full (max 4 players).' });
+      return;
+    }
+    this.players.set(username, {
+      ws,
+      hand:       [],
+      faceUp:     [],
+      faceDown:   [],
+      swapReady:  false,
+      hasFinished: false,
+    });
+    this._sendTo(ws, { type: 'SHITHEAD_JOIN_OK', username });
+    this._broadcastPlayers();
+  }

Inconsistent username validation. In server.js, the username is trimmed and limited to 20 characters before passing to addPlayer, but addPlayer doesn't validate for empty usernames after trimming. A username consisting only of whitespace will be trimmed to an empty string in server.js but isn't explicitly rejected in addPlayer. While this currently works because the empty string check happens in server.js, it would be more robust to validate within addPlayer as well (similar to how Game.addPlayer in game.js validates at lines 58-60).

> +    const p = this.players.get(username);
+    if (!p || p.swapReady) return;
+
+    const hi = p.hand.findIndex(c => c.id === handCardId);
+    const fi = p.faceUp.findIndex(c => c.id === faceUpCardId);
+    if (hi === -1 || fi === -1) return;
+
+    [p.hand[hi], p.faceUp[fi]] = [p.faceUp[fi], p.hand[hi]];
+    this._sendPlayerState(username);
+  }
+
+  playCards(username, cardIds) {
+    if (this.state !== 'PLAYING') return;
+    if (this._currentPlayer() !== username) {
+      const p = this.players.get(username);
+      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' }`.

> +      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    if (p.hand.length > 0 || p.faceUp.length > 0) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Must play hand or face-up cards first.' });
+      return;
+    }
+
+    const idx = p.faceDown.findIndex(c => c.id === cardId);
+    if (idx === -1) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Card not found.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'CARD_NOT_FOUND', message: 'Card not found.' }`.
```suggestion
      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' });
      return;
    }
    const p = this.players.get(username);
    if (!p) return;

    if (p.hand.length > 0 || p.faceUp.length > 0) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'HAND_OR_FACEUP_REQUIRED', message: 'Must play hand or face-up cards first.' });
      return;
    }

    const idx = p.faceDown.findIndex(c => c.id === cardId);
    if (idx === -1) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'CARD_NOT_FOUND', message: 'Card not found.' });
```

> +  playFaceDown(username, cardId) {
+    if (this.state !== 'PLAYING') return;
+    if (this._currentPlayer() !== username) {
+      const p = this.players.get(username);
+      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    if (p.hand.length > 0 || p.faceUp.length > 0) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Must play hand or face-up cards first.' });
+      return;
+    }
+
+    const idx = p.faceDown.findIndex(c => c.id === cardId);

Missing input validation for cardId parameter. The playFaceDown method should validate that cardId is provided and is a valid type before attempting to use it. If cardId is undefined, null, or the wrong type, the findIndex operation could behave unexpectedly. Add validation at the start: `if (!cardId) { this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Card not found.' }); return; }`

> @@ -11,6 +11,7 @@ const os = require('os');
 const { WebSocketServer } = require('ws');
 const QRCode = require('qrcode');
 const { Game } = require('./game');
+const { ShitheadGame } = require('./shithead');

The PR title states "[WIP] Revert card game implementation changes" but the code changes are actually adding a new ShitheadGame implementation (shithead.js is a new file with 503 lines). The title should be updated to accurately reflect what the PR does, such as "Add standalone Shithead card game implementation" or similar. This discrepancy may cause confusion for reviewers and in the Git history.

> +    this.state       = 'LOBBY';
+    this.deck        = [];
+    this.pile        = [];
+    this.turnOrder   = [];
+    this.turn        = 0;
+    this.sevenActive = false;
+    this.finishOrder = [];
+    this.shithead    = null;
+    for (const [, p] of this.players) {
+      p.hand       = [];
+      p.faceUp     = [];
+      p.faceDown   = [];
+      p.swapReady  = false;
+      p.hasFinished = false;
+    }
+    this._broadcast({ type: 'SHITHEAD_RESTARTED' });

After restarting the game, only SHITHEAD_RESTARTED is broadcast, but clients don't receive the updated game state. Consider adding `this._broadcastGameState();` after line 432 to ensure all clients receive the reset state information (similar to how startGame calls _broadcastGameState at line 216).
```suggestion
    this._broadcast({ type: 'SHITHEAD_RESTARTED' });
    this._broadcastGameState();
```

> +      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Game already in progress.' });
+      return;
+    }
+    if (this.players.size >= 4) {
+      this._sendTo(ws, { type: 'SHITHEAD_ERROR', message: 'Room full (max 4 players).' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, instead of `{ type: 'SHITHEAD_ERROR', message: '...' }`, use `{ type: 'SHITHEAD_ERROR', code: 'GAME_IN_PROGRESS', message: 'Game already in progress.' }`.
```suggestion
      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'GAME_IN_PROGRESS', message: 'Game already in progress.' });
      return;
    }
    if (this.players.size >= 4) {
      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'ROOM_FULL', message: 'Room full (max 4 players).' });
```

> +      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'No valid cards to play.' });
+      return;
+    }
+
+    if (!cards || cards.length === 0 || cards.length !== cardIds.length) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Invalid card selection.' });
+      return;
+    }
+
+    const rank = cards[0].rank;
+    if (!cards.every(c => c.rank === rank)) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'All cards must be the same rank.' });
+      return;
+    }
+    if (!this._canPlay(rank)) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Cannot play that card.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'MISMATCHED_RANKS', message: 'All cards must be the same rank.' }`.
```suggestion
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NO_VALID_CARDS', message: 'No valid cards to play.' });
      return;
    }

    if (!cards || cards.length === 0 || cards.length !== cardIds.length) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'INVALID_CARD_SELECTION', message: 'Invalid card selection.' });
      return;
    }

    const rank = cards[0].rank;
    if (!cards.every(c => c.rank === rank)) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'MISMATCHED_RANKS', message: 'All cards must be the same rank.' });
      return;
    }
    if (!this._canPlay(rank)) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'ILLEGAL_PLAY', message: 'Cannot play that card.' });
```

> +  playCards(username, cardIds) {
+    if (this.state !== 'PLAYING') return;
+    if (this._currentPlayer() !== username) {
+      const p = this.players.get(username);
+      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    const hasHand   = p.hand.length > 0;
+    const hasFaceUp = p.faceUp.length > 0;
+
+    let cards;
+    if (hasHand) {
+      cards = cardIds.map(id => p.hand.find(c => c.id === id)).filter(Boolean);

Missing input validation for cardIds parameter. The method should validate that cardIds is an array and contains valid elements before processing. If a non-array or malformed input is passed, the map operation at line 264 could fail. Add validation at the start of the method: `if (!Array.isArray(cardIds) || cardIds.length === 0) { this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Invalid card selection.' }); return; }`

> +    const readyCount = [...this.players.values()].filter(pl => pl.swapReady).length;
+    const total      = this.players.size;
+    this._broadcast({ type: 'SHITHEAD_SWAP_READY', readyCount, total });
+
+    if (readyCount === total) {
+      this.state = 'PLAYING';
+      this._broadcastGameState();
+      this._broadcastTurnInfo();
+    }
+  }
+
+  swapCard(username, handCardId, faceUpCardId) {
+    if (this.state !== 'SWAP') return;
+    const p = this.players.get(username);
+    if (!p || p.swapReady) return;
+

Missing input validation for card ID parameters. The swapCard method should validate that handCardId and faceUpCardId are provided and are valid types (e.g., strings) before attempting to use them. If these parameters are undefined or the wrong type, the findIndex operations could behave unexpectedly. Add validation at the start: `if (!handCardId || !faceUpCardId) return;`
```suggestion

    if (typeof handCardId !== 'string' || typeof faceUpCardId !== 'string' ||
        !handCardId || !faceUpCardId) {
      return;
    }
```

> +      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Not your turn.' });
+      return;
+    }
+    const p = this.players.get(username);
+    if (!p) return;
+
+    if (p.hand.length > 0 || p.faceUp.length > 0) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Must play hand or face-up cards first.' });
+      return;
+    }
+
+    const idx = p.faceDown.findIndex(c => c.id === cardId);
+    if (idx === -1) {
+      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', message: 'Card not found.' });

Error messages in ShitheadGame are missing the 'code' field. According to the codebase convention, error messages should include both 'code' and 'message' fields (as seen in game.js lines 172, 178). For example, use `{ type: 'SHITHEAD_ERROR', code: 'INVALID_PLAY_ORDER', message: 'Must play hand or face-up cards first.' }`.
```suggestion
      if (p) this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'NOT_YOUR_TURN', message: 'Not your turn.' });
      return;
    }
    const p = this.players.get(username);
    if (!p) return;

    if (p.hand.length > 0 || p.faceUp.length > 0) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'INVALID_PLAY_ORDER', message: 'Must play hand or face-up cards first.' });
      return;
    }

    const idx = p.faceDown.findIndex(c => c.id === cardId);
    if (idx === -1) {
      this._sendTo(p.ws, { type: 'SHITHEAD_ERROR', code: 'CARD_NOT_FOUND', message: 'Card not found.' });
```

> +  removePlayer(ws) {
+    for (const [, p] of this.players) {
+      if (p.ws === ws) {
+        p.ws = null;
+        break;
+      }
+    }
+    this._broadcastPlayers();
+  }

The removePlayer method only sets ws to null but doesn't actually remove players who disconnect during the LOBBY state. According to the pattern in Game class (game.js:67-80), players who disconnect during LOBBY should be deleted from the players Map, while players who disconnect during an active game should have their ws set to null. Consider adding: `if (this.state === 'LOBBY') { this.players.delete(username); } else { p.ws = null; }` where username is the player being removed.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/14#pullrequestreview-3864262699
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/14/review/3864262699@github.com>