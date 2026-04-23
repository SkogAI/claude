MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Thu, 20 Nov 2025 23:56:19 -0800
Subject: Re: [SkogAI/setup] Add nologin shell to AUR builder user (PR #9)
Message-ID: <SkogAI/setup/pull/9/review/3491589900@github.com>
In-Reply-To: <SkogAI/setup/pull/9@github.com>
References: <SkogAI/setup/pull/9@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69201b23bc099_ea11001137166"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR enhances the security of the AUR builder user by setting its shell to nologin, preventing interactive logins while still allowing command execution via sudo for package building operations.

**Key Changes:**
- Adds `shell: /usr/sbin/nologin` parameter to the AUR builder user configuration





---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -3,6 +3,7 @@
   ansible.builtin.user:
     name: aur
     group: wheel
+    shell: /usr/sbin/nologin

The path `/usr/sbin/nologin` may not be correct for Arch Linux. On Arch Linux, the nologin binary is typically located at `/usr/bin/nologin` due to Arch's merged `/usr/bin` structure. Using an incorrect path could cause the user creation to fail or default to a different shell.

Consider changing this to:
```yaml
shell: /usr/bin/nologin
```

Alternatively, you can use `/sbin/nologin` which is a symlink to `/usr/bin/nologin` on most systems.
```suggestion
    shell: /usr/bin/nologin
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/9#pullrequestreview-3491589900
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/9/review/3491589900@github.com>