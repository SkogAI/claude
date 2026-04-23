MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:11:04 -0800
Subject: Re: [aldervall/Quiz-trivia] Complete Shithead card game integration into room-based Game Night (PR #22)
Message-ID: <aldervall/Quiz-trivia/pull/22/review/3864474856@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/22@github.com>
References: <aldervall/Quiz-trivia/pull/22@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fd38e111_ca111014243c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Integrates the standalone Shithead card game into the room-based “Game Night” flow so it can be selected from the lobby, started by the admin, and played using the standard room WebSocket with proper display + player UIs.

**Changes:**
- Extend Shithead deck creation to support 1–3 combined decks and allow `startGame(deckCount)`.
- Wire Shithead into the room server flow (`START_MINI_GAME`, reconnect handling, new `SHITHEAD_*` message handlers, cleanup/reset hooks).
- Enable Shithead selection in the lobby UI (including deck-count setting) and replace the in-room Shithead player placeholder with a full mobile UI; add a dedicated Shithead display screen.

### Reviewed changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `shithead.js` | Adds multi-deck support and passes deck count into game start. |
| `server.js` | Creates and manages per-room `ShitheadGame` instances and routes Shithead WS commands through the room WS. |
| `public/group/index.html` | Enables Shithead tile and adds deck-count selection + start behavior for Shithead. |
| `public/group/display.html` | Adds a Shithead-specific display UI and handlers for `SHITHEAD_*` broadcast messages. |
| `public/games/shithead/index.html` | Implements the in-room Shithead player UI using the standard room WebSocket join flow. |
</details>






> +        gameState = msg;
+        if (msg.state === 'PLAYING') {
+          if (!document.getElementById('playing').classList.contains('active')) {
+            show('playing');
+          }

`SHITHEAD_GAME_STATE` handling doesn’t cover `msg.state === 'GAME_OVER'`. On reconnect/refresh after the game ends, `ShitheadGame.addPlayer()` re-sends `SHITHEAD_GAME_STATE` but does not re-emit `SHITHEAD_GAME_OVER`, so this page can fail to show the game-over screen. Handle `GAME_OVER` here (derive the shithead player from `msg.players` / `msg.finishOrder` if needed) and route it through the same UI as `SHITHEAD_GAME_OVER`.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/22#pullrequestreview-3864474856
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/22/review/3864474856@github.com>