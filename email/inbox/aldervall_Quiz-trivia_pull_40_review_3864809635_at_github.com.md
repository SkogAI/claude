MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 20:30:49 -0800
Subject: Re: [aldervall/Quiz-trivia] Add player rules page and link it from player/lobby views (PR #40)
Message-ID: <aldervall/Quiz-trivia/pull/40/review/3864809635@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/40@github.com>
References: <aldervall/Quiz-trivia/pull/40@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a11df9e873b_b5111016615a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This pull request adds a new rules page at `/rules` that explains the gameplay for Quiz and Shithead games. The page is accessible via a "📖 Rules" link added to the player join screen, lobby screen, and in-game views. The rules page includes smart back-navigation that returns users to their previous location.

**Changes:**
- Added a new `/rules` route in server.js and a standalone rules.html page with game explanations
- Integrated "📖 Rules" links across all player-facing views (join, lobby, quiz game, shithead game)
- Implemented context-aware back navigation using query parameters (`?room=CODE&from=PATH`)

### Reviewed changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| server.js | Added GET /rules route to serve the new rules page |
| public/rules.html | New standalone page with Quiz and Shithead game rules, includes back-navigation logic |
| public/player/index.html | Added fixed-position rules link in top-right corner with dynamic URL updates |
| public/group/index.html | Added rules link to header alongside room code chip |
| public/games/shithead/index.html | Added fixed-position rules link in top-right corner |
| public/games/quiz/index.html | Added fixed-position rules link in top-right corner |
</details>






> +        <li>Play cards of equal or higher rank than the current top card.</li>
+        <li>Special cards can reset or clear the pile based on game rules.</li>
+        <li>If you cannot play, pick up the pile.</li>
+        <li>The first player to get rid of all cards wins.</li>
+      </ul>
+    </section>
+
+    <p>If your host uses house rules, the host's call applies for this room.</p>
+  </main>
+
+  <script>
+    const params = new URLSearchParams(location.search);
+    const from = params.get('from');
+    const room = (params.get('room') || '').toUpperCase();
+
+    const isSafePath = typeof from === 'string' && from.startsWith('/');

The validation `from.startsWith('/')` is insufficient to prevent navigation to external sites. A malicious URL like `//evil.com/path` starts with `/` but is a protocol-relative URL that navigates to an external domain. This could be exploited for phishing attacks.

Consider strengthening the validation to ensure the path doesn't start with `//`, or use a more robust check like checking that it starts with `/` but not `//`.
```suggestion
    const isSafePath =
      typeof from === 'string' &&
      from.startsWith('/') &&
      !from.startsWith('//');
```

> @@ -434,6 +450,9 @@ <h1>Game over!</h1>
   let selectedCardIds = new Set();
   let ws, connectGen = 0;
 
+  document.getElementById('rules-link').href =
+    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(location.pathname)}`;

The construction of the `from` parameter is inconsistent across files. In `public/player/index.html` line 643, it includes both `location.pathname` and `location.search`, but in `public/games/shithead/index.html` line 454, `public/games/quiz/index.html` line 350, and `public/group/index.html` line 501, it only includes `location.pathname`.

While this doesn't cause issues currently (since these pages don't have query strings), it would be more consistent and future-proof to always include `location.search` in the `from` parameter construction. This ensures that if query parameters are added to these pages in the future, the back navigation will preserve them.
```suggestion
    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(`${location.pathname}${location.search}`)}`;
```

> @@ -330,6 +346,9 @@ <h1>Game Over!</h1>
   const storageKey = `gn-username-${roomCode}`;
   let myUsername   = sessionStorage.getItem(storageKey);
 
+  document.getElementById('rules-link').href =
+    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(location.pathname)}`;

The construction of the `from` parameter is inconsistent with `public/player/index.html` line 643, which includes both `location.pathname` and `location.search`. For consistency and future-proofing (in case query parameters are added to these pages), consider using `${location.pathname}${location.search}` here as well.
```suggestion
    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(`${location.pathname}${location.search}`)}`;
```

> @@ -478,6 +497,8 @@ <h2>🎮 Game Night</h2>
   let selectedDeckCount     = 1;
 
   document.getElementById('room-chip').textContent = roomCode || '????';
+  document.getElementById('rules-link').href =
+    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(location.pathname)}`;

The construction of the `from` parameter is inconsistent with `public/player/index.html` line 643, which includes both `location.pathname` and `location.search`. For consistency and future-proofing (in case query parameters are added to these pages), consider using `${location.pathname}${location.search}` here as well.
```suggestion
    `/rules?room=${encodeURIComponent(roomCode || '')}&from=${encodeURIComponent(`${location.pathname}${location.search}`)}`;
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/40#pullrequestreview-3864809635
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/40/review/3864809635@github.com>