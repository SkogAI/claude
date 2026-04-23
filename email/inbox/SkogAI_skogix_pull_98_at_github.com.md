MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 12:26:16 -0800
Subject: [SkogAI/skogix] [WIP] Migrate locale role from ansible to system-setup (PR #98)
Message-ID: <SkogAI/skogix/pull/98@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b56e8a9fe9_b9110013352a1"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;migrate locale role from ansible/ to system-setup/&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## overview
&gt; 
&gt; migrate the `locale` role from `ansible/roles/locale/` to `system-setup/roles/05-locale/` to replace the sed/locale-gen hack currently in bootstrap.sh.
&gt; 
&gt; ## current state
&gt; 
&gt; **bootstrap.sh contains:**
&gt; ```bash
&gt; sed -i &#39;s/^#en_US.UTF-8/en_US.UTF-8/&#39; /etc/locale.gen
&gt; locale-gen
&gt; ```
&gt; 
&gt; **ansible/roles/locale/ provides:**
&gt; - proper ansible implementation with lineinfile
&gt; - configurable locale generation via variables
&gt; - handler-based locale-gen execution
&gt; - /etc/locale.conf creation with LANG and LC_ALL
&gt; - comprehensive documentation
&gt; 
&gt; ## migration tasks
&gt; 
&gt; - [ ] copy `ansible/roles/locale/` to `system-setup/roles/05-locale/`
&gt; - [ ] verify all paths and FQCNs are correct
&gt; - [ ] add role to `system-setup/skogai.yml` playbook
&gt; - [ ] configure default locales in `vars/` files if needed
&gt; - [ ] test role execution with `./run.sh`
&gt; - [ ] remove locale setup from `bootstrap.sh` once verified
&gt; - [ ] update system-setup/CLAUDE.md with new role
&gt; 
&gt; ## acceptance criteria
&gt; 
&gt; - locale role executes successfully in system-setup
&gt; - /etc/locale.gen is properly configured
&gt; - /etc/locale.conf is created with correct LANG/LC_ALL
&gt; - locale-gen runs only when changes detected (via handler)
&gt; - bootstrap.sh no longer contains locale configuration
&gt; - role documented in system-setup/CLAUDE.md
&gt; 
&gt; ## files to migrate
&gt; 
&gt; ```
&gt; ansible/roles/locale/
&gt; ├── defaults/main.yml       # locale_locales_to_generate, locale_system_locale
&gt; ├── tasks/main.yml          # lineinfile for locale.gen, copy for locale.conf
&gt; ├── handlers/main.yml       # locale-gen command
&gt; ├── meta/main.yml           # role metadata
&gt; └── README.md               # comprehensive documentation
&gt; ```
&gt; 
&gt; ## references
&gt; 
&gt; - ansible/roles/locale/README.md
&gt; - todo/ISSUES.md mentions &quot;Create 05-locale role&quot;
&gt; - system-setup/bootstrap.sh:47-48 (current sed hack)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#75

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skogix/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/98

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/98.patch
https://github.com/SkogAI/skogix/pull/98.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/98
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/98@github.com&gt;
