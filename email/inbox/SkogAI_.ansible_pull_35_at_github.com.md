MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.ansible" <.ansible@noreply.github.com>
Date: Sun, 28 Sep 2025 19:51:30 -0700
Subject: [SkogAI/.ansible] [WIP] step 2 (PR #35)
Message-ID: <SkogAI/.ansible/pull/35@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d9f43261202_ea4a10c8681bc"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ## Migration Phase - Role &amp; Variable Organization
&gt; 
&gt; ### Objective
&gt; Clean up role organization with placeholders for systematic execution flow.
&gt; 
&gt; ### Current Structure
&gt; - Numbered roles (01-07) for critical system tasks
&gt; - Named roles (dotfiles, git, ssh, etc.) for application configs
&gt; - Duplicate packages role
&gt; 
&gt; ### Tasks
&gt; 
&gt; #### 1. Role Structure Cleanup
&gt; - [x] Move duplicate packages role to backup
&gt; - [ ] Rename 03_gui to 03_display_server
&gt; - [ ] Create placeholder structure for missing numbered roles:
&gt;   ```
&gt;   roles/
&gt;   ├── 01_host_info       [PRESERVE]
&gt;   ├── 02_basics         [PRESERVE]
&gt;   ├── 03_display_server [Renamed from gui]
&gt;   ├── 04_desktop        [PRESERVE]
&gt;   ├── 05_packages       [Merge from backup]
&gt;   ├── 06_microcode      [Placeholder]
&gt;   ├── 07_users          [PRESERVE]
&gt;   ├── 08_hardware       [Placeholder]
&gt;   ├── 09_bluetooth      [Placeholder]
&gt;   └── 10_laptop        [Placeholder]
&gt;   ```
&gt; 
&gt; #### 2. Named Role Organization
&gt; Keep application-specific roles:
&gt; - dotfiles
&gt; - git  
&gt; - ssh
&gt; - system
&gt; - tmux
&gt; 
&gt; #### 3. Variable Consolidation 
&gt; - [ ] Review group_vars vs host_vars
&gt; - [ ] Move host-specific to host_vars/archlinux.yml
&gt; - [ ] Keep defaults in group_vars/all/
&gt; 
&gt; ### Placeholder Role Template
&gt; Each placeholder should have minimal structure:
&gt; ```yaml
&gt; # main.yml
&gt; ---
&gt; # Placeholder for future implementation
&gt; - name: &quot;Placeholder task for role documentation&quot;
&gt;   debug:
&gt;     msg: &quot;Role: {{ role_name }} - To be implemented&quot;
&gt; ```
&gt; 
&gt; ### Success Criteria
&gt; - ✓ Clean numbered role sequence (01-10)
&gt; - ✓ Application roles properly organized
&gt; - ✓ No duplicate roles
&gt; - ✓ Variables properly segregated
&gt; - ✓ All roles have basic structure
&gt; 
&gt; **Estimated Time:** 2-3 hours

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;step 2&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Migration Phase - Role &amp; Variable Organization
&gt; 
&gt; ### Objective
&gt; Clean up role organization with placeholders for systematic execution flow.
&gt; 
&gt; ### Current Structure
&gt; - Numbered roles (01-07) for critical system tasks
&gt; - Named roles (dotfiles, git, ssh, etc.) for application configs
&gt; - Duplicate packages role
&gt; 
&gt; ### Tasks
&gt; 
&gt; #### 1. Role Structure Cleanup
&gt; - [x] Move duplicate packages role to backup
&gt; - [ ] Rename 03_gui to 03_display_server
&gt; - [ ] Create placeholder structure for missing numbered roles:
&gt;   ```
&gt;   roles/
&gt;   ├── 01_host_info       [PRESERVE]
&gt;   ├── 02_basics         [PRESERVE]
&gt;   ├── 03_display_server [Renamed from gui]
&gt;   ├── 04_desktop        [PRESERVE]
&gt;   ├── 05_packages       [Merge from backup]
&gt;   ├── 06_microcode      [Placeholder]
&gt;   ├── 07_users          [PRESERVE]
&gt;   ├── 08_hardware       [Placeholder]
&gt;   ├── 09_bluetooth      [Placeholder]
&gt;   └── 10_laptop        [Placeholder]
&gt;   ```
&gt; 
&gt; #### 2. Named Role Organization
&gt; Keep application-specific roles:
&gt; - dotfiles
&gt; - git  
&gt; - ssh
&gt; - system
&gt; - tmux
&gt; 
&gt; #### 3. Variable Consolidation 
&gt; - [ ] Review group_vars vs host_vars
&gt; - [ ] Move host-specific to host_vars/archlinux.yml
&gt; - [ ] Keep defaults in group_vars/all/
&gt; 
&gt; ### Placeholder Role Template
&gt; Each placeholder should have minimal structure:
&gt; ```yaml
&gt; # main.yml
&gt; ---
&gt; # Placeholder for future implementation
&gt; - name: &quot;Placeholder task for role documentation&quot;
&gt;   debug:
&gt;     msg: &quot;Role: {{ role_name }} - To be implemented&quot;
&gt; ```
&gt; 
&gt; ### Success Criteria
&gt; - ✓ Clean numbered role sequence (01-10)
&gt; - ✓ Application roles properly organized
&gt; - ✓ No duplicate roles
&gt; - ✓ Variables properly segregated
&gt; - ✓ All roles have basic structure
&gt; 
&gt; **Estimated Time:** 2-3 hours&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;
Fixes SkogAI/.ansible#34

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/.ansible/pull/35

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/.ansible/pull/35.patch
https://github.com/SkogAI/.ansible/pull/35.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.ansible/pull/35
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/.ansible/pull/35@github.com&gt;
