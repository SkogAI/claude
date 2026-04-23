MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Fri, 27 Feb 2026 14:07:30 -0800
Subject: Re: [aldervall/Quiz-trivia] Increase Shithead max players to 6 and add min-player labels to game tiles (PR #65)
Message-ID: <aldervall/Quiz-trivia/pull/65/review/3869314644@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/65@github.com>
References: <aldervall/Quiz-trivia/pull/65@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a215a2d26d8_f21110320053"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Updates the Shithead mini-game and lobby game-selection UI to support larger games and to clearly communicate minimum player requirements in the lobby.

**Changes:**
- Increased Shithead “room full” guard from 4 to 6 players.
- Added `minPlayers` metadata for Shithead (2) and Cards Against Humanity (3) in the lobby game tiles.
- Rendered a small “Min: X players” badge on game tiles when `minPlayers` is present.

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `shithead.js` | Raises the Shithead player cap check from 4 → 6 in `addPlayer`. |
| `public/group/index.html` | Adds `minPlayers` to game tiles and renders a “Min players” badge with styling. |





> +    if (this.players.size >= 6) {
+      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'ROOM_FULL', message: 'Room full (max 6 players).' });

Raising the lobby cap to 6 can break `startGame(1)`: the initial deal is 9 cards/player (3 faceDown + 3 faceUp + 3 hand), so 6 players requires 54 cards and a 1-deck game only has 52. That means `this.deck.pop()` will start returning `undefined`, leading to runtime errors when card fields like `id`/`rank` are accessed.

Consider enforcing a max player count based on `deckCount` (or adding a guard in `startGame` to abort with a clear error when there aren’t enough cards for the initial deal) so 1 deck never starts with 6 players.
```suggestion
    if (this.players.size >= 5) {
      this._sendTo(ws, { type: 'SHITHEAD_ERROR', code: 'ROOM_FULL', message: 'Room full (max 5 players).' });
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/65#pullrequestreview-3869314644
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/65/review/3869314644@github.com>