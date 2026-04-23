MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 23 Nov 2025 05:44:26 -0800
Subject: [SkogAI/setup] [WIP] Migrate git functions from bash to zsh (PR #26)
Message-ID: <SkogAI/setup/pull/26@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69230fba8ce40_c7110024487b"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Migrate git functions from bash to zsh&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; Migrate useful git workflow functions from `TODO/` bash scripts to zsh modules.
&gt; 
&gt; ## Source
&gt; - `roles/bash/files/bash/git_functions.sh` - Advanced git workflows
&gt; - `roles/bash/files/bash/git_aliases.sh` - Git shortcuts
&gt; - `roles/bash/files/bash/git_completions.sh` - Tab completion
&gt; 
&gt; ## Target
&gt; - `roles/03-dotfiles/files/zsh/git-functions.zsh`
&gt; 
&gt; ## Tasks
&gt; - [ ] Review git_functions.sh for useful functions
&gt; - [ ] Convert bash syntax to zsh
&gt; - [ ] Merge aliases into existing zsh aliases
&gt; - [ ] Add to zsh module loading order
&gt; - [ ] Test with `zsh -n` for syntax errors
&gt; - [ ] Document any new functions
&gt; 
&gt; ## Notes
&gt; - May conflict with existing git aliases - review for duplicates
&gt; - Completions likely handled by zsh git plugin already
&gt; 
&gt; ## Priority
&gt; Medium - nice productivity enhancement
&gt; 
&gt; ---
&gt; 🤖 Generated with [Claude Code](https://claude.com/claude-code)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#16

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/26

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/26.patch
https://github.com/SkogAI/setup/pull/26.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/26
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/26@github.com&gt;
