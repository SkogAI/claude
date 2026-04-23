MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Fri, 27 Feb 2026 13:45:36 -0800
Subject: Re: [aldervall/Quiz-trivia] Kick inactive Shithead player after 40 seconds of inactivity (PR #63)
Message-ID: <aldervall/Quiz-trivia/pull/63/review/3869221172@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/63@github.com>
References: <aldervall/Quiz-trivia/pull/63@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a21080868f2_ef11102510c3"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds an inactivity safeguard to the Shithead mini-game so a disconnected/unresponsive current-turn player can’t stall the game indefinitely.

**Changes:**
- Introduces a 40s per-turn inactivity timer in `ShitheadGame` and kicks the blocking current player when it expires.
- Broadcasts a new `SHITHEAD_PLAYER_KICKED` event and surfaces it as a toast in both the TV/display and player clients.
- Clears the inactivity timer on restart and when the game ends.

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| `shithead.js` | Starts/clears a per-turn inactivity timer and removes the current player on timeout. |
| `public/group/display.html` | Shows a toast on `SHITHEAD_PLAYER_KICKED`. |
| `public/games/shithead/index.html` | Shows a toast on `SHITHEAD_PLAYER_KICKED` (self vs other). |





> +        this.shithead = this.turnOrder[0];
+        const sp = this.players.get(this.shithead);
+        if (sp) sp.hasFinished = true;

When an inactivity kick leaves exactly one active player, the remaining player is currently set as `shithead` and appended to `finishOrder`. That makes the remaining player lose, which is opposite of the intended outcome (the kicked player should lose / be the shithead, and the remaining player should be treated as the winner). Adjust the end-game branch to set `shithead` to the kicked username and push the remaining player ahead of them in `finishOrder` (and optionally mark the remaining player's `hasFinished` true) before broadcasting game over.
```suggestion
        const remainingUsername = this.turnOrder[0];
        const remainingPlayer = this.players.get(remainingUsername);
        if (remainingPlayer) remainingPlayer.hasFinished = true;
        // Remaining active player finishes ahead of the kicked player
        this.finishOrder.push(remainingUsername);
        // The kicked player is the shithead (loser)
        this.shithead = username;
```

> @@ -760,6 +760,9 @@ <h1>Game Over!</h1>
       case 'SHITHEAD_GAME_OVER':
         handleShitheadGameOver(msg);
         break;
+      case 'SHITHEAD_PLAYER_KICKED':
+        showShitheadToast(`⏰ ${GN.esc(msg.username)} removed for inactivity`);

`showShitheadToast()` uses `textContent`, so passing an already-escaped username will display HTML entities literally (e.g. `&lt;`), and escaping is unnecessary for XSS safety here. Remove `GN.esc()` in this toast message (or switch the toast renderer to `innerHTML` consistently, but then escape there).
```suggestion
        showShitheadToast(`⏰ ${msg.username} removed for inactivity`);
```

> +        } else {
+          showToast(`⏰ ${GN.esc(msg.username)} was removed for inactivity.`, 2500);

`showToast()` assigns via `textContent`, so `GN.esc(msg.username)` will render HTML entities literally and is unnecessary for safety. Use the raw `msg.username` in this toast.

Also, if the current user is kicked, consider clearing local `myState` / disabling actions and redirecting back to the lobby (or home). After being removed from `this.players` server-side, they will stop receiving `SHITHEAD_YOUR_STATE` updates, leaving the UI in a stale/interactive state even though the server will ignore their plays.
```suggestion
          if (typeof myState !== 'undefined') {
            myState = null;
          }
          sessionStorage.removeItem(storageKey);
          window.location.href = roomCode ? `/group/${roomCode}` : '/?removed=1';
        } else {
          showToast(`⏰ ${msg.username} was removed for inactivity.`, 2500);
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/63#pullrequestreview-3869221172
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/63/review/3869221172@github.com>