MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 15:25:24 -0800
Subject: Re: [SkogAI/setup] feat(dotfiles): Consolidate i3/sway configs into shared Jinja template (PR #49)
Message-ID: <SkogAI/setup/pull/49/review/3513022318@github.com>
In-Reply-To: <SkogAI/setup/pull/49@github.com>
References: <SkogAI/setup/pull/49@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69278c646e248_ef110098840"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR consolidates i3 and sway window manager configurations into a shared Jinja2 template, reducing duplication and simplifying maintenance. The approach deploys configs to `~/.config/i3/` and attempts to detect the active window manager via `$XDG_CURRENT_DESKTOP` to conditionally render WM-specific sections.

### Key Changes
- Created unified `wm-config.j2` template with conditional blocks for i3 vs sway-specific settings
- Consolidated config files to `~/.config/i3/` directory structure (scripts, config.d files, wallpaper)
- Removed redundant sway directory and its config files (config, config-backup, skogconfig)

### Reviewed changes

Copilot reviewed 5 out of 8 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| roles/03-dotfiles/templates/wm-config.j2 | New unified template with ~60% shared config and WM-specific conditionals for i3/sway |
| roles/03-dotfiles/tasks/main.yml | Added WM detection logic, template deployment, updated symlinks from sway/ to i3/ paths |
| roles/03-dotfiles/files/.config/i3/config.d/keyboard-setup.sh | New sway-specific keyboard setup script using swaymsg commands |
| roles/03-dotfiles/files/.config/i3/config.d/50-systemd-user.conf | New sway-specific systemd environment setup for Wayland session |
| roles/03-dotfiles/files/.config/sway/config | Deleted - replaced by template |
| roles/03-dotfiles/files/.config/sway/config-backup | Deleted - no longer needed |
| roles/03-dotfiles/files/.config/sway/skogconfig | Deleted - functionality merged into template |
| roles/03-dotfiles/files/.config/sway/wallpaper.jpg | Deleted - sway uses system wallpaper path |
</details>



<details>
<summary>Comments suppressed due to low confidence (6)</summary>

**roles/03-dotfiles/templates/wm-config.j2:15**
* [nitpick] The template is missing a `font` configuration that was present in the original configs (e.g., `font pango: Noto Sans Regular 10` in skogconfig). While i3/sway will use defaults, explicitly setting the font maintains consistency with the previous configuration and provides better control over appearance.
**roles/03-dotfiles/templates/wm-config.j2:191**
* The `50-systemd-user.conf` file is symlinked to `~/.config/i3/config.d/` but won't be loaded by sway. The template should include `~/.config/i3/config.d/*` (user-specific configs) in addition to or instead of `/etc/sway/config.d/*` (system-wide configs), or explicitly exec the 50-systemd-user.conf file similar to how keyboard-setup.sh is executed on line 179.
**roles/03-dotfiles/templates/wm-config.j2:15**
* Missing `floating_modifier $mod` setting which was present in the original configs (e.g., roles/03-dotfiles/files/.config/sway/skogconfig line 5). This setting is needed to move floating windows by holding $mod and dragging with the mouse. Consider adding it to the shared section of the template.
**roles/03-dotfiles/templates/wm-config.j2:33**
* Workspace assignments using `[class=...]` criteria won't work in sway/Wayland. Sway uses `app_id` instead of `class`. Consider moving these assignments to the i3-specific section, or use conditional syntax like `{% if wm == 'i3' %}assign [class="Steam"] $ws9{% else %}assign [app_id="steam"] $ws9{% endif %}` to support both WMs.
**roles/03-dotfiles/templates/wm-config.j2:129**
* The template is missing resize mode configuration that was present in the original configs (e.g., skogconfig lines 123-142). Users will not be able to use `$mod+r` to enter resize mode for adjusting window sizes with vim keys or arrows. Consider adding the resize mode block to restore this functionality.
**roles/03-dotfiles/templates/wm-config.j2:15**
* [nitpick] The template removes the `gaps inner 6` and `gaps outer 3` settings that were present in the original skogconfig. If this is intentional (to use i3-gaps/sway defaults), consider adding a comment explaining the removal. Otherwise, add these settings to maintain visual consistency with the previous config.
</details>



---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +- name: Check if sway is running or preferred
+  ansible.builtin.shell: echo $XDG_CURRENT_DESKTOP
+  register: current_desktop
+  changed_when: false
+  failed_when: false
+
+- name: Set active WM fact
+  ansible.builtin.set_fact:
+    active_wm: "{{ 'sway' if 'sway' in (current_desktop.stdout | lower) else 'i3' }}"
+

The WM detection uses `echo $XDG_CURRENT_DESKTOP`, which reads the variable from the Ansible controller's environment, not the target machine. This will likely be empty or incorrect when running Ansible remotely or in a non-graphical session. Consider using `ansible.builtin.environment` to read from the target's environment, or checking for running processes (e.g., `pgrep -x sway` or `pgrep -x i3`), or checking installed packages to determine which WM to configure.
```suggestion
- name: Check if sway is running
  ansible.builtin.shell: pgrep -x sway
  register: sway_running
  changed_when: false
  failed_when: false
  become: false

- name: Set active WM fact
  ansible.builtin.set_fact:
    active_wm: "{{ 'sway' if sway_running.rc == 0 else 'i3' }}"
```

> +
+- name: Set active WM fact
+  ansible.builtin.set_fact:
+    active_wm: "{{ 'sway' if 'sway' in (current_desktop.stdout | lower) else 'i3' }}"
+
+# Deploy WM config from shared template (i3 folder - sway uses it as fallback)
+- name: Deploy WM config from template
+  ansible.builtin.template:
+    src: wm-config.j2
+    dest: "/home/{{ item.name }}/.config/i3/config"
+    owner: "{{ item.name }}"
+    group: "{{ item.name }}"
+    mode: '0644'
+  loop: "{{ users }}"
+  vars:
+    wm: "{{ active_wm }}"
   become: true
 

The comment says "sway uses it as fallback" but sway does not automatically fall back to `~/.config/i3/config`. Sway reads from `~/.config/sway/config` by default. You need to either: (1) Also create `~/.config/sway/config` as a symlink to `~/.config/i3/config`, (2) Create `~/.config/sway/` directory and deploy the config there as well when active_wm is 'sway', or (3) Ensure users launch sway with `-c ~/.config/i3/config`. Without this, sway users will not get the generated config.
```suggestion


# If sway is the active WM, ensure sway config directory and symlink config
- name: Ensure .config/sway directory exists for sway users
  ansible.builtin.file:
    path: "/home/{{ item.name }}/.config/sway"
    state: directory
    owner: "{{ item.name }}"
    group: "{{ item.name }}"
    mode: '0755'
  loop: "{{ users }}"
  when: active_wm == 'sway'
  become: true

- name: Symlink sway config to i3 config if sway is active
  ansible.builtin.file:
    src: "/home/{{ item.name }}/.config/i3/config"
    dest: "/home/{{ item.name }}/.config/sway/config"
    state: link
    owner: "{{ item.name }}"
    group: "{{ item.name }}"
  loop: "{{ users }}"
  when: active_wm == 'sway'
  become: true
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/49#pullrequestreview-3513022318
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/49/review/3513022318@github.com>