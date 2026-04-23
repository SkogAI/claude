MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sun, 14 Dec 2025 07:34:15 -0800
Subject: [SkogAI/skogansible] [WIP] Add new role for managing filesystem mounts (PR #88)
Message-ID: <SkogAI/skogansible/pull/88@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693ed8f77eb08_dc111813175ec"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;New role: Filesystem mounts management&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Purpose
&gt; Manage data drive mounts (/mnt/extra, /mnt/warez) through Ansible.
&gt; 
&gt; ## Reference
&gt; - Current fstab entries: `backup/todo/extra-settings/fstab`
&gt; - Drives:
&gt;   - /mnt/extra: UUID=93f3c5d5-d775-4364-abc2-09161102aa04 (ext4)
&gt;   - /mnt/warez: UUID=4cb7e060-09f1-455d-8a4b-dea8286c6c0a (ext4)
&gt; 
&gt; ## Tasks
&gt; - [ ] Create `roles/filesystems/` directory structure
&gt; - [ ] Create `vars/filesystems.yml` with mount definitions
&gt; - [ ] Add tasks to ensure mount points exist
&gt; - [ ] Add tasks to manage fstab entries (ansible.posix.mount)
&gt; - [ ] Add tasks to mount filesystems
&gt; - [ ] Add role to playbook.yml
&gt; - [ ] Test on current system
&gt; 
&gt; ## Variables Structure
&gt; ```yaml
&gt; data_mounts:
&gt;   - path: /mnt/extra
&gt;     uuid: 93f3c5d5-d775-4364-abc2-09161102aa04
&gt;     fstype: ext4
&gt;     opts: defaults
&gt;   - path: /mnt/warez
&gt;     uuid: 4cb7e060-09f1-455d-8a4b-dea8286c6c0a
&gt;     fstype: ext4
&gt;     opts: defaults
&gt; ```
&gt; 
&gt; ## Acceptance Criteria
&gt; - Mounts defined in vars file
&gt; - fstab entries managed by Ansible
&gt; - Filesystems mounted successfully
&gt; - Persists across reboots&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/skogansible#79

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogansible/pull/88

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogansible/pull/88.patch
https://github.com/SkogAI/skogansible/pull/88.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/88
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogansible/pull/88@github.com&gt;
