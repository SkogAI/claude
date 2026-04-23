MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 26 Dec 2025 11:30:21 -0800
Subject: Re: [SkogAI/skogansible] feat: implement composition layer for role orchestration (PR #112)
Message-ID: <SkogAI/skogansible/pull/112/review/3613812759@github.com>
In-Reply-To: <SkogAI/skogansible/pull/112@github.com>
References: <SkogAI/skogansible/pull/112@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694ee24d33f6d_11610d0315257"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR implements Phase 2 of epic #91, introducing a composition layer that orchestrates Ansible roles into higher-level operations through profile-based selection, dependency management, and conditional execution.

**Key Changes:**
- Four machine profiles (workstation, laptop, server, WSL) with tailored role combinations
- Role dependency management via meta/main.yml declarations (git dependency added to chezmoi)
- Hierarchical tagging system (profile → category → role → task) for execution control

### Reviewed changes

Copilot reviewed 9 out of 9 changed files in this pull request and generated 11 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `roles/chezmoi/meta/main.yml` | Adds git as explicit dependency for chezmoi role |
| `playbooks/site.yml` | Enhanced with composition layer, conditional role inclusion, and comprehensive role orchestration |
| `playbooks/workstation.yml` | Updated with hierarchical tags, machine type variables, and conditional filesystems mounting |
| `playbooks/laptop.yml` | New profile for portable development with battery optimization and minimal services |
| `playbooks/server.yml` | New headless profile with hardened SSH, service focus, and no GUI components |
| `playbooks/wsl.yml` | New Windows Subsystem for Linux profile with CLI-only tools and Windows integration |
| `docs/COMPOSITION.md` | Comprehensive architecture documentation covering profiles, dependencies, conditionals, and tags |
| `docs/TESTING_PROFILES.md` | Complete testing guide with validation procedures, checklists, and CI integration examples |
| `docs/README.md` | Updated documentation index with composition layer and testing guide entries |
</details>






---

💡 <a href="/SkogAI/skogansible/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +      vars:
+        # WSL-specific package overrides
+        packages_gui: false
+        packages_cli_only: true

The WSL profile also sets role-level variable overrides (`packages_gui`, `packages_cli_only`) on lines 31-32 that are not documented in docs/COMPOSITION.md. Verify these variables are actually used by the packages role and document them in the composition layer documentation if they're part of the public interface.
```suggestion

```

> +    # VERSION CONTROL & DOTFILES (all profiles)
+    # ========================================================================
 
     - role: git
       tags: [git, vcs]
 
     - role: chezmoi
       tags: [chezmoi, dotfiles]
+      # Note: chezmoi depends on git (declared in meta/main.yml)
+
+    # ========================================================================
+    # SHELL CONFIGURATION (all profiles)
+    # ========================================================================
 
     - role: zsh
       tags: [zsh, shell]

The comment on line 33 states "VERSION CONTROL & DOTFILES (all profiles)" and includes the chezmoi role without any conditional. However, according to docs/COMPOSITION.md (lines 78-83), the server profile should NOT include chezmoi. Similarly, line 44's comment states "SHELL CONFIGURATION (all profiles)" but server profile doesn't include zsh. Either update the comments to reflect that these are NOT for all profiles, or add conditional inclusion to match the documented behavior for server profile.

> +**Run complete workstation setup:**
+```bash
+ansible-playbook playbooks/site.yml --tags workstation

The documentation describes using profile tags like `ansible-playbook playbooks/site.yml --tags workstation` (line 271), but the site.yml playbook uses conditional inclusion with `when` clauses rather than profile-specific tags. The profile tags (workstation, laptop, server, wsl) are added to individual roles in the profile-specific playbooks, but since site.yml doesn't have a 'workstation' tag on its conditional roles, running `--tags workstation` on site.yml would not produce the expected behavior. Either update the documentation to clarify that profile tags only work on profile-specific playbooks, or add profile tags to the conditional roles in site.yml.
```suggestion
**Run complete workstation setup via profile playbook (profile tags are defined only in profile-specific playbooks, not in `site.yml`):**
```bash
ansible-playbook playbooks/workstation.yml --tags workstation
```

> +# Test profile tags
+ansible-playbook playbooks/site.yml --tags workstation --list-tasks
+ansible-playbook playbooks/site.yml --tags laptop --list-tasks
+ansible-playbook playbooks/site.yml --tags server --list-tasks

The testing guide suggests running profile-specific tags against site.yml (e.g., `ansible-playbook playbooks/site.yml --tags workstation`), but site.yml does not include profile tags on its roles. The profile tags are only present in the profile-specific playbooks (workstation.yml, laptop.yml, etc.). These test commands will not work as expected. Update these test commands to either use the profile-specific playbooks or remove the profile tag tests from the site.yml testing section.
```suggestion
# Test profile playbooks (profile-specific tags are defined here)
ansible-playbook playbooks/workstation.yml --list-tasks
ansible-playbook playbooks/laptop.yml --list-tasks
ansible-playbook playbooks/server.yml --list-tasks
```

> +- [ ] Service roles included (cloudflared, filesystems)
+- [ ] Machine type set to 'server'
+- [ ] Headless mode enabled (`chezmoi_headless: true`)
+- [ ] GUI disabled (`chezmoi_gui: false`)
+- [ ] Window manager set to 'none'

The test checklist states "Dotfiles roles included (chezmoi, zsh)" should be verified for the server profile, but the actual server.yml playbook does not include these roles. The documentation in docs/COMPOSITION.md (lines 78-83) also confirms that chezmoi and zsh are NOT included in the server profile. Update this checklist to remove the expectation of chezmoi and zsh roles, or update the server.yml playbook to include them if they should be present.
```suggestion
- [ ] Service roles included as documented for the server profile
- [ ] Machine type set to 'server'
- [ ] System configured for headless operation
- [ ] No GUI/window manager components enabled
```

> +    chezmoi_machine_type: server
+    chezmoi_headless: true
+    chezmoi_gui: false
+    chezmoi_wm: none

The server profile defines chezmoi-related variables (`chezmoi_machine_type`, `chezmoi_headless`, `chezmoi_gui`, `chezmoi_wm`) on lines 21-24, but the chezmoi role is not included in the roles section. These variables will be loaded but never used, creating unnecessary configuration. Either remove these variables or add the chezmoi role to the server profile if dotfile management is needed on servers.
```suggestion

```

> +echo -e "\n=== Profile Tag Tests ==="
+for profile in workstation laptop server wsl; do
+  echo "Testing profile tag: $profile..."
+  ansible-playbook playbooks/site.yml --tags $profile --list-tasks > /dev/null || exit 1
+done
+

The regression test script includes "Profile Tag Tests" (lines 305-309) that run `ansible-playbook playbooks/site.yml --tags $profile` for each profile. However, site.yml does not include profile-specific tags on its roles, so these tests will not work as expected. Either remove this test section or update site.yml to include profile tags on all roles so that tag-based filtering by profile works correctly.
```suggestion

```

> @@ -0,0 +1,41 @@
+---
+# Laptop profile - portable development environment with power optimization
+- name: Configure Arch Linux laptop
+  hosts: all
+  connection: local
+
+  vars_files:
+    - ../vars/main.yml
+    - ../vars/packages.yml
+    - ../vars/ssh.yml
+    - ../vars/ssh_vault.yml
+    - ../vars/user.yml
+    - ../vars/git.yml
+    - ../vars/chezmoi.yml
+    - ../vars/zsh.yml

The laptop profile does not load cloudflared or filesystems vars files, but the workstation profile does. According to the documentation (docs/COMPOSITION.md line 62), the laptop profile might optionally need cloudflared. If cloudflared can be enabled on laptop via feature flags, the `../vars/cloudflared.yml` and `../vars/cloudflared_vault.yml` vars_files should be included for consistency. Similarly, consider whether `../vars/filesystems.yml` should be included if filesystems might be conditionally mounted on laptops.
```suggestion
    - ../vars/zsh.yml
    - ../vars/cloudflared.yml
    - ../vars/cloudflared_vault.yml
    - ../vars/filesystems.yml
```

> +  vars_files:
+    - ../vars/main.yml
+    - ../vars/packages.yml
+    - ../vars/ssh.yml
+    - ../vars/ssh_vault.yml
+    - ../vars/user.yml
+    - ../vars/git.yml
+    - ../vars/cloudflared.yml
+    - ../vars/cloudflared_vault.yml
+    - ../vars/filesystems.yml

According to the documentation in docs/COMPOSITION.md (lines 78-83), the server profile should only include packages, ssh, git, cloudflared, and filesystems roles. However, this vars_files section loads `../vars/chezmoi.yml` and `../vars/zsh.yml` even though these roles are not included in the server profile. This creates an inconsistency and loads unnecessary variables. Remove these vars_file entries or update the documentation to explain why they're needed.

> +    - role: packages
+      tags: [packages, install, base, server]
+      vars:
+        # Server-specific package overrides
+        packages_gui: false
+        packages_development: minimal
+
+    - role: ssh
+      tags: [ssh, config, base, server]
+      vars:
+        # Hardened SSH for servers
+        ssh_hardening_enabled: true
+        ssh_hardening_server_enabled: true

The server profile sets multiple variables with inconsistent naming patterns. Lines 31-33 use `packages_gui` and `packages_development`, while lines 39-40 use `ssh_hardening_enabled` and `ssh_hardening_server_enabled`. The variables on lines 31-33 appear to be role-level variable overrides but are not documented in docs/COMPOSITION.md. Verify these variables are actually used by the packages role, or remove them if they're not implemented yet.

> +        run: |
+          python -m pip install --upgrade pip
+          pip install ansible

The CI example installs `ansible` via `pip install ansible` without pinning to a specific version or verifying integrity, which creates a supply chain risk if the PyPI package or dependency chain is compromised. Because this workflow runs arbitrary code in the CI environment with access to the repository (and potentially secrets/artifacts), an attacker who controls the `ansible` package version could execute malicious code in your pipeline. To reduce this risk, pin `ansible` to a specific, vetted version (or hash) and/or use a locked requirements file so that CI always installs a known-safe build.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/112#pullrequestreview-3613812759
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/112/review/3613812759@github.com>