MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Thu, 20 Nov 2025 22:06:38 -0800
Subject: Re: [SkogAI/setup] Add git worktree workflow tooling (PR #3)
Message-ID: <SkogAI/setup/pull/3/review/3491322996@github.com>
In-Reply-To: <SkogAI/setup/pull/3@github.com>
References: <SkogAI/setup/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6920016ee5722_c111006113e2"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR introduces a comprehensive git worktree-based development workflow with automated GitHub integration. The tooling provides end-to-end support for feature development, from issue creation through PR submission to cleanup, enabling parallel development across multiple branches using git worktrees.

- Adds five bash scripts for worktree lifecycle management (create, list, PR, cleanup, issue)
- Implements automatic PR-to-issue linking via `.git-issue` metadata files
- Provides comprehensive documentation of the workflow in `.claude/skills/git-worktree.md`

### Reviewed Changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 9 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tooling/wt-new | Creates new worktree with optional GitHub issue linking and path traversal validation needs |
| tooling/wt-pr | Pushes branch and creates PR with automatic issue linking and commit changelog |
| tooling/wt-list | Lists all worktrees with their associated PR status from GitHub |
| tooling/wt-issue | Creates GitHub issues and outputs commands for next workflow steps |
| tooling/wt-done | Cleans up worktrees and branches after PR merge with safety checks |
| .git-issue | Metadata file linking current worktree to issue #2 |
| .claude/skills/git-worktree.md | Complete workflow documentation with examples and conventions |
</details>






---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
+        exit 1
+    fi
+fi
+
+# Get worktree path
+WORKTREE_PATH=$(git worktree list --porcelain | grep -B2 "branch refs/heads/$BRANCH" | grep "worktree" | cut -d' ' -f2)
+
+if [[ -z "$WORKTREE_PATH" ]]; then
+    echo "Error: No worktree found for branch '$BRANCH'"
+    exit 1
+fi
+
+# If we're in the worktree, move out first
+if [[ "$(pwd)" == "$WORKTREE_PATH"* ]]; then
+    cd ..

Potential bug: Using `cd ..` without checking success or storing the original directory could fail if the script is run from a location that doesn't have a parent directory accessible, or if permissions are restricted. Consider using `cd "$(git rev-parse --show-toplevel)"` to navigate to the repository root, or store and restore the original directory more safely.
```suggestion
    cd "$(git rev-parse --show-toplevel)" || { echo "Error: Failed to change directory to repo root"; exit 1; }
```

> +#!/bin/bash
+set -euo pipefail
+
+# List all worktrees with their status
+# Usage: wt-list
+
+echo "Worktrees:"
+echo "=========="
+git worktree list
+
+echo ""
+echo "PR Status:"
+echo "=========="
+
+# Get all branches with worktrees (excluding main)
+git worktree list --porcelain | grep "^branch" | cut -d'/' -f3 | while read -r branch; do

This parsing assumes branch refs are always in the format `refs/heads/branch-name` and splits on `/` taking the 3rd field. However, this will fail for branches with slashes in their names (e.g., `feature/add-login`). Consider using `cut -d'/' -f3-` to capture all segments after `refs/heads/`, or use a more robust parsing method like `sed 's|^refs/heads/||'`.
```suggestion
git worktree list --porcelain | grep "^branch" | cut -d'/' -f3- | while read -r branch; do
```

> +if [[ -n "$ISSUE_NUM" ]]; then
+    # Get issue title for PR title
+    ISSUE_TITLE=$(gh issue view "$ISSUE_NUM" --json title --jq '.title')
+
+    # Create PR body with issue link
+    PR_BODY=$(cat <<EOF
+Closes #$ISSUE_NUM
+
+## Changes
+$(git log origin/main..HEAD --pretty=format:"- %s")
+EOF
+)
+    gh pr create --title "$ISSUE_TITLE" --body "$PR_BODY" $DRAFT_FLAG
+    echo "PR created for branch $BRANCH (closes #$ISSUE_NUM)"
+else
+    gh pr create --fill $DRAFT_FLAG

The `$DRAFT_FLAG` variable is unquoted in the command. While this works when empty (it expands to nothing), it's inconsistent with the quoting practices used elsewhere in the script. Consider using an array to handle optional flags more cleanly: `FLAGS=()` and then `[[ -n "$DRAFT_FLAG" ]] && FLAGS+=(--draft)`, followed by `gh pr create --fill "${FLAGS[@]}"`. Alternatively, keep the current approach but add a comment explaining the intentional unquoted expansion.

> +
+ISSUE_NUM=""
+while [[ $# -gt 0 ]]; do
+    case $1 in
+        --issue)
+            ISSUE_NUM="$2"
+            shift 2
+            ;;
+        *)
+            echo "Unknown option: $1"
+            exit 1
+            ;;
+    esac
+done
+
+WORKTREE_PATH="../$BRANCH"

Security concern: The branch name is used directly to construct a file path without validation. A malicious or accidentally crafted branch name like `../../etc/passwd` or `../../sensitive-dir` could create worktrees outside the intended parent directory. Consider validating that `BRANCH` doesn't contain path traversal sequences: `if [[ "$BRANCH" =~ \.\./|^/ ]]; then echo "Error: Branch name cannot contain '..' or start with '/'"; exit 1; fi`

> +    echo "Error: Branch '$BRANCH' already exists"
+    exit 1
+fi
+
+# Check if worktree path already exists
+if [[ -d "$WORKTREE_PATH" ]]; then
+    echo "Error: Directory '$WORKTREE_PATH' already exists"
+    exit 1
+fi
+
+# Create worktree with new branch based on origin/main
+git worktree add "$WORKTREE_PATH" -b "$BRANCH" origin/main
+
+# Store issue number in worktree for wt-pr to use
+if [[ -n "$ISSUE_NUM" ]]; then
+    echo "$ISSUE_NUM" > "$WORKTREE_PATH/.git-issue"

The `.git-issue` file is created in the worktree directory without any validation or error checking. If the write fails (e.g., due to permissions), the script will silently continue. Consider checking the write operation succeeded: `echo "$ISSUE_NUM" > "$WORKTREE_PATH/.git-issue" || { echo "Warning: Failed to write .git-issue file"; }`
```suggestion
    echo "$ISSUE_NUM" > "$WORKTREE_PATH/.git-issue" || { echo "Warning: Failed to write .git-issue file"; }
```

> +fi
+
+# Create PR with auto-filled title and body from commits
+if [[ -n "$ISSUE_NUM" ]]; then
+    # Get issue title for PR title
+    ISSUE_TITLE=$(gh issue view "$ISSUE_NUM" --json title --jq '.title')
+
+    # Create PR body with issue link
+    PR_BODY=$(cat <<EOF
+Closes #$ISSUE_NUM
+
+## Changes
+$(git log origin/main..HEAD --pretty=format:"- %s")
+EOF
+)
+    gh pr create --title "$ISSUE_TITLE" --body "$PR_BODY" $DRAFT_FLAG

The `$DRAFT_FLAG` variable is unquoted in the command. While this works when empty (it expands to nothing), it's inconsistent with the quoting practices used elsewhere in the script. Consider using an array to handle optional flags more cleanly: `FLAGS=()` and then `[[ -n "$DRAFT_FLAG" ]] && FLAGS+=(--draft)`, followed by `gh pr create --title "$ISSUE_TITLE" --body "$PR_BODY" "${FLAGS[@]}"`. Alternatively, keep the current approach but add a comment explaining the intentional unquoted expansion.

> +        *)
+            echo "Unknown option: $1"
+            exit 1
+            ;;
+    esac
+done
+
+# Create issue
+if [[ -n "$BODY" ]]; then
+    ISSUE_URL=$(gh issue create --title "$TITLE" --body "$BODY")
+else
+    ISSUE_URL=$(gh issue create --title "$TITLE" --body "")
+fi
+
+# Extract issue number
+ISSUE_NUM=$(echo "$ISSUE_URL" | grep -oE '[0-9]+$')

The regex pattern `[0-9]+$` will fail if the GitHub issue URL doesn't end with a number (e.g., if GitHub changes URL format or returns an error message). This could result in an empty `ISSUE_NUM` which would then be echoed as "Created issue #: $TITLE". Consider adding validation: `if [[ -z "$ISSUE_NUM" ]]; then echo "Error: Failed to extract issue number from URL"; exit 1; fi` after line 37.
```suggestion
ISSUE_NUM=$(echo "$ISSUE_URL" | grep -oE '[0-9]+$')
if [[ -z "$ISSUE_NUM" ]]; then
    echo "Error: Failed to extract issue number from URL"
    exit 1
fi
```

> +fi
+
+# Check if PR is merged
+PR_STATE=$(gh pr view "$BRANCH" --json state --jq '.state' 2>/dev/null || echo "UNKNOWN")
+
+if [[ "$PR_STATE" != "MERGED" && "$PR_STATE" != "CLOSED" ]]; then
+    echo "Warning: PR for '$BRANCH' is not merged (state: $PR_STATE)"
+    read -p "Continue anyway? [y/N] " -n 1 -r
+    echo
+    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
+        exit 1
+    fi
+fi
+
+# Get worktree path
+WORKTREE_PATH=$(git worktree list --porcelain | grep -B2 "branch refs/heads/$BRANCH" | grep "worktree" | cut -d' ' -f2)

The worktree path parsing could fail if the branch name contains special regex characters or if there are multiple worktrees. The `grep -B2` approach is fragile. Consider using a more robust method: `git worktree list --porcelain | awk '/^worktree /{path=$2} /^branch refs\/heads\/'$BRANCH'$/{print path}'` or using git's built-in filtering capabilities more safely.
```suggestion
WORKTREE_PATH=$(git worktree list --porcelain | awk -v branch="refs/heads/$BRANCH" '
    /^worktree / { path = $2 }
    /^branch / && $2 == branch { print path }
')
```

> +    exit 1
+fi
+
+# Push to origin
+git push -u origin "$BRANCH"
+
+# Check for linked issue
+ISSUE_NUM=""
+if [[ -f ".git-issue" ]]; then
+    ISSUE_NUM=$(cat .git-issue)
+fi
+
+# Create PR with auto-filled title and body from commits
+if [[ -n "$ISSUE_NUM" ]]; then
+    # Get issue title for PR title
+    ISSUE_TITLE=$(gh issue view "$ISSUE_NUM" --json title --jq '.title')

If the `gh issue view` command fails (e.g., issue doesn't exist, network error, or authentication failure), the script will continue with an empty `ISSUE_TITLE`, potentially creating a PR with a blank title. Consider adding error handling: check the exit status of the `gh` command or validate that `ISSUE_TITLE` is non-empty before proceeding.
```suggestion
    ISSUE_TITLE=$(gh issue view "$ISSUE_NUM" --json title --jq '.title')
    if [[ -z "$ISSUE_TITLE" ]]; then
        echo "Error: Could not retrieve a non-empty issue title for issue #$ISSUE_NUM"
        exit 1
    fi
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/3#pullrequestreview-3491322996
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/3/review/3491322996@github.com>