MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:11:48 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Istanbul/nyc test coverage reporting (PR #24)
Message-ID: <aldervall/Quiz-trivia/pull/24/review/3864476360@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/24@github.com>
References: <aldervall/Quiz-trivia/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fd646d6a3_bd1110511ef"; charset="UTF-8"

@Copilot commented on this pull request.



> +## Testing & Coverage
+
+Unit tests use Node's built-in test runner. Run all tests with:
+
+```bash
+npm test
+```
+
+To generate a coverage report with [Istanbul/nyc](https://github.com/istanbuljs/nyc):
+
+```bash
+npm run coverage
+```

Added `"engines": {"node": ">=20"}` to package.json and a Node ≥ 20 callout at the top of the Testing & Coverage section in the README (f53ecad).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/24#discussion_r2862146294
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/24/review/3864476360@github.com>