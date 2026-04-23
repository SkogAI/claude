MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.ansible" <.ansible@noreply.github.com>
Date: Sun, 28 Sep 2025 08:49:36 -0700
Subject: Re: [SkogAI/.ansible] Fix site.yml to use correct multi-distro packages role=0A=0ACo-authored-by: Skogix <690279+Skogix@users.noreply.github.com> (PR #28)
Message-ID: <SkogAI/.ansible/pull/28/review/3277105575@github.com>
In-Reply-To: <SkogAI/.ansible/pull/28@github.com>
References: <SkogAI/.ansible/pull/28@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d959101922f_7dcb10c81347e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR fixes the site.yml playbook to use the correct multi-distro packages role by implementing a new role structure and updating the main playbook configuration. The changes introduce a backup packages role with multi-distro support and clean up the configuration files.

- Adds a new `packages_multi_distro` role in the `roles_backup` directory with comprehensive package management for multiple distributions
- Updates the main site.yml playbook to comment out non-existent roles with TODO markers
- Refactors host variable files to use cleaner, more modular configuration structure

### Reviewed Changes

Copilot reviewed 25 out of 26 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| roles_backup/packages_multi_distro/* | New multi-distro package management role with support for apt, dnf, homebrew, flatpak, and mas |
| roles/0*/* | Placeholder roles with basic structure for future implementation |
| roles/02_basics/* | Updated basics role with improved reflector configuration and systemd-boot detection |
| playbooks/site.yml | Updated to comment out non-existent roles with TODO markers |
| host_vars/* | Refactored configuration structure with cleaner defaults and host-specific overrides |
| ansible.cfg | Removed vault password file reference |
</details>






---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/.ansible/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +  tags: [packages, install, repos, become]
+
+- name: "Install Homebrew packages for Linux"
+  ansible.builtin.include_tasks:
+    file: "pkg_mgr/homebrew.yml"
+  when: (ansible_facts['system'] == "Linux" and packages_homebrew_installed) and
+        (ansible_facts['architecture'] == "x86_64" or ansible_facts['architecture'] == "amd64")
+  tags: [packages, homebrew, install, repos, formulas, casks]
+
+- name: "Install Mac App Store apps"
+  ansible.builtin.include_tasks:
+    file: "pkg_mgr/mas.yml"
+  when: (ansible_facts['system'] == "Darwin") and (packages_mas_apps | length > 0)
+  tags: [packages, mas]
+
+- name: "Include Flakpak packages"

There's a typo in the task name. 'Flakpak' should be 'Flatpak'.
```suggestion
- name: "Include Flatpak packages"
```

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

The condition references `packages_install_flatpak` but the variable is defined as `packages_install_flatpaks` (plural) in the defaults file. This will cause the task to never execute when intended.
```suggestion
  when: packages_install_flatpaks
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.ansible/pull/28#pullrequestreview-3277105575
You are receiving this because you authored the thread.

Message ID: <SkogAI/.ansible/pull/28/review/3277105575@github.com>