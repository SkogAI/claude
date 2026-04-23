MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Thu, 27 Nov 2025 16:41:36 -0800
Subject: [SkogAI/skogix] [WIP] Standardize role structure across system-setup/roles (PR #81)
Message-ID: <SkogAI/skogix/pull/81@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6928efc094da2_f21100136592"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;standardize role structure across system-setup/ roles&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## overview
&gt; 
&gt; standardize all roles in system-setup/roles/ to follow ansible best practices with proper defaults/main.yml, meta/main.yml, and handlers/main.yml where appropriate.
&gt; 
&gt; ## current state
&gt; 
&gt; **system-setup/roles/:**
&gt; - inconsistent structure across roles
&gt; - some roles have defaults/main.yml, many don&#39;t
&gt; - no meta/main.yml files for role metadata
&gt; - no handlers/ directories (handlers inline or absent)
&gt; - hardcoded values in many roles
&gt; 
&gt; **ansible/roles/:**
&gt; - consistent structure across all roles
&gt; - defaults/main.yml in every role
&gt; - meta/main.yml with role metadata
&gt; - handlers/main.yml when needed (e.g., locale role)
&gt; - all configurable via variables
&gt; 
&gt; ## target structure
&gt; 
&gt; ```
&gt; roles/[role-name]/
&gt; ├── defaults/
&gt; │   └── main.yml      # default variables (always present)
&gt; ├── tasks/
&gt; │   └── main.yml      # main task list (always present)
&gt; ├── handlers/
&gt; │   └── main.yml      # handlers (if needed)
&gt; ├── meta/
&gt; │   └── main.yml      # role metadata (always present)
&gt; ├── templates/        # jinja2 templates (if needed)
&gt; ├── files/            # static files (if needed)
&gt; └── README.md         # documentation (see issue #X)
&gt; ```
&gt; 
&gt; ## migration tasks
&gt; 
&gt; for each role in system-setup/roles/:
&gt; 
&gt; ### defaults/main.yml
&gt; - [ ] 00-secrets - extract variables (repo URL, key paths)
&gt; - [ ] 01-base - extract package lists, configuration
&gt; - [ ] 02-users - extract hardcoded values (wheel group, shell)
&gt; - [ ] 03-dotfiles - review existing defaults, ensure complete
&gt; - [ ] 04-aur-user - covered by issue #X
&gt; - [ ] 05-nvm - extract version, install path variables
&gt; - [ ] 06-skogcli - extract repo URLs, paths
&gt; - [ ] 07-argc - extract install location, version
&gt; - [ ] 08-graphics - extract driver preferences, ollama config
&gt; - [ ] 09-uv-tools - covered by issue #X
&gt; - [ ] 10-gptme - extract configuration variables
&gt; 
&gt; ### meta/main.yml
&gt; - [ ] create meta/main.yml for all roles with:
&gt;   - galaxy_info (author, description, license, platforms)
&gt;   - dependencies (list role dependencies)
&gt;   - allow_duplicates (if applicable)
&gt; 
&gt; ### handlers/main.yml
&gt; - [ ] review all roles for handler opportunities:
&gt;   - systemd service restarts
&gt;   - shell reloads
&gt;   - cache updates
&gt;   - configuration reloads
&gt; 
&gt; ### variable migration
&gt; - [ ] identify all hardcoded values in tasks/main.yml files
&gt; - [ ] move to defaults/main.yml with sensible defaults
&gt; - [ ] update tasks to reference variables
&gt; - [ ] document variables in README.md (see issue #X)
&gt; 
&gt; ## meta/main.yml template
&gt; 
&gt; ```yaml
&gt; ---
&gt; galaxy_info:
&gt;   author: skogix
&gt;   description: [Role description]
&gt;   license: MIT
&gt;   min_ansible_version: &quot;2.9&quot;
&gt;   platforms:
&gt;     - name: ArchLinux
&gt;       versions:
&gt;         - all
&gt; 
&gt; dependencies: []
&gt; ```
&gt; 
&gt; ## acceptance criteria
&gt; 
&gt; - all roles have defaults/main.yml with documented variables
&gt; - all roles have meta/main.yml with proper metadata
&gt; - handlers extracted where appropriate
&gt; - no hardcoded values in tasks files
&gt; - variables use consistent naming (role_name_variable_name)
&gt; - role structure documented in system-setup/README.md
&gt; - backwards compatibility maintained (defaults match current behavior)
&gt; 
&gt; ## references
&gt; 
&gt; - ansible/roles/locale/defaults/main.yml
&gt; - ansible/roles/aur-user/defaults/main.yml
&gt; - ansible/roles/uv_tools/defaults/main.yml
&gt; - ansible/roles/locale/meta/main.yml
&gt; - ansible/roles/locale/handlers/main.yml
&gt; - system-setup/roles/09-uv-tools/defaults/main.yml (existing example)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#80

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/81

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/81.patch
https://github.com/SkogAI/skogix/pull/81.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/81
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/81@github.com&gt;
