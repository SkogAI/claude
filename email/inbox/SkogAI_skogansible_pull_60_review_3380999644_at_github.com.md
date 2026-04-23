MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sun, 26 Oct 2025 03:55:05 -0700
Subject: Re: [SkogAI/skogansible] Remove vault/become password file handling (PR #60)
Message-ID: <SkogAI/skogansible/pull/60/review/3380999644@github.com>
In-Reply-To: <SkogAI/skogansible/pull/60@github.com>
References: <SkogAI/skogansible/pull/60@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fdfe094d46d_1627911004b5"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes non-functional vault and become password file handling, simplifying privilege escalation to use standard Ansible mechanisms. The changes eliminate hardcoded password file paths and complex validation logic, replacing them with clear guidance for users when privilege escalation fails.

**Key changes:**
- Removed password file exports and validation from environment/scripts
- Eliminated early play termination based on password file checks
- Fixed duplicate `validate` parameter in sudoers configuration

### Reviewed Changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `.env` | Removed password file exports, added generic environment setup comments |
| `run.sh` | Removed hardcoded password file arguments, added argument pass-through |
| `test.sh` | Removed password file validation, added privilege failure guidance |
| `roles/01_host_info/tasks/main.yml` | Removed become password file checks and early play termination logic |
| `roles/02_package_managers/tasks/main.yml` | Fixed duplicate `validate` parameter |
| `CLAUDE.md` | Removed vault setup documentation, simplified privilege escalation guidance |
| `.github/copilot-instructions.md` | Removed vault setup instructions, simplified privilege access guidance |
</details>






> +    if ansible-playbook \
+        playbooks/all.yml \
+        --check \
+        --diff; then

The continuation of the `if` statement across lines 209-212 is inconsistent with shell script formatting. The backslash on line 209 suggests line continuation, but lines 210-212 are not properly indented to show they are continuations. Consider reformatting to: `if ansible-playbook playbooks/all.yml --check --diff; then` on a single line, or ensure proper indentation for multi-line format.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/60#pullrequestreview-3380999644
You are receiving this because you were mentioned.

Message ID: <SkogAI/skogansible/pull/60/review/3380999644@github.com>