MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/supabase <supabase@noreply.github.com>
Date: Sat, 01 Nov 2025 07:14:42 -0700
Subject: Re: [SkogAI/supabase] refactor: generalize branch/workflow management scriptsAll scripts now work on any branch/workflow by default, with optionalfiltering via --prefix or --workflow parameters.Changes:- claude-cleanup: Works on all merged branches (optional --prefix filter)- claude-sync: Works on all branches (optional --prefix filter)- claude-status: Shows all branches (optional --prefix filter)- claude-watch: Watches latest workflow (optional --workflow filter)- auto-create-pr: Works on any branch (optional --prefix filter)All scripts maintain backward compatibility while being truly generic.No more hardcoded bot-specific logic!Updated scripts/README.md with:- New generic usage examples for all scripts- Documentation for optional filtering parameters- Added [TODO] entries for all undocumented scripts

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-Authored-By: Claude <noreply@anthropic.com> (PR #212)
Message-ID: <SkogAI/supabase/pull/212/review/3407550850@github.com>
In-Reply-To: <SkogAI/supabase/pull/212@github.com>
References: <SkogAI/supabase/pull/212@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690615d27915d_3ec3e1100638ce"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the Claude-specific scripts to be more generic and reusable by adding optional prefix filtering, making them work with any branch naming pattern (not just `claude/*`). The changes allow these tools to be used for other automated workflows like Copilot or custom automation patterns.

Key changes:
- Added `--prefix` option to all scripts for filtering branches/workflows by prefix
- Updated script documentation and help messages to reflect generic usage
- Made scripts work on all branches by default when no prefix is specified

### Reviewed Changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| scripts/claude-watch | Added `--workflow` option to monitor specific workflow files, generalized messaging from "Claude" to "Workflow" |
| scripts/claude-sync | Added `--prefix` option to sync specific branch prefixes, defaults to all branches if not specified |
| scripts/claude-status | Added `--prefix` option to filter branch status display, uses `rg` for pattern matching |
| scripts/claude-cleanup | Added `--prefix` option to clean up specific branch prefixes, defaults to all merged branches |
| scripts/auto-create-pr | Added `--prefix` option to create PRs only for matching branches, generalized from Claude-specific to generic automation |
| scripts/README.md | Updated documentation for all scripts with new options and examples |
</details>






---

💡 <a href="/SkogAI/supabase/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

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

The script uses `rg` (ripgrep) command without ensuring it's installed, while the else branch uses standard `grep`. This creates an inconsistent dependency. If `rg` is not available, the script will fail when using the `--prefix` option. Consider using `grep` consistently or adding a dependency check for `rg`.
```suggestion
    if command -v rg >/dev/null 2>&1; then
        BRANCHES=$(git branch -a | rg "(^|\\s+)${ESCAPED_PREFIX}" | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)
    else
        BRANCHES=$(git branch -a | grep -E "(^|[[:space:]])${ESCAPED_PREFIX}" | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)
    fi
```

> +    ESCAPED_PREFIX=$(echo "$PREFIX" | sed 's|/|\\/|g')
+    BRANCHES=$(git branch -a | rg "(^|\\s+)${ESCAPED_PREFIX}" | sed 's/^[* ]*//; s/remotes\/origin\///' | sort -u)

The regex pattern `(^|\\s+)` may not correctly match branch names with the prefix. Git branch output starts with whitespace and an optional `*` marker. The pattern should be `(^[* ]*|\\s+)${ESCAPED_PREFIX}` or simpler, just use `grep` with the escaped prefix after the sed cleanup, similar to the else branch: `git branch -a | sed 's/^[* ]*//; s/remotes\/origin\///' | grep \"^${PREFIX}\" | sort -u`.
```suggestion
    # No need to escape PREFIX for grep, as we use it as a fixed string at the start of the line
    BRANCHES=$(git branch -a | sed 's/^[* ]*//; s/remotes\/origin\///' | grep "^${PREFIX}" | sort -u)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/supabase/pull/212#pullrequestreview-3407550850
You are receiving this because you authored the thread.

Message ID: <SkogAI/supabase/pull/212/review/3407550850@github.com>