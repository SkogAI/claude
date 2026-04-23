MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 03:07:03 -0800
Subject: [SkogAI/skogix] [WIP] Migrate AUR user role to system-setup repository (PR #91)
Message-ID: <SkogAI/skogix/pull/91@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ad3d753465_f111008618e6"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Migrate aur-user role from ansible/ to system-setup/&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Overview
&gt; 
&gt; Migrate the AUR user and helper installation role from `ansible/roles/aur-user/` to `system-setup/` repository. This provides secure AUR package building with dedicated user and helper installation.
&gt; 
&gt; ## Current Implementation (ansible/)
&gt; 
&gt; The `ansible/roles/aur-user/` role provides:
&gt; - Dedicated system user for AUR builds with nologin shell
&gt; - Security-focused configuration (no interactive login)
&gt; - AUR helper installation (paru or yay)
&gt; - Proper sudo configuration for pacman
&gt; - Build directory with correct permissions
&gt; - Comprehensive documentation
&gt; 
&gt; **Key Features:**
&gt; - `aur_user_name`: Username for AUR builder (default: aur_builder)
&gt; - `aur_user_shell`: Shell (default: /usr/bin/nologin for security)
&gt; - `aur_user_home`: Home directory (default: /var/lib/aur_builder)
&gt; - `aur_user_build_dir_name`: Build directory name
&gt; - `aur_user_groups`: Optional groups (e.g., wheel for sudo)
&gt; - Base-devel and git installation
&gt; - Configurable permissions
&gt; 
&gt; ## Why This is Better
&gt; 
&gt; **Current system-setup:**
&gt; - Has 04-aur-user role but may need enhancements
&gt; - This ansible/ version has better documentation
&gt; - More security-focused (nologin shell by default)
&gt; - Better variable naming and configurability
&gt; 
&gt; **ansible/ role approach:**
&gt; - Security best practices (nologin shell, system user, no password)
&gt; - Comprehensive documentation with security considerations
&gt; - Clear examples for usage with makepkg
&gt; - Detailed sudo configuration guidance
&gt; - Production-ready defaults
&gt; 
&gt; ## Migration Tasks
&gt; 
&gt; - [ ] Compare with existing system-setup/roles/04-aur-user/
&gt; - [ ] Identify improvements from ansible/ version
&gt; - [ ] Merge best features from both implementations
&gt; - [ ] Update documentation with security considerations
&gt; - [ ] Add AUR helper installation support (paru/yay)
&gt; - [ ] Update defaults with better variable names
&gt; - [ ] Add example playbook to system-setup
&gt; - [ ] Test AUR package building workflow
&gt; - [ ] Document sudo configuration patterns
&gt; 
&gt; ## Files to Review
&gt; 
&gt; **Source (ansible/):**
&gt; ```
&gt; ansible/roles/aur-user/
&gt; ├── defaults/main.yml
&gt; ├── tasks/main.yml
&gt; ├── meta/main.yml
&gt; └── README.md
&gt; ```
&gt; 
&gt; **Target (system-setup):**
&gt; ```
&gt; system-setup/roles/04-aur-user/
&gt; ```
&gt; 
&gt; ## Enhancement Tasks
&gt; 
&gt; - [ ] Add AUR helper installation (paru/yay)
&gt; - [ ] Configure sudo for password-less pacman
&gt; - [ ] Document makepkg usage patterns
&gt; - [ ] Add security best practices section
&gt; - [ ] Include example sudoers configuration
&gt; - [ ] Add troubleshooting guide
&gt; 
&gt; ## Security Considerations
&gt; 
&gt; The ansible/ version emphasizes:
&gt; - **nologin shell**: Prevents interactive login
&gt; - **System user**: UID &lt; 1000
&gt; - **No password**: User cannot authenticate
&gt; - **Explicit shell**: Must use `sudo -u aur_builder sh -c`
&gt; - **Limited sudo**: Only for specific pacman commands
&gt; 
&gt; ## Benefits
&gt; 
&gt; 1. **Security**: Dedicated user with nologin shell
&gt; 2. **Isolation**: Separate build directory and environment
&gt; 3. **Flexibility**: Configurable helper (paru vs yay)
&gt; 4. **Documentation**: Comprehensive security and usage guide
&gt; 5. **Best Practices**: Production-ready defaults
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `ansible/roles/aur-user/`
&gt; - Target: `system-setup/roles/04-aur-user/`
&gt; - Documentation: `ansible/roles/aur-user/README.md`
&gt; - Example playbook: `ansible/example-aur-user-playbook.yml`
&gt; 
&gt; ## Related Issues
&gt; 
&gt; Part of ansible/ to system-setup migration effort. See also:
&gt; - locale role migration  
&gt; - uv_tools role migration
&gt; 
&gt; ## Related Tasks (from TODO)
&gt; 
&gt; From `todo/ISSUES.md`:
&gt; - [ ] Enhance 04-aur-user with configurable defaults
&gt; - [ ] Install AUR helper (paru/yay)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#85

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/91

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/91.patch
https://github.com/SkogAI/skogix/pull/91.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/91
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/91@github.com&gt;
