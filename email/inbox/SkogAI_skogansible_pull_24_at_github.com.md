MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 02:42:32 -0700
Subject: [SkogAI/skogansible] [WIP] Configure ansible-lint with repository-specific rules (PR #24)
Message-ID: <SkogAI/skogansible/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df9a881c1d8_6ec110d8155697"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ### Overview
&gt; 
&gt; Create and configure ansible-lint configuration file to enforce best practices and catch common issues in Ansible code, with rules tailored to this repository&#39;s specific setup.
&gt; 
&gt; ### Tasks
&gt; 
&gt; - [ ] Create `.ansible-lint` configuration file
&gt; - [ ] Define skip rules for repository-specific patterns
&gt; - [ ] Configure exclude patterns for directories that shouldn&#39;t be linted
&gt; - [ ] Set up appropriate warning levels
&gt; - [ ] Test ansible-lint locally before committing
&gt; - [ ] Document any intentional rule skips
&gt; 
&gt; ### Configuration Details
&gt; 
&gt; **Create `.ansible-lint` with:**
&gt; 
&gt; ```yaml
&gt; ---
&gt; # Skip rules that don&#39;t apply to this repository
&gt; skip_list:
&gt;   - yaml[line-length]  # Long lines acceptable in some cases
&gt;   - name[casing]       # Allow flexible naming
&gt; 
&gt; # Exclude patterns
&gt; exclude_paths:
&gt;   - .cache/
&gt;   - .collections/
&gt;   - logs/
&gt;   - .github/
&gt; 
&gt; # Enable specific checks
&gt; enable_list:
&gt;   - args
&gt;   - empty-string-compare
&gt;   - no-log-password
&gt;   - no-same-owner
&gt; 
&gt; # Verbosity level
&gt; verbosity: 1
&gt; ```
&gt; 
&gt; ### Repository-Specific Considerations
&gt; 
&gt; Based on CLAUDE.md guidelines:
&gt; - **Vault usage**: Ensure no-log-password rules are enforced
&gt; - **AUR packages**: May need to skip some rules for `become_user` usage
&gt; - **Local-only execution**: Skip rules that assume multi-host inventories
&gt; - **Custom roles**: Ensure role naming matches our `01_`, `02_` prefix pattern
&gt; 
&gt; ### Testing
&gt; 
&gt; Before committing, run:
&gt; ```bash
&gt; ansible-lint playbooks/
&gt; ansible-lint roles/01_host_info/
&gt; ansible-lint roles/02_package_managers/
&gt; ```
&gt; 
&gt; Fix any issues or add justified skips to configuration.
&gt; 
&gt; ### References
&gt; 
&gt; - ansible-lint documentation: https://ansible-lint.readthedocs.io/
&gt; - Best practices from issue #4 discussion

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Configure ansible-lint with repository-specific rules&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;### Overview
&gt; 
&gt; Create and configure ansible-lint configuration file to enforce best practices and catch common issues in Ansible code, with rules tailored to this repository&#39;s specific setup.
&gt; 
&gt; ### Tasks
&gt; 
&gt; - [ ] Create `.ansible-lint` configuration file
&gt; - [ ] Define skip rules for repository-specific patterns
&gt; - [ ] Configure exclude patterns for directories that shouldn&#39;t be linted
&gt; - [ ] Set up appropriate warning levels
&gt; - [ ] Test ansible-lint locally before committing
&gt; - [ ] Document any intentional rule skips
&gt; 
&gt; ### Configuration Details
&gt; 
&gt; **Create `.ansible-lint` with:**
&gt; 
&gt; ```yaml
&gt; ---
&gt; # Skip rules that don&#39;t apply to this repository
&gt; skip_list:
&gt;   - yaml[line-length]  # Long lines acceptable in some cases
&gt;   - name[casing]       # Allow flexible naming
&gt; 
&gt; # Exclude patterns
&gt; exclude_paths:
&gt;   - .cache/
&gt;   - .collections/
&gt;   - logs/
&gt;   - .github/
&gt; 
&gt; # Enable specific checks
&gt; enable_list:
&gt;   - args
&gt;   - empty-string-compare
&gt;   - no-log-password
&gt;   - no-same-owner
&gt; 
&gt; # Verbosity level
&gt; verbosity: 1
&gt; ```
&gt; 
&gt; ### Repository-Specific Considerations
&gt; 
&gt; Based on CLAUDE.md guidelines:
&gt; - **Vault usage**: Ensure no-log-password rules are enforced
&gt; - **AUR packages**: May need to skip some rules for `become_user` usage
&gt; - **Local-only execution**: Skip rules that assume multi-host inventories
&gt; - **Custom roles**: Ensure role naming matches our `01_`, `02_` prefix pattern
&gt; 
&gt; ### Testing
&gt; 
&gt; Before committing, run:
&gt; ```bash
&gt; ansible-lint playbooks/
&gt; ansible-lint roles/01_host_info/
&gt; ansible-lint roles/02_package_managers/
&gt; ```
&gt; 
&gt; Fix any issues or add justified skips to configuration.
&gt; 
&gt; ### References
&gt; 
&gt; - ansible-lint documentation: https://ansible-lint.readthedocs.io/
&gt; - Best practices from issue SkogAI/skogansible#4 discussion&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;
Fixes SkogAI/skogansible#9

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 Share your feedback on Copilot coding agent for the chance to win a $200 gift card! Click [here](https://survey3.medallia.com/?EAHeSx-AP01bZqG0Ld9QLQ) to start the survey.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogansible/pull/24

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogansible/pull/24.patch
https://github.com/SkogAI/skogansible/pull/24.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/24
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogansible/pull/24@github.com&gt;
