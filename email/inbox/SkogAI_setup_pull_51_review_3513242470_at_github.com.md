MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 17:22:04 -0800
Subject: Re: [SkogAI/setup] Revert "feat(dotfiles): Consolidate i3/sway configs into shared Jinja template" (PR #51)
Message-ID: <SkogAI/setup/pull/51/review/3513242470@github.com>
In-Reply-To: <SkogAI/setup/pull/51@github.com>
References: <SkogAI/setup/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6927a7bcaa510_ec110021698"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR reverts the consolidation of i3/sway configs (PR #49), returning to separate configuration files for each window manager. However, the revert appears incomplete with several critical issues: an incomplete Ansible task definition, X11-specific commands in sway configs, and inconsistent handling of window manager-specific deployments.

Key changes:
- Restores separate sway config files (config, skogconfig, config-backup) and i3 config
- Reverts Ansible tasks to use file-based configs instead of template-based deployment
- Re-introduces conditional deployment logic using `wm_type` variable

### Reviewed changes

Copilot reviewed 5 out of 8 changed files in this pull request and generated 8 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| roles/03-dotfiles/tasks/main.yml | Reverts task definitions from template-based to file-based deployments, but contains incomplete task and inconsistent logic |
| roles/03-dotfiles/files/.config/sway/skogconfig | Restored sway config but contains X11-specific commands (xrandr, feh, picom, i3-msg, i3blocks) |
| roles/03-dotfiles/files/.config/sway/config | Restored sway config with minimal i3 reference in comment |
| roles/03-dotfiles/files/.config/sway/config-backup | Restored default sway config backup |
| roles/03-dotfiles/files/.config/sway/config.d/keyboard-setup.sh | Restored sway-specific keyboard setup script |
| roles/03-dotfiles/files/.config/sway/config.d/50-systemd-user.conf | Restored sway systemd integration config |
| roles/03-dotfiles/files/.config/i3/config | Reverted from template-based to static i3 config, removing Discord workspace assignments |
</details>






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

The task 'Symlink i3 wallpaper for users' is incomplete - it's missing required properties (state, force, owner, group, loop, when, become). The task definition runs directly into the next task definition on line 363, causing a syntax error. The task should include all properties similar to the mods config task below it.
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

> +- name: Deploy window manager config from template
+  ansible.builtin.template:
+    src: ".config/wm/config.j2"
+    dest: "/home/{{ item.name }}/.config/{{ wm_type | default('i3') }}/config"
+    owner: "{{ item.name }}"
+    group: "{{ item.name }}"
+    mode: '0644'
+  loop: "{{ users }}"
+  become: true
+

This task still uses the template-based deployment approach that should have been removed in this revert. The task references '.config/wm/config.j2' which was part of the consolidated approach being reverted. This should instead use ansible.builtin.file to symlink static config files for i3 and sway separately, or this task should be removed entirely if static files are being deployed differently.
```suggestion
- name: Symlink i3 config for users
  ansible.builtin.file:
    src: "{{ role_path }}/files/.config/i3/config"
    dest: "/home/{{ item.name }}/.config/i3/config"
    state: link
    force: true
    owner: "{{ item.name }}"
    group: "{{ item.name }}"
  loop: "{{ users }}"
  when: wm_type | default('i3') == 'i3'
  become: true

- name: Symlink sway config for users
  ansible.builtin.file:
    src: "{{ role_path }}/files/.config/sway/config"
    dest: "/home/{{ item.name }}/.config/sway/config"
    state: link
    force: true
    owner: "{{ item.name }}"
    group: "{{ item.name }}"
  loop: "{{ users }}"
  when: wm_type | default('i3') == 'sway'
  become: true
```

> +# for_window [class="Pamac-manager"] floating enable
+# for_window [window_role="About"] floating enable
+
+# Workspace assignments
+# assign [class="(?i)firefox-nightly"] $ws2
+# assign [class="kitty"] $ws1
+# assign [class="Thunar"] $ws3
+# assign [class="thunderbird"] $ws4
+# assign [class="TelegramDesktop"] $ws5
+
+# Auto focus on new windows
+# for_window [class=kitty] focus
+# for_window [class=(?i)firefox-nightly] focus
+
+# Autostart Applications
+exec --no-startup-id "i3-msg 'workspace 1; exec kitty'"

Using i3-msg in a sway config file will fail. Sway uses 'swaymsg' instead of 'i3-msg'. This should be changed to: exec --no-startup-id \"swaymsg 'workspace 1; exec kitty'\"
```suggestion
exec --no-startup-id "swaymsg 'workspace 1; exec kitty'"
```

> +
+# Workspace assignments
+# assign [class="(?i)firefox-nightly"] $ws2
+# assign [class="kitty"] $ws1
+# assign [class="Thunar"] $ws3
+# assign [class="thunderbird"] $ws4
+# assign [class="TelegramDesktop"] $ws5
+
+# Auto focus on new windows
+# for_window [class=kitty] focus
+# for_window [class=(?i)firefox-nightly] focus
+
+# Autostart Applications
+exec --no-startup-id "i3-msg 'workspace 1; exec kitty'"
+exec --no-startup-id dunst
+exec_always --no-startup-id picom --config ~/.config/picom/picom.conf

Picom is an X11 compositor and will not work with sway (Wayland). Sway has its own built-in compositor. This line should be removed from the sway config.
```suggestion

```

> +# Executing command: eos-welcome --startdelay=3
+# Executing command: wireplumber
+# exec --no-startup-id wireplumber
+# Executing command: /usr/lib/xapps/xapp-sn-watcher
+# exec --no-startup-id wireplumber
+# Executing command: xdg-user-dirs-update
+exec --no-startup-id xdg-user-dirs-update
+
+# Lock screen setup
+exec --no-startup-id xss-lock -l ~/.config/i3/scripts/blur-lock
+
+# Power saving settings
+# exec --no-startup-id xset s 480 dpms 600 600 600
+
+# Display and Appearance
+exec_always xrandr --output DP-4 --mode 1920x1080 --rate 144 --primary

xrandr is an X11 tool and does not work with sway (Wayland). For sway, use 'output' configuration instead: 'output DP-4 resolution 1920x1080@144Hz'. See lines 86-87 in roles/03-dotfiles/files/.config/sway/config for the correct sway syntax.
```suggestion
output DP-4 resolution 1920x1080@144Hz
output DP-4 primary
```

> +# Executing command: wireplumber
+# exec --no-startup-id wireplumber
+# Executing command: /usr/lib/xapps/xapp-sn-watcher
+# exec --no-startup-id wireplumber
+# Executing command: xdg-user-dirs-update
+exec --no-startup-id xdg-user-dirs-update
+
+# Lock screen setup
+exec --no-startup-id xss-lock -l ~/.config/i3/scripts/blur-lock
+
+# Power saving settings
+# exec --no-startup-id xset s 480 dpms 600 600 600
+
+# Display and Appearance
+exec_always xrandr --output DP-4 --mode 1920x1080 --rate 144 --primary
+exec --no-startup-id sleep 1 && feh --bg-fill ~/.config/i3/wallpaper.jpg

feh is an X11 wallpaper setter and will not work with sway (Wayland). Sway uses 'output * bg <path> fill' configuration. This should be replaced with: output * bg ~/.config/sway/wallpaper.jpg fill (and move outside of exec, as it's a config directive).
```suggestion
output * bg ~/.config/sway/wallpaper.jpg fill
```

> +
+# - Workspace names are simple numbers (1, 2, etc.) instead of descriptive names (1:skogix, 2:web, etc.).
+# - Font is set to pango:Hack 9 instead of pango:Noto Mono Sans 20.
+# - Keybinding for launching rofi is ctrl+space and $mod+space, without specific font size.
+# - Autostart applications include dunst, picom, redshift, etc., instead of nm-applet, volumeicon, pasystray, etc.
+# - Window rules include applications like Calculator, Timer, librewolf, firefox, etc.
+# - Resize mode uses 5 px or 5 ppt instead of 10 px or 10 ppt.
+# - Volume control bindings use pamixer and amixer.
+# - No bar settings specified.
+# - Floating rules include applications like Calculator, Timer, mpv, etc.
+
+
+# i3bar configuration
+bar {
+    font pango: Hack 10
+    status_command i3blocks -c ~/.config/i3/i3blocks.conf

i3blocks may not be fully compatible with sway's bar. Consider using i3status or a Wayland-compatible status bar like waybar. If using i3blocks, it should reference a sway config path, not an i3 path: i3blocks -c ~/.config/sway/i3blocks.conf
```suggestion
    status_command i3blocks -c ~/.config/sway/i3blocks.conf
```

> @@ -0,0 +1,290 @@
+# Basic i3 Settings

Comment header says 'Basic i3 Settings' in a sway config file. Should be 'Basic sway Settings' for clarity.
```suggestion
# Basic sway Settings
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/51#pullrequestreview-3513242470
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/51/review/3513242470@github.com>