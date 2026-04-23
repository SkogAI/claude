MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sat, 21 Feb 2026 04:52:09 -0800
Subject: Re: [SkogAI/lore] Fix lore-data.js tracking, scope build workflow to master, restore docstring guideline (PR #59)
Message-ID: <SkogAI/lore/pull/59/review/3835534261@github.com>
In-Reply-To: <SkogAI/lore/pull/59@github.com>
References: <SkogAI/lore/pull/59@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6999aa7960491_fc113838552b"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Stops `lore-data.js` churn and unintended CI auto-commits by scoping the explorer-data build workflow to `master`, while restoring a documented Python docstring convention in `CLAUDE.md`.

**Changes:**
- Ignore `lore-data.js` in `.gitignore` (intended as a generated artifact).
- Restrict `.github/workflows/build-explorer-data.yml` push trigger to `master` only.
- Restore the “triple-quote docstrings” guideline in `CLAUDE.md`.

### Reviewed changes

Copilot reviewed 2 out of 3 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `CLAUDE.md` | Re-adds a Python documentation/docstring convention to the documented code style. |
| `.gitignore` | Adds `lore-data.js` to ignored generated artifacts. |
| `.github/workflows/build-explorer-data.yml` | Scopes the workflow push trigger to `master` to prevent CI committing back onto feature branches. |





> +    branches:
+      - master

With `lore-data.js` now gitignored, the later `git add lore-data.js` in this workflow will fail once the file is removed from tracking (unless you force-add it) and will break the job due to `bash -e`. Decide whether the file should remain tracked (then don’t ignore it) or stop committing it in CI (remove the commit/push step and/or upload it as an artifact).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/59#pullrequestreview-3835534261
You are receiving this because you were assigned.

Message ID: <SkogAI/lore/pull/59/review/3835534261@github.com>