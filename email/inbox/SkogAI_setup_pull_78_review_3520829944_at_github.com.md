MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:27:51 -0800
Subject: Re: [SkogAI/setup] Add issue workflow documentation and todo directory=0A=0ACo-authored-by: Skogix <690279+Skogix@users.noreply.github.com> (PR #78)
Message-ID: <SkogAI/setup/pull/78/review/3520829944@github.com>
In-Reply-To: <SkogAI/setup/pull/78@github.com>
References: <SkogAI/setup/pull/78@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b655761672_c3110012823de"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds comprehensive documentation for the repository's git worktree-based issue workflow and creates the `todo/` directory structure for tracking work on GitHub issues. The workflow integrates several scripts (wt-issue, wt-new, wt-pr, wt-list, wt-done) with personal markdown tracking files.

**Key Changes:**
- Documents the complete issue workflow in CLAUDE.md (steps 1-7)
- Creates todo/ directory with explanatory .gitkeep file
- Updates .gitignore to exclude personal todo markdown files

### Reviewed changes

Copilot reviewed 2 out of 3 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| todo/.gitkeep | Creates todo directory with documentation explaining its purpose for tracking issue work |
| CLAUDE.md | Adds comprehensive "Issue Workflow" section documenting the 7-step worktree-based workflow with script usage examples |
| .gitignore | Adds pattern to exclude personal todo/*.md tracking files from version control |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +   echo "# Issue #<issue-number>: <title>
+
+   ## Plan
+   - [ ] Task 1
+   - [ ] Task 2
+   
+   ## Notes
+   - Notes go here
+   " > todo/<issue-number>.md

Missing closing quote in the echo command. The multiline string should be properly closed with a quote before the redirect operator.

The command should be:
```bash
echo "# Issue #<issue-number>: <title>

## Plan
- [ ] Task 1
- [ ] Task 2

## Notes
- Notes go here" > todo/<issue-number>.md
```

> @@ -84,6 +84,66 @@ The `.gitconfig.j2` template includes:
 
 - Run `scripts/status` at conversation start
 
+### Issue Workflow
+
+This repository uses a git worktree-based workflow for managing issues:
+
+1. **Create an issue** (optional - can work on issues created via GitHub UI):
+   ```bash
+   ./scripts/wt-issue "<title>" "[body]"
+   # Returns issue number to use in next step
+   ```
+
+2. **Create a worktree linked to the issue**:
+   ```bash
+   ./scripts/wt-new <branch-name> <issue-number>

The documentation shows `<issue-number>` as required, but the actual script (scripts/wt-new:4) defines it as optional: `[issue-number]`. The documentation should use square brackets to indicate it's optional:

```bash
./scripts/wt-new <branch-name> [<issue-number>]
```

This is particularly relevant since step 1 mentions "optional - can work on issues created via GitHub UI", suggesting the workflow can work without creating issues via the script.
```suggestion
   ./scripts/wt-new <branch-name> [<issue-number>]
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/78#pullrequestreview-3520829944
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/78/review/3520829944@github.com>