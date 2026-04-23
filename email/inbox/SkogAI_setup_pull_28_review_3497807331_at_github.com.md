MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 23 Nov 2025 06:26:34 -0800
Subject: Re: [SkogAI/setup] Migrate PATH management from bash to zsh (PR #28)
Message-ID: <SkogAI/setup/pull/28/review/3497807331@github.com>
In-Reply-To: <SkogAI/setup/pull/28@github.com>
References: <SkogAI/setup/pull/28@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6923199a39746_ae11002100bf"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR migrates PATH management functionality from bash scripts to a new modular zsh configuration file (`05-paths.zsh`), improving code organization and taking advantage of zsh-specific features.

Key changes:
- Created `05-paths.zsh` with improved PATH manipulation functions using boundary-checking patterns
- Moved all PATH exports out of `00-env.zsh` to focus it purely on environment variables
- Added `$HOME/bin` to PATH (previously in old 00-env.zsh but missing from bash scripts)

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/files/.config/zsh/05-paths.zsh` | New module with PATH functions and directory additions; includes improved duplicate detection |
| `roles/03-dotfiles/files/.config/zsh/00-env.zsh` | Removed all PATH exports, cleaned up TODOs; focused on environment variables only |
| `roles/03-dotfiles/tasks/main.yml` | Added 05-paths.zsh to zsh_configs deployment list |





---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +add_to_path_front /usr/lib/ccache
+add_to_path_front "$HOME/.local/bin"
+add_to_path_front "$HOME/bin"

The order of `add_to_path_front` calls is reversed. Each call prepends to PATH, so these three lines produce `~/bin:~/.local/bin:/usr/lib/ccache:...`. However, ccache must have the highest priority to intercept compiler calls, and the bash source (`paths_vars.sh` lines 8-10) produces `/usr/lib/ccache:~/.local/bin:...`. The calls should be reversed: first `~/bin`, then `~/.local/bin`, then `/usr/lib/ccache`.
```suggestion
add_to_path_front "$HOME/bin"
add_to_path_front "$HOME/.local/bin"
add_to_path_front /usr/lib/ccache
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/28#pullrequestreview-3497807331
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/28/review/3497807331@github.com>