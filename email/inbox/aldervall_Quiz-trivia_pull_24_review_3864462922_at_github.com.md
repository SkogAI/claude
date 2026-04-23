MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 18:04:39 -0800
Subject: Re: [aldervall/Quiz-trivia] Add Istanbul/nyc test coverage reporting (PR #24)
Message-ID: <aldervall/Quiz-trivia/pull/24/review/3864462922@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/24@github.com>
References: <aldervall/Quiz-trivia/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0fbb76681d_db1110119585"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds Istanbul/nyc-based coverage reporting to the Node.js trivia server to make it easier to measure how much of the server-side code is exercised by tests.

**Changes:**
- Adds `nyc` dev dependency plus `npm test` and `npm run coverage` scripts.
- Configures nyc reporters (`text`, `lcov`, `html`) and output directory (`coverage/`).
- Updates `.gitignore` and `README.md` with coverage artifacts + usage docs.

### Reviewed changes

Copilot reviewed 2 out of 4 changed files in this pull request and generated 4 comments.

| File | Description |
| ---- | ----------- |
| package.json | Adds `test`/`coverage` scripts and nyc configuration for server modules. |
| package-lock.json | Locks nyc and its transitive dependencies. |
| README.md | Documents how to run tests and generate/read coverage reports. |
| .gitignore | Ignores nyc output directories (`coverage/`, `.nyc_output/`). |





> @@ -4,7 +4,30 @@
   "description": "Local network party quiz game",
   "main": "server.js",
   "scripts": {
-    "start": "node server.js"
+    "start": "node server.js",
+    "test": "node --test",

`npm test` is configured as `node --test`, but this repo currently has no discoverable Node test files (no `test/` directory and no `*.test.*` files). As a result, `npm test` will likely execute zero tests and still exit successfully, and `npm run coverage` will report coverage based on no executed code. Consider either (a) pointing the script at the existing test entrypoints, or (b) renaming/adding tests to match Node’s discovery conventions (e.g., `test/**/*.test.mjs` / `*.test.js`).
```suggestion
    "test": "node --test tests/**/*.js",
```

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

The nyc config doesn’t set `all: true`, so coverage will typically only be reported for files that were actually loaded during the test run. Given the PR goal of “overall test coverage reporting” across the listed server modules, consider enabling `all` so the report includes the full include-set (showing 0% for untouched modules) rather than potentially omitting them.

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

`nyc@18` requires Node `20 || >=22` (as reflected by the lockfile), but the README section doesn’t mention this. If someone runs the project outside Docker on an older Node version, `npm run coverage` will fail. Consider documenting the minimum Node version required for coverage here (and/or adding a `package.json` `engines.node` constraint to make the requirement explicit).

> +Unit tests use Node's built-in test runner. Run all tests with:
+
+```bash
+npm test
+```

This section describes “Unit tests” run via Node’s built-in test runner, but the repository currently appears to have only `tests/*.mjs` browser scripts (no `test/` directory and no `*.test.*` files). As written, `npm test` is likely to run zero tests, so the README instructions are misleading. Consider adjusting the wording to reflect the current state, or updating the tests/scripts so `npm test` actually runs the intended suite.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/24#pullrequestreview-3864462922
You are receiving this because you were assigned.

Message ID: <aldervall/Quiz-trivia/pull/24/review/3864462922@github.com>