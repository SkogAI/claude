MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 10:08:11 -0800
Subject: [SkogAI/setup] [WIP] Add .editorconfig template for consistency across editors (PR #69)
Message-ID: <SkogAI/setup/pull/69@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b368b6f933_ed11001141390"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Add .editorconfig template for cross-editor consistency&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Deploy `.editorconfig` template from `dotfiles-templates/` to provide language-specific coding style rules that work across all editorconfig-aware editors.
&gt; 
&gt; ## Context
&gt; 
&gt; The `dotfiles-templates/.editorconfig` provides:
&gt; - UTF-8 encoding, LF line endings, trailing whitespace removal
&gt; - Language-specific indentation rules:
&gt;   - YAML/JSON/JS: 2 spaces
&gt;   - Python: 4 spaces (PEP 8)
&gt;   - Shell scripts: 2 spaces
&gt;   - Go/Makefiles: tabs (as required)
&gt; - Works automatically in vim, neovim, vscode, zed, emacs, sublime, intellij, etc.
&gt; 
&gt; ## Current State
&gt; 
&gt; - ✅ Source template exists: `dotfiles-templates/.editorconfig`
&gt; - ❌ Not deployed by system-setup ansible roles
&gt; - ❌ Users must configure editor-specific settings manually
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; - [ ] Copy `dotfiles-templates/.editorconfig` to `system-setup/roles/03-dotfiles/files/.editorconfig`
&gt; - [ ] Add deployment task in `roles/03-dotfiles/tasks/main.yml`:
&gt;   ```yaml
&gt;   - name: Symlink editorconfig for users
&gt;     ansible.builtin.file:
&gt;       src: &quot;{{ role_path }}/files/.editorconfig&quot;
&gt;       dest: &quot;/home/{{ item.name }}/.editorconfig&quot;
&gt;       state: link
&gt;       force: true
&gt;       owner: &quot;{{ item.name }}&quot;
&gt;       group: &quot;{{ item.name }}&quot;
&gt;     loop: &quot;{{ users }}&quot;
&gt;     become: true
&gt;   ```
&gt; - [ ] Test deployment with `./run.sh`
&gt; - [ ] Verify editorconfig is respected in vim/neovim/zed
&gt; 
&gt; ## Implementation Notes
&gt; 
&gt; - Deploy to `~/.editorconfig` (home directory) for global effect
&gt; - Users can override with project-specific `.editorconfig` files (editorconfig searches upward)
&gt; - File should be symlinked (not templated) unless user-specific rules needed
&gt; - Consider templating if different users need different default indent sizes
&gt; 
&gt; ## Priority
&gt; 
&gt; **High** - Cross-editor consistency with minimal configuration
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `/home/skogix/skogix/dotfiles-templates/.editorconfig`
&gt; - Target role: `system-setup/roles/03-dotfiles/`
&gt; - EditorConfig spec: https://editorconfig.org/
&gt; - Related: Part of dotfiles-templates integration initiative&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#53

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/69

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/69.patch
https://github.com/SkogAI/setup/pull/69.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/69
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/69@github.com&gt;
