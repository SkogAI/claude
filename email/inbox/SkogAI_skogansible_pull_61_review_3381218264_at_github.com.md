MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sun, 26 Oct 2025 09:50:23 -0700
Subject: Re: [SkogAI/skogansible] fix: simplify become/vault configuration to use environment variables only=0A=0ARemove all hardcoded password file paths and rely purely on environment=0Avariables from .env (loaded via .envrc).=0A=0AChanges:=0A- Simplify run.sh to pass arguments directly to ansible-playbook=0A- Remove all password file path references from CLAUDE.md=0A- Replace "Vault Setup" with "Privilege Escalation" section=0A- Document the 4 reasons a playbook might abort due to privileges=0A- Direct users to check .env/.envrc if environment is broken=0A=0AFixes #53=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #61)
Message-ID: <SkogAI/skogansible/pull/61/review/3381218264@github.com>
In-Reply-To: <SkogAI/skogansible/pull/61@github.com>
References: <SkogAI/skogansible/pull/61@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fe514f1416e_a21111100724a9"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR simplifies the Ansible configuration by removing hardcoded password file paths and relying solely on environment variables from `.env` (loaded via `.envrc`). The changes make the setup more flexible and better documented.

**Key changes:**
- Refactored `run.sh` to accept arguments and pass them directly to ansible-playbook
- Updated documentation to replace "Vault Setup" with "Privilege Escalation" section that explains when/why playbooks might fail
- Removed hardcoded file paths from documentation in favor of environment variable references

### Reviewed Changes

Copilot reviewed 3 out of 5 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| run.sh | Refactored to accept playbook and options as arguments, removing hardcoded password file paths |
| CLAUDE.md | Updated documentation to focus on environment variables and added troubleshooting guidance for privilege issues |
| tasks/skogai-core.yml | Changed module reference from FQCN to short name |





> @@ -8,7 +8,7 @@
     upgrade: true
 
 - name: Install core packages
-  community.general.pacman:
+  pacman:

The module name should use the fully qualified collection name (FQCN). Change `pacman` to `community.general.pacman` to follow Ansible best practices and match the coding guidelines that specify 'Use fully qualified collection names (FQCNs) for all modules'.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/61#pullrequestreview-3381218264
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/61/review/3381218264@github.com>