MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:26:15 -0800
Subject: Re: [SkogAI/setup] Add .profile template for login shell environment (PR #73)
Message-ID: <SkogAI/setup/pull/73/review/3520829650@github.com>
In-Reply-To: <SkogAI/setup/pull/73@github.com>
References: <SkogAI/setup/pull/73@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b64f7da3b2_b4110015507ae"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds templated `.profile` deployment for POSIX-compliant login shell environment configuration, providing bash and other login shell users with equivalent environment setup to what zsh users receive via `00-env.zsh.j2`. The template uses per-user variable substitution for `EDITOR`, `VISUAL`, and `PAGER` settings, following the existing product() loop pattern for templated dotfiles.

Key changes:
- Created `.profile.j2` template with PATH setup, XDG base directories, user-templated editor/pager, colored man pages, and local override mechanism
- Added `.profile` to `templated_dotfiles` list in deployment task
- Added `pager` variable to user configuration

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/templates/.profile.j2` | New template for login shell environment with user-specific editor/pager templating |
| `roles/03-dotfiles/tasks/main.yml` | Added `.profile` to templated_dotfiles deployment list |
| `vars/user.yml` | Added `pager: bat` variable for user-specific pager configuration |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +export LANG=en_US.UTF-8
+export LC_ALL=en_US.UTF-8

Hard-coding locale settings in user dotfiles overrides system-wide locale configuration. Since locale is managed by the dedicated `roles/00-locale` role (which sets `/etc/locale.conf`), these hard-coded values should be removed to respect the system configuration. Users can override locale in their `.profile.local` if needed for specific use cases.
```suggestion

```

> @@ -0,0 +1,50 @@
+# ~/.profile - Shell profile configuration template

Template is missing the standard ansible-managed file comment that appears in other templated dotfiles. Consider adding a comment like `# Managed by Ansible - Local customizations go in ~/.profile.local` to align with the pattern used in `.gitconfig.j2` and other templates.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/73#pullrequestreview-3520829650
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/73/review/3520829650@github.com>