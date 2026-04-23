MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 21 Nov 2025 15:21:59 -0800
Subject: Re: [SkogAI/skogix] Enhance /commit-pr with pre-flight validation and smart defaults (PR #42)
Message-ID: <SkogAI/skogix/pull/42/review/3494669826@github.com>
In-Reply-To: <SkogAI/skogix/pull/42@github.com>
References: <SkogAI/skogix/pull/42@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6920f4175a85d_de110029532"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR enhances the `/commit-pr` command with robust pre-flight validation, smart defaults, and improved error handling. The changes make the command more resilient by detecting existing PRs, dynamically determining the default branch, and validating the repository state before attempting operations. Additional context gathering (submodules, recent commits) provides better information for decision-making.

- Added pre-flight validation checks to prevent duplicate PRs and ensure clean repository state
- Implemented dynamic default branch detection with fallback handling
- Enhanced context gathering with submodule status, recent commits, and existing PR detection
- Added argument support for custom PR titles/descriptions via `argument-hint`
- Expanded allowed tools list to support new validation and detection features
- Updated CLAUDE.md with comprehensive skogcli CLI documentation and integration notes

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 7 comments.

| File | Description |
| ---- | ----------- |
| .claude/commands/commit-pr.md | Enhanced with pre-flight validation, default branch detection, existing PR checks, argument support, and expanded context gathering |
| CLAUDE.md | Added skogcli CLI documentation section with config, agent, and memory management commands; added context notes about skogcli installation and .envrc integration |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +- If PR already exists, provide the existing PR URL instead of creating duplicate
+- If push fails, explain the issue

The error handling guidance is incomplete. Consider adding specific scenarios:
- What if there are no changes to commit? (covered in pre-flight check #1 but not in error handling)
- What if the branch is behind origin and needs to be rebased/merged first?
- What if there are merge conflicts when creating the branch from default?
- What if `gh` CLI is not authenticated?

These are common failure modes that should have clear guidance.
```suggestion
- If PR already exists, provide the existing PR URL instead of creating duplicate.
- If push fails, explain the issue (e.g., branch is behind origin, authentication failure, etc.) and suggest resolution.
- If there are no changes to commit, explain that there is nothing to commit and abort the process.
- If the branch is behind origin and needs to be rebased or merged, explain the situation and suggest running `git pull --rebase` or `git merge origin/<branch>` before retrying.
- If there are merge conflicts when creating the branch or rebasing, explain the conflict and suggest resolving conflicts before proceeding.
- If the `gh` CLI is not authenticated, explain the authentication error and suggest running `gh auth login` to authenticate.
```

> @@ -1,20 +1,45 @@
 ---
-allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*)
-description: Commit, push, and open a PR
+allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(git fetch:*), Bash(git rev-parse:*), Bash(git diff:*)

The allowed-tools list is missing `Bash(git symbolic-ref:*)` which is used in line 12 for default branch detection. Additionally, `Bash(git log:*)` is used in line 13 but not listed. Consider adding:
- `Bash(git symbolic-ref:*)`
- `Bash(git log:*)`
- `Bash(git remote:*)` (as a fallback for default branch detection)
- `Bash(git submodule:*)` (used in line 15)
```suggestion
allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(git fetch:*), Bash(git rev-parse:*), Bash(git diff:*), Bash(git symbolic-ref:*), Bash(git log:*), Bash(git remote:*), Bash(git submodule:*)
```

> @@ -1,20 +1,45 @@
 ---
-allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*)
-description: Commit, push, and open a PR
+allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(git fetch:*), Bash(git rev-parse:*), Bash(git diff:*)

The git command syntax in allowed-tools appears incorrect. The flag should be `-b` (short form) or `--orphan` for new branches, not `--branch`. The correct syntax is:
- `git checkout -b <branch-name>` to create a new branch
- `git switch -c <branch-name>` (newer syntax)

Update to: `Bash(git checkout -b:*)` or add `Bash(git switch:*)` for modern git versions.
```suggestion
allowed-tools: Bash(git checkout -b:*), Bash(git switch -c:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(git fetch:*), Bash(git rev-parse:*), Bash(git diff:*)
```

>  ---
 
 ## Context
 
 - Current git status: !`git status`
 - Current git diff (staged and unstaged changes): !`git diff HEAD`
 - Current branch: !`git branch --show-current`
+- Default branch: !`git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's/origin\///' || echo "master"`
+- Recent commits: !`git log --oneline -5`
+- Existing PRs for this branch: !`gh pr list --head $(git branch --show-current) --state open 2>/dev/null`
+- Submodule status: !`git submodule status --recursive`
+
+## Pre-flight checks
+
+Before proceeding, verify:
+1. There are changes to commit (staged or unstaged)
+2. No open PR already exists for this branch
+3. Current branch is not the default branch (or create new branch)

Pre-flight check #3 states "Current branch is not the default branch (or create new branch)" but this creates ambiguity. The instruction suggests two acceptable states without clarifying the expected action. Consider rephrasing to: "If on default branch, a new feature branch will be created (handled in step 1)" to clearly indicate this is informational rather than a blocking check.
```suggestion
3. If on default branch, a new feature branch will be created (handled in step 1)
```

>  ---
 
 ## Context
 
 - Current git status: !`git status`
 - Current git diff (staged and unstaged changes): !`git diff HEAD`
 - Current branch: !`git branch --show-current`
+- Default branch: !`git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's/origin\///' || echo "master"`

The default branch detection command may fail or return unexpected results. The fallback `echo "master"` assumes "master" is the default, but modern repositories often use "main". Consider improving the fallback logic:

```bash
git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's/origin\///' || git remote show origin | grep 'HEAD branch' | cut -d' ' -f5 || echo "main"
```

Alternatively, use `gh repo view --json defaultBranchRef --jq .defaultBranchRef.name` if `gh` CLI is available.
```suggestion
- Default branch: !`git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's/origin\///' || git remote show origin | grep 'HEAD branch' | cut -d' ' -f5 || echo "main"`
```

>  
 ## Your task
 
-Based on the above changes:
+Based on the above changes and checks:
+
+1. If on default branch, create a new feature branch with descriptive name based on changes
+2. Stage all changes with `git add -A`
+3. Create a single commit with an appropriate conventional message
+4. Push the branch to origin (use `--set-upstream` if needed)
+5. Create a pull request using `gh pr create`
+   - Use commit message as title (or $ARGUMENTS if provided)

The instruction to use "$ARGUMENTS if provided" is ambiguous. It's unclear whether this means:
1. Use arguments as the title (replacing commit message entirely)
2. Append arguments to the commit message
3. Use arguments only if no commit message exists

Consider clarifying the precedence and format, such as: "Use $ARGUMENTS as the PR title if provided, otherwise use the commit message as the title".
```suggestion
   - Use $ARGUMENTS as the PR title if provided, otherwise use the commit message as the title
```

>  
 ## Your task
 
-Based on the above changes:
+Based on the above changes and checks:
+
+1. If on default branch, create a new feature branch with descriptive name based on changes
+2. Stage all changes with `git add -A`
+3. Create a single commit with an appropriate conventional message
+4. Push the branch to origin (use `--set-upstream` if needed)
+5. Create a pull request using `gh pr create`
+   - Use commit message as title (or $ARGUMENTS if provided)
+   - Generate body summarizing the changes
+   - Target the default branch
+
+$ARGUMENTS

[nitpick] The `$ARGUMENTS` placeholder appears standalone without context. Unlike the `/commit` command which has it directly under "Your task", this placement between the task steps and error handling is confusing. Consider either:
1. Moving it closer to where it's referenced (line 35)
2. Adding explanatory text like "Arguments provided by user: $ARGUMENTS"
3. Removing it if it's automatically expanded by the framework
```suggestion
Arguments provided by user: $ARGUMENTS
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/42#pullrequestreview-3494669826
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogix/pull/42/review/3494669826@github.com>