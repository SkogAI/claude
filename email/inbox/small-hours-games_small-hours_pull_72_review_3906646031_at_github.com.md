MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Fri, 06 Mar 2026 15:53:48 -0800
Subject: Re: [small-hours-games/small-hours] Add test coverage analysis with prioritized improvement recommendations (PR #72)
Message-ID: <small-hours-games/small-hours/pull/72/review/3906646031@github.com>
In-Reply-To: <small-hours-games/small-hours/pull/72@github.com>
References: <small-hours-games/small-hours/pull/72@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69ab690c31d71_f81110952011"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a repository-level testing/coverage assessment document to guide future work on improving automated test coverage across the quiz + mini-games codebase.

**Changes:**
- Introduces `TEST_COVERAGE_ANALYSIS.md` summarizing the current testing situation (no Node test-runner-discovered tests; existing Puppeteer scripts).
- Proposes a prioritized roadmap of unit/integration/E2E test additions across core modules (`game.js`, `shithead.js`, `cah.js`, `server/*`, question pipeline, spy game).
- Suggests “quick win” targets for extracting/testing pure(ish) logic.





> @@ -0,0 +1,152 @@
+# Test Coverage Analysis
+
+## Current State
+
+The project has **zero unit tests**. Running `npm test` (`node --test`) discovers 0 test files because the existing E2E tests in `tests/` use `.mjs` extension without the `.test.` naming convention.

This sentence makes it sound like the `.mjs` extension prevents discovery, but Node’s runner supports `.mjs` (per README). The real issue is that the files aren’t named with a `*.test.*` pattern (and/or aren’t passed explicitly), so it would be clearer to call that out to avoid confusion.
```suggestion
The project has **zero unit tests**. Running `npm test` (`node --test`) discovers 0 test files because the existing E2E tests in `tests/` are `.mjs` scripts that do not follow a `*.test.*` naming pattern and are not passed explicitly to the test runner.
```

> +- **Rename existing tests** to `*.test.mjs` so `node --test` discovers them.
+- **Add Shithead E2E test**: Full card game flow with 2+ players.
+- **Add CAH E2E test**: Full round with czar picking winner.
+- **Automate Spy game test**: Convert `spy-manual-test.md` to Puppeteer test.

Renaming these Puppeteer scripts to `*.test.mjs` will make them discoverable, but they currently don’t use `node:test`/assertions and mostly just `console.log('❌')` on failures. As written, they may still exit 0 even when a check fails, so the recommendation should include converting checks into failing assertions (or setting a non-zero exit code) so CI can reliably detect regressions.
```suggestion
- **Rename existing tests** to `*.test.mjs` so `node --test` discovers them, and update them to use `node:test` (or another assertion library) so that failed checks cause a non-zero exit code instead of only `console.log` output.
- **Add Shithead E2E test**: Full card game flow with 2+ players, wired through `node:test`/assertions so CI can reliably detect regressions.
- **Add CAH E2E test**: Full round with czar picking winner, using assertions rather than just logging failures.
- **Automate Spy game test**: Convert `spy-manual-test.md` to a Puppeteer test using `node:test`/assertions (or explicit non-zero `process.exitCode`) so failures break the CI build.
```

> +- **Rename existing tests** to `*.test.mjs` so `node --test` discovers them.
+- **Add Shithead E2E test**: Full card game flow with 2+ players.
+- **Add CAH E2E test**: Full round with czar picking winner.
+- **Automate Spy game test**: Convert `spy-manual-test.md` to Puppeteer test.
+- **Add CI integration**: Run tests in GitHub Actions before deploy.
+

The existing E2E scripts in `tests/*.mjs` currently hardcode `BASE = 'https://quiz.aldervall.se'`. If you wire these into `npm test`/CI as suggested here, they’ll run against the public demo site rather than a local ephemeral server, which is flaky and can interfere with real users. Consider updating the recommendation to require a configurable base URL (env var) and starting the server in CI (or using a mocked/staged endpoint).
```suggestion
- **Make E2E base URL configurable**: Update `tests/*.mjs` to read a `BASE_URL` (or similar) environment variable instead of hardcoding `https://quiz.aldervall.se`. Default it to a local URL such as `http://localhost:3000` for developer runs.
- **Rename existing tests** to `*.test.mjs` so `node --test` discovers them.
- **Add Shithead E2E test**: Full card game flow with 2+ players.
- **Add CAH E2E test**: Full round with czar picking winner.
- **Automate Spy game test**: Convert `spy-manual-test.md` to Puppeteer test.
- **Add CI integration**: In GitHub Actions (or other CI), start a local ephemeral server instance and run the E2E tests against it by setting `BASE_URL` to the local server URL. Do **not** point tests at the public demo site to avoid flakiness and impacting real users.
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/72#pullrequestreview-3906646031
You are receiving this because you modified the open/close state.

Message ID: <small-hours-games/small-hours/pull/72/review/3906646031@github.com>