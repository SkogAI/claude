MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/dotfiles <dotfiles@noreply.github.com>
Date: Wed, 25 Feb 2026 21:48:20 -0800
Subject: [SkogAI/dotfiles] [WIP] Remove extracted-todo/ansible-roles directory (PR #11)
Message-ID: <SkogAI/dotfiles/pull/11@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_699fdea4bd86e_cb1110714d7"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Remove extracted-todo/ansible-roles directory&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; `dot_config/zsh/extracted-todo/ansible-roles/` contains a full Ansible role tree that was apparently extracted/archived but never cleaned up:
&gt; 
&gt; ```
&gt; extracted-todo/ansible-roles/roles/
&gt;   01_host_info/
&gt;   02_basics/
&gt;   04_desktop/
&gt;   05_packages/
&gt;   07_users/
&gt;   dotfiles/
&gt;   git/
&gt;   packages/
&gt;   ssh/
&gt;   system/
&gt;   tmux/
&gt; ```
&gt; 
&gt; These are Ansible task files, handlers, and defaults — not dotfile config. They have no place in a standalone chezmoi repo.
&gt; 
&gt; ## Changes needed
&gt; - Delete the entire `dot_config/zsh/extracted-todo/ansible-roles/` directory tree
&gt; 
&gt; ## Acceptance criteria
&gt; - No ansible role YAML files remain in the repo
&gt; - `extracted-todo/` only contains items relevant to chezmoi/zsh&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/dotfiles#7

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/dotfiles/pull/11

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/dotfiles/pull/11.patch
https://github.com/SkogAI/dotfiles/pull/11.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/dotfiles/pull/11
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/dotfiles/pull/11@github.com&gt;
