MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 16:30:50 -0800
Subject: Re: [SkogAI/setup] Set up Copilot instructions (PR #84)
Message-ID: <SkogAI/setup/pull/84/review/3520887299@github.com>
In-Reply-To: <SkogAI/setup/pull/84@github.com>
References: <SkogAI/setup/pull/84@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b903a2e33a_a9110016413d0"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR configures GitHub Copilot coding agent instructions for the repository following [best practices](https://gh.io/copilot-coding-agent-tips). The change replaces a meta-instruction template (`.github/instructions/Copilot`) with actual onboarding documentation (`.github/copilot-instructions.md`) that provides build commands, project structure, coding conventions, and workflow guidance.

**Key Changes:**
- Added comprehensive Copilot instructions covering build/validation, project structure, role conventions, and git workflow
- Removed the template file that contained instructions for generating the actual instructions
- Documented Ansible-specific patterns (FQCN, variable naming, dotfiles structure)

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 7 comments.

| File | Description |
| ---- | ----------- |
| `.github/instructions/Copilot` | Deleted meta-instruction template file used for generating instructions |
| `.github/copilot-instructions.md` | Added comprehensive agent onboarding documentation with build commands, project structure (numbered roles 00-10), Ansible conventions (FQCN required, role-prefixed variables), dotfiles patterns (templates, static files, .local overrides), and worktree-based git workflow |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +**Tech Stack:** Ansible, Bash, Zsh, Jinja2 templates
+
+## Build & Validation Commands
+
+```bash
+# Bootstrap (run once on fresh system)
+./bootstrap.sh
+
+# Apply ansible configuration (requires vault passwords)
+./run.sh
+
+# Dry run with diff (no vault required for syntax check)
+ansible-playbook skogai.yml --check --diff -i inventory
+
+# Run single role by tag
+ansible-playbook skogai.yml --tags dotfiles -i inventory

The tag-based role execution shown here (`--tags dotfiles`) is not implemented in the codebase. The `skogai.yml` playbook does not define role tags, and the roles' meta files only define `galaxy_tags` (for Ansible Galaxy) which cannot be used for selective execution with `--tags`. 

To make this example work, either:
1. Remove this example command, or
2. Add actual task/role tags to the playbook/roles
```suggestion

```

> +├── defaults/main.yml       # Default variables (required)
+├── tasks/main.yml          # Main task list (required)
+├── handlers/main.yml       # Service handlers (required)
+├── meta/main.yml           # Role metadata (required)

The role structure documentation states that `defaults/main.yml`, `handlers/main.yml`, and `meta/main.yml` are "required", but this is inaccurate. For example, `roles/00-locale/` only contains `tasks/main.yml` and lacks the other directories.

Consider changing "(required)" to "(commonly used)" or "(optional)" for these directories, or clarify that only `tasks/main.yml` is truly required.
```suggestion
├── defaults/main.yml       # Default variables (optional)
├── tasks/main.yml          # Main task list (required)
├── handlers/main.yml       # Service handlers (optional)
├── meta/main.yml           # Role metadata (optional)
```

> +2. **Variable Naming:** Use `{role_name}_{variable_name}` pattern
+   - ✅ `base_packages`, `users_primary_user`, `dotfiles_repo_url`

The variable naming examples are inconsistent with the pattern described. The pattern states `{role_name}_{variable_name}`, but the examples show:
- `base_packages` ✅ (correct: role is "base")
- `users_primary_user` ✅ (correct: role is "users") 
- `dotfiles_repo_url` ✅ (correct: role is "dotfiles")

However, the second example should clarify that "users" refers to the role name "02-users", not just "users". Consider updating to show the actual role directory names or clarifying that the numeric prefix can be omitted in variable names.
```suggestion
2. **Variable Naming:** Use `{role_name}_{variable_name}` pattern. Omit any numeric prefix from the role directory name when forming variable names.
   - For example, for role directory `02-users/`, use `users_primary_user` (not `02_users_primary_user`).
   - ✅ `base_packages` (from `base/`), `users_primary_user` (from `02-users/`), `dotfiles_repo_url` (from `03-dotfiles/`)
```

> +| What to change | Where to edit |
+|----------------|---------------|
+| User config | `vars/user.yml` |
+| System packages | `vars/packages.yml` |
+| Locale settings | `vars/locale.yml` |
+| Dotfile templates | `roles/03-dotfiles/templates/` |
+| Static dotfiles | `roles/03-dotfiles/files/` |
+| Role defaults | `roles/{role}/defaults/main.yml` |

The key files table is missing `vars/groups.yml` and `vars/main.yml` which exist in the vars directory alongside the other listed configuration files. These should be documented here for completeness, or an explanation should be provided if they're intentionally omitted.
```suggestion
| What to change      | Where to edit                      |
|---------------------|------------------------------------|
| User config         | `vars/user.yml`                    |
| System packages     | `vars/packages.yml`                |
| Locale settings     | `vars/locale.yml`                  |
| Group definitions   | `vars/groups.yml`                  |
| Main variable entry point | `vars/main.yml`              |
| Dotfile templates  | `roles/03-dotfiles/templates/`     |
| Static dotfiles    | `roles/03-dotfiles/files/`         |
| Role defaults      | `roles/{role}/defaults/main.yml`   |
```

> +## Key Files to Edit
+
+| What to change | Where to edit |
+|----------------|---------------|
+| User config | `vars/user.yml` |
+| System packages | `vars/packages.yml` |
+| Locale settings | `vars/locale.yml` |
+| Dotfile templates | `roles/03-dotfiles/templates/` |
+| Static dotfiles | `roles/03-dotfiles/files/` |
+| Role defaults | `roles/{role}/defaults/main.yml` |
+
+## Testing Changes
+
+1. Always validate syntax first: `ansible-playbook skogai.yml --syntax-check -i inventory`
+2. Use check mode for safe testing: `ansible-playbook skogai.yml --check --diff -i inventory`
+3. Test individual roles: `ansible-playbook example-{role}.yml --check -i inventory`

The example playbook reference pattern `example-{role}.yml --check` may be misleading. Looking at the actual example playbooks (e.g., `example-argc.yml`), many reference paths like `../ansible/roles/{role}` which don't match the actual repository structure where roles are in `roles/` at the repository root. 

Consider clarifying that example playbooks may need path adjustments, or verify that the example playbooks work as-is with the documented command pattern.
```suggestion
3. Test individual roles: `ansible-playbook example-{role}.yml --check -i inventory`
   - **Note:** Example playbooks (e.g., `example-argc.yml`) may reference role paths like `../ansible/roles/{role}`. If you encounter errors about missing roles, adjust the paths in the example playbook to match the repository structure (roles are in `roles/` at the repository root).
```

> +
+# Run single role by tag
+ansible-playbook skogai.yml --tags dotfiles -i inventory
+
+# Validate ansible syntax
+ansible-playbook skogai.yml --syntax-check -i inventory
+```
+
+**Note:** `run.sh` requires vault password files at `~/.ssh/ansible-vault-password` and `~/.ssh/ansible-become-password`. For CI/testing, use `--check --diff` mode which doesn't require passwords.
+
+## Project Structure
+
+```
+├── skogai.yml              # Main playbook
+├── inventory               # Ansible inventory (localhost)
+├── bootstrap.sh            # Installs git, uv, ansible

The bootstrap.sh description is incomplete. According to the actual script, it installs:
- `git`
- `github-cli` (gh) 
- `uv`
- `ansible` (via `uv tool install`)
- Ansible collections (community.general, kewlfft.aur, ansible.posix)

Consider updating the description to: "Installs git, gh, uv, ansible (via uv), and Ansible collections"
```suggestion
├── bootstrap.sh            # Installs git, gh, uv, ansible (via uv), and Ansible collections
```

> +│   ├── locale.yml          # Locale settings
+│   └── ssh_vault.yml       # SSH keys (encrypted)
+├── roles/
+│   ├── 00-locale/          # System locale configuration
+│   ├── 00-secrets/         # SSH keys from private repo
+│   ├── 01-base/            # Base packages
+│   ├── 02-users/           # User creation with sudo
+│   ├── 03-dotfiles/        # Dotfiles deployment
+│   ├── 04-aur-user/        # AUR helper setup
+│   ├── 05-nvm/             # Node version manager
+│   ├── 06-skogcli/         # SkogAI CLI tools
+│   ├── 07-argc/            # argc argument parser
+│   ├── 08-graphics/        # GPU drivers, window manager
+│   ├── 09-uv-tools/        # Python CLI via uv
+│   ├── 10-gptme/           # gptme AI assistant
+│   └── ...                 # Additional tool-specific roles (bash, zsh, etc.)

The project structure lists roles with "..." but there are actually many additional roles in the repository (bash, zsh, bat, brave, btop, fonts, fzf, gh, git, go, lazygit, lsd, lua, neovim, npm, nvim, nvm, python, rust, skogai-ssh, ssh_vault, starship, system, tldr, tmux, warp, zoxide).

Consider either:
1. Listing all roles explicitly, or
2. Adding a note like "└── ...                 # Additional tool-specific roles (see roles/ directory)" to indicate there are more roles not shown
```suggestion
│   └── ...                 # Additional tool-specific roles (see roles/ directory for full list)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/84#pullrequestreview-3520887299
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/84/review/3520887299@github.com>