MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 17:40:54 -0800
Subject: Re: [SkogAI/setup] ✨ Set up Copilot instructions (PR #85)
Message-ID: <SkogAI/setup/pull/85/review/3520902799@github.com>
In-Reply-To: <SkogAI/setup/pull/85@github.com>
References: <SkogAI/setup/pull/85@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ba0a694d2e_fa110016794ba"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds GitHub Copilot-specific instructions to complement the existing CLAUDE.md documentation. The new `.github/copilot-instructions.md` file provides Copilot with repository-specific context including Ansible conventions, project structure, and common workflows - tailored to Copilot's instruction format as recommended by GitHub's best practices guide.

**Key Changes:**
- Created `.github/copilot-instructions.md` with repository overview, essential commands, and coding conventions
- Documented FQCN requirement, role structure, and variable naming patterns
- Added quick reference tables for configuration file locations





> +- **Role Structure**: All roles must have:
+  - `defaults/main.yml` - default variables
+  - `tasks/main.yml` - main task list
+  - `handlers/main.yml` - service restart handlers
+  - `meta/main.yml` - role metadata

The documentation states that all roles "must have" these four files, but this is inaccurate. Based on the actual role structure:
- `tasks/main.yml` is required
- `defaults/main.yml`, `handlers/main.yml`, and `meta/main.yml` are optional (many roles don't have all of these)
- `templates/` and `files/` directories are also optional

Suggest changing "All roles must have:" to "Standard role structure (files are optional except tasks/main.yml):"
```suggestion
- **Role Structure**: Standard role structure (files are optional except tasks/main.yml):
  - `tasks/main.yml` - main task list (**required**)
  - `defaults/main.yml` - default variables (optional)
  - `handlers/main.yml` - service restart handlers (optional)
  - `meta/main.yml` - role metadata (optional)
  - `templates/` - Jinja2 templates (optional)
  - `files/` - static files (optional)
```

>  ./run.sh
 
-# Dry run with diff (no vault required for syntax check)
-ansible-playbook skogai.yml --check --diff -i inventory
-
-# Run single role by tag
-ansible-playbook skogai.yml --tags dotfiles -i inventory
+# Run single role
+ansible-playbook skogai.yml --tags dotfiles

The simplified command is missing the `-i inventory` flag that's present in `run.sh` (line 6) and `CLAUDE.md` (line 14). The inventory file defines `ansible_connection=local` for localhost, which is important for proper execution.

Suggest changing to:
```bash
ansible-playbook skogai.yml --tags dotfiles -i inventory
```
```suggestion
ansible-playbook skogai.yml --tags dotfiles -i inventory
```

>  
-# Validate ansible syntax
-ansible-playbook skogai.yml --syntax-check -i inventory
+# Dry run with diff
+ansible-playbook skogai.yml --check --diff

The simplified command is missing the `-i inventory` flag that's present in `run.sh` (line 6) and `CLAUDE.md` (line 15). The inventory file defines `ansible_connection=local` for localhost, which is important for proper execution.

Suggest changing to:
```bash
ansible-playbook skogai.yml --check --diff -i inventory
```
```suggestion
ansible-playbook skogai.yml --check --diff -i inventory
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/85#pullrequestreview-3520902799
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/85/review/3520902799@github.com>