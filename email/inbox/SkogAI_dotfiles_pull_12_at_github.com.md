MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/dotfiles <dotfiles@noreply.github.com>
Date: Wed, 25 Feb 2026 21:48:21 -0800
Subject: [SkogAI/dotfiles] [WIP] Remove skogansible references from config files (PR #12)
Message-ID: <SkogAI/dotfiles/pull/12@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_699fdea59fb42_ff1110845a5"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Remove skogansible references from worktrunk and gita configs&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; Tool config files still track the `skogansible` repository:
&gt; 
&gt; ### `dot_config/worktrunk/config.toml` (line 56-63)
&gt; ```toml
&gt; [projects.&quot;github.com/SkogAI/skogansible&quot;]
&gt;     &quot;ANSIBLE_STDOUT_CALLBACK=dense ANSIBLE_DISPLAY_OK_HOSTS=no ANSIBLE_DISPLAY_SKIPPED_HOSTS=no ./run.sh --check&quot;,
&gt; ```
&gt; Remove the entire `skogansible` project block.
&gt; 
&gt; ### `dot_config/gita/repos.csv` (line 31)
&gt; ```
&gt; /home/skogix/dev/repos/skogansible,skogansible,,
&gt; ```
&gt; Remove this line.
&gt; 
&gt; ### `dot_config/gita/groups.csv`
&gt; `skogansible` appears in the repos group listing.
&gt; Remove `skogansible` from the group entry.
&gt; 
&gt; ## Acceptance criteria
&gt; - No `skogansible` entries in worktrunk, gita repos, or gita groups&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/dotfiles#8

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/dotfiles/pull/12

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/dotfiles/pull/12.patch
https://github.com/SkogAI/dotfiles/pull/12.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/dotfiles/pull/12
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/dotfiles/pull/12@github.com&gt;
