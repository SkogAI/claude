MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 03:05:40 -0800
Subject: [SkogAI/skogix] [WIP] Enhance 04-aur-user with configurability from ansible roles (PR #89)
Message-ID: <SkogAI/skogix/pull/89@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ad384d1dd0_ba110082961e"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;enhance 04-aur-user with configurability from ansible/roles/aur-user&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## overview
&gt; 
&gt; enhance `system-setup/roles/04-aur-user/` with the configurability and best practices from `ansible/roles/aur-user/`.
&gt; 
&gt; ## current state
&gt; 
&gt; **system-setup/roles/04-aur-user/:**
&gt; - hardcoded username `aur`, group `wheel`, shell `/usr/sbin/nologin`
&gt; - no defaults/main.yml - all values inline in tasks
&gt; - installs yay directly
&gt; - no build directory creation
&gt; - minimal documentation
&gt; 
&gt; **ansible/roles/aur-user/:**
&gt; - fully configurable via defaults/main.yml
&gt; - security check verifies nologin shell exists
&gt; - creates dedicated build directory with proper permissions
&gt; - comprehensive README with security considerations
&gt; - example playbook demonstrating customization
&gt; 
&gt; ## migration tasks
&gt; 
&gt; - [ ] create `system-setup/roles/04-aur-user/defaults/main.yml` with variables:
&gt;   - aur_user_name (default: aur_builder or aur)
&gt;   - aur_user_shell (default: /usr/bin/nologin)
&gt;   - aur_user_home (default: /var/lib/aur_builder or /home/aur)
&gt;   - aur_user_create_home (default: true)
&gt;   - aur_user_comment
&gt;   - aur_user_system (default: true)
&gt;   - aur_user_groups (default: [])
&gt;   - aur_user_build_dir_name (default: build)
&gt;   - aur_user_build_dir_mode (default: &#39;0750&#39;)
&gt; - [ ] add security check from ansible/ version (verify nologin shell exists)
&gt; - [ ] add build directory creation task
&gt; - [ ] replace hardcoded values in tasks/main.yml with variables
&gt; - [ ] create comprehensive README.md based on ansible/ version
&gt; - [ ] add meta/main.yml with role metadata
&gt; - [ ] test with default configuration
&gt; - [ ] test with custom configuration (different username, home dir)
&gt; - [ ] update system-setup/CLAUDE.md
&gt; 
&gt; ## acceptance criteria
&gt; 
&gt; - role uses variables from defaults/main.yml
&gt; - security check prevents creating user with non-existent shell
&gt; - build directory created with proper ownership and permissions
&gt; - role works with both default and custom configurations
&gt; - README documents all variables and security considerations
&gt; - existing system-setup deployments continue to work (backwards compatible)
&gt; 
&gt; ## configuration example
&gt; 
&gt; ```yaml
&gt; # vars/user.yml or playbook
&gt; aur_user_name: aur_builder
&gt; aur_user_shell: /usr/bin/nologin
&gt; aur_user_home: /var/lib/aur_builder
&gt; aur_user_build_dir_name: build
&gt; ```
&gt; 
&gt; ## references
&gt; 
&gt; - ansible/roles/aur-user/README.md
&gt; - ansible/roles/aur-user/defaults/main.yml
&gt; - ansible/roles/aur-user/tasks/main.yml
&gt; - system-setup/roles/04-aur-user/tasks/main.yml&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#76

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/89

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/89.patch
https://github.com/SkogAI/skogix/pull/89.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/89
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/89@github.com&gt;
