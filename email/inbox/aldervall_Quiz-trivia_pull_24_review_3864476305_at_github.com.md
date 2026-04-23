MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:11:46 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Istanbul/nyc test coverage reporting (PR #24)
Message-ID: <aldervall/Quiz-trivia/pull/24/review/3864476305@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/24@github.com>
References: <aldervall/Quiz-trivia/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fd62a578e_ae11101025a5"; charset="UTF-8"

@Copilot commented on this pull request.



> +  "nyc": {
+    "include": [
+      "game.js",
+      "local-db.js",
+      "questions.js",
+      "server.js",
+      "shithead.js",
+      "translator.js"
+    ],
+    "exclude": [
+      "node_modules/**",
+      "tests/**",
+      "public/**"
+    ],
+    "reporter": [
+      "text",
+      "lcov",
+      "html"
+    ],
+    "report-dir": "coverage"

Added `"all": true` to the nyc config in f53ecad. All six server-side modules now appear in the coverage table even when no tests load them.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/24#discussion_r2862146244
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/24/review/3864476305@github.com>