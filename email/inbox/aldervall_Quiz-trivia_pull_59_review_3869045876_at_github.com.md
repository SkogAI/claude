MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Fri, 27 Feb 2026 12:55:46 -0800
Subject: Re: [aldervall/Quiz-trivia] Implement Cards Against Humanity-style party game ("Cards") (PR #59)
Message-ID: <aldervall/Quiz-trivia/pull/59/review/3869045876@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/59@github.com>
References: <aldervall/Quiz-trivia/pull/59@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a204d291c32_fe111038039f"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a new “Cards” (Cards Against Humanity-style) mini-game to the existing room-based Game Night system, integrating it into lobby voting/start flow, server-side WebSocket handling, and both player + display UIs.

**Changes:**
- Introduces `CAHGame` server-side game logic/state machine and wires new `CAH_*` WebSocket commands into the room handler.
- Adds new player route/UI at `/group/:code/cah` and extends lobby UI to support suggesting/starting `cah` with a rounds picker.
- Extends the display/host UI with CAH-specific screens (picking/judging/winner/game over).

### Reviewed changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 6 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `server/rooms.js` | Extends room structure to track `cahGame` (and `shitheadGame`) instances. |
| `server/handlers.js` | Adds CAH integration: reconnect support, start-game wiring, and submit/pick message handlers. |
| `server.js` | Adds the `/group/:code/cah` page route. |
| `public/group/index.html` | Adds CAH tile + rounds settings and start payload (`maxRounds`). |
| `public/group/display.html` | Adds CAH display screens and handlers for `CAH_*` events. |
| `public/games/cah/index.html` | New CAH player client: hand selection, submission, czar judging, and game over flows. |
| `cah.js` | New `CAHGame` implementation (deck, state transitions, scoring, reconnect). |
</details>



<details>
<summary>Comments suppressed due to low confidence (1)</summary>

**public/group/index.html:365**
* The Decks settings row markup is now malformed: the `<div class="settings-row" id="deck-count-row">` opening tag appears to have been removed, but the closing `</div>` remains. This breaks the DOM structure and `updateStartSection()` later calls `document.getElementById('deck-count-row').style...`, which will throw when the element is missing. Reintroduce the deck-count-row wrapper (or guard the JS) so both Shithead deck selection and CAH rounds selection work reliably.
```
      <span class="settings-label">Decks:</span>
      <button class="setting-btn deck-btn active" data-decks="1">1 deck</button>
      <button class="setting-btn deck-btn" data-decks="2">2 decks</button>
      <button class="setting-btn deck-btn" data-decks="3">3 decks</button>
    </div>
```
</details>



> +      } else if (gameType === 'cah') {
+        const maxRounds = Number.isInteger(msg.maxRounds) ? Math.max(1, Math.min(20, msg.maxRounds)) : 8;
+        room.cahGame = new CAHGame(room._broadcast);
+        for (const [uname, p] of room.players) {
+          room.cahGame.addPlayer(p.ws, uname);
+        }
+        room.cahGame.startGame(maxRounds);
       }

The CAH start path introduces a new real-time game flow, but the repo’s existing Puppeteer integration tests only cover quiz flows. Adding at least a minimal automated test that starts a CAH game (3 players), submits a round, and validates the state transitions would help prevent regressions (especially around reconnect/disconnect and deck exhaustion).

> +    if (msg.state === 'PICKING') {
+      showCahScreen('picking');
+      renderCahBlackCard(msg.blackCard, 'cah-black-card-text');
+      const round = msg.round || '?';
+      const max   = msg.maxRounds || '?';

CAH display never populates the picking/winner scoreboards (e.g. `#cah-scores-picking`), even though `CAH_GAME_STATE` includes a `players` array with points. As a result the CAH display scoreboard stays empty outside the round-winner event. Consider calling `renderCahScores(...)` from `handleCahGameState()` (and/or `CAH_NEW_ROUND`) using the current points so the host screen consistently shows standings.

> +        <span class="cah-pts">${s.points} pts</span>
+      </div>`
+    ).join('');
+  }
+
+  function handleCahGameState(msg) {
+    if (msg.state === 'PICKING') {
+      showCahScreen('picking');
+      renderCahBlackCard(msg.blackCard, 'cah-black-card-text');
+      const round = msg.round || '?';
+      const max   = msg.maxRounds || '?';
+      document.getElementById('cah-round-label').textContent = `Round ${round} / ${max}`;
+      document.getElementById('cah-czar-name').textContent = GN.esc(msg.czar || '');
+      document.getElementById('cah-submitted-badge').textContent = `${msg.submittedCount || 0} / ${msg.totalNonCzar || '?'}`;
+    } else if (msg.state === 'JUDGING') {
+      showCahScreen('judging');

When `CAH_GAME_STATE` is `JUDGING`, the display switches to the judging screen but doesn't render the black card or submissions unless a separate `CAH_JUDGING` event arrives. If the display reconnects or misses that event, the judging UI can be blank. A more robust approach is to include the anonymous submissions (or enough data to re-render) in the game-state message while in `JUDGING`, or to have the display request/resend `CAH_JUDGING` on connect.
```suggestion
      showCahScreen('judging');
      // If the game-state message already includes judging data (e.g. after a reconnect),
      // render the judging UI directly so the screen is not blank while waiting for CAH_JUDGING.
      if (msg && Array.isArray(msg.submissions)) {
        renderCahJudging(msg);
      }
```

> +      const round = msg.round || '?';
+      const max   = msg.maxRounds || '?';
+      document.getElementById('cah-round-label').textContent = `Round ${round} / ${max}`;
+      document.getElementById('cah-czar-name').textContent = GN.esc(msg.czar || '');
+      document.getElementById('cah-submitted-badge').textContent = `${msg.submittedCount || 0} / ${msg.totalNonCzar || '?'}`;
+    } else if (msg.state === 'JUDGING') {
+      showCahScreen('judging');
+    } else if (msg.state === 'GAME_OVER') {
+      // handled by CAH_GAME_OVER
+    } else if (msg.state === 'LOBBY') {
+      showScreen('lobby-display');
+    }
+  }
+
+  function renderCahJudging(msg) {
+    const gameState = { czar: document.getElementById('cah-czar-name').textContent };

`renderCahJudging()` declares `const gameState = ...` but never uses it. This looks like leftover code and adds noise; removing it will avoid confusion about which state object is authoritative.
```suggestion

```

> +    for (let i = a.length - 1; i > 0; i--) {
+      const j = Math.floor(Math.random() * (i + 1));
+      [a[i], a[j]] = [a[j], a[i]];
+    }
+    return a;
+  }
+
+  _currentCzar() {
+    const usernames = [...this.players.keys()];
+    if (usernames.length === 0) return null;
+    return usernames[this.czarIndex % usernames.length];
+  }
+
+  _replenishHands() {
+    for (const [, p] of this.players) {
+      while (p.hand.length < 7 && this.whiteDeck.length > 0) {

The white-card deck can be exhausted for common player/round configurations (e.g. 6 players: initial deal 42 cards + 8 rounds × 5 submissions = 82 > the ~80-card deck). Once `whiteDeck` is empty, hands stop replenishing and players may be unable to submit the required number of cards (especially for Pick 2), potentially stalling the game. Consider adding a discard pile with reshuffle, increasing the deck size, or constraining `maxRounds` based on `players.size` and available white cards.
```suggestion
      while (p.hand.length < 7) {
        // If the draw deck is empty, try to reshuffle the discard pile
        if (this.whiteDeck.length === 0) {
          if (this.discardPile && this.discardPile.length > 0) {
            this.whiteDeck = this._shuffle(this.discardPile);
            this.discardPile = [];
          } else {
            // No more cards available anywhere — stop replenishing
            break;
          }
        }

        if (this.whiteDeck.length === 0) {
          // Still no cards after attempted reshuffle; give up
          break;
        }
```

> +    const nonCzar = [...this.players.keys()].filter(u => u !== czar);
+    if (nonCzar.length > 0 && nonCzar.every(u => this.submissions.has(u))) {

If a non-czar player disconnects mid-round, `removePlayer()` keeps them in `this.players` (ws set to null) and they will still be counted in `nonCzar.every(...)`. Because CAH has no per-round timeout or admin override, the round can get stuck in `PICKING` indefinitely waiting for a submission that will never arrive. Consider either (a) excluding disconnected players from the required submission set, (b) auto-folding them with a random/empty submission after a timeout, or (c) allowing the czar/admin to force judging after some minimum number of submissions.
```suggestion
    const nonCzarConnected = [...this.players.entries()]
      .filter(([u, player]) => u !== czar && player && player.ws)
      .map(([u]) => u);
    if (nonCzarConnected.length === 0 || nonCzarConnected.every(u => this.submissions.has(u))) {
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/59#pullrequestreview-3869045876
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/59/review/3869045876@github.com>