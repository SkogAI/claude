MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 04 Oct 2025 17:15:14 -0700
Subject: Re: [SkogAI/skogansible] Consolidate multiple Ansible projects into unified structure (PR #46)
Message-ID: <SkogAI/skogansible/pull/46/review/3302117740@github.com>
In-Reply-To: <SkogAI/skogansible/pull/46@github.com>
References: <SkogAI/skogansible/pull/46@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e1b8922789b_82c3c10d82687b"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR consolidates multiple Ansible projects into a unified structure, creating a comprehensive system management setup for Arch Linux. The changes add several new playbooks with different purposes and introduce numerous named roles for specific functionality.

Key changes include:
- Added three main playbooks: `site.yml` (unified main playbook), `skogai.yml` (Arch Linux setup), and `update.yml` (maintenance tasks)
- Created task files for SkogAI core functionality, bootstrap setup, and maintenance operations
- Introduced multiple named roles covering system configuration, package management, dotfiles, SSH, Git, and other development tools

### Reviewed Changes

Copilot reviewed 49 out of 49 changed files in this pull request and generated 14 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tasks/skogai-core.yml | Comprehensive Arch Linux setup tasks including yay installation, system optimizations, and automated maintenance |
| tasks/maintenance.yml | System maintenance tasks for package updates and cleanup |
| tasks/bootstrap.yml | Initial system setup with essential packages and dependencies |
| playbooks/site.yml | Main unified playbook combining numbered and named roles with flexible execution options |
| playbooks/skogai.yml | Standalone comprehensive Arch Linux setup playbook |
| playbooks/update.yml | Quick system maintenance playbook |
| roles/* | Multiple new roles for specific functionality (ssh, git, packages, system, tmux, etc.) |
| requirements.yml | Added community.crypto collection dependency |
</details>






> @@ -0,0 +1,257 @@
+---
+# SkogAI Core Tasks - Comprehensive Arch Linux setup
+# Extracted from skogai-core.yml playbook
+
+- name: Update arch
+  community.general.pacman:
+    update_cache: true
+    upgrade: true
+
+- name: Install core packages
+  pacman:

Use fully qualified collection names (FQCNs) for all modules. Change 'pacman:' to 'community.general.pacman:' to match the pattern used elsewhere in the file.
```suggestion
  community.general.pacman:
```

> +    regexp: "PKGEXT='.pkg.tar.zst'"
+    line: "PKGEXT='.pkg.tar'"
+
+- name: Makepkg - enable parallel compilation MAKEFLAGS="-j$(nproc)"
+  lineinfile:
+    path: /etc/makepkg.conf
+    regexp: '#MAKEFLAGS="-j2"'
+    line: 'MAKEFLAGS="-j$(nproc)"'
+
+- name: Fstab change relatime to noatime
+  replace:
+    path: /etc/fstab
+    regexp: "relatime"
+    replace: "noatime"
+
+- name: Change number of failed logins that triger 10min lockout

Corrected spelling of 'triger' to 'trigger'.
```suggestion
- name: Change number of failed logins that trigger 10min lockout
```

> +- name: Add the user to the root group, to be able to enter directories
+  user:
+    name: "{{ ansible_user }}"
+    groups: root
+    append: yes
+
+- name: Disable need for sudo password for the current user
+  lineinfile:
+    path: "/etc/sudoers.d/99_no_pswd_for_{{ ansible_env.SUDO_UID }}"
+    state: present
+    line: "{{ ansible_user }} ALL=(ALL:ALL) NOPASSWD: ALL"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Install ssh
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Install ssh
+  pacman:
+    name:
+      - openssh
+
+- name: Enable and start ssh service
+  systemd:
+    name: sshd
+    enabled: yes
+    state: started
+
+- name: Install plocate
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +      - plocate
+
+- name: Enable and start ~12h updatedb timer
+  systemd:
+    name: plocate-updatedb.timer
+    enabled: yes
+    state: started
+
+- name: Archlinux-keyring - enable weekly update
+  systemd:
+    name: archlinux-keyring-wkd-sync.timer
+    enabled: yes
+    state: started
+
+- name: Install util-linux
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +    name: archlinux-keyring-wkd-sync.timer
+    enabled: yes
+    state: started
+
+- name: Install util-linux
+  pacman:
+    name:
+      - util-linux
+
+- name: Enable and start weekly ssd disks trim using fstrim timer
+  systemd:
+    name: fstrim.timer
+    enabled: yes
+    state: started
+- name: install trash-cli
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +
+      [Timer]
+      OnCalendar=daily
+      Persistent=true
+
+      [Install]
+      WantedBy=timers.target
+
+- name: Enable and start trash-empty.timer
+  systemd:
+    name: trash-empty.timer
+    enabled: yes
+    state: started
+
+- name: Install pacman-contrib
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +    enabled: yes
+    state: started
+
+- name: Install pacman-contrib
+  pacman:
+    name:
+      - pacman-contrib
+
+- name: Enable and start weekly cache cleanup paccache timer
+  systemd:
+    name: paccache.timer
+    enabled: yes
+    state: started
+
+- name: Install reflector
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +  pacman:
+    update_cache: yes
+
+- name: Upgrade all packages
+  become: yes
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.
```suggestion
  community.general.pacman:
    update_cache: yes

- name: Upgrade all packages
  become: yes
  community.general.pacman:
```

> +  pacman:
+    update_cache: yes
+
+- name: Upgrade all packages
+  become: yes
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.
```suggestion
  community.general.pacman:
    update_cache: yes

- name: Upgrade all packages
  become: yes
  community.general.pacman:
```

> @@ -0,0 +1,31 @@
+---
+# Bootstrap tasks - Initial system setup
+# Extracted from bootstrap.yml playbook
+
+- name: Update package database
+  become: yes
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> @@ -0,0 +1,31 @@
+---
+# Bootstrap tasks - Initial system setup
+# Extracted from bootstrap.yml playbook
+
+- name: Update package database
+  become: yes
+  pacman:
+    update_cache: yes
+
+- name: Install essential packages
+  become: yes
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +    update_cache: yes
+
+- name: Install essential packages
+  become: yes
+  pacman:
+    name:
+      - base-devel
+      - git
+      - python
+      - python-pip
+      - python-packaging
+    state: present
+
+- name: Ensure ansible dependencies are installed
+  become: yes
+  pacman:

Use fully qualified collection names (FQCNs). Change 'pacman:' to 'community.general.pacman:' for consistency.

> +    autoclean: true
+    autoremove: true
+    install_recommends: true
+  become: true
+  tags: [packages, cli, become]
+
+- name: "Install gui packages"
+  ansible.builtin.apt:
+    name: "{{ packages_apt_packages['gui'] }}"
+    state: "present"
+    autoclean: true
+    autoremove: true
+    install_recommends: true
+  become: true
+  # TODO: fix 'when' clause
+  when: packages_install_flatpak

The TODO comment indicates this when clause is incorrect. The variable should likely be 'packages_desktop_present' to match GUI package installation logic, not 'packages_install_flatpak'.
```suggestion
  when: packages_desktop_present
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/46#pullrequestreview-3302117740
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/46/review/3302117740@github.com>