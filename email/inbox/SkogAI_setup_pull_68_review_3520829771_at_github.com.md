MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:27:02 -0800
Subject: Re: [SkogAI/setup] Add .bashrc.j2 template as lightweight alternative to modular bash role (PR #68)
Message-ID: <SkogAI/setup/pull/68/review/3520829771@github.com>
In-Reply-To: <SkogAI/setup/pull/68@github.com>
References: <SkogAI/setup/pull/68@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b6526dd6f6_f51100162656f"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds a lightweight `.bashrc.j2` template as an alternative to the complex modular `roles/bash/` role (which includes oh-my-bash and 15+ separate files). The new template provides a simple, ~60-line bash configuration with sensible defaults, user-defined aliases via `extra_aliases` from `vars/user.yml`, and the standard `.bashrc.local` override mechanism that's consistent with other dotfiles in the repository.

### Key Changes
- New bash template with essential features (history, completion, dircolors, safety aliases)
- Integration of per-user `extra_aliases` configuration from `vars/user.yml`
- Maintains `.bashrc.local` override pattern for consistency with existing dotfiles

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/templates/.bashrc.j2` | New bash configuration template with user-specific alias rendering and local override support |
| `roles/03-dotfiles/tasks/main.yml` | Added `.bashrc` to `templated_dotfiles` list for per-user deployment |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +# Common aliases
+alias ll='ls -alF'
+alias la='ls -A'
+alias l='ls -CF'
+alias ..='cd ..'
+alias ...='cd ../..'
+
+# Safety aliases
+alias rm='rm -i'
+alias cp='cp -i'
+alias mv='mv -i'
+
+{% if item.0.extra_aliases is defined %}
+# User-defined aliases
+{% for alias in item.0.extra_aliases %}
+alias {{ alias.name }}='{{ alias.cmd }}'

The alias command rendering doesn't handle single quotes properly. If an `alias.cmd` value contains a single quote (e.g., `echo 'hello'`), the generated bash syntax will be broken. Consider using `{{ alias.cmd | replace("'", "'\"'\"'") }}` to properly escape single quotes within the command string, which is the standard bash escaping technique for single-quoted strings.
```suggestion
alias {{ alias.name }}='{{ alias.cmd | replace("'", "'\"'\"'") }}'
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/68#pullrequestreview-3520829771
You are receiving this because you were assigned.

Message ID: <SkogAI/setup/pull/68/review/3520829771@github.com>