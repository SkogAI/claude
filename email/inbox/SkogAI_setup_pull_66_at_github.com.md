MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 10:08:10 -0800
Subject: [SkogAI/setup] [WIP] Add .local override pattern to dotfile templates (PR #66)
Message-ID: <SkogAI/setup/pull/66@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b368a570cd_cb1100106551d"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Add .local override pattern to all dotfile templates&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Implement consistent `.local` override mechanism across all dotfile templates to allow user-specific customization without modifying ansible-managed files.
&gt; 
&gt; ## Context
&gt; 
&gt; The `dotfiles-templates/` pattern uses `.local` files for user overrides:
&gt; - `.bashrc` → `.bashrc.local`
&gt; - `.zshrc` → `.zshrc.local`
&gt; - `.vimrc` → `.vimrc.local`
&gt; - `.tmux.conf` → `.tmux.conf.local`
&gt; - `.gitconfig` → `.gitconfig.local`
&gt; - `.profile` → `.profile.local`
&gt; 
&gt; **Benefits:**
&gt; - Users can customize without breaking ansible deployment
&gt; - Ansible can safely overwrite managed files on updates
&gt; - Local changes persist across ansible runs
&gt; - Clear separation between managed vs user config
&gt; 
&gt; ## Current State
&gt; 
&gt; - ❌ `.zshrc.j2` doesn&#39;t load `.zshrc.local`
&gt; - ❌ `.gitconfig.j2` doesn&#39;t include `.gitconfig.local`
&gt; - ❌ No `.local` pattern documented for users
&gt; - ⚠️ Users may edit ansible-managed files directly (changes lost on next run)
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; ### 1. Update .zshrc template
&gt; 
&gt; File: `roles/03-dotfiles/templates/.zshrc.j2`
&gt; 
&gt; Add at end:
&gt; ```bash
&gt; # Load local zsh configuration if it exists
&gt; [ -f ~/.zshrc.local ] &amp;&amp; source ~/.zshrc.local
&gt; ```
&gt; 
&gt; ### 2. Update .gitconfig template
&gt; 
&gt; File: `roles/03-dotfiles/templates/.gitconfig.j2`
&gt; 
&gt; Add at end:
&gt; ```gitconfig
&gt; # Include local gitconfig for user-specific overrides
&gt; [include]
&gt;   path = ~/.gitconfig.local
&gt; ```
&gt; 
&gt; ### 3. Document pattern in role README
&gt; 
&gt; File: `roles/03-dotfiles/README.md`
&gt; 
&gt; Add section:
&gt; ```markdown
&gt; ## User Customization with .local Files
&gt; 
&gt; All dotfile templates support `.local` override files:
&gt; 
&gt; - `~/.zshrc.local` - Personal zsh aliases, functions, settings
&gt; - `~/.gitconfig.local` - Git user info, additional aliases
&gt; - `~/.inputrc.local` - Custom readline keybindings
&gt; - `~/.dircolors.local` - Custom color schemes
&gt; 
&gt; **Example - Add personal aliases:**
&gt; ```bash
&gt; echo &quot;alias myproject=&#39;cd ~/projects/myapp&#39;&quot; &gt;&gt; ~/.zshrc.local
&gt; ```
&gt; 
&gt; These files are:
&gt; - ✅ Never touched by ansible
&gt; - ✅ Persist across ansible runs
&gt; - ✅ Loaded after main config (can override defaults)
&gt; - ✅ Optional (missing files are ignored)
&gt; ```
&gt; 
&gt; ### 4. Create example .local files
&gt; 
&gt; Add examples to `roles/03-dotfiles/files/examples/`:
&gt; - `zshrc.local.example` - Common user customizations
&gt; - `gitconfig.local.example` - User/email configuration
&gt; 
&gt; ### 5. Test override mechanism
&gt; 
&gt; - [ ] Deploy with `./run.sh`
&gt; - [ ] Create `~/.zshrc.local` with test alias
&gt; - [ ] Verify alias works after sourcing
&gt; - [ ] Re-run ansible, verify `.local` file untouched
&gt; - [ ] Test gitconfig include with custom settings
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; - `.local` files should NEVER be managed by ansible (no tasks for them)
&gt; - Document in role README and potentially in deployed comment blocks
&gt; - Consider adding template comments showing `.local` override pattern
&gt; - May want to create empty `.local` files on first deployment with helpful comments
&gt; 
&gt; ## Priority
&gt; 
&gt; **High** - Critical for allowing user customization without breaking ansible management
&gt; 
&gt; ## References
&gt; 
&gt; - Source pattern: `dotfiles-templates/README.md` lines 95-109
&gt; - Target templates: `roles/03-dotfiles/templates/`
&gt; - Related: Part of dotfiles-templates integration initiative&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#55

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/66

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/66.patch
https://github.com/SkogAI/setup/pull/66.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/66
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/66@github.com&gt;
