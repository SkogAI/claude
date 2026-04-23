MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 13:22:25 -0800
Subject: Re: [SkogAI/skogix] Migrate locale role from ansible/ to system-setup/ (PR #96)
Message-ID: <SkogAI/skogix/pull/96/review/3520828844@github.com>
In-Reply-To: <SkogAI/skogix/pull/96@github.com>
References: <SkogAI/skogix/pull/96@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b641131304_cf110015209a2"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR completes the migration of the locale role from the legacy `ansible/` directory to `system-setup/`, adding the full Ansible role structure with proper defaults, handlers, metadata, and documentation. The migration improves maintainability and follows Ansible best practices with a handler-based locale-gen execution pattern.

**Key changes:**
- Adds complete role structure (defaults, handlers, meta, README) to `00-locale` role
- Refactors tasks to use notify/handler pattern instead of conditional command execution
- Updates documentation and example playbooks to reference the correct role paths

### Reviewed changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| system-setup/roles/00-locale/tasks/main.yml | Refactored to use notify/handler pattern and removed default values (now in defaults/main.yml) |
| system-setup/roles/00-locale/defaults/main.yml | Added default variables for locale configuration |
| system-setup/roles/00-locale/handlers/main.yml | Added handler for locale-gen execution |
| system-setup/roles/00-locale/meta/main.yml | Added role metadata with Galaxy info |
| system-setup/roles/00-locale/README.md | Added comprehensive documentation with usage examples |
| system-setup/examples/example-locale.yml | Updated role path reference from ansible/ to system-setup/ |
| system-setup/README.md | Fixed documentation links to correct role paths |
</details>






---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>    become: true
 
   roles:
-    - role: ../ansible/roles/locale
+    - role: ../roles/00-locale

The role reference should use `roles/00-locale` instead of `../roles/00-locale` to be consistent with the established pattern used in other example playbooks (e.g., example-aur-user.yml) and documented in README.md line 328.
```suggestion
    - role: roles/00-locale
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/96#pullrequestreview-3520828844
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/96/review/3520828844@github.com>