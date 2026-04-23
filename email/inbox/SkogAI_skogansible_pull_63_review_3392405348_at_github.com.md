MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Wed, 29 Oct 2025 02:34:53 -0700
Subject: Re: [SkogAI/skogansible] fix: use FQCN for pacman module in tasks/skogai-core.yml (PR #63)
Message-ID: <SkogAI/skogansible/pull/63/review/3392405348@github.com>
In-Reply-To: <SkogAI/skogansible/pull/63@github.com>
References: <SkogAI/skogansible/pull/63@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6901dfbd3db1a_2df89110026490"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR uncomments a large section of previously disabled Arch Linux system configuration tasks and updates module references to use fully qualified collection names (FQCNs). The changes enable comprehensive system setup including AUR helper installation, system optimizations, service configurations, and automated maintenance tasks.

- Uncommented 162 lines of previously commented-out configuration tasks
- Updated all `pacman` module references to use FQCN `community.general.pacman`
- Enabled Python development packages in core package installation





> @@ -9,7 +9,7 @@
     upgrade: true
 
 - name: Install core packages

The task "Install core packages" is missing the `become: true` directive. This task modifies system packages which requires elevated privileges. Add `become: true` at the task level (before the module name) to ensure proper execution.
```suggestion
- name: Install core packages
  become: true
```

> +- name: Disable need for password for yay
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile` for consistency with the project's coding guidelines that require fully qualified collection names for all modules.

> -# - name: Enable and start reflector timer
-#   systemd:
-#     name: reflector.timer
-#     enabled: yes
-#     state: started
-#
-# - name: Do initial run of reflector.service
-#   systemd:
-#     name: reflector
-#     enabled: yes
-#     state: started
+      - python-pip
+      - python-setuptools
+      - python-pexpect # child application control
+
+- name: Disable need for password for yay

This task is missing the `become: true` directive. Modifying `/etc/sudoers.d/` files requires elevated privileges. Add `become: true` at the task level.
```suggestion
- name: Disable need for password for yay
  become: true
```

> -#     state: started
+      - python-pip
+      - python-setuptools
+      - python-pexpect # child application control
+
+- name: Disable need for password for yay
+  lineinfile:
+    path: /etc/sudoers.d/temp_allow_no_pswd_pacman
+    state: present
+    line: "ALL ALL=NOPASSWD: /usr/bin/pacman"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Git clone yay-repo in to /tmp
+  become: no
+  git:

The module `git` should use FQCN `ansible.builtin.git` for consistency with the project's coding guidelines.
```suggestion
  ansible.builtin.git:
```

> +    path: /etc/sudoers.d/temp_allow_no_pswd_pacman
+    state: present
+    line: "ALL ALL=NOPASSWD: /usr/bin/pacman"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Git clone yay-repo in to /tmp
+  become: no
+  git:
+    repo: "https://aur.archlinux.org/yay-bin.git"
+    dest: /tmp/yay-bin
+    clone: yes
+
+- name: Install yay using makepkg
+  become: no
+  expect:

The module `expect` should use FQCN `ansible.builtin.expect` for consistency with the project's coding guidelines.
```suggestion
  ansible.builtin.expect:
```

> +    repo: "https://aur.archlinux.org/yay-bin.git"
+    dest: /tmp/yay-bin
+    clone: yes
+
+- name: Install yay using makepkg
+  become: no
+  expect:
+    chdir: /tmp/yay-bin
+    command: makepkg -si
+    async: 600
+    poll: 0
+    responses:
+      (?i)Proceed with installation: "y"
+
+- name: Re-enable need for password for pacman
+  file:

The module `file` should use FQCN `ansible.builtin.file` for consistency with the project's coding guidelines. Additionally, this task requires `become: true` to modify files in `/etc/sudoers.d/`.
```suggestion
  become: true
  ansible.builtin.file:
```

> +  expect:
+    chdir: /tmp/yay-bin
+    command: makepkg -si
+    async: 600
+    poll: 0
+    responses:
+      (?i)Proceed with installation: "y"
+
+- name: Re-enable need for password for pacman
+  file:
+    path: /etc/sudoers.d/temp_allow_no_pswd_pacman
+    state: absent
+
+- name: Set yay options to cleanafter package installation
+  become: no
+  shell: yay -Y --answerclean All --removemake --cleanafter --save

The module `shell` should use FQCN `ansible.builtin.shell` for consistency with the project's coding guidelines.
```suggestion
  ansible.builtin.shell: yay -Y --answerclean All --removemake --cleanafter --save
```

> +  lineinfile:
+    path: /etc/pacman.conf
+    regexp: "^#Color$"
+    line: "Color"
+
+- name: Pacman - enable ParallelDownloads = 5
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify `/etc/pacman.conf`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
    path: /etc/pacman.conf
    regexp: "^#Color$"
    line: "Color"

- name: Pacman - enable ParallelDownloads = 5
  become: true
  ansible.builtin.lineinfile:
```

> +  lineinfile:
+    path: /etc/pacman.conf
+    regexp: "^#Color$"
+    line: "Color"
+
+- name: Pacman - enable ParallelDownloads = 5
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify `/etc/pacman.conf`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
    path: /etc/pacman.conf
    regexp: "^#Color$"
    line: "Color"

- name: Pacman - enable ParallelDownloads = 5
  become: true
  ansible.builtin.lineinfile:
```

> +    executable: /usr/bin/bash
+
+- name: Pacman - enable color
+  lineinfile:
+    path: /etc/pacman.conf
+    regexp: "^#Color$"
+    line: "Color"
+
+- name: Pacman - enable ParallelDownloads = 5
+  lineinfile:
+    path: /etc/pacman.conf
+    regexp: "ParallelDownloads"
+    line: "ParallelDownloads = 5"
+
+- name: Makepkg - disable compression
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify `/etc/makepkg.conf`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
```

> +  lineinfile:
+    path: /etc/makepkg.conf
+    regexp: '#MAKEFLAGS="-j2"'
+    line: 'MAKEFLAGS="-j$(nproc)"'

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify `/etc/makepkg.conf`.
```suggestion
  ansible.builtin.lineinfile:
    path: /etc/makepkg.conf
    regexp: '#MAKEFLAGS="-j2"'
    line: 'MAKEFLAGS="-j$(nproc)"'
  become: true
```

> +    line: "ParallelDownloads = 5"
+
+- name: Makepkg - disable compression
+  lineinfile:
+    path: /etc/makepkg.conf
+    regexp: "PKGEXT='.pkg.tar.zst'"
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

The module `replace` should use FQCN `ansible.builtin.replace`. Additionally, this task requires `become: true` to modify `/etc/fstab`.
```suggestion
  become: true
  ansible.builtin.replace:
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

Corrected spelling of 'triger' to 'trigger' in the task name.
```suggestion
- name: Change number of failed logins that trigger 10min lockout
```

> +    line: "PKGEXT='.pkg.tar'"
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
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify `/etc/security/faillock.conf`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
```

> +    line: 'MAKEFLAGS="-j$(nproc)"'
+
+- name: Fstab change relatime to noatime
+  replace:
+    path: /etc/fstab
+    regexp: "relatime"
+    replace: "noatime"
+
+- name: Change number of failed logins that triger 10min lockout
+  lineinfile:
+    path: /etc/security/faillock.conf
+    regexp: "^# deny = 3$"
+    line: "deny = 10"
+
+- name: Enable members of wheel group to sudo
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify files in `/etc/sudoers.d/`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
```

> +- name: Change number of failed logins that triger 10min lockout
+  lineinfile:
+    path: /etc/security/faillock.conf
+    regexp: "^# deny = 3$"
+    line: "deny = 10"
+
+- name: Enable members of wheel group to sudo
+  lineinfile:
+    path: /etc/sudoers.d/98_wheel_allow_sudo
+    state: present
+    line: "%wheel ALL=(ALL:ALL) ALL"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Add the user to the root group, to be able to enter directories
+  user:

The module `user` should use FQCN `ansible.builtin.user`. Additionally, this task requires `become: true` to modify user group membership.
```suggestion
  become: true
  ansible.builtin.user:
```

> +- name: Enable members of wheel group to sudo
+  lineinfile:
+    path: /etc/sudoers.d/98_wheel_allow_sudo
+    state: present
+    line: "%wheel ALL=(ALL:ALL) ALL"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Add the user to the root group, to be able to enter directories
+  user:
+    name: "{{ ansible_user }}"
+    groups: root
+    append: yes
+
+- name: Disable need for sudo password for the current user
+  lineinfile:

The module `lineinfile` should use FQCN `ansible.builtin.lineinfile`. Additionally, this task requires `become: true` to modify files in `/etc/sudoers.d/`.
```suggestion
  become: true
  ansible.builtin.lineinfile:
```

> +- name: Install ssh
+  community.general.pacman:

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.

> +- name: Enable and start ssh service
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +    line: "{{ ansible_user }} ALL=(ALL:ALL) NOPASSWD: ALL"
+    validate: /usr/sbin/visudo -cf %s
+    create: yes
+
+- name: Install ssh
+  community.general.pacman:
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

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.
```suggestion
- name: Install plocate
  become: true
```

> +- name: Enable and start ~12h updatedb timer
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +- name: Archlinux-keyring - enable weekly update
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +    name:
+      - plocate
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

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.
```suggestion
- name: Install util-linux
  become: true
```

> +- name: Enable and start weekly ssd disks trim using fstrim timer
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +  systemd:
+    name: archlinux-keyring-wkd-sync.timer
+    enabled: yes
+    state: started
+
+- name: Install util-linux
+  community.general.pacman:
+    name:
+      - util-linux
+
+- name: Enable and start weekly ssd disks trim using fstrim timer
+  systemd:
+    name: fstrim.timer
+    enabled: yes
+    state: started
+- name: install trash-cli

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.
```suggestion
- name: install trash-cli
  become: true
```

> +- name: Create trash-empty.service file
+  copy:

The module `copy` should use FQCN `ansible.builtin.copy`. Additionally, this task requires `become: true` to create files in `/etc/systemd/system/`.

> +- name: Create trash-empty.timer file
+  copy:

The module `copy` should use FQCN `ansible.builtin.copy`. Additionally, this task requires `become: true` to create files in `/etc/systemd/system/`.

> +- name: Enable and start trash-empty.timer
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +      Description=Empty trash older than 30 days daily
+
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

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.
```suggestion
- name: Install pacman-contrib
  become: true
```

> +- name: Enable and start weekly cache cleanup paccache timer
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +    name: trash-empty.timer
+    enabled: yes
+    state: started
+
+- name: Install pacman-contrib
+  community.general.pacman:
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

This task is missing the `become: true` directive. Package installation with pacman requires elevated privileges.
```suggestion
- name: Install reflector
  become: true
```

> +- name: Write reflector configuration file
+  copy:

The module `copy` should use FQCN `ansible.builtin.copy`. Additionally, this task requires `become: true` to create files in `/etc/xdg/reflector/`.

> +- name: Enable and start reflector timer
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

> +- name: Do initial run of reflector.service
+  systemd:

The module `systemd` should use FQCN `ansible.builtin.systemd`. Additionally, this task requires `become: true` to manage system services.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/63#pullrequestreview-3392405348
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/63/review/3392405348@github.com>