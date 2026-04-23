MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sun, 26 Oct 2025 09:51:00 -0700
Subject: Re: [SkogAI/skogansible] Use full path for visudo in validate parameter=0A=0ACo-authored-by: Skogix <690279+Skogix@users.noreply.github.com> (PR #62)
Message-ID: <SkogAI/skogansible/pull/62/review/3381218489@github.com>
In-Reply-To: <SkogAI/skogansible/pull/62@github.com>
References: <SkogAI/skogansible/pull/62@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fe5174bb384_442b71100379da"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes the vault-based authentication mechanism and simplifies the Ansible configuration to rely on standard environment-based privilege escalation instead of vault-encrypted password files.

**Key changes:**
- Removed vault password file configuration and related documentation
- Simplified `run.sh` and `test.sh` scripts to remove password file dependencies
- Fixed duplicate `validate` parameter in sudoers configuration

### Reviewed Changes

Copilot reviewed 8 out of 9 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `.env` | Removed vault and become password file exports, replaced with guidance comments |
| `run.sh` | Simplified to remove password file parameters and accept command-line arguments |
| `test.sh` | Removed vault file existence checks and password file parameters from check mode |
| `roles/01_host_info/tasks/main.yml` | Removed become password file validation tasks |
| `roles/02_package_managers/tasks/main.yml` | Fixed duplicate `validate` parameter in sudoers lineinfile task |
| `tasks/skogai-core.yml` | Changed from FQCN to short module name for pacman |
| `CLAUDE.md` | Updated documentation to reflect removal of vault-based authentication |
| `.github/copilot-instructions.md` | Updated documentation to reflect removal of vault-based authentication |
</details>






> @@ -8,7 +8,7 @@
     upgrade: true
 
 - name: Install core packages
-  community.general.pacman:
+  pacman:

The module name should use the fully qualified collection name (FQCN). Change `pacman:` to `community.general.pacman:` to follow Ansible best practices and match the coding guidelines.

> @@ -11,10 +11,9 @@
   ansible.builtin.lineinfile:
     path: /etc/sudoers.d/11-install-aur_builder
     line: "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman"
-    validate: /usr/sbin/visudo -cf %s
+    validate: "/usr/sbin/visudo -cf %s"

[nitpick] While the full path `/usr/sbin/visudo` is more explicit, the quotes are unnecessary for this parameter value. The original `visudo -cf %s` would work correctly as visudo is typically in the system PATH. However, if the intention is to ensure the exact binary is used, this change is reasonable.
```suggestion
    validate: /usr/sbin/visudo -cf %s
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/62#pullrequestreview-3381218489
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/62/review/3381218489@github.com>