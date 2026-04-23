MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Fri, 21 Nov 2025 00:20:16 -0800
Subject: Re: [SkogAI/setup] Migrate HA configuration to Ansible (PR #11)
Message-ID: <SkogAI/setup/pull/11/review/3491656128@github.com>
In-Reply-To: <SkogAI/setup/pull/11@github.com>
References: <SkogAI/setup/pull/11@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692020c07f45_bd11001101749"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR introduces a new `issues.md` file that serves as a TODO list for migrating various system configuration tasks from the bootstrap script to Ansible roles. The document organizes planned work into priority levels (High, Medium, Low) and provides important notes about what must remain in bootstrap.sh due to chicken-and-egg dependencies.

Key changes:
- Creates a structured TODO list with prioritized tasks for Ansible migration
- Documents the distinction between what can be moved to Ansible roles and what must stay in bootstrap.sh
- Provides a clear goal statement for keeping bootstrap.sh minimal





---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,25 @@
+# TODO - Migrate to Ansible
+
+## High Priority
+
+- [ ] Create `05-locale` role for locale setup (replace sed/locale-gen hack in bootstrap.sh)
+- [ ] Move keyring initialization to `01-base` role

This task appears to conflict with the note on line 21 which states "Initial pacman keyring setup (needed before any packages)" must stay in bootstrap.sh. The keyring initialization (pacman-key --init, pacman-key --populate) needs to happen before any packages can be installed, including those needed to run Ansible. Consider clarifying this task or removing it if it contradicts the chicken-and-egg constraint.
```suggestion

```

> +
+## Medium Priority
+
+- [ ] Add AUR helper installation (paru/yay) via `04-aur-user`
+- [ ] Create role for Python CLI tools (uv tool installs)
+
+## Low Priority
+
+- [ ] Consider role for ansible-galaxy collection installs
+- [ ] Add more dotfile templates as needed
+
+## Notes
+
+**Must stay in bootstrap.sh (chicken-and-egg):**
+- Initial pacman keyring setup (needed before any packages)
+- git, uv installation (needed for ansible)

The bootstrap.sh script also installs `github-cli` (line 17: `sudo pacman -S --noconfirm git github-cli uv`), but it's not mentioned in this list. Consider adding `github-cli` to keep the documentation accurate and complete.
```suggestion
- git, github-cli, uv installation (needed for ansible)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/11#pullrequestreview-3491656128
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/11/review/3491656128@github.com>