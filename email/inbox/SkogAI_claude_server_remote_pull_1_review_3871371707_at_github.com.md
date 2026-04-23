MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude_server_remote <claude_server_remote@noreply.github.com>
Date: Sat, 28 Feb 2026 21:20:24 -0800
Subject: Re: [SkogAI/claude_server_remote] Add SSH server setup script (PR #1)
Message-ID: <SkogAI/claude_server_remote/pull/1/review/3871371707@github.com>
In-Reply-To: <SkogAI/claude_server_remote/pull/1@github.com>
References: <SkogAI/claude_server_remote/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a3cc98ad1e8_ee1110126902c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a `setup-ssh.sh` helper script intended to install and configure an SSH server for `claude_server_remote`, including an option to append an authorized key via a CLI flag.

**Changes:**
- Introduces `setup-ssh.sh` to install `openssh-server` via `apt-get`.
- Writes an `sshd_config.d` drop-in config and validates sshd configuration.
- Starts `sshd` using `systemd` when available, with a non-systemd fallback; optionally appends an authorized key.





---

💡 <a href="/SkogAI/claude_server_remote/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,61 @@
+#!/usr/bin/env bash
+set -euo pipefail
+
+# Setup SSH server for claude_server_remote
+# Usage: sudo ./setup-ssh.sh [--add-key "ssh-ed25519 AAAA..."]
+
+AUTHORIZED_KEY=""
+
+while [[ $# -gt 0 ]]; do
+    case "$1" in
+        --add-key)

Argument parsing for --add-key assumes a second argument exists. With `set -u`, running `./setup-ssh.sh --add-key` will error when referencing $2, and `shift 2` will also fail. Add an explicit check for a missing/empty value and emit a usage error before accessing $2.
```suggestion
        --add-key)
            if [[ $# -lt 2 || -z "${2:-}" ]]; then
                echo "Usage: $0 [--add-key \"ssh-ed25519 AAAA...\"]"
                exit 1
            fi
```

> +echo "==> Writing open sshd config..."
+mkdir -p /etc/ssh/sshd_config.d
+cat > /etc/ssh/sshd_config.d/hardened.conf << 'EOF'
+# Open SSH config for claude_server_remote

Typo/inconsistent naming in user-facing output: consider using the standard "OpenSSH" capitalization in this message for clarity.
```suggestion
echo "==> Writing OpenSSH server config..."
mkdir -p /etc/ssh/sshd_config.d
cat > /etc/ssh/sshd_config.d/hardened.conf << 'EOF'
# OpenSSH config for claude_server_remote
```

> +            ;;
+        *)
+            echo "Usage: $0 [--add-key \"ssh-ed25519 AAAA...\"]"
+            exit 1
+            ;;
+    esac
+done
+
+echo "==> Installing openssh-server..."
+apt-get update -qq
+apt-get install -y -qq openssh-server
+
+echo "==> Writing open sshd config..."
+mkdir -p /etc/ssh/sshd_config.d
+cat > /etc/ssh/sshd_config.d/hardened.conf << 'EOF'
+# Open SSH config for claude_server_remote

Typo/inconsistent naming in this comment: consider using the standard "OpenSSH" capitalization for clarity/searchability.
```suggestion
# OpenSSH config for claude_server_remote
```

> +AuthorizedKeysFile .ssh/authorized_keys
+PermitEmptyPasswords no
+KbdInteractiveAuthentication yes
+EOF
+
+echo "==> Validating sshd config..."
+mkdir -p /run/sshd
+sshd -t
+
+echo "==> Starting sshd..."
+if command -v systemctl &>/dev/null && systemctl is-system-running &>/dev/null; then
+    systemctl enable ssh
+    systemctl restart ssh
+else
+    # Fallback for containers / environments without systemd
+    /usr/sbin/sshd

In the non-systemd path, `/usr/sbin/sshd` will daemonize by default. If this script is used to start sshd as a container entrypoint, the script will exit and the container may stop unless another foreground process exists. Consider using a foreground mode (and/or `exec`) in the container fallback so the container stays up when intended.
```suggestion
    exec /usr/sbin/sshd -D -e
```

> +PermitRootLogin yes
+PasswordAuthentication yes
+PubkeyAuthentication yes
+AuthorizedKeysFile .ssh/authorized_keys
+PermitEmptyPasswords no
+KbdInteractiveAuthentication yes

The sshd configuration written here enables `PermitRootLogin yes` together with `PasswordAuthentication yes` and `KbdInteractiveAuthentication yes`, which allows direct password-based SSH login as `root`. An attacker who can reach this host only needs to obtain or guess the root password to gain full system control, and common password-spraying or brute-force attacks will work as soon as port 22 is exposed. To harden this setup, disable password/keyboard-interactive authentication and avoid permitting direct root SSH login (or at minimum require key-only auth for root via `PubkeyAuthentication` with passwords disabled).
```suggestion
PermitRootLogin prohibit-password
PasswordAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PermitEmptyPasswords no
KbdInteractiveAuthentication no
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude_server_remote/pull/1#pullrequestreview-3871371707
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude_server_remote/pull/1/review/3871371707@github.com>