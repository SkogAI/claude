MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sun, 14 Sep 2025 10:20:58 -0700
Subject: Re: [SkogAI/claude] Add Claude command definitions for worktree management (PR #11)
Message-ID: <SkogAI/claude/pull/11/review/3222270976@github.com>
In-Reply-To: <SkogAI/claude/pull/11@github.com>
References: <SkogAI/claude/pull/11@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c6f97aa0423_5ff110e05624d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds Claude command definitions for git worktree management functionality. It introduces commands for creating worktrees tied to GitHub issues and closing them with automatic PR creation.

- Implements worktree creation command with GitHub issue integration
- Adds worktree closure command that creates pull requests and cleans up
- Includes example command template for reference

### Reviewed Changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| README.md | Added test content for todo-issue-template |
| .claude/commands/worktree.md | Defines command for creating worktrees from GitHub issues |
| .claude/commands/worktree-close.md | Defines command for closing worktrees and creating PRs |
| .claude/commands/example.md | Provides basic example command template |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/claude/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -0,0 +1,17 @@
+---
+description: Create a git worktree for a GitHub issue
+allowed-tools: [Bash, Task]
+---
+
+Create a git worktree for working on a GitHub issue.
+
+Usage: /worktree <issue-number> [description]
+
+Steps:
+1. Parse the issue number from $ARGUMENTS
+2. If no description provided, fetch it from GitHub using `gh issue view <number>`
+3. Create branch name as `feature/issue-<number>-<kebab-case-description>`
+4. Create worktree at `/home/skogix/dev/issue-<number>`

The hardcoded path `/home/skogix/dev/` makes this command user-specific and not portable. Consider using a configurable base directory or relative path pattern.
```suggestion
4. Create worktree at `$HOME/dev/issue-<number>`
```

> @@ -0,0 +1,21 @@
+---
+description: Close a worktree and create a pull request
+allowed-tools: [Bash, Task]
+---
+
+Close a git worktree and create a pull request for the issue.
+
+Usage: /worktree-close <issue-number>
+
+Steps:
+1. Parse the issue number from $ARGUMENTS
+2. Check if worktree exists at `/home/skogix/dev/issue-<number>`

The hardcoded path `/home/skogix/dev/` should match the configurable base directory used in the worktree creation command for consistency.
```suggestion
2. Check if worktree exists at `<base-dir>/issue-<number>`
```

> +description: Create a git worktree for a GitHub issue
+allowed-tools: [Bash, Task]
+---
+
+Create a git worktree for working on a GitHub issue.
+
+Usage: /worktree <issue-number> [description]
+
+Steps:
+1. Parse the issue number from $ARGUMENTS
+2. If no description provided, fetch it from GitHub using `gh issue view <number>`
+3. Create branch name as `feature/issue-<number>-<kebab-case-description>`
+4. Create worktree at `/home/skogix/dev/issue-<number>`
+5. Show confirmation with the worktree path and branch name
+
+The worktree will be based on origin/master.

Using 'master' as the default branch is outdated. Consider using 'main' or making the base branch configurable, as many repositories have moved to 'main' as the default branch name.
```suggestion
The worktree will be based on the default branch (e.g., origin/main or origin/master).
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/11#pullrequestreview-3222270976
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/11/review/3222270976@github.com>