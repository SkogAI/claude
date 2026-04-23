MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:28:43 -0800
Subject: [SkogAI/setup] [WIP] Create .profile template for login shell environment (PR #81)
Message-ID: <SkogAI/setup/pull/81@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b658b3caa6_f3110015940a2"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Create .profile template for login shell environment&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Create `.profile` template from `dotfiles-templates/` for login shell environment setup, providing XDG base directories, PATH configuration, and environment variables for bash and other POSIX shells.
&gt; 
&gt; ## Context
&gt; 
&gt; The `dotfiles-templates/.profile` provides:
&gt; - PATH setup for `~/bin` and `~/.local/bin`
&gt; - XDG Base Directory specification variables
&gt; - Default EDITOR, VISUAL, PAGER settings
&gt; - Colored man pages via LESS_TERMCAP
&gt; - Language/locale settings
&gt; - Loads `.bashrc` for interactive bash shells
&gt; - `.profile.local` override mechanism
&gt; 
&gt; **Why needed:**
&gt; - zsh users have `00-env.zsh` and `05-paths.zsh` (well covered)
&gt; - bash users and login shells need equivalent environment setup
&gt; - POSIX shell compatibility for non-bash/zsh scenarios
&gt; - Some display managers/session managers only source `.profile`
&gt; 
&gt; ## Current State
&gt; 
&gt; - ✅ Source template exists: `dotfiles-templates/.profile`
&gt; - ✅ zsh equivalent exists: `roles/03-dotfiles/templates/.config/zsh/00-env.zsh.j2`
&gt; - ❌ No `.profile` template in system-setup
&gt; - ⚠️ Potential duplication with zsh env setup
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; ### 1. Create .profile template
&gt; 
&gt; File: `roles/03-dotfiles/templates/.profile.j2`
&gt; 
&gt; Base on `dotfiles-templates/.profile` with ansible variables:
&gt; ```bash
&gt; # ~/.profile - Shell profile for login shells
&gt; 
&gt; # Set PATH to include user&#39;s private bin directories
&gt; if [ -d &quot;$HOME/bin&quot; ] ; then
&gt;     PATH=&quot;$HOME/bin:$PATH&quot;
&gt; fi
&gt; 
&gt; if [ -d &quot;$HOME/.local/bin&quot; ] ; then
&gt;     PATH=&quot;$HOME/.local/bin:$PATH&quot;
&gt; fi
&gt; 
&gt; # Default editor (use templating for user preference)
&gt; export EDITOR={{ editor | default(&#39;vim&#39;) }}
&gt; export VISUAL={{ editor | default(&#39;vim&#39;) }}
&gt; 
&gt; # Default pager
&gt; export PAGER={{ pager | default(&#39;less&#39;) }}
&gt; 
&gt; # XDG Base Directory specification
&gt; export XDG_CONFIG_HOME=&quot;$HOME/.config&quot;
&gt; export XDG_CACHE_HOME=&quot;$HOME/.cache&quot;
&gt; export XDG_DATA_HOME=&quot;$HOME/.local/share&quot;
&gt; export XDG_STATE_HOME=&quot;$HOME/.local/state&quot;
&gt; 
&gt; # Colored man pages
&gt; export LESS_TERMCAP_mb=$&#39;\e[1;32m&#39;
&gt; export LESS_TERMCAP_md=$&#39;\e[1;34m&#39;
&gt; export LESS_TERMCAP_me=$&#39;\e[0m&#39;
&gt; export LESS_TERMCAP_so=$&#39;\e[01;44;33m&#39;
&gt; export LESS_TERMCAP_se=$&#39;\e[0m&#39;
&gt; export LESS_TERMCAP_us=$&#39;\e[1;32m&#39;
&gt; export LESS_TERMCAP_ue=$&#39;\e[0m&#39;
&gt; 
&gt; # Load .bashrc if bash is the shell
&gt; if [ -n &quot;$BASH_VERSION&quot; ]; then
&gt;     if [ -f &quot;$HOME/.bashrc&quot; ]; then
&gt;         . &quot;$HOME/.bashrc&quot;
&gt;     fi
&gt; fi
&gt; 
&gt; # Load local profile if it exists
&gt; [ -f &quot;$HOME/.profile.local&quot; ] &amp;&amp; . &quot;$HOME/.profile.local&quot;
&gt; ```
&gt; 
&gt; ### 2. Add deployment task
&gt; 
&gt; File: `roles/03-dotfiles/tasks/main.yml`
&gt; 
&gt; Add to `templated_dotfiles` list:
&gt; ```yaml
&gt; vars:
&gt;   templated_dotfiles:
&gt;     - .zshrc
&gt;     - .gitconfig
&gt;     - .nvmrc
&gt;     - .profile  # ADD THIS
&gt; ```
&gt; 
&gt; ### 3. Optional: Add user variables
&gt; 
&gt; File: `vars/user.yml`
&gt; 
&gt; ```yaml
&gt; users:
&gt;   - name: skogix
&gt;     editor: vim  # or nvim, nano, etc.
&gt;     pager: less  # or bat, most, etc.
&gt; ```
&gt; 
&gt; ### 4. Test deployment
&gt; 
&gt; - [ ] Deploy with `./run.sh`
&gt; - [ ] Verify `~/.profile` created with correct content
&gt; - [ ] Test login shell sources `.profile`
&gt; - [ ] Verify environment variables set correctly
&gt; - [ ] Test `.profile.local` override mechanism
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; **Deduplication concerns:**
&gt; - `.profile` sets XDG vars, EDITOR, PAGER
&gt; - `00-env.zsh.j2` also sets these for zsh users
&gt; - This is intentional - different shells, different entry points
&gt; - `.profile` = login shells (bash, sh, display managers)
&gt; - `00-env.zsh.j2` = zsh interactive shells
&gt; 
&gt; **When is .profile sourced:**
&gt; - Login shells (bash --login, su - user)
&gt; - Display managers (GDM, SDDM, LightDM)
&gt; - SSH connections (depends on config)
&gt; - NOT sourced by zsh by default (zsh uses `.zprofile`)
&gt; 
&gt; ## Priority
&gt; 
&gt; **Medium** - Important for bash users and login shell scenarios, but zsh users already covered
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `/home/skogix/skogix/dotfiles-templates/.profile`
&gt; - Target role: `system-setup/roles/03-dotfiles/`
&gt; - Similar: `roles/03-dotfiles/templates/.config/zsh/00-env.zsh.j2`
&gt; - Related: Part of dotfiles-templates integration initiative&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#56

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/81

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/81.patch
https://github.com/SkogAI/setup/pull/81.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/81
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/81@github.com&gt;
