MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 10:08:11 -0800
Subject: [SkogAI/setup] [WIP] Add .dircolors template for custom ls colors (PR #74)
Message-ID: <SkogAI/setup/pull/74@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b368bdf605_d81100118982a"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Add .dircolors template for custom ls colors&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Deploy `.dircolors` template from `dotfiles-templates/` to provide custom color schemes for `ls` output based on file types.
&gt; 
&gt; ## Context
&gt; 
&gt; The `dotfiles-templates/.dircolors` provides:
&gt; - Custom color codes for different file types
&gt; - Archives (tar, zip, gz) in red
&gt; - Images (png, jpg, gif) in magenta
&gt; - Audio files (mp3, wav) in cyan
&gt; - Documents (pdf, doc) in green
&gt; - Code files (py, js, sh) in yellow
&gt; - Better visual distinction in terminal file listings
&gt; 
&gt; ## Current State
&gt; 
&gt; - ✅ Source template exists: `dotfiles-templates/.dircolors` (also `.dir_colors`)
&gt; - ❌ Not deployed by system-setup ansible roles
&gt; - ❌ Users rely on system defaults
&gt; - ⚠️ zsh 50-aliases.zsh uses system dircolors: `eval &quot;$(dircolors -b)&quot;`
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; - [ ] Choose canonical name: `.dircolors` (more common) or `.dir_colors` (legacy)
&gt; - [ ] Copy chosen file to `system-setup/roles/03-dotfiles/files/.dircolors`
&gt; - [ ] Add deployment task in `roles/03-dotfiles/tasks/main.yml`:
&gt;   ```yaml
&gt;   - name: Symlink dircolors for users
&gt;     ansible.builtin.file:
&gt;       src: &quot;{{ role_path }}/files/.dircolors&quot;
&gt;       dest: &quot;/home/{{ item.name }}/.dircolors&quot;
&gt;       state: link
&gt;       force: true
&gt;       owner: &quot;{{ item.name }}&quot;
&gt;       group: &quot;{{ item.name }}&quot;
&gt;     loop: &quot;{{ users }}&quot;
&gt;     become: true
&gt;   ```
&gt; - [ ] Update zsh `50-aliases.zsh.j2` to reference custom dircolors:
&gt;   ```bash
&gt;   # Current: eval &quot;$(dircolors -b)&quot;
&gt;   # New: test -r ~/.dircolors &amp;&amp; eval &quot;$(dircolors -b ~/.dircolors)&quot; || eval &quot;$(dircolors -b)&quot;
&gt;   ```
&gt; - [ ] Test deployment with `./run.sh`
&gt; - [ ] Verify colorized ls output in both bash and zsh
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; - File should be symlinked (not templated) unless users need different color schemes
&gt; - Add `.dircolors.local` override mechanism for user customization
&gt; - Works with GNU ls (Arch default) - BSD ls uses different format
&gt; - Both bash and zsh need to source dircolors in their rc files
&gt; 
&gt; ## Priority
&gt; 
&gt; **Medium** - Nice UX improvement, not critical functionality
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `/home/skogix/skogix/dotfiles-templates/.dircolors`
&gt; - Target role: `system-setup/roles/03-dotfiles/`
&gt; - Current usage: `roles/03-dotfiles/templates/.config/zsh/50-aliases.zsh.j2`
&gt; - Related: Part of dotfiles-templates integration initiative&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#54

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/74

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/74.patch
https://github.com/SkogAI/setup/pull/74.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/74
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/74@github.com&gt;
