MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 02:42:45 -0700
Subject: [SkogAI/skogansible] [WIP] Set up yamllint for YAML file validation (PR #25)
Message-ID: <SkogAI/skogansible/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df9a95ac2cf_b04d10d8139a0"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ### Overview
&gt; 
&gt; Configure yamllint to ensure consistent YAML formatting and catch syntax errors across all YAML files in the repository.
&gt; 
&gt; ### Tasks
&gt; 
&gt; - [ ] Create `.yamllint` configuration file
&gt; - [ ] Define rules for indentation, line length, and formatting
&gt; - [ ] Configure exclude patterns for generated/cache files
&gt; - [ ] Test yamllint locally on all YAML files
&gt; - [ ] Fix any existing YAML formatting issues
&gt; - [ ] Integrate into GitHub Actions workflow
&gt; 
&gt; ### Configuration Details
&gt; 
&gt; **Create `.yamllint` with:**
&gt; 
&gt; ```yaml
&gt; ---
&gt; extends: default
&gt; 
&gt; rules:
&gt;   line-length:
&gt;     max: 120
&gt;     level: warning
&gt;   indentation:
&gt;     spaces: 2
&gt;     indent-sequences: true
&gt;   comments:
&gt;     min-spaces-from-content: 1
&gt;   truthy:
&gt;     allowed-values: [&#39;true&#39;, &#39;false&#39;, &#39;yes&#39;, &#39;no&#39;]
&gt; 
&gt; ignore: |
&gt;   .cache/
&gt;   .collections/
&gt;   logs/
&gt;   .github/
&gt;   .direnv/
&gt; ```
&gt; 
&gt; ### Files to Validate
&gt; 
&gt; yamllint will check:
&gt; - `ansible.cfg` (not YAML, skip)
&gt; - `playbooks/*.yml`
&gt; - `roles/*/tasks/*.yml`
&gt; - `roles/*/defaults/*.yml`
&gt; - `roles/*/vars/*.yml`
&gt; - `vars/*.yml`
&gt; - `requirements.yml`
&gt; - `.github/workflows/*.yml`
&gt; 
&gt; ### Testing
&gt; 
&gt; Run locally before committing:
&gt; ```bash
&gt; yamllint .
&gt; ```
&gt; 
&gt; Fix issues or adjust rules as needed for this repository&#39;s style.
&gt; 
&gt; ### Integration
&gt; 
&gt; Once configured, add to GitHub Actions workflow (issue #6):
&gt; ```yaml
&gt; - name: Run yamllint
&gt;   run: yamllint .
&gt; ```
&gt; 
&gt; ### References
&gt; 
&gt; - yamllint documentation: https://yamllint.readthedocs.io/
&gt; - Part of testing strategy from issue #4

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Set up yamllint for YAML file validation&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;### Overview
&gt; 
&gt; Configure yamllint to ensure consistent YAML formatting and catch syntax errors across all YAML files in the repository.
&gt; 
&gt; ### Tasks
&gt; 
&gt; - [ ] Create `.yamllint` configuration file
&gt; - [ ] Define rules for indentation, line length, and formatting
&gt; - [ ] Configure exclude patterns for generated/cache files
&gt; - [ ] Test yamllint locally on all YAML files
&gt; - [ ] Fix any existing YAML formatting issues
&gt; - [ ] Integrate into GitHub Actions workflow
&gt; 
&gt; ### Configuration Details
&gt; 
&gt; **Create `.yamllint` with:**
&gt; 
&gt; ```yaml
&gt; ---
&gt; extends: default
&gt; 
&gt; rules:
&gt;   line-length:
&gt;     max: 120
&gt;     level: warning
&gt;   indentation:
&gt;     spaces: 2
&gt;     indent-sequences: true
&gt;   comments:
&gt;     min-spaces-from-content: 1
&gt;   truthy:
&gt;     allowed-values: [&#39;true&#39;, &#39;false&#39;, &#39;yes&#39;, &#39;no&#39;]
&gt; 
&gt; ignore: |
&gt;   .cache/
&gt;   .collections/
&gt;   logs/
&gt;   .github/
&gt;   .direnv/
&gt; ```
&gt; 
&gt; ### Files to Validate
&gt; 
&gt; yamllint will check:
&gt; - `ansible.cfg` (not YAML, skip)
&gt; - `playbooks/*.yml`
&gt; - `roles/*/tasks/*.yml`
&gt; - `roles/*/defaults/*.yml`
&gt; - `roles/*/vars/*.yml`
&gt; - `vars/*.yml`
&gt; - `requirements.yml`
&gt; - `.github/workflows/*.yml`
&gt; 
&gt; ### Testing
&gt; 
&gt; Run locally before committing:
&gt; ```bash
&gt; yamllint .
&gt; ```
&gt; 
&gt; Fix issues or adjust rules as needed for this repository&#39;s style.
&gt; 
&gt; ### Integration
&gt; 
&gt; Once configured, add to GitHub Actions workflow (issue SkogAI/skogansible#6):
&gt; ```yaml
&gt; - name: Run yamllint
&gt;   run: yamllint .
&gt; ```
&gt; 
&gt; ### References
&gt; 
&gt; - yamllint documentation: https://yamllint.readthedocs.io/
&gt; - Part of testing strategy from issue SkogAI/skogansible#4&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;
Fixes SkogAI/skogansible#10

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skogansible/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogansible/pull/25

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogansible/pull/25.patch
https://github.com/SkogAI/skogansible/pull/25.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/25
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogansible/pull/25@github.com&gt;
