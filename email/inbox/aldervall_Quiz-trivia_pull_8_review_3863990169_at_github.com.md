MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 14:53:55 -0800
Subject: Re: [aldervall/Quiz-trivia] Add contributor docs and AI agent onboarding materials (PR #8)
Message-ID: <aldervall/Quiz-trivia/pull/8/review/3863990169@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/8@github.com>
References: <aldervall/Quiz-trivia/pull/8@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0cf0321686_d611101367ae"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds contributor-facing documentation and GitHub repo templates to make onboarding (including AI agents) easier and to document the project’s architecture, entry points, and contribution workflow.

**Changes:**
- Expanded `README.md` with an Architecture/Data Flow section and a link to contributor docs.
- Added `CONTRIBUTING.md` with setup, standards, manual testing steps, and an AI agent guide.
- Added GitHub metadata files: Copilot instructions, issue templates, and a PR template.

### Reviewed changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| README.md | Adds architecture/data-flow overview, core-files summary, WS message flow, and contributing link |
| CONTRIBUTING.md | New contributor guide: setup, structure, standards, manual testing, AI agent guidance |
| .github/copilot-instructions.md | New Copilot/agent context: repo layout, conventions, state machine, WS reference |
| .github/PULL_REQUEST_TEMPLATE.md | New PR checklist template emphasizing testing and style |
| .github/ISSUE_TEMPLATE/feature_request.yml | New structured feature request form with labels and area dropdown |
| .github/ISSUE_TEMPLATE/bug_report.yml | New structured bug report form with labels and repro/env/log fields |
</details>






> +- [ ] New feature
+- [ ] Documentation update
+- [ ] Refactor / code quality
+- [ ] Other (describe below)
+
+## Testing done
+
+<!-- Describe how you tested this change. For game-logic changes, include which game flows you exercised. -->
+
+- [ ] Started server and verified the host view at `/host/`
+- [ ] Joined as a player and played through a full game
+- [ ] Verified edge cases (disconnect, all-answered early, API unavailable)
+
+## Checklist
+
+- [ ] `'use strict'` is present in any new/modified `.js` files

The PR checklist requires `'use strict'` in any new/modified `.js` files, but client-side scripts under `public/` currently don’t follow this pattern. Consider changing this checklist item to “server-side `.js` files” (or clarifying the scope) to keep guidance consistent with the existing codebase.
```suggestion
- [ ] `'use strict'` is present in any new/modified server-side `.js` files (excluding client-side scripts under `public/`)
```

> +- **`'use strict'`** at the top of every `.js` file.
+- Use `const` / `let`; avoid `var`.
+- Prefer named functions over anonymous callbacks for anything non-trivial.
+- Error handling: use `try/catch` around async operations; broadcast `{ type: 'ERROR', code, message }` to clients on failure.
+- Keep server-side and client-side concerns separate — no business logic in `server.js`, it belongs in `game.js`.

The coding standard says `'use strict'` must be at the top of every `.js` file, but the repo’s front-end scripts under `public/` don’t use it. To avoid misleading contributors, please scope this requirement to server-side Node files (e.g. `server.js`, `game.js`, `questions.js`, etc.) or explicitly exempt `public/` client code.

> +                questions.js  ← Fetches questions (local DB first, then Open Trivia DB API)
+                       │
+                 local-db.js  ← Persistent question cache in data/questions-db.json
+                       │
+               translator.js  ← Optional translation layer for non-English rounds
+```

The architecture diagram and core-files table describe `translator.js` as an active translation layer for non-English rounds, but the current server/game flow doesn’t call `translateQuestions`, and `Game.startGame(..., language)` ignores the `language` parameter. Please adjust the README to reflect current behavior (e.g. translation is planned/experimental, or `SET_LANGUAGE` only updates the client-side language flag) to avoid overpromising functionality.

> +questions.js   — Fetch + normalise questions (local DB → Open Trivia DB API)
+local-db.js    — Download and query the local question cache
+translator.js  — Optional per-round translation of question text
+public/        — Static front-end (host view + player view)

This doc lists `translator.js` as providing per-round translation, but `translateQuestions` is not currently invoked anywhere and `Game.startGame` doesn’t use its `language` argument. Please update this file to match the current implementation (or note that translation is not wired in yet) so Copilot/agents don’t implement changes based on incorrect assumptions.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/8#pullrequestreview-3863990169
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/8/review/3863990169@github.com>