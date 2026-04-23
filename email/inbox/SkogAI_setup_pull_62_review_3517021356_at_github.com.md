MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Thu, 27 Nov 2025 14:22:49 -0800
Subject: Re: [SkogAI/setup] feat(locale): migrate locale configuration to dedicated role (PR #62)
Message-ID: <SkogAI/setup/pull/62/review/3517021356@github.com>
In-Reply-To: <SkogAI/setup/pull/62@github.com>
References: <SkogAI/setup/pull/62@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6928cf398238a_fb1100203835"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR successfully migrates locale configuration from bootstrap.sh to a dedicated Ansible role (`roles/00-locale`), following the repository's pattern of modularizing system configuration. The migration centralizes locale management, improves idempotency, and ensures locale is configured before all other roles.

**Key Changes:**
- Created new `roles/00-locale` role with FQCN-compliant tasks for locale generation
- Centralized locale configuration in `vars/locale.yml`
- Simplified `bootstrap.sh` by removing locale-gen commands (kept LC_ALL/LANG exports for pacman)
- Cleaned up duplicate locale tasks from `roles/01-base`
- Updated documentation across CLAUDE.md and whats-next.md

### Reviewed changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 6 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `roles/00-locale/tasks/main.yml` | New locale role implementing idempotent locale generation with FQCN modules; contains issue with LC_ALL in /etc/locale.conf |
| `vars/locale.yml` | New centralized locale configuration defining locales to generate and system locale |
| `skogai.yml` | Added locale role as first role and included vars/locale.yml in vars_files |
| `roles/01-base/tasks/main.yml` | Removed duplicate locale configuration tasks, now focusing only on base packages |
| `bootstrap.sh` | Removed locale-gen commands while keeping LC_ALL/LANG exports for script execution |
| `CLAUDE.md` | Added locale configuration documentation with minor inaccuracies about LC_ALL |
| `whats-next.md` | Comprehensive handoff document with several documentation inconsistencies about implementation approach |
</details>






---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    state: present
+  loop: "{{ locale_locales_to_generate | default(['en_US.UTF-8 UTF-8']) }}"
+  register: locale_gen_result
+  become: true
+
+- name: Generate locales
+  ansible.builtin.command:
+    cmd: locale-gen
+  when: locale_gen_result.changed
+  become: true
+
+- name: Set system locale
+  ansible.builtin.copy:
+    content: |
+      LANG={{ locale_system_locale | default('en_US.UTF-8') }}
+      LC_ALL={{ locale_system_locale | default('en_US.UTF-8') }}

`LC_ALL` should not be set in `/etc/locale.conf`. According to Linux locale best practices, `LC_ALL` is designed to override all other locale settings and should only be set temporarily (e.g., in shell scripts or for specific commands). Setting it permanently in `/etc/locale.conf` prevents users from having granular control over individual locale categories (LC_TIME, LC_MONETARY, etc.).

The `/etc/locale.conf` file should only set `LANG`:
```yaml
content: |
  LANG={{ locale_system_locale | default('en_US.UTF-8') }}
```
```suggestion

```

> @@ -69,6 +70,17 @@ Zsh modules deployed from templates (see `roles/03-dotfiles/README.md` for detai
 
 **Note:** Most zsh modules now use `.j2` templates (as of 2025-11-27), allowing per-user variable substitution.
 
+### Locale Configuration
+
+The `00-locale` role manages system locale:
+- Configures `/etc/locale.gen` to uncomment desired locales
+- Runs `locale-gen` only when changes are made (idempotent)
+- Sets system-wide locale in `/etc/locale.conf`
+- Runs before all other roles to ensure locale is available
+- Configured via `vars/locale.yml`:
+  - `locale_locales_to_generate`: list of locales to generate
+  - `locale_system_locale`: system-wide LANG/LC_ALL setting

The documentation states "LANG/LC_ALL setting" but `LC_ALL` should not be set in `/etc/locale.conf` according to Linux locale best practices. This should be updated to only mention `LANG`:
```markdown
  - `locale_system_locale`: system-wide LANG setting
```
```suggestion
  - `locale_system_locale`: system-wide LANG setting
```

> +3. Implemented idempotent locale-gen execution using:
+   - lineinfile with check_mode + register
+   - conditional command execution based on changes

The documentation claims the implementation uses "lineinfile with check_mode + register", but the actual code in `roles/00-locale/tasks/main.yml` doesn't use `check_mode: true`. The implementation is still idempotent because `lineinfile` with `state: present` only makes changes when the line doesn't exist, but the documentation should accurately reflect the actual approach used.

> +1. **Idempotent locale-gen**: Used lineinfile with check_mode + register to detect if changes would be made, then conditionally run locale-gen
+   - This prevents unnecessary locale regeneration on every ansible run
+   - Pattern: `check_mode: true` + `register: locale_check` + `when: locale_check.changed`

The documentation describes using "check_mode + register" pattern, but the actual implementation doesn't use `check_mode: true`. The code achieves idempotency through `lineinfile` with `state: present`, which only makes changes when the line doesn't exist. This section should be updated to accurately reflect the actual implementation approach.
```suggestion
1. **Idempotent locale-gen**: Used `lineinfile` with `state: present` to ensure required locales are uncommented in `/etc/locale.gen`. `locale-gen` is only run when changes are made.
   - This prevents unnecessary locale regeneration on every ansible run
   - Pattern: `lineinfile` with `state: present` (idempotent) + `register` result + `when: result.changed` to run `locale-gen` only if needed
```

> -echo "- [ ] task description" >> /home/skogix/.claude/docs/skogix/todo.list
-```
+1. **Bootstrap.sh must remain minimal**: Only contains what's needed to install ansible (git, uv, ansible)
+   - LC_ALL/LANG exports must stay (needed for pacman during bootstrap)
+   - Actual locale generation moved to ansible
+
+2. **Role ordering is critical**: roles/00-locale must run first
+   - Uses `00-` prefix to ensure it runs before other roles
+   - Listed first in skogai.yml
+
+3. **FQCN required**: All ansible modules must use fully qualified collection names
+   - Part of ongoing FQCN migration effort (see todo/ISSUES.md)
+   - ansible.builtin.* for core modules
+
+4. **Idempotency required**: Ansible runs should not regenerate locale every time
+   - Uses check_mode to detect if changes would be made

The documentation mentions "Uses check_mode to detect if changes would be made" but the actual implementation doesn't use `check_mode: true`. The idempotency is achieved through `lineinfile` with `state: present` which automatically handles change detection.
```suggestion
   - Idempotency is achieved using Ansible's change detection (e.g., lineinfile with state: present)
```

> +3. Implemented idempotent locale-gen execution using:
+   - lineinfile with check_mode + register
+   - conditional command execution based on changes
+4. Verified role structure matches existing roles (00-secrets, 01-base patterns)
+5. Updated all relevant documentation
+
+## Testing Status
+
+- **NOT TESTED YET** - Changes not committed or executed
+- Need to run `./run.sh` to verify ansible playbook works
+- Need to verify locale-gen only runs when changes are made
+- Need to verify /etc/locale.conf is created correctly
+
+## Decisions Made
+
+1. **Role naming**: Used `00-locale` to ensure it runs first (before 00-secrets)

The documentation states "Used `00-locale` to ensure it runs first (before 00-secrets)" but the actual first role after `00-locale` in `skogai.yml` is `skogai-ssh`, not `00-secrets`. This should be corrected to accurately reflect the role ordering.
```suggestion
1. **Role naming**: Used `00-locale` to ensure it runs first (before skogai-ssh)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/62#pullrequestreview-3517021356
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/62/review/3517021356@github.com>