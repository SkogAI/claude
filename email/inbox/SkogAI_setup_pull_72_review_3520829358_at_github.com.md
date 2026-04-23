MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:24:55 -0800
Subject: Re: [SkogAI/setup] Integrate dotfile-ansible zsh utilities into 03-dotfiles (PR #72)
Message-ID: <SkogAI/setup/pull/72/review/3520829358@github.com>
In-Reply-To: <SkogAI/setup/pull/72@github.com>
References: <SkogAI/setup/pull/72@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b64a77cd6d_d111001395653"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR integrates valuable shell utilities from the imported `roles/zsh/` directory into the main `roles/03-dotfiles` role, addressing issue #21. The changes add convenient aliases and functions for git operations, neovim, system tools, and network testing, while also fixing a task configuration bug where static files were incorrectly listed as templated.

### Key Changes
- **Bug fix**: Corrected `tasks/main.yml` to remove `05-paths.zsh` and `80-pkg-functions.zsh` from the templated configs list (they are static symlinked files)
- **New aliases**: Added git shortcuts (`gph`, `gcm`, `unstage`, `gu`), neovim aliases (`vi`, `vim`, `ni`, `v`), and system tools (`bt`, enhanced `ncdu`)
- **New function**: Added `speedtest_loop` for iterative network speed testing with formatted output
- **Documentation**: Updated both CLAUDE.md and TO-DOS.md to reflect that `roles/bash` and `roles/zsh` are now reference-only

### Reviewed changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/templates/.config/zsh/50-aliases.zsh.j2` | Added 8 new aliases (git, neovim, system) and `speedtest_loop` function |
| `roles/03-dotfiles/tasks/main.yml` | Fixed bug by removing non-templated files from `templated_zsh_configs` list |
| `TO-DOS.md` | Marked integration task as complete with summary of changes |
| `CLAUDE.md` | Updated documentation to clarify roles/bash and roles/zsh are reference-only; documented static vs templated zsh module distinction |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -101,3 +113,24 @@ nisshfs() {
   fusermount -zu ~/.sshfs/$server
   rm -rf ~/.sshfs/$server
 }
+
+# speedtest_loop - run multiple speedtest iterations
+speedtest_loop() {
+  if ! command -v speedtest &> /dev/null; then
+    echo "Error: speedtest-cli not installed (pacman -S speedtest-cli)"

The error message refers to "speedtest-cli" package (`pacman -S speedtest-cli`), but the actual command being checked and used is `speedtest` (line 119, 126). These are different packages:
- `speedtest-cli` is a Python-based unofficial tool
- `speedtest` (from `speedtest-cli` package on Arch) or Ookla's official `speedtest` binary

The error message should match the actual command being used. If using Ookla's speedtest, the message should suggest the correct package installation command.
```suggestion
    echo "Error: speedtest (Ookla CLI) not installed. Install from AUR (yay -S speedtest) or see https://www.speedtest.net/apps/cli"
```

> @@ -4,14 +4,23 @@ Outstanding tasks to revisit later.
 
 ## Post-migration tasks - 2025-11-23 13:50
 
-- **Integrate zsh utility scripts into 03-dotfiles** - Pre-converted zsh scripts exist in `roles/zsh/` but need integration with current dotfiles role. **Problem:** The `roles/zsh/files/zsh/` contains git_functions.zsh, pkg_functions.zsh, paths_functions.zsh etc. that should be available in the main dotfiles setup but aren't being deployed. **Files:** `roles/zsh/files/zsh/*.zsh`, `roles/03-dotfiles/files/.config/zsh/`, `roles/03-dotfiles/tasks/main.yml`. **Solution:** Either merge roles/zsh into roles/03-dotfiles, or add roles/zsh to skogai.yml, or selectively copy useful functions. See GitHub issues #16-18.
+- ✅ **Integrate zsh utility scripts into 03-dotfiles** - COMPLETED 2025-11-29. Integrated valuable functions from `roles/zsh/files/zsh/` into the main dotfiles:
+  - Added missing git aliases (unstage, gu, gcm, gph)
+  - Added neovim aliases (vi, vim, ni, v)
+  - Added btop alias (bt), ncdu flags
+  - Added color code exports to 00-env.zsh.j2
+  - Added speedtest_loop function
+  - Fixed task file inconsistency (removed 05-paths.zsh and 80-pkg-functions.zsh from templated configs - they're static files)
+  - See GitHub issue #12

The issue reference "GitHub issue #12" is inconsistent with the PR metadata which states this PR "Fixes SkogAI/setup#21". This should be updated to "GitHub issue #21" for consistency and correct tracking.
```suggestion
  - See GitHub issue #21
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/72#pullrequestreview-3520829358
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/72/review/3520829358@github.com>