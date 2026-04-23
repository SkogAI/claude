MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 11:31:12 -0800
Subject: Re: [SkogAI/skogix] Add pre-push hook for soft-serve SSH host key verification (PR #117)
Message-ID: <SkogAI/skogix/pull/117/review/3573318787@github.com>
In-Reply-To: <SkogAI/skogix/pull/117@github.com>
References: <SkogAI/skogix/pull/117@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c6d80e45dd_c0111810796c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds automated SSH host key verification for the soft-serve git server to prevent "Host key verification failed" errors during dual-remote pushes. The solution provides a pre-push git hook that automatically scans and adds the soft-serve host key to `~/.ssh/known_hosts` when needed.

**Key Changes:**
- Pre-push hook that detects soft-serve URLs and manages SSH host keys automatically
- Setup script for easy installation of hooks into `.git/hooks/`
- Comprehensive documentation covering installation, troubleshooting, and manual alternatives

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 7 comments.

| File | Description |
| ---- | ----------- |
| `scripts/git-hooks/pre-push` | Git hook that detects pushes to soft-serve:23231, validates and adds SSH host keys to known_hosts, with graceful fallback on failures |
| `scripts/git-hooks/setup-hooks.sh` | Installation script that copies hooks to .git/hooks/ directory and sets executable permissions |
| `scripts/git-hooks/README.md` | Documentation covering hook behavior, installation methods, manual alternatives, and troubleshooting steps |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,30 @@
+#!/bin/bash

Use `#!/usr/bin/env bash` instead of `#!/bin/bash` for better portability. This shebang is used consistently in most other scripts in the repository (notification.sh, stop.sh, pre-tool-use.sh, post-tool-use.sh, etc.), making it the established convention for this codebase.
```suggestion
#!/usr/bin/env bash
```

> +
+# Check if pushing to soft-serve
+if [[ "$url" == *"soft-serve:23231"* ]]; then
+    echo "Detected push to soft-serve, checking SSH host key..."
+    
+    # Ensure .ssh directory exists
+    mkdir -p ~/.ssh
+    chmod 700 ~/.ssh
+    
+    # Create known_hosts if it doesn't exist
+    touch ~/.ssh/known_hosts
+    chmod 644 ~/.ssh/known_hosts
+    
+    # Check if soft-serve host key is already in known_hosts
+    # SSH known_hosts format for non-standard ports: [hostname]:port
+    if ! grep -qE '^\[?soft-serve\]?:?23231' ~/.ssh/known_hosts 2>/dev/null; then

The regex pattern for detecting existing host keys may not match all valid known_hosts formats. The pattern `^\[?soft-serve\]?:?23231` will incorrectly match lines like "soft-serve23231" (without port separator). A more precise pattern would be `^\[soft-serve\]:23231\s` to strictly match the bracketed hostname:port format that ssh-keyscan produces, or handle standard and bracketed formats separately.
```suggestion
    if ! grep -qE '^\[soft-serve\]:23231\s' ~/.ssh/known_hosts 2>/dev/null; then
```

> +    mkdir -p ~/.ssh
+    chmod 700 ~/.ssh
+    
+    # Create known_hosts if it doesn't exist
+    touch ~/.ssh/known_hosts
+    chmod 644 ~/.ssh/known_hosts
+    
+    # Check if soft-serve host key is already in known_hosts
+    # SSH known_hosts format for non-standard ports: [hostname]:port
+    if ! grep -qE '^\[?soft-serve\]?:?23231' ~/.ssh/known_hosts 2>/dev/null; then
+        echo "Adding soft-serve SSH host key to known_hosts..."
+        
+        # Try to scan the host key
+        if command -v ssh-keyscan >/dev/null 2>&1; then
+            # Use a temporary file to validate ssh-keyscan output
+            temp_keys=$(mktemp)

The temporary file should be created with a more secure template that includes a unique identifier. Use `mktemp -t soft-serve-keys.XXXXXX` or `mktemp /tmp/soft-serve-keys.XXXXXX` to ensure a unique and recognizable temporary file name. This prevents potential issues if multiple git operations run concurrently.
```suggestion
            temp_keys=$(mktemp -t soft-serve-keys.XXXXXX)
```

> +    chmod 644 ~/.ssh/known_hosts
+    
+    # Check if soft-serve host key is already in known_hosts
+    # SSH known_hosts format for non-standard ports: [hostname]:port
+    if ! grep -qE '^\[?soft-serve\]?:?23231' ~/.ssh/known_hosts 2>/dev/null; then
+        echo "Adding soft-serve SSH host key to known_hosts..."
+        
+        # Try to scan the host key
+        if command -v ssh-keyscan >/dev/null 2>&1; then
+            # Use a temporary file to validate ssh-keyscan output
+            temp_keys=$(mktemp)
+            
+            # Scan the host key
+            if ssh-keyscan -p 23231 soft-serve > "$temp_keys" 2>/dev/null && [ -s "$temp_keys" ]; then
+                # Validate that we got actual key data (lines starting with [soft-serve]:23231)
+                if grep -q '^\[soft-serve\]:23231' "$temp_keys"; then

The validation pattern `^\[soft-serve\]:23231` only checks for lines starting with this prefix but doesn't verify that the line contains a valid SSH key. An attacker or network issue could potentially inject lines like "[soft-serve]:23231 malformed-data" that would pass this check. Add validation to ensure each line contains valid key data (e.g., checking for presence of key type like ssh-rsa, ssh-ed25519, ecdsa-sha2-nistp256, etc.) after the hostname:port prefix.
```suggestion
                if grep -Eq '^\[soft-serve\]:23231 (ssh-(rsa|ed25519|dss)|ecdsa-sha2-nistp(256|384|521)) ' "$temp_keys"; then
```

> @@ -0,0 +1,60 @@
+#!/bin/bash

Use `#!/usr/bin/env bash` instead of `#!/bin/bash` for better portability. This shebang is used consistently in most other scripts in the repository (notification.sh, stop.sh, pre-tool-use.sh, post-tool-use.sh, etc.), making it the established convention for this codebase.
```suggestion
#!/usr/bin/env bash
```

> +        if command -v ssh-keyscan >/dev/null 2>&1; then
+            # Use a temporary file to validate ssh-keyscan output
+            temp_keys=$(mktemp)
+            
+            # Scan the host key
+            if ssh-keyscan -p 23231 soft-serve > "$temp_keys" 2>/dev/null && [ -s "$temp_keys" ]; then
+                # Validate that we got actual key data (lines starting with [soft-serve]:23231)
+                if grep -q '^\[soft-serve\]:23231' "$temp_keys"; then
+                    cat "$temp_keys" >> ~/.ssh/known_hosts
+                    echo "Successfully added soft-serve host key to known_hosts"
+                else
+                    echo "Warning: ssh-keyscan returned unexpected format"
+                    echo "Continuing with push attempt..."
+                fi
+            else
+                echo "Warning: Could not scan soft-serve host key (server may be unreachable)"
+                echo "Continuing with push attempt..."
+            fi
+            
+            rm -f "$temp_keys"
+        else
+            echo "Warning: ssh-keyscan not found, cannot automatically add host key"
+            echo "Run manually: ssh-keyscan -p 23231 soft-serve >> ~/.ssh/known_hosts"

This hook automatically trusts whatever SSH host key `ssh-keyscan` returns for `soft-serve` and appends it to `~/.ssh/known_hosts` without any fingerprint verification or pinning. In an environment where DNS or the network can be spoofed, an attacker could stand up a rogue SSH server as `soft-serve`, have this hook record the attacker's host key, and thereafter transparently receive all pushes (source code) over an apparently "secure" SSH connection. To avoid silently weakening SSH host authentication, this logic should only accept a host key that matches a pre-pinned fingerprint or a known-good key, and fail (or at least prompt) when the scanned key does not match.

> +```bash
+ssh-keyscan -p 23231 soft-serve >> ~/.ssh/known_hosts
+```

The README recommends using `ssh-keyscan -p 23231 soft-serve >> ~/.ssh/known_hosts` directly, which records whatever host key is returned at that moment without any verification. If an attacker can spoof DNS or the network path to `soft-serve`, they can supply their own SSH host key, have it permanently trusted in `known_hosts`, and then intercept or tamper with future SSH pushes that appear to be going to the real server. The documentation should instead recommend validating the scanned key against a known-good fingerprint (or a pinned key distributed out-of-band) before adding it to `known_hosts`, and warn against blindly trusting `ssh-keyscan` output.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/117#pullrequestreview-3573318787
You are receiving this because you were assigned.

Message ID: <SkogAI/skogix/pull/117/review/3573318787@github.com>