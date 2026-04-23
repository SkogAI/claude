MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Thu, 02 Oct 2025 05:07:44 -0700
Subject: [SkogAI/skogansible] [WIP] Add ansible-lint configuration file (PR #16)
Message-ID: <SkogAI/skogansible/pull/16@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68de6b10e001a_3ef010d848436"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ### Overview
&gt; Add a `.ansible-lint` configuration file to enforce Ansible best practices and coding standards across the repository.
&gt; 
&gt; ### Tasks
&gt; - [ ] Create `.ansible-lint` configuration file in repository root
&gt; - [ ] Configure appropriate rule exclusions for this repository&#39;s structure
&gt; - [ ] Set skip list for rules that don&#39;t apply (e.g., role naming conventions)
&gt; - [ ] Configure warn list for rules that should warn but not fail
&gt; - [ ] Test locally with `ansible-lint` command
&gt; 
&gt; ### Acceptance Criteria
&gt; - `.ansible-lint` file exists in repository root
&gt; - Configuration is tuned for this Ansible configuration directory structure
&gt; - Running `ansible-lint` produces actionable, relevant warnings/errors
&gt; - No false positives for legitimate patterns in this repo
&gt; 
&gt; ### Example Configuration
&gt; ```yaml
&gt; ---
&gt; skip_list:
&gt;   - role-name  # Our roles use numbered prefixes (01_host_info, etc.)
&gt;   - yaml[line-length]  # Allow longer lines for readability
&gt;   
&gt; warn_list:
&gt;   - experimental  # Warn about experimental features
&gt;   - no-changed-when  # Warn when tasks don&#39;t set changed_when
&gt; 
&gt; exclude_paths:
&gt;   - .cache/
&gt;   - .collections/
&gt;   - logs/
&gt; ```
&gt; 
&gt; ### References
&gt; - [ansible-lint documentation](https://ansible-lint.readthedocs.io/)
&gt; - Previous discussion in #4

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Add ansible-lint configuration file&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;### Overview
&gt; Add a `.ansible-lint` configuration file to enforce Ansible best practices and coding standards across the repository.
&gt; 
&gt; ### Tasks
&gt; - [ ] Create `.ansible-lint` configuration file in repository root
&gt; - [ ] Configure appropriate rule exclusions for this repository&#39;s structure
&gt; - [ ] Set skip list for rules that don&#39;t apply (e.g., role naming conventions)
&gt; - [ ] Configure warn list for rules that should warn but not fail
&gt; - [ ] Test locally with `ansible-lint` command
&gt; 
&gt; ### Acceptance Criteria
&gt; - `.ansible-lint` file exists in repository root
&gt; - Configuration is tuned for this Ansible configuration directory structure
&gt; - Running `ansible-lint` produces actionable, relevant warnings/errors
&gt; - No false positives for legitimate patterns in this repo
&gt; 
&gt; ### Example Configuration
&gt; ```yaml
&gt; ---
&gt; skip_list:
&gt;   - role-name  # Our roles use numbered prefixes (01_host_info, etc.)
&gt;   - yaml[line-length]  # Allow longer lines for readability
&gt;   
&gt; warn_list:
&gt;   - experimental  # Warn about experimental features
&gt;   - no-changed-when  # Warn when tasks don&#39;t set changed_when
&gt; 
&gt; exclude_paths:
&gt;   - .cache/
&gt;   - .collections/
&gt;   - logs/
&gt; ```
&gt; 
&gt; ### References
&gt; - [ansible-lint documentation](https://ansible-lint.readthedocs.io/)
&gt; - Previous discussion in SkogAI/skogansible#4&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;
Fixes SkogAI/skogansible#7

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skogansible/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogansible/pull/16

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogansible/pull/16.patch
https://github.com/SkogAI/skogansible/pull/16.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/16
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogansible/pull/16@github.com&gt;
