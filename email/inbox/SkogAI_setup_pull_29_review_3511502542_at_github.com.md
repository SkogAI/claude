MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 07:26:13 -0800
Subject: Re: [SkogAI/setup] chore: clean up TODO migration artifacts (PR #29)
Message-ID: <SkogAI/setup/pull/29/review/3511502542@github.com>
In-Reply-To: <SkogAI/setup/pull/29@github.com>
References: <SkogAI/setup/pull/29@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69271c15a1cb0_b31100626780"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR cleans up TODO migration artifacts while simultaneously making several configuration and code quality improvements across the Ansible playbooks and dotfiles configuration.

**Key changes:**
- Removes obsolete documentation (whats-next.md handoff, aider chat history) and completed TODO task
- Adds new zsh configuration modules (05-paths.zsh, 55-git-functions.zsh, 80-pkg-functions.zsh) for better modularity
- Updates Ansible best practices: standardizes boolean values (yes→true), modernizes fact access (ansible_user_id→ansible_facts['user_id']), corrects FQCN usage (ansible.posix.authorized_key)

### Reviewed changes

Copilot reviewed 22 out of 23 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| whats-next.md | Removed obsolete 93-line handoff document from TODO migration work |
| .aider.chat.history.md | Removed 65 lines of aider tool chat history (now ignored by .gitignore) |
| TO-DOS.md | Removed completed "Clean up TODO artifacts" task (issue #20) |
| .gitignore | Updated aider ignore pattern from specific cache file to broader `.aider.*` pattern |
| vars/user.yml | Changed git_name from "Skogix" to "skogix" for consistency with username |
| vars/main.yml | Added YAML document marker, updated git_user_name to lowercase "skogix" |
| vars/ssh_vault.yml | Re-encrypted vault file with updated SSH key content |
| vars/packages.yml | Added 'aichat' to AUR packages list |
| skogai.yml | Removed invalid pre_tasks (collections can't be included as tasks), expanded role list to include all 9 core roles |
| skogai-main.yml | Cleaned up formatting and changed become: yes to become: true |
| site.yml | Added vars/ssh_vault.yml and skogai-ssh role |
| bootstrap.sh | Added ansible.posix collection installation |
| requirements/common.yml | Deleted redundant file (collections already in requirements/arch.yml) |
| roles/skogai-ssh/tasks/main.yml | Modernized to use ansible_facts['user_id'] instead of ansible_user_id, corrected authorized_key FQCN to ansible.posix |
| roles/03-dotfiles/templates/.gitconfig.j2 | Updated default SSH signing key |
| roles/03-dotfiles/files/.gitconfig | Updated SSH signing key to match template |
| roles/03-dotfiles/files/.config/zsh/80-pkg-functions.zsh | Added 255-line package management functions module (pkg-install, pkg-update, etc.) |
| roles/03-dotfiles/files/.config/zsh/55-git-functions.zsh | Added git workflow functions module (gacp, gacpgh, parse_git_branch) |
| roles/03-dotfiles/files/.config/zsh/50-aliases.zsh | Removed git functions (moved to 55-git-functions.zsh) |
| roles/03-dotfiles/files/.config/zsh/05-paths.zsh | Added PATH management functions and configuration |
| roles/03-dotfiles/files/.config/zsh/00-env.zsh | Cleaned up PATH management (moved to 05-paths.zsh), removed TODO comments |
| roles/03-dotfiles/tasks/main.yml | Added three new zsh config files to symlink list |
| roles/03-dotfiles/README.md | Added Zsh Module Structure documentation table |
</details>






---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -1,7 +1,7 @@
 [user]
     name = {{ item.0.git_name | default(item.0.name) }}
     email = {{ item.0.git_email | default('emil@skogsund.se') }}
-    signingkey = {{ item.0.git_signingkey | default('ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILlUcpcztoYpgvgKEhnYBY0c52gl0/GLNDxYK4X5umgK') }}
+    signingkey = {{ item.0.git_signingkey | default('ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFoUpUb/CaUNSMW3jAEmjBK0OUe3r+NgdKwxyl63NB4') }}

The default SSH signing key has been changed in this template. Ensure this change is intentional and that the new key `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFoUpUb/CaUNSMW3jAEmjBK0OUe3r+NgdKwxyl63NB4` is the correct public key for commit signing. This change also appears in `.gitconfig` (roles/03-dotfiles/files/.gitconfig:4) but should ideally be managed through user variables rather than hardcoded defaults.
```suggestion
{% if item.0.git_signingkey %}
    signingkey = {{ item.0.git_signingkey }}
{% endif %}
```

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

The `alias g='git'` conflicts with oh-my-zsh git plugin's 'g' alias (loaded in 10-plugins.zsh:21). Since the oh-my-zsh git plugin loads first, this redefinition may override the plugin's behavior. Consider removing this duplicate alias or documenting the intentional override.
```suggestion

```

> +  sudo rm -rf /usr/local/go
+  
+  echo "→ Installing Go to /usr/local"
+  sudo mv go /usr/local
+  
+  popd > /dev/null 2>&1
+  echo "✓ Successfully installed Go: $(/usr/local/go/bin/go version)"
+}
+
+# ============================================================================
+# Universal Package Management Functions (Arch Linux / pacman-first)
+# ============================================================================
+
+# Install packages
+pkg-install() {
+  if [[ -z "$@" ]]; then

The condition `[[ -z "$@" ]]` doesn't work correctly in bash/zsh for checking if no arguments were provided. Use `[[ $# -eq 0 ]]` instead. The `$@` variable is always non-empty when quoted, even with no arguments.
```suggestion
  if [[ $# -eq 0 ]]; then
```

> +  pacman -Ss "$@"
+}
+
+# Show package information
+pkg-info() {
+  if [[ -z "$1" ]]; then
+    echo "Usage: pkg-info PACKAGE"
+    return 1
+  fi
+  # Try remote repository first, then local
+  pacman -Si "$1" 2>/dev/null || pacman -Qi "$1"
+}
+
+# Remove package(s)
+pkg-remove() {
+  if [[ -z "$@" ]]; then

The condition `[[ -z "$@" ]]` doesn't work correctly in bash/zsh for checking if no arguments were provided. Use `[[ $# -eq 0 ]]` instead. The `$@` variable is always non-empty when quoted, even with no arguments.
```suggestion
  if [[ $# -eq 0 ]]; then
```

> +## Zsh Module Structure
+
+Zsh configuration is split into modular files loaded in order:
+
+| Module | Purpose |
+|--------|---------|
+| `00-env.zsh` | Environment variables |
+| `10-plugins.zsh` | Plugin loading |
+| `20-history.zsh` | History configuration |
+| `30-completion.zsh` | Tab completion settings |
+| `40-options.zsh` | Shell options |
+| `50-aliases.zsh` | Command aliases |
+| `55-git-functions.zsh` | Git workflow functions (gacp, gacpgh, parse_git_branch) |
+| `60-keybindings.zsh` | Keyboard shortcuts |
+| `70-nvm.zsh` | Node version manager integration |
+

The Zsh module table is missing entries for `05-paths.zsh` and `80-pkg-functions.zsh` which are new modules added in this PR (as seen in tasks/main.yml:68,77). The table should include all modules for completeness.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/29#pullrequestreview-3511502542
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/29/review/3511502542@github.com>