MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 03:05:56 -0800
Subject: [SkogAI/skogix] [WIP] Add UV installation capability to 09-uv-tools role (PR #90)
Message-ID: <SkogAI/skogix/pull/90@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ad394bbcd6_ca1100877377"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;enhance 09-uv-tools with uv installation capability from ansible/roles/uv_tools&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## overview
&gt; 
&gt; enhance `system-setup/roles/09-uv-tools/` to optionally install uv itself, adopting the self-contained approach from `ansible/roles/uv_tools/`.
&gt; 
&gt; ## current state
&gt; 
&gt; **system-setup/roles/09-uv-tools/:**
&gt; - assumes uv is pre-installed (fails if not found at /bin/uv)
&gt; - simple package installation logic
&gt; - minimal defaults/main.yml
&gt; 
&gt; **ansible/roles/uv_tools/:**
&gt; - can install uv via official installer script or system package manager
&gt; - configurable installation method (script vs system)
&gt; - configurable binary path (/usr/local/bin/uv vs /bin/uv)
&gt; - more sophisticated error handling
&gt; - comprehensive documentation
&gt; 
&gt; ## migration tasks
&gt; 
&gt; - [ ] add uv installation capability to system-setup/roles/09-uv-tools/tasks/main.yml:
&gt;   - check if uv exists task
&gt;   - install via script block (when not exists and method == &quot;script&quot;)
&gt;   - install via system package (when not exists and method == &quot;system&quot;)
&gt;   - cleanup installer script task
&gt; - [ ] enhance defaults/main.yml with:
&gt;   - uv_tools_install_method (default: skip or script)
&gt;   - uv_tools_installer_url
&gt;   - uv_tools_binary_path (default: /bin/uv for system-setup compatibility)
&gt; - [ ] keep existing &quot;fail if not installed&quot; behavior as default
&gt; - [ ] make uv installation opt-in via variable (backwards compatible)
&gt; - [ ] improve error handling in package installation (check for &quot;already exist&quot;)
&gt; - [ ] create comprehensive README.md based on ansible/ version
&gt; - [ ] add meta/main.yml with role metadata
&gt; - [ ] test with uv pre-installed (existing behavior)
&gt; - [ ] test with uv installation (new capability)
&gt; - [ ] update system-setup/CLAUDE.md
&gt; 
&gt; ## acceptance criteria
&gt; 
&gt; - role maintains backwards compatibility (fails if uv not found by default)
&gt; - can optionally install uv when uv_tools_install_method is set
&gt; - supports both script and system installation methods
&gt; - binary path is configurable
&gt; - error handling improved for idempotency
&gt; - README documents installation methods and use cases
&gt; - existing deployments unaffected
&gt; 
&gt; ## configuration examples
&gt; 
&gt; ```yaml
&gt; # existing behavior (default) - requires uv pre-installed
&gt; uv_tools_packages:
&gt;   - name: ruff
&gt;   - name: black
&gt; 
&gt; # new capability - install uv first
&gt; uv_tools_install_method: script
&gt; uv_tools_installer_url: &quot;https://astral.sh/uv/install.sh&quot;
&gt; uv_tools_binary_path: /usr/local/bin/uv
&gt; uv_tools_packages:
&gt;   - name: ansible
&gt;     version: &quot;8.5.0&quot;
&gt; ```
&gt; 
&gt; ## references
&gt; 
&gt; - ansible/roles/uv_tools/README.md
&gt; - ansible/roles/uv_tools/defaults/main.yml
&gt; - ansible/roles/uv_tools/tasks/main.yml
&gt; - system-setup/roles/09-uv-tools/tasks/main.yml&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#77

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skogix/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/90

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/90.patch
https://github.com/SkogAI/skogix/pull/90.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/90
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/90@github.com&gt;
