MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sun, 14 Sep 2025 08:28:05 -0700
Subject: Re: [SkogAI/claude] feat: add Git-based project management workflow (PR #3)
Message-ID: <SkogAI/claude/pull/3/review/3222172346@github.com>
In-Reply-To: <SkogAI/claude/pull/3@github.com>
References: <SkogAI/claude/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c6df05de3d6_10010e058577"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements a Git-based project management workflow to replace local todo lists, establishing standardized processes for task tracking and development workflows.

- Introduces comprehensive Git workflow documentation with git-flow branch naming conventions
- Adds GitHub issue templates for structured tracking of features, bugs, and general tasks
- Establishes conventional commit message format for consistent change documentation

### Reviewed Changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| GIT_WORKFLOW.md | Comprehensive workflow guide with branch strategies, commit conventions, and CLI commands |
| .github/ISSUE_TEMPLATE/task.md | Template for general tasks with priority and subtask tracking |
| .github/ISSUE_TEMPLATE/feature.md | Template for new features with requirements and acceptance criteria |
| .github/ISSUE_TEMPLATE/bug.md | Template for bug reports with reproduction steps and environment details |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/claude/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -0,0 +1,125 @@
+# Git Workflow Guide
+
+## Branch Strategy
+
+### Main Branches
+- `master` or `main` - Production-ready code

Consider using only `main` as the primary branch name, as `master` is being phased out in favor of more inclusive terminology. Most modern Git repositories default to `main`.
```suggestion
- `main` - Production-ready code
```

> +- `in-progress` - Currently being worked on
+- `blocked` - Waiting on dependencies
+- `ready-for-review` - PR ready for review
+
+## Quick Commands
+
+### Create and track issue from CLI
+```bash
+# Create issue
+gh issue create --title "Task title" --body "Description" --label "task"
+
+# List open issues
+gh issue list
+
+# Start work on issue
+gh issue develop 42 --checkout

The `gh issue develop` command with `--checkout` flag doesn't exist in the GitHub CLI. Use `gh issue develop 42` which creates and checks out a branch, or use standard git commands: `git checkout -b feature/42-description`.
```suggestion
gh issue develop 42
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/3#pullrequestreview-3222172346
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/3/review/3222172346@github.com>