MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 04 Oct 2025 02:38:38 -0700
Subject: Re: [SkogAI/skogansible] . (PR #42)
Message-ID: <SkogAI/skogansible/pull/42/review/3301713926@github.com>
In-Reply-To: <SkogAI/skogansible/pull/42@github.com>
References: <SkogAI/skogansible/pull/42@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0eb1ee2871_28b4f10d89562c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes `become: true` directives from Ansible tasks in the package managers role, which would cause these tasks to run without elevated privileges. The changes also remove the `validate` parameter from the sudoers configuration and add a `become_user: skogix` directive to one task.

### Key changes:
- Removed `become: true` from all tasks that require root privileges
- Added `become_user: skogix` to the sudoers configuration task
- Removed validation for sudoers file modification





>  - name: Create the `aur_builder` user
-  become: true
   ansible.builtin.user:
     name: aur_builder
     create_home: yes
     group: wheel

The `aur_builder` user creation task requires elevated privileges but `become: true` has been removed. This task will fail when run as a regular user since creating users requires root access.

>  - name: Allow the `aur_builder` user to run `sudo pacman` without a password
-  become: true
   ansible.builtin.lineinfile:
+    become_user: skogix
     path: /etc/sudoers.d/11-install-aur_builder

This task attempts to modify `/etc/sudoers.d/` as user `skogix` without `become: true`. Regular users cannot write to this directory - this requires root privileges and should use `become: true` instead of `become_user: skogix`.

>  - name: Install pacman packages
-  become: true
   community.general.pacman:
     name: "{{ packages }}"
     state: present

Package installation with pacman requires elevated privileges but `become: true` has been removed. This task will fail when run as a regular user since installing system packages requires root access.

>  - name: Allow the `aur_builder` user to run `sudo pacman` without a password
-  become: true
   ansible.builtin.lineinfile:
+    become_user: skogix
     path: /etc/sudoers.d/11-install-aur_builder
     line: "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman"
     create: yes
     mode: "0440"

The `validate` parameter has been removed from the sudoers configuration. This parameter ensures the sudoers file syntax is valid before applying changes. Without validation, syntax errors could lock out sudo access entirely.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/42#pullrequestreview-3301713926
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/42/review/3301713926@github.com>