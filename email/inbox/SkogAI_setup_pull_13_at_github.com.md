MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Fri, 21 Nov 2025 03:51:36 -0800
Subject: [SkogAI/setup] [WIP] Migrate dotfiles to Ansible management (PR #13)
Message-ID: <SkogAI/setup/pull/13@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69205248aca84_b311006691"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Migrate dotfiles from todo/dotfiles to Ansible management&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Overview
&gt; 
&gt; Migrate the dotfiles in `todo/dotfiles/` to be managed by the `roles/03-dotfiles` Ansible role.
&gt; 
&gt; ## Files to Migrate
&gt; 
&gt; ### Shell Configuration
&gt; - [ ] `zshrc` - Main zsh configuration with zplug plugins
&gt; - [ ] `zshenv` - Environment variables
&gt; 
&gt; ### Git Configuration
&gt; - [ ] `gitconfig` - Git aliases, signing, credential helpers
&gt; 
&gt; ### XDG Config (~/.config/)
&gt; Application configs in `config/`:
&gt; - [ ] `kitty` - Terminal emulator
&gt; - [ ] `i3` - Window manager
&gt; - [ ] `rofi` - Application launcher
&gt; - [ ] `dunst` - Notification daemon
&gt; - [ ] `fzf` - Fuzzy finder
&gt; - [ ] `gh` - GitHub CLI
&gt; - [ ] `btop` - System monitor
&gt; - [ ] `zsh` - Additional zsh config
&gt; - [ ] `sheldon` - Shell plugin manager
&gt; - [ ] `direnv` - Directory environments
&gt; - [ ] `gptme`, `aichat`, `mods` - AI tools
&gt; - [ ] `zed` - Editor
&gt; - [ ] `picom` - Compositor
&gt; - [ ] `gammastep` - Display temperature
&gt; - [ ] `ncspot` - Spotify client
&gt; - [ ] `glow` - Markdown viewer
&gt; - [ ] `rclone` - Cloud storage
&gt; - [ ] `byobu` - Terminal multiplexer
&gt; - [ ] `x11`, `dconf` - X11/desktop settings
&gt; - [ ] `systemd` - User services
&gt; - [ ] `user-dirs.dirs/locale` - XDG directories
&gt; - [ ] `pipewire` - Audio
&gt; - [ ] `znt` - Zsh navigation tools
&gt; 
&gt; ### Other
&gt; - [ ] `cloudflared/` - Cloudflare tunnel config
&gt; - [ ] `skogai/` - Custom scripts/tools
&gt; - [ ] `nvmrc` - Node version
&gt; - [ ] `rcrc` - rcm config (may not be needed with Ansible)
&gt; 
&gt; ## Implementation Approach
&gt; 
&gt; ### 1. Template vs Static Files
&gt; 
&gt; **Use templates (`.j2`) for:**
&gt; - `gitconfig` - User email, signing key vary per user
&gt; - `zshrc`/`zshenv` - Paths may vary
&gt; 
&gt; **Use static files for:**
&gt; - Application configs that don&#39;t need variables (kitty, rofi themes, etc.)
&gt; 
&gt; ### 2. Directory Structure
&gt; 
&gt; ```
&gt; roles/03-dotfiles/
&gt; ├── files/
&gt; │   └── config/          # Static XDG configs
&gt; │       ├── kitty/
&gt; │       ├── i3/
&gt; │       └── ...
&gt; ├── templates/
&gt; │   ├── zshrc.j2
&gt; │   ├── zshenv.j2
&gt; │   └── gitconfig.j2
&gt; └── tasks/
&gt;     └── main.yml
&gt; ```
&gt; 
&gt; ### 3. Task Implementation
&gt; 
&gt; For each dotfile category, add to `tasks/main.yml`:
&gt; 
&gt; ```yaml
&gt; # Shell configs
&gt; - name: Deploy zshrc
&gt;   template:
&gt;     src: zshrc.j2
&gt;     dest: &quot;{{ user_home }}/.zshrc&quot;
&gt;     owner: &quot;{{ user_name }}&quot;
&gt;     mode: &#39;0644&#39;
&gt; 
&gt; # XDG config directories
&gt; - name: Deploy XDG configs
&gt;   copy:
&gt;     src: &quot;config/{{ item }}&quot;
&gt;     dest: &quot;{{ user_home }}/.config/&quot;
&gt;     owner: &quot;{{ user_name }}&quot;
&gt;   loop:
&gt;     - kitty
&gt;     - i3
&gt;     - rofi
&gt;     # ... etc
&gt; ```
&gt; 
&gt; ### 4. Variables to Extract
&gt; 
&gt; Add to `vars/user.yml`:
&gt; - `git_email`
&gt; - `git_signing_key`
&gt; - `default_editor`
&gt; 
&gt; ### 5. Migration Steps
&gt; 
&gt; 1. Review each config for hardcoded paths/values
&gt; 2. Convert user-specific values to Jinja2 variables
&gt; 3. Copy static files to `files/config/`
&gt; 4. Copy templates to `templates/`
&gt; 5. Update `tasks/main.yml` with deployment tasks
&gt; 6. Test with `--check --diff`
&gt; 7. Run full playbook
&gt; 8. Remove `todo/dotfiles/` after verification
&gt; 
&gt; ## Notes
&gt; 
&gt; - Some configs may depend on packages installed by other roles
&gt; - Consider adding tags for selective deployment
&gt; - The `skogai/` directory may warrant its own role if complex&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#12

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/13

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/13.patch
https://github.com/SkogAI/setup/pull/13.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/13
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/13@github.com&gt;
