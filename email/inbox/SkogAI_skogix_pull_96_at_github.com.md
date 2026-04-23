MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 12:26:15 -0800
Subject: [SkogAI/skogix] [WIP] Migrate locale role from ansible to system-setup (PR #96)
Message-ID: <SkogAI/skogix/pull/96@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b56e7bb55c_d811001192659"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Migrate locale role from ansible/ to system-setup/&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Overview
&gt; 
&gt; Migrate the locale configuration role from `ansible/roles/locale/` to `system-setup/` repository as it provides a much better implementation than current system-setup approach.
&gt; 
&gt; ## Current Implementation (ansible/)
&gt; 
&gt; The `ansible/roles/locale/` role provides:
&gt; - Configurable locale generation via `/etc/locale.gen`
&gt; - System-wide default locale configuration via `/etc/locale.conf`
&gt; - Idempotent operations with proper change detection
&gt; - Handler-based locale-gen execution
&gt; - Multiple locale support with variables
&gt; 
&gt; **Key Features:**
&gt; - `locale_locales_to_generate`: List of locales to uncomment in /etc/locale.gen
&gt; - `locale_system_locale`: System-wide default locale
&gt; - Proper FQCN usage (ansible.builtin modules)
&gt; - Descriptive task names
&gt; - Comprehensive documentation
&gt; 
&gt; ## Why This is Better
&gt; 
&gt; **Current system-setup approach:**
&gt; - Uses sed/locale-gen hack in bootstrap.sh
&gt; - Not idempotent
&gt; - Hard to maintain
&gt; - No configurability
&gt; - No proper change detection
&gt; 
&gt; **ansible/ role approach:**
&gt; - Proper Ansible role structure
&gt; - Idempotent and maintainable
&gt; - Configurable via variables
&gt; - Handler-based execution (only runs locale-gen when needed)
&gt; - Supports multiple locales
&gt; - Clean separation of concerns
&gt; 
&gt; ## Migration Tasks
&gt; 
&gt; - [ ] Copy role to system-setup/roles/locale/
&gt; - [ ] Review and update defaults if needed
&gt; - [ ] Add to system-setup playbook (skogai.yml)
&gt; - [ ] Test with example playbook
&gt; - [ ] Update system-setup documentation
&gt; - [ ] Remove sed/locale-gen hack from bootstrap.sh
&gt; - [ ] Verify FQCN compliance
&gt; - [ ] Add example usage to system-setup README
&gt; 
&gt; ## Files to Migrate
&gt; 
&gt; ```
&gt; ansible/roles/locale/
&gt; ├── defaults/main.yml
&gt; ├── handlers/main.yml
&gt; ├── tasks/main.yml
&gt; ├── meta/main.yml
&gt; └── README.md
&gt; ```
&gt; 
&gt; ## Benefits
&gt; 
&gt; 1. **Maintainability**: Proper Ansible role structure
&gt; 2. **Configurability**: Easy to customize locales per system
&gt; 3. **Idempotency**: Safe to run multiple times
&gt; 4. **Best Practices**: Follows Ansible standards
&gt; 5. **Documentation**: Comprehensive README with examples
&gt; 
&gt; ## References
&gt; 
&gt; - Source: `ansible/roles/locale/`
&gt; - Target: `system-setup/roles/locale/`
&gt; - Documentation: `ansible/roles/locale/README.md`
&gt; - Example playbook: `ansible/example-locale-playbook.yml`
&gt; 
&gt; ## Related Issues
&gt; 
&gt; Part of ansible/ to system-setup migration effort. See also:
&gt; - AUR user role migration
&gt; - uv_tools role migration&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#84

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skogix/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/96

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/96.patch
https://github.com/SkogAI/skogix/pull/96.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/96
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/96@github.com&gt;
