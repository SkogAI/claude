MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 23 Nov 2025 06:26:12 -0800
Subject: Re: [SkogAI/setup] Migrate git functions from bash to zsh module (PR #26)
Message-ID: <SkogAI/setup/pull/26/review/3497807166@github.com>
In-Reply-To: <SkogAI/setup/pull/26@github.com>
References: <SkogAI/setup/pull/26@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6923198421a56_ca1100174244"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR successfully migrates git workflow functions from legacy bash scripts into a dedicated zsh module (`55-git-functions.zsh`), modernizing the implementation and improving integration with the existing zsh configuration system.

**Key changes:**
- Migrated three core functions (`gacp`, `gacpgh`, `parse_git_branch`) and two aliases (`yolo`, `g`) from bash to zsh
- Modernized git commands by replacing `git branch | sed` with `git branch --show-current`
- Enhanced `yolo` alias to push the current branch dynamically instead of hardcoded `master`

### Reviewed changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/files/.config/zsh/55-git-functions.zsh` | New module containing migrated git functions and aliases with modernized implementations |
| `roles/03-dotfiles/files/.config/zsh/50-aliases.zsh` | Removed duplicate functions and added migration reference note |
| `roles/03-dotfiles/tasks/main.yml` | Added 55-git-functions.zsh to the zsh_configs list for proper module loading |
| `roles/03-dotfiles/README.md` | Documented the new module in the zsh module structure table with description |





---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +  gh pr merge -dm
+}
+
+# parse_git_branch - extract current git branch for prompt
+parse_git_branch() {
+  local branch=$(git branch --show-current 2>/dev/null)
+  if [ -n "$branch" ]; then
+    echo " [$branch]"
+  fi
+}
+
+# Additional git aliases
+# WARNING: yolo is intentionally dangerous - bypasses all safety checks
+# Use 'gpf' (git push --force-with-lease) for safer force pushing
+alias yolo="git push origin \$(git branch --show-current) --force --no-verify"
+alias g='git'

[nitpick] The `alias g='git'` may be redundant since the oh-my-zsh git plugin (loaded in `10-plugins.zsh`) already defines this alias. While this won't cause functional issues (your definition will override the plugin's), it's cleaner to remove redundant definitions. Consider removing this line unless you want to explicitly document that you're overriding the plugin's default.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/26#pullrequestreview-3497807166
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/26/review/3497807166@github.com>