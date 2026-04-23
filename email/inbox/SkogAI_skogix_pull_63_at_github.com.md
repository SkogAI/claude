MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 22 Nov 2025 18:01:35 -0800
Subject: [SkogAI/skogix] [WIP] Add dotfiles configuration repository with symlinks (PR #63)
Message-ID: <SkogAI/skogix/pull/63@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69226affd96e9_b81100720721"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;dotfiles: Dotfiles configuration repository&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; Personal dotfiles repository using direct symlinks (ansible.builtin.file state: link).
&gt; 
&gt; ## Location
&gt; `todo/dotfiles/` (separate git repo)
&gt; 
&gt; ## Contents
&gt; - zshrc, zshenv - Shell configuration
&gt; - gitconfig - Git configuration  
&gt; - nvmrc, rcrc - Tool configurations
&gt; - config/ - Application configs (27+ apps)
&gt; - skogai/, cloudflared/ - Project-specific configs
&gt; 
&gt; ## Approach: Direct Symlinks (like zsh-project)
&gt; 
&gt; Following system-setup pattern in `roles/03-dotfiles/tasks/main.yml`:
&gt; 
&gt; ```yaml
&gt; - name: Symlink dotfiles
&gt;   ansible.builtin.file:
&gt;     src: &quot;{{ role_path }}/files/{{ item }}&quot;
&gt;     dest: &quot;/home/{{ user.name }}/{{ item }}&quot;
&gt;     state: link
&gt;     force: true
&gt;     owner: &quot;{{ user.name }}&quot;
&gt;     group: &quot;{{ user.name }}&quot;
&gt;   loop:
&gt;     - .zshrc
&gt;     - .zshenv
&gt;     - .gitconfig
&gt;     - .nvmrc
&gt;     # etc
&gt; ```
&gt; 
&gt; ### Benefits
&gt; - Source of truth in repo, symlinked to home
&gt; - Easy to see what&#39;s managed (all in files/)
&gt; - Ansible handles creation/updates
&gt; - Same pattern as zsh modular configs
&gt; 
&gt; ### Migration Path
&gt; 1. Move dotfiles from todo/dotfiles/ to system-setup/roles/03-dotfiles/files/
&gt; 2. Add symlink tasks for each file/directory
&gt; 3. Keep rcrc for reference but not primary tool
&gt; 
&gt; ## Status
&gt; - Current: Uses rcm for symlink management
&gt; - Target: Direct symlinks via ansible like zsh configs&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#38

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/63

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/63.patch
https://github.com/SkogAI/skogix/pull/63.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/63
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/63@github.com&gt;
