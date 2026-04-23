MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:25:19 -0800
Subject: Re: [SkogAI/setup] Add .local override pattern to dotfile templates (PR #66)
Message-ID: <SkogAI/setup/pull/66/review/3520829448@github.com>
In-Reply-To: <SkogAI/setup/pull/66@github.com>
References: <SkogAI/setup/pull/66@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b64bff45a_d71100145563f"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR implements a consistent `.local` override mechanism across all primary dotfile templates (.zshrc, .gitconfig) to allow user-specific customization without breaking Ansible deployment. The pattern was already present in .bashrc and .profile, and this PR extends it to the remaining key dotfiles with comprehensive documentation and examples.

**Key Changes:**
- Added `.local` file sourcing to `.zshrc.j2` and `.gitconfig.j2` templates
- Created example files demonstrating common customization patterns
- Documented the `.local` override pattern in the role README with usage examples

### Reviewed changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/templates/.zshrc.j2` | Added sourcing of `~/.zshrc.local` at end of file for personal zsh customizations |
| `roles/03-dotfiles/templates/.gitconfig.j2` | Added `[include]` section to load `~/.gitconfig.local` for git overrides |
| `roles/03-dotfiles/files/examples/zshrc.local.example` | Example file showing common zsh customizations (aliases, functions, PATH additions) |
| `roles/03-dotfiles/files/examples/gitconfig.local.example` | Example file showing git customizations (email overrides, aliases, signing keys) |
| `roles/03-dotfiles/README.md` | Added comprehensive documentation section explaining the `.local` override pattern with usage examples |
</details>






---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -106,3 +106,6 @@ wt_exec() {
 fi
 
 if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
+
+# Load local zsh configuration if it exists
+[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[nitpick] The existing `.bashrc` and `.profile` files use the POSIX-compatible dot (`.`) command for sourcing, but this uses `source`. While `source` works in zsh, using `.` would maintain consistency with the existing dotfiles pattern and remain POSIX-compatible.

Suggested change:
```bash
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
```
```suggestion
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/66#pullrequestreview-3520829448
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/66/review/3520829448@github.com>