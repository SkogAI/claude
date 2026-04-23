MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 23 Nov 2025 05:42:53 -0800
Subject: [SkogAI/setup] [WIP] Evaluate ssh_vault role for secrets management integration (PR #24)
Message-ID: <SkogAI/setup/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69230f5db280a_e9114025462c"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Evaluate SSH vault role for secrets management&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; Evaluate the ssh_vault role from TODO/ for potential integration with current secrets management.
&gt; 
&gt; ## Current State
&gt; - **Existing**: `roles/00-secrets` clones SSH keys from `skogix/secrets` private repo
&gt; - **TODO approach**: `roles/ssh_vault` uses ansible-vault encryption for SSH key backup/restore
&gt; 
&gt; ## SSH Vault Role Features
&gt; - Backup `~/.ssh/` directory
&gt; - Archive to `.tar.gz`
&gt; - Encrypt with ansible-vault
&gt; - Deploy keys from vaulted variables
&gt; - Vault password file management
&gt; 
&gt; ## Analysis Required
&gt; 
&gt; ### Pros of ssh_vault approach
&gt; - [ ] Keys stored encrypted in repo (portable)
&gt; - [ ] No external dependency on GitHub private repo
&gt; - [ ] Ansible-native vault integration
&gt; 
&gt; ### Cons of ssh_vault approach
&gt; - [ ] Hardcoded paths (`/home/skogix/`) need updating
&gt; - [ ] More complex than current git clone approach
&gt; - [ ] Vault password management overhead
&gt; - [ ] Keys in repo (even encrypted) vs separate secrets repo
&gt; 
&gt; ### Current 00-secrets approach
&gt; - Simple: `gh repo clone skogix/secrets`
&gt; - Keys in private repo, not in main config
&gt; - Requires GitHub authentication
&gt; 
&gt; ## Tasks
&gt; - [ ] Review ssh_vault role tasks in detail
&gt; - [ ] Compare security models (vault vs private repo)
&gt; - [ ] Decide: migrate, hybrid approach, or keep current
&gt; - [ ] If migrating: update all hardcoded paths to `{{ ansible_user_dir }}`
&gt; - [ ] Document chosen approach
&gt; 
&gt; ## Files to Review
&gt; - `TODO/roles/ssh_vault/tasks/main.yml`
&gt; - `TODO/roles/ssh_vault/decrypt_ssh_keys.yml`
&gt; - `TODO/roles/ssh_vault/encrypt_and_upload_ssh_keys.yml`
&gt; - `roles/00-secrets/tasks/main.yml` (current)
&gt; 
&gt; ## Decision Criteria
&gt; 1. Security: Which approach better protects keys?
&gt; 2. Portability: Which works better across machines?
&gt; 3. Simplicity: Which has less maintenance overhead?
&gt; 4. Recovery: Which is easier to restore from?
&gt; 
&gt; ## Priority
&gt; Medium - current approach works, but vault approach may be more portable
&gt; 
&gt; ---
&gt; 🤖 Generated with [Claude Code](https://claude.com/claude-code)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#19

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/24

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/24.patch
https://github.com/SkogAI/setup/pull/24.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/24
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/24@github.com&gt;
