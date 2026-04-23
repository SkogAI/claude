MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 17:15:48 -0800
Subject: Re: [SkogAI/setup] dotfiles: deploy i3 config with shared i3/sway Jinja template (PR #46)
Message-ID: <SkogAI/setup/pull/46/review/3513219668@github.com>
In-Reply-To: <SkogAI/setup/pull/46@github.com>
References: <SkogAI/setup/pull/46@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6927a6441902f_106110016890"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds i3 window manager configuration deployment using a shared Jinja2 template that consolidates the ~90% config overlap between i3 (X11) and sway (Wayland). The PR introduces a `wm_type` variable to control which window manager config is deployed, with conditional rendering for WM-specific settings like X11 vs Wayland initialization, keyboard layouts, and compositor configurations.

**Key changes:**
- New shared template at `templates/.config/wm/config.j2` with `wm_type`-based conditionals for i3/sway differences
- Added `wm_type` variable in `vars/user.yml` (default: 'i3') to control WM selection
- Updated deployment tasks to template the WM config and conditionally symlink i3-specific files (scripts, wallpaper)

### Reviewed changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| `vars/user.yml` | Adds `wm_type` variable (default: 'i3') to select window manager |
| `roles/03-dotfiles/templates/.config/wm/config.j2` | New shared Jinja2 template with conditional blocks for i3 vs sway-specific config sections |
| `roles/03-dotfiles/tasks/main.yml` | Adds i3/i3/scripts to config_dirs; deploys WM config from template; makes sway tasks conditional; adds i3 scripts and wallpaper symlinks (contains bugs) |
| `CLAUDE.md` | Documents the new `wm_type` variable and shared template approach in the dotfiles structure section |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    force: true
+    owner: "{{ item.0.name }}"
+    group: "{{ item.0.name }}"
+  loop: "{{ users | product(i3_scripts) | list }}"
+  vars:
+    i3_scripts:
+      - blur-lock
+      - empty_workspace
+      - exit_menu
+  when: wm_type | default('i3') == 'i3'
+  become: true
+
+- name: Symlink i3 wallpaper for users
+  ansible.builtin.file:
+    src: "{{ role_path }}/files/.config/i3/wallpaper.jpg"
+    dest: "/home/{{ item.name }}/.config/i3/wallpaper.jpg"

The "Symlink i3 wallpaper for users" task is incomplete and missing required parameters. It needs:
- `state: link`
- `force: true`
- `owner: "{{ item.name }}"`
- `group: "{{ item.name }}"`
- `loop: "{{ users }}"`
- `when: wm_type | default('i3') == 'i3'`
- `become: true`

The task should follow the same pattern as the i3 scripts task above it (lines 342-357).
```suggestion
    dest: "/home/{{ item.name }}/.config/i3/wallpaper.jpg"
    state: link
    force: true
    owner: "{{ item.name }}"
    group: "{{ item.name }}"
  loop: "{{ users }}"
  when: wm_type | default('i3') == 'i3'
  become: true
```

> @@ -326,4 +369,5 @@
     owner: "{{ item.name }}"
     group: "{{ item.name }}"
   loop: "{{ users }}"
+  when: wm_type | default('i3') == 'i3'

The `when` condition is incorrectly placed on the "Symlink mods config for users" task. This condition should be on the "Symlink i3 wallpaper for users" task above (line 359-362), not here. The mods config should be deployed regardless of window manager type.

> @@ -317,6 +321,45 @@
   loop: "{{ users }}"
   become: true
 
+- name: Remove existing WM config symlink if present
+  ansible.builtin.file:
+    path: "/home/{{ item.name }}/.config/{{ wm_type | default('i3') }}/config"
+    state: absent
+  loop: "{{ users }}"
+  when: ansible_check_mode is not defined or not ansible_check_mode

The `when: ansible_check_mode is not defined or not ansible_check_mode` condition is unnecessary. The `ansible.builtin.file` module with `state: absent` already handles check mode correctly by reporting what would be removed without actually removing files. This condition prevents the task from running in check mode (dry-run), which means users won't see the removal in dry-run reports. Consider removing this condition to follow standard Ansible practices.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/46#pullrequestreview-3513219668
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/46/review/3513219668@github.com>