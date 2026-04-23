MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 16:35:29 -0800
Subject: Re: [aldervall/Quiz-trivia] Implement server-side Shithead card game (PR #14)
Message-ID: <aldervall/Quiz-trivia/pull/14/c3970050802@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/14@github.com>
References: <aldervall/Quiz-trivia/pull/14@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0e6d1de85a_d611107541e"; charset="UTF-8"

Copilot left a comment (aldervall/Quiz-trivia#14)


> @copilot apply changes based on the comments in [this thread](https://github.com/aldervall/Quiz-trivia/pull/14#pullrequestreview-3864262699)

Applied all review feedback in commit 8bff375:

- All `SHITHEAD_ERROR` messages now include `code` + `message` fields (`INVALID_USERNAME`, `GAME_IN_PROGRESS`, `ROOM_FULL`, `NOT_YOUR_TURN`, `NO_VALID_CARDS`, `INVALID_CARD_SELECTION`, `MISMATCHED_RANKS`, `ILLEGAL_PLAY`, `INVALID_PLAY_ORDER`, `CARD_NOT_FOUND`)
- `addPlayer` validates empty username before checking for reconnects
- `swapCard` validates `handCardId`/`faceUpCardId` are non-empty strings
- `playCards` guards `cardIds` is a non-empty array (in both `shithead.js` and `server.js`)
- `playFaceDown` validates `cardId` is present before `findIndex`
- `restart()` now broadcasts `SHITHEAD_GAME_STATE` after `SHITHEAD_RESTARTED` so clients receive the reset state
- `removePlayer` deletes the player from the Map during `LOBBY` state (full removal), and only nulls `ws` during an active game (preserves reconnection)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/14#issuecomment-3970050802
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/14/c3970050802@github.com>