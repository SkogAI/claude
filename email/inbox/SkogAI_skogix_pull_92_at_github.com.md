MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 03:07:20 -0800
Subject: [SkogAI/skogix] [WIP] Migrate uv_tools role from ansible to system-setup (PR #92)
Message-ID: <SkogAI/skogix/pull/92@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ad3e86779f_b31100933664"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Migrate uv_tools role from ansible/ to system-setup/&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Overview
&gt; 
&gt; Migrate the Python CLI tools management role from `ansible/roles/uv_tools/` to `system-setup/` repository. This provides modern Python tool installation using uv (faster alternative to pipx).
&gt; 
&gt; ## Current Implementation (ansible/)
&gt; 
&gt; The `ansible/roles/uv_tools/` role provides:
&gt; - uv installation (via official installer or system package)
&gt; - Python CLI tool installation in isolated environments
&gt; - Version management per tool
&gt; - Optional tool upgrades
&gt; - Fast, modern alternative to pipx
&gt; 
&gt; **Key Features:**
&gt; - `uv_tools_install_method`: Installation method (script or system)
&gt; - `uv_tools_installer_url`: Official installer URL
&gt; - `uv_tools_packages`: List of tools with optional versions
&gt; - `uv_tools_upgrade`: Upgrade existing tools flag
&gt; - `uv_tools_binary_path`: Binary installation path
&gt; - Isolated tool environments
&gt; - Automatic PATH management
&gt; 
&gt; ## Why This is Better
&gt; 
&gt; **Current system-setup:**
&gt; - Likely missing comprehensive uv tool management
&gt; - May not have version control per tool
&gt; - Upgrade functionality may be missing
&gt; 
&gt; **ansible/ role approach:**
&gt; - Modern approach using uv (faster than pipx)
&gt; - Isolated environments per tool
&gt; - Version pinning support
&gt; - Automatic PATH integration
&gt; - Both installer and system package support
&gt; - Comprehensive documentation
&gt; 
&gt; ## Use Cases
&gt; 
&gt; **Perfect for:**
&gt; - Development workstation setup
&gt; - Python automation tools (ansible, black, pytest, ruff)
&gt; - CLI utilities management
&gt; - Bootstrap scenarios (tools before venvs)
&gt; - System-wide Python tools without environment pollution
&gt; 
&gt; **Example Tools:**
&gt; - ansible (automation)
&gt; - black (formatting)
&gt; - pytest (testing)
&gt; - ruff (linting)
&gt; - httpie (HTTP client)
&gt; 
&gt; ## Migration Tasks
&gt; 
&gt; - [ ] Copy role to system-setup/roles/uv-tools/
&gt; - [ ] Review and update defaults
&gt; - [ ] Add common tool presets (development, automation, testing)
&gt; - [ ] Add to system-setup playbook (skogai.yml)
&gt; - [ ] Test with example tools
&gt; - [ ] Document integration with bootstrap.sh
&gt; - [ ] Add troubleshooting guide
&gt; - [ ] Create example configurations
&gt; 
&gt; ## Files to Migrate
&gt; 
&gt; ```
&gt; ansible/roles/uv_tools/
&gt; ├── defaults/main.yml
&gt; ├── tasks/main.yml
&gt; ├── meta/main.yml
&gt; └── README.md
&gt; ```
&gt; 
&gt; ## Configuration Examples
&gt; 
&gt; **Development tools:**
&gt; ```yaml
&gt; uv_tools_packages:
&gt;   - name: black
&gt;   - name: ruff
&gt;   - name: pytest
&gt;   - name: mypy
&gt; ```
&gt; 
&gt; **Automation tools:**
&gt; ```yaml
&gt; uv_tools_packages:
&gt;   - name: ansible
&gt;     version: &quot;8.5.0&quot;
&gt;   - name: ansible-lint
&gt; ```
&gt; 
&gt; **Pinned versions:**
&gt; ```yaml
&gt; uv_tools_packages:
&gt;   - name: ansible
&gt;     version: &quot;8.5.0&quot;
&gt;   - name: black
&gt;     version: &quot;23.12.1&quot;
&gt; ```
&gt; 
&gt; ## Benefits
&gt; 
&gt; 1. **Speed**: uv is significantly faster than pip/pipx
&gt; 2. **Isolation**: Each tool in its own environment
&gt; 3. **Version Control**: Pin or upgrade per tool
&gt; 4. **Modern**: Uses latest Python packaging standards
&gt; 5. **Clean**: No system Python pollution
&gt; 6. **Automatic**: PATH management handled
&gt; 7. **Bootstrap-friendly**: Great for initial setup
&gt; 
&gt; ## Integration Notes
&gt; 
&gt; **Bootstrap.sh relationship:**
&gt; - Bootstrap.sh installs uv and ansible
&gt; - This role manages all other Python CLI tools
&gt; - Keeps bootstrap minimal (chicken-and-egg)
&gt; - Role takes over after ansible is available
&gt; 
&gt; **Goal:** Keep bootstrap.sh thin - only what&#39;s needed to run Ansible
&gt; 
&gt; ## Enhancement Tasks
&gt; 
&gt; - [ ] Add tool preset variables (dev, automation, testing)
&gt; - [ ] Document uv vs pipx comparison
&gt; - [ ] Add upgrade workflows
&gt; - [ ] Create tool dependency resolution guide
&gt; - [ ] Add performance benchmarks
&gt; - [ ] Document backup/restore of tool environments
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `ansible/roles/uv_tools/`
&gt; - Target: `system-setup/roles/uv-tools/` or similar
&gt; - Documentation: `ansible/roles/uv_tools/README.md`
&gt; - Example playbook: `ansible/example-uv-tools-playbook.yml`
&gt; - UV documentation: https://astral.sh/uv
&gt; 
&gt; ## Related Issues
&gt; 
&gt; Part of ansible/ to system-setup migration effort. See also:
&gt; - locale role migration
&gt; - aur-user role migration
&gt; 
&gt; ## Related Tasks (from TODO)
&gt; 
&gt; From `todo/ISSUES.md`:
&gt; - [ ] Create role for Python CLI tools (uv tool installs)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#86

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/92

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/92.patch
https://github.com/SkogAI/skogix/pull/92.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/92
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/92@github.com&gt;
