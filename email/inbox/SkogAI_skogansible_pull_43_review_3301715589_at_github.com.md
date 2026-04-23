MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 04 Oct 2025 02:40:08 -0700
Subject: Re: [SkogAI/skogansible] . (PR #43)
Message-ID: <SkogAI/skogansible/pull/43/review/3301715589@github.com>
In-Reply-To: <SkogAI/skogansible/pull/43@github.com>
References: <SkogAI/skogansible/pull/43@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0eb787fd81_31d1a10d8940b5"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes `become: true` directives from several tasks in the package managers role and makes some related configuration changes. The changes appear to be attempting to modify privilege escalation behavior for package installation tasks.

Key changes:
- Removes `become: true` from multiple tasks including user creation, sudoers configuration, and package installation
- Adds `become_user: skogix` to the sudoers file configuration task
- Removes the `validate` parameter from the sudoers configuration





> @@ -1,20 +1,18 @@
 ---
 - name: Create the `aur_builder` user
-  become: true
   ansible.builtin.user:
     name: aur_builder
     create_home: yes
     group: wheel

Creating a user requires root privileges. The `become: true` directive is necessary for this task to succeed, as regular users cannot create system accounts.
```suggestion
    group: wheel
  become: true
```

>    ansible.builtin.lineinfile:
+    become_user: skogix

Modifying files in `/etc/sudoers.d/` requires root privileges, but `become_user: skogix` runs as a regular user. This task needs `become: true` to escalate to root privileges.
```suggestion
    become: true
```

>    ansible.builtin.lineinfile:
+    become_user: skogix
     path: /etc/sudoers.d/11-install-aur_builder
     line: "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman"
     create: yes
     mode: "0440"

Removing the `validate: 'visudo -cf %s'` parameter eliminates syntax validation for sudoers configuration. This could lead to malformed sudoers files that break system authentication.
```suggestion
    mode: "0440"
    validate: 'visudo -cf %s'
```

> @@ -26,13 +24,11 @@
     file: "{{ playbook_dir }}/../vars/packages.yml"
 
 - name: Install pacman packages

Installing system packages with pacman requires root privileges. The `become: true` directive is necessary for this task to succeed.
```suggestion
- name: Install pacman packages
  become: true
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/43#pullrequestreview-3301715589
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/43/review/3301715589@github.com>