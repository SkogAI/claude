MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 10 Jan 2026 18:48:29 -0800
Subject: [SkogAI/skogansible] [WIP] Move user management to dedicated role (PR #122)
Message-ID: <SkogAI/skogansible/pull/122@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69630f7d3dde4_c210d0119218c"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Move user management to dedicated role&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; 
&gt; User and group management is currently in the `packages` role, which is conceptually wrong. The packages role should only handle software installation.
&gt; 
&gt; ## Proposed Solution
&gt; 
&gt; Create a dedicated role (e.g., `users` or `security`) that handles:
&gt; 
&gt; - **User creation/management** - Ensure users defined in `vars/user.yml` are reflected on the system 
&gt; - **Group management** - Create groups (if needed) and set user group membership to reflect the vars
&gt; - **Privileges/Security** - User-related security configuration and future chown/chmod operations
&gt; 
&gt; ## Goal
&gt; 
&gt; User, groups and privileges set in a configuration file should be reflected on the system.
&gt; 
&gt; ## Current State
&gt; 
&gt; - User group management currently lives in `roles/packages/tasks/user_groups.yml`
&gt; - Only applies `groups_base` field from `vars/user.yml`
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; - [ ] New role created (e.g., `roles/users/`)
&gt; - [ ] All user and group management moved from packages role with the exception of &quot;aur_builder&quot; or specific changes related to package installation
&gt; - [ ] Role ensures users and groups settings are reflected on the system
&gt; - [ ] Foundation for future security tasks and configuration
&gt; - [ ] Documentation updated where needed
&gt; - [ ] Other tasks only configure what is absolute necessary when it comes to users and groups&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/skogansible#121

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogansible/pull/122

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogansible/pull/122.patch
https://github.com/SkogAI/skogansible/pull/122.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/122
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogansible/pull/122@github.com&gt;
