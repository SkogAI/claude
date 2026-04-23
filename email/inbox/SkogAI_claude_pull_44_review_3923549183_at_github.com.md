MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Tue, 10 Mar 2026 08:55:57 -0700
Subject: Re: [SkogAI/claude] worktree testworktree (PR #44)
Message-ID: <SkogAI/claude/pull/44/review/3923549183@github.com>
In-Reply-To: <SkogAI/claude/pull/44@github.com>
References: <SkogAI/claude/pull/44@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69b03f0d22e97_bd111050899"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Updates the repo’s worktree workflow to ship each worktree branch via a PR directly to `master`, and adds helper commands to streamline “ship” and “merge” steps.

**Changes:**
- Update `projects/GIT.md` to document a worktree → PR → master workflow and related setup/rules.
- Add `workspace::ship` and `workspace::merge` commands to `Argcfile.sh` (including `gh pr create --fill` default behavior).

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 6 comments.

| File | Description |
| ---- | ----------- |
| projects/GIT.md | Documents the simplified shipping workflow (worktree PRs to master) and updates setup/rules accordingly. |
| Argcfile.sh | Adds CLI helpers for pushing a worktree branch + creating a PR, and for running `wt merge` for trivial changes. |





---

💡 <a href="/SkogAI/claude/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +- master is the only branch that talks to origin
+- no develop branch — worktrees PR directly against master
+- worktree branches are temporary — removed after merge

The workflow section pushes the worktree branch to `origin`, but the rules section later says “master is the only branch that talks to origin”. These statements conflict; either update the rule (e.g., “only master is long-lived on origin / only master is merged into”) or adjust the workflow to avoid pushing feature branches.
```suggestion
- master is the only long-lived branch on origin (only branch you push to directly)
- worktree branches may be pushed to origin only for PRs and are deleted after merge
- no develop branch — worktrees PR directly against master
```

> +git push -u origin HEAD
 gh pr create --base master
 ```

The PR description mentions adding `--fill` to the default PR creation flow, but this doc snippet uses `gh pr create --base master` without `--fill`. Consider updating the example to include `--fill` (or `--title/--body`) to match the intended non-interactive default behavior.

> +  local branch
+  branch=$(git branch --show-current)
+
+  if [[ "$branch" == "master" ]]; then
+    echo "error: already on master, nothing to ship" >&2
+    return 1
+  fi

`branch=$(git branch --show-current)` can be empty in a detached-HEAD state. In that case the script will still run `git push -u origin HEAD`, which can fail or push to an unintended remote ref. Consider validating that `branch` is non-empty (and possibly that it matches the expected `worktree-*` pattern) before proceeding.

> +  git push -u origin HEAD
+  if [[ -n "$argc_title" ]]; then
+    gh pr create --base master --title "$argc_title" --body "${argc_body:-}"
+  else
+    gh pr create --base master --fill
+  fi

If `git push -u origin HEAD` fails, the function will still attempt to create a PR. Since this is a workflow helper, it should stop on push failure (e.g., check the exit status / `|| return`) to avoid confusing follow-up errors from `gh pr create`.

> @@ -25,6 +25,31 @@ workspace::remove() {
   git worktree remove "$(_worktree_path "$argc_name")"
 }
 
+# @cmd Push worktree branch and create PR against master
+# @option -t --title  PR title
+# @option -b --body   PR body
+workspace::ship() {
+  local branch
+  branch=$(git branch --show-current)
+
+  if [[ "$branch" == "master" ]]; then
+    echo "error: already on master, nothing to ship" >&2
+    return 1
+  fi
+
+  git push -u origin HEAD
+  if [[ -n "$argc_title" ]]; then
+    gh pr create --base master --title "$argc_title" --body "${argc_body:-}"

When `--title` is provided but `--body` is omitted, the code passes `--body ""`, which forces an empty PR body. It’s usually better to omit `--body` unless a body was explicitly provided, or fall back to `--fill` so the PR body can be auto-populated.
```suggestion
    if [[ -n "$argc_body" ]]; then
      gh pr create --base master --title "$argc_title" --body "$argc_body"
    else
      gh pr create --base master --title "$argc_title" --fill
    fi
```

> +  branch=$(git branch --show-current)
+
+  if [[ "$branch" == "master" ]]; then
+    echo "error: already on master, nothing to ship" >&2
+    return 1
+  fi
+
+  git push -u origin HEAD
+  if [[ -n "$argc_title" ]]; then
+    gh pr create --base master --title "$argc_title" --body "${argc_body:-}"
+  else
+    gh pr create --base master --fill
+  fi
+}
+
+# @cmd Merge current worktree into master (for trivial changes)

`workspace::merge` is described as merging “into master”, but it just runs `wt merge` without specifying/ensuring the target branch. If `wt` is configured to merge into a different default branch, this wrapper could merge into the wrong place. Consider either enforcing the intended target (e.g., ensure `wt` default-branch is `master` here) or adjusting the command description to match the actual behavior.
```suggestion
# @cmd Merge current worktree using wt's default target branch (for trivial changes)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/44#pullrequestreview-3923549183
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/claude/pull/44/review/3923549183@github.com>