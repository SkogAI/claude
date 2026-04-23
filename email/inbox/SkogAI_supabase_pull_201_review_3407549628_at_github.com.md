MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/supabase <supabase@noreply.github.com>
Date: Sat, 01 Nov 2025 07:12:24 -0700
Subject: Re: [SkogAI/supabase] Merge branch 'skogix-script-cleanup' into 185-a-cleanup-of-the-scripts-folder-to-look-over-the-usage-of-each-script-and-create-a-readme-thereafter (PR #201)
Message-ID: <SkogAI/supabase/pull/201/review/3407549628@github.com>
In-Reply-To: <SkogAI/supabase/pull/201@github.com>
References: <SkogAI/supabase/pull/201@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69061548562c4_56ea61100209dd"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR generalizes automation scripts to work with any branch prefix instead of being hardcoded to `claude/*` branches. The changes enable these tools to be used across different automation workflows (e.g., copilot, claude, or any other bot).

**Key changes:**
- Added `--prefix` option to all branch management scripts
- Added `--workflow` option to workflow monitoring script
- Updated documentation and help messages to reflect generic usage
- Scripts now default to "all branches" behavior when no prefix is specified

### Reviewed Changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| scripts/claude-watch | Added `--workflow` parameter to filter which workflow runs to monitor |
| scripts/claude-sync | Added `--prefix` parameter to sync specific branch prefixes or all branches |
| scripts/claude-status | Added `--prefix` parameter to view status of specific branch prefixes |
| scripts/claude-cleanup | Added `--prefix` parameter to clean up branches by prefix |
| scripts/auto-create-pr | Added `--prefix` parameter to conditionally create PRs based on branch prefix |
| scripts/README.md | Updated documentation for all scripts with new options and examples |
</details>






---

💡 <a href="/SkogAI/supabase/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -29,11 +73,13 @@ error() {
 # Get current branch
 BRANCH=$(git branch --show-current)
 
-# Check if we're on a claude/* branch
-if [[ ! $BRANCH =~ ^claude/ ]]; then
-  warn "Not on a claude/* branch (current: $BRANCH)"
-  warn "Skipping auto-PR creation"
-  exit 0
+# Check if prefix filter is specified
+if [ -n "$PREFIX" ]; then
+  if [[ ! $BRANCH =~ ^${PREFIX} ]]; then

The PREFIX variable should be escaped before use in regex to prevent regex injection. Special regex characters in PREFIX (like `.`, `*`, `[`, etc.) will be interpreted as regex metacharacters rather than literal characters. For example, `--prefix 'test.'` would match 'test' followed by any character. Use `[[ ! $BRANCH =~ ^${PREFIX//\//\\/} ]]` or better yet, use string prefix matching with `[[ $BRANCH != ${PREFIX}* ]]` instead.
```suggestion
  if [[ $BRANCH != ${PREFIX}* ]]; then
```

>  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
 
 # Fetch latest from remote
 git fetch --quiet origin 2>/dev/null || true
 
-# Get all claude/* branches (both local and remote)
-BRANCHES=$(git branch -a | grep -E '(^|\s+)claude/' | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)
+# Get branches, optionally filtered by prefix
+if [ -n "$PREFIX" ]; then
+    # Escape special regex characters in PREFIX
+    ESCAPED_PREFIX=$(echo "$PREFIX" | sed 's|/|\\/|g')
+    BRANCHES=$(git branch -a | rg "(^|\\s+)${ESCAPED_PREFIX}" | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)

The script uses `rg` (ripgrep) which may not be installed on all systems, while the else branch uses standard `grep`. This creates an inconsistent dependency. Replace `rg` with `grep -E` to use the same tool throughout: `BRANCHES=$(git branch -a | grep -E \"(^|\\s+)${ESCAPED_PREFIX}\" | sed 's/^[* ]*//; s/remotes\\/origin\\///' | sort -u)`
```suggestion
    BRANCHES=$(git branch -a | grep -E "(^|\\s+)${ESCAPED_PREFIX}" | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)
```

> @@ -39,16 +83,22 @@ git fetch origin "${main_branch}:${main_branch}" 2>/dev/null || {
     echo -e "${YELLOW}Note: Could not update local ${main_branch} (might be checked out)${NC}"
 }
 
-# Find all local claude/* branches
-claude_branches=$(git for-each-ref --format='%(refname:short)' refs/heads/claude/)
+# Find all local branches, optionally filtered by prefix
+if [ -n "$PREFIX" ]; then
+    branches_to_sync=$(git for-each-ref --format='%(refname:short)' "refs/heads/${PREFIX}" 2>/dev/null || echo "")

The pattern `refs/heads/${PREFIX}` requires an exact match, but should use glob matching with a wildcard. This will fail to match branches like `claude/feature-1` when PREFIX is `claude/`. Change to: `branches_to_sync=$(git for-each-ref --format='%(refname:short)' \"refs/heads/${PREFIX}*\" 2>/dev/null || echo \"\")`
```suggestion
    branches_to_sync=$(git for-each-ref --format='%(refname:short)' "refs/heads/${PREFIX}*" 2>/dev/null || echo "")
```

> +        remote_branches=$(git branch -r --list "origin/${PREFIX}*" --format='%(refname:short)' | sed 's|origin/||' || true)
+    else
+        local_branches=$(git branch --format='%(refname:short)' | grep -v "^${default_branch}$" || true)
+        remote_branches=$(git branch -r --format='%(refname:short)' | sed 's|origin/||' | grep -v "^${default_branch}$" || true)

The grep pattern may fail to exclude HEAD entries. When `git branch -r` is used, it can include `origin/HEAD -> origin/main` entries. After the sed replacement, these become `HEAD -> main`. Add an additional filter: `remote_branches=$(git branch -r --format='%(refname:short)' | sed 's|origin/||' | grep -v \"^${default_branch}$\" | grep -v \"^HEAD\" || true)`
```suggestion
        remote_branches=$(git branch -r --list "origin/${PREFIX}*" --format='%(refname:short)' | sed 's|origin/||' | grep -v "^HEAD" || true)
    else
        local_branches=$(git branch --format='%(refname:short)' | grep -v "^${default_branch}$" || true)
        remote_branches=$(git branch -r --format='%(refname:short)' | sed 's|origin/||' | grep -v "^${default_branch}$" | grep -v "^HEAD" || true)
```

> +echo -e "  • Open @claude issues: ${BOLD}${OPEN_ISSUES}${NC}"
+echo -e "  • Open @claude PRs: ${BOLD}${OPEN_PRS}${NC}"

The labels still reference '@claude' specifically, but the script now works with any prefix. These should be generalized to reflect that they show all @claude mentions regardless of the prefix filter being used. Consider changing to: `echo -e \"  • Open issues with @claude: ${BOLD}${OPEN_ISSUES}${NC}\"` and `echo -e \"  • Open PRs with @claude: ${BOLD}${OPEN_PRS}${NC}\"`
```suggestion
echo -e "  • Open issues with mentions: ${BOLD}${OPEN_ISSUES}${NC}"
echo -e "  • Open PRs with mentions: ${BOLD}${OPEN_PRS}${NC}"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/supabase/pull/201#pullrequestreview-3407549628
You are receiving this because you authored the thread.

Message ID: <SkogAI/supabase/pull/201/review/3407549628@github.com>