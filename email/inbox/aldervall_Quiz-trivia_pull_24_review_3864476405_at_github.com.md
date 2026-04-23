MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:11:51 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Istanbul/nyc test coverage reporting (PR #24)
Message-ID: <aldervall/Quiz-trivia/pull/24/review/3864476405@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/24@github.com>
References: <aldervall/Quiz-trivia/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fd6746dc2_e51110101776"; charset="UTF-8"

@Copilot commented on this pull request.



> @@ -4,7 +4,30 @@
   "description": "Local network party quiz game",
   "main": "server.js",
   "scripts": {
-    "start": "node server.js"
+    "start": "node server.js",
+    "test": "node --test",

Kept `node --test` (auto-discovers `**/*.test.{js,cjs,mjs}` per Node's built-in conventions). The existing `tests/*.mjs` files are Puppeteer E2E scripts that require a live server, so they're intentionally not wired to this script. Updated the README in f53ecad to explicitly call this out so the distinction is clear.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/24#discussion_r2862146350
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/24/review/3864476405@github.com>