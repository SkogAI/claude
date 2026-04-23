MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:11:52 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Istanbul/nyc test coverage reporting (PR #24)
Message-ID: <aldervall/Quiz-trivia/pull/24/review/3864476461@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/24@github.com>
References: <aldervall/Quiz-trivia/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fd68a0f17_f1111052782"; charset="UTF-8"

@Copilot commented on this pull request.



> +Unit tests use Node's built-in test runner. Run all tests with:
+
+```bash
+npm test
+```

Updated the README in f53ecad to remove the misleading "Unit tests" wording. The section now explains that `node --test` auto-discovers future `*.test.{js,cjs,mjs}` unit test files, and that the `tests/` folder contains E2E browser automation scripts that are not part of this runner.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/24#discussion_r2862146414
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/24/review/3864476461@github.com>