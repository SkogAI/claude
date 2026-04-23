MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:28:41 -0800
Subject: [SkogAI/setup] [WIP] Create .bashrc template as alternative to bash role (PR #80)
Message-ID: <SkogAI/setup/pull/80@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b65895305e_b311001421459"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Create .bashrc template as alternative to modular bash role&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Create simple `.bashrc` template from `dotfiles-templates/` as a lightweight alternative to the complex modular bash role for users who prefer bash over zsh.
&gt; 
&gt; ## Context
&gt; 
&gt; **Current bash role complexity:**
&gt; - 15 separate function/alias files in `roles/bash/files/bash/`
&gt; - Modular structure: `git_functions.sh`, `pkg_functions.sh`, `neovim_aliases.sh`, etc.
&gt; - Complex deployment with oh-my-bash integration
&gt; - 200+ lines across multiple files
&gt; 
&gt; **dotfiles-templates/.bashrc simplicity:**
&gt; - Single 50-line file with sensible defaults
&gt; - History settings, color support, basic aliases
&gt; - Programmable completion
&gt; - Safety aliases (rm -i, cp -i, mv -i)
&gt; - `.bashrc.local` override mechanism
&gt; 
&gt; **Trade-off:**
&gt; - Modular bash role: Feature-rich, complex, harder to maintain
&gt; - Simple bashrc template: Minimal, easy to understand, quick to deploy
&gt; 
&gt; ## Current State
&gt; 
&gt; - ✅ Source template exists: `dotfiles-templates/.bashrc`
&gt; - ✅ Complex bash role exists: `roles/bash/` (15 files, 200+ lines)
&gt; - ❌ No simple .bashrc template option
&gt; - ⚠️ System-setup is zsh-focused, bash is secondary
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; ### Option 1: Add template alongside bash role
&gt; 
&gt; File: `roles/03-dotfiles/templates/.bashrc.j2`
&gt; 
&gt; Base on `dotfiles-templates/.bashrc` with minimal templating:
&gt; ```bash
&gt; # ~/.bashrc - Bash shell configuration
&gt; 
&gt; # If not running interactively, don&#39;t do anything
&gt; [[ $- != *i* ]] &amp;&amp; return
&gt; 
&gt; # History configuration
&gt; HISTSIZE=10000
&gt; HISTFILESIZE=20000
&gt; HISTCONTROL=ignoreboth:erasedups
&gt; shopt -s histappend
&gt; 
&gt; # Shell options
&gt; shopt -s checkwinsize
&gt; shopt -s globstar 2&gt;/dev/null
&gt; shopt -s cdspell 2&gt;/dev/null
&gt; 
&gt; # Enable color support
&gt; if [ -x /usr/bin/dircolors ]; then
&gt;     test -r ~/.dircolors &amp;&amp; eval &quot;$(dircolors -b ~/.dircolors)&quot; || eval &quot;$(dircolors -b)&quot;
&gt;     alias ls=&#39;ls --color=auto&#39;
&gt;     alias grep=&#39;grep --color=auto&#39;
&gt; fi
&gt; 
&gt; # Prompt (could template this with user color preference)
&gt; PS1=&#39;\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ &#39;
&gt; 
&gt; # Common aliases
&gt; alias ll=&#39;ls -alF&#39;
&gt; alias la=&#39;ls -A&#39;
&gt; alias ..=&#39;cd ..&#39;
&gt; alias ...=&#39;cd ../..&#39;
&gt; 
&gt; # Safety aliases
&gt; alias rm=&#39;rm -i&#39;
&gt; alias cp=&#39;cp -i&#39;
&gt; alias mv=&#39;mv -i&#39;
&gt; 
&gt; # Enable programmable completion
&gt; if ! shopt -oq posix; then
&gt;   if [ -f /usr/share/bash-completion/bash_completion ]; then
&gt;     . /usr/share/bash-completion/bash_completion
&gt;   elif [ -f /etc/bash_completion ]; then
&gt;     . /etc/bash_completion
&gt;   fi
&gt; fi
&gt; 
&gt; # Load local configuration if it exists
&gt; [ -f ~/.bashrc.local ] &amp;&amp; . ~/.bashrc.local
&gt; ```
&gt; 
&gt; Add to `templated_dotfiles` in tasks/main.yml:
&gt; ```yaml
&gt; vars:
&gt;   templated_dotfiles:
&gt;     - .zshrc
&gt;     - .gitconfig
&gt;     - .nvmrc
&gt;     - .profile
&gt;     - .bashrc  # ADD THIS
&gt; ```
&gt; 
&gt; ### Option 2: Replace bash role entirely
&gt; 
&gt; - Deprecate `roles/bash/` complex modular structure
&gt; - Use simple `.bashrc` template from dotfiles-templates
&gt; - Update `skogai.yml` to remove bash role
&gt; - Document migration path for bash role users
&gt; 
&gt; ### Decision Required
&gt; 
&gt; Which approach:
&gt; 1. **Both** - Keep complex bash role AND add simple template (users choose)
&gt; 2. **Replace** - Deprecate bash role, use simple template only
&gt; 3. **Enhance** - Keep bash role, but refactor using dotfiles-templates as base
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; **Recommendation: Option 1 (Both)**
&gt; - Add simple `.bashrc.j2` template to 03-dotfiles
&gt; - Keep existing bash role for users who need it
&gt; - Default to simple template for new users
&gt; - Document both options in README
&gt; 
&gt; **If replacing bash role:**
&gt; - Ensure no critical functionality lost
&gt; - Migrate useful functions to `.bashrc.local` examples
&gt; - Communicate breaking change to bash role users
&gt; 
&gt; ## Priority
&gt; 
&gt; **Low** - System-setup is zsh-focused, bash is secondary shell
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `/home/skogix/skogix/dotfiles-templates/.bashrc`
&gt; - Current bash role: `/home/skogix/skogix/system-setup/roles/bash/`
&gt; - Target: `system-setup/roles/03-dotfiles/templates/.bashrc.j2`
&gt; - Related: Part of dotfiles-templates integration initiative
&gt; 
&gt; ## Discussion Needed
&gt; 
&gt; Should we:
&gt; - Keep bash role complexity?
&gt; - Simplify to dotfiles-templates approach?
&gt; - Offer both options?&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#57

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/80

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/80.patch
https://github.com/SkogAI/setup/pull/80.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/80
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/80@github.com&gt;
