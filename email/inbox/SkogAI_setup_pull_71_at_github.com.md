MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 10:08:12 -0800
Subject: [SkogAI/setup] [WIP] Add .inputrc template for readline configuration (PR #71)
Message-ID: <SkogAI/setup/pull/71@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b368cce04_b81100100368e"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Add .inputrc template for readline configuration&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Deploy `.inputrc` template from `dotfiles-templates/` to configure readline behavior for all readline-enabled tools (bash, python REPL, mysql, etc.).
&gt; 
&gt; ## Context
&gt; 
&gt; The `dotfiles-templates/.inputrc` provides:
&gt; - Case-insensitive tab completion
&gt; - Colored completion output
&gt; - Enhanced keyboard navigation (Ctrl+arrows for word movement)
&gt; - UTF-8 support
&gt; - Better history search with arrow keys
&gt; 
&gt; This benefits any tool using GNU readline library, not just bash.
&gt; 
&gt; ## Current State
&gt; 
&gt; - ✅ Source template exists: `dotfiles-templates/.inputrc`
&gt; - ❌ Not deployed by system-setup ansible roles
&gt; - ❌ Users rely on system defaults (less optimal)
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; - [ ] Copy `dotfiles-templates/.inputrc` to `system-setup/roles/03-dotfiles/files/.inputrc`
&gt; - [ ] Add deployment task in `roles/03-dotfiles/tasks/main.yml`:
&gt;   ```yaml
&gt;   - name: Symlink inputrc for users
&gt;     ansible.builtin.file:
&gt;       src: &quot;{{ role_path }}/files/.inputrc&quot;
&gt;       dest: &quot;/home/{{ item.name }}/.inputrc&quot;
&gt;       state: link
&gt;       force: true
&gt;       owner: &quot;{{ item.name }}&quot;
&gt;       group: &quot;{{ item.name }}&quot;
&gt;     loop: &quot;{{ users }}&quot;
&gt;     become: true
&gt;   ```
&gt; - [ ] Test deployment with `./run.sh`
&gt; - [ ] Verify readline behavior improves in bash/python REPL
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; - File should be symlinked (not templated) as it requires no user-specific customization
&gt; - Consider adding `.inputrc.local` override mechanism for user customization
&gt; - Works for both bash and zsh users
&gt; 
&gt; ## Priority
&gt; 
&gt; **High** - Universal improvement for all users with minimal effort
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `/home/skogix/skogix/dotfiles-templates/.inputrc`
&gt; - Target role: `system-setup/roles/03-dotfiles/`
&gt; - Related: Part of dotfiles-templates integration initiative&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#52

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/71

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/71.patch
https://github.com/SkogAI/setup/pull/71.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/71
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/71@github.com&gt;
