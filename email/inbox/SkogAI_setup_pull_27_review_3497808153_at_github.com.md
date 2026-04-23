MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 23 Nov 2025 06:28:36 -0800
Subject: Re: [SkogAI/setup] Migrate package management functions from bash to zsh (PR #27)
Message-ID: <SkogAI/setup/pull/27/review/3497808153@github.com>
In-Reply-To: <SkogAI/setup/pull/27@github.com>
References: <SkogAI/setup/pull/27@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69231a14ca98d_b0110023249b"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR migrates package management functions from bash to zsh, introducing 16 functions organized into three categories: universal pacman wrappers for standard package operations, binary upgrade helpers for fetching/installing tools from GitHub releases, and a GitHub API helper. The migration adapts the code for a pacman-first Arch Linux approach while adding improved error handling, dependency checks, and interactive confirmations.

**Key Changes:**
- New `80-pkg-functions.zsh` file with 255 lines containing 11 universal pacman wrappers (pkg-*) and 5 upgrade helpers
- Integration into zsh module loading sequence via ansible tasks
- Enhanced error handling with early returns and actionable error messages compared to original bash version

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 9 comments.

| File | Description |
| ---- | ----------- |
| `roles/03-dotfiles/files/.config/zsh/80-pkg-functions.zsh` | New file with 16 functions: GitHub release helper, 4 binary upgrade functions (k9s, gone, pinger, go), and 11 universal pacman wrapper functions for package management |
| `roles/03-dotfiles/tasks/main.yml` | Added `80-pkg-functions.zsh` to zsh_configs list for symlink deployment |
| `CLAUDE.md` | Updated documentation to include pkg-functions in zsh module loading order and describe the three function categories |





---

💡 <a href="/SkogAI/setup/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +  pacman -Ss "$@"
+}
+
+# Show package information
+pkg-info() {
+  if [[ -z "$1" ]]; then
+    echo "Usage: pkg-info PACKAGE"
+    return 1
+  fi
+  # Try remote repository first, then local
+  pacman -Si "$1" 2>/dev/null || pacman -Qi "$1"
+}
+
+# Remove package(s)
+pkg-remove() {
+  if [[ -z "$@" ]]; then

The test `[[ -z "$@" ]]` is incorrect for checking if arguments are provided. In zsh/bash, `$@` always expands to something (even if empty), so this test will never be true when arguments are provided.

Use `[[ $# -eq 0 ]]` instead to check if no arguments were provided, or `[[ -z "$*" ]]` to check if all arguments are empty.
```suggestion
  if [[ $# -eq 0 ]]; then
```

> +k9s-upgrade() {
+  local VERSION=$(get_latest_release derailed/k9s)
+  if [[ -z "$VERSION" ]]; then
+    echo "Failed to get latest k9s version"
+    return 1
+  fi
+  
+  pushd /tmp > /dev/null 2>&1
+  echo "→ Downloading k9s ${VERSION}"
+  wget -q https://github.com/derailed/k9s/releases/download/$VERSION/k9s_Linux_x86_64.tar.gz || {
+    echo "Failed to download k9s"
+    popd > /dev/null 2>&1
+    return 1
+  }
+  
+  echo "→ Extracting k9s ${VERSION}"
+  tar -xzf k9s_Linux_x86_64.tar.gz
+  
+  echo "→ Installing k9s to /usr/local/bin"
+  sudo mv k9s /usr/local/bin
+  rm k9s_Linux_x86_64.tar.gz
+  
+  echo "✓ k9s ${VERSION} installed"
+  k9s version
+  popd > /dev/null 2>&1
+}

The function uses `wget` without checking if it's installed, similar to how `get_latest_release` checks for `curl` (lines 15-18). Consider adding a dependency check at the start:

```zsh
if ! command -v wget &> /dev/null; then
  echo "Error: wget is required but not installed (install with: pacman -S wget)"
  return 1
fi
```

This applies to all the binary upgrade functions (k9s-upgrade, gone-upgrade, pinger-upgrade, go-upgrade).

> +  echo "→ Extracting pinger ${VERSION}"
+  tar -xzf pinger_${VERSION}_linux_amd64.tar.gz

Missing error handling for tar extraction. If extraction fails, the function will continue and fail at the mv step. Consider adding error handling:

```zsh
echo "→ Extracting pinger ${VERSION}"
tar -xzf pinger_${VERSION}_linux_amd64.tar.gz || {
  echo "Failed to extract pinger"
  rm -rf pinger_${VERSION}_linux_amd64.tar.gz
  popd > /dev/null 2>&1
  return 1
}
```

This applies to all the binary upgrade functions with tar operations.

> +    return 1
+  fi
+  
+  pushd /tmp > /dev/null 2>&1
+  echo "→ Downloading pinger ${VERSION}"
+  wget -q https://github.com/hirose31/pinger/releases/download/${VERSION}/pinger_${VERSION}_linux_amd64.tar.gz || {
+    echo "Failed to download pinger"
+    popd > /dev/null 2>&1
+    return 1
+  }
+  
+  echo "→ Extracting pinger ${VERSION}"
+  tar -xzf pinger_${VERSION}_linux_amd64.tar.gz
+  
+  echo "→ Installing pinger to /usr/local/bin"
+  sudo mv pinger_${VERSION}_linux_amd64/pinger /usr/local/bin

Missing error handling for installation. If the `sudo mv` fails (e.g., due to permission issues or missing source file), the function should report the error. Consider:

```zsh
echo "→ Installing pinger to /usr/local/bin"
sudo mv pinger_${VERSION}_linux_amd64/pinger /usr/local/bin || {
  echo "Failed to install pinger"
  rm -rf pinger_${VERSION}_linux_amd64.tar.gz pinger_${VERSION}_linux_amd64
  popd > /dev/null 2>&1
  return 1
}
```

This applies to all the binary upgrade functions with sudo mv operations.
```suggestion
  sudo mv pinger_${VERSION}_linux_amd64/pinger /usr/local/bin || {
    echo "Failed to install pinger"
    rm -rf pinger_${VERSION}_linux_amd64.tar.gz pinger_${VERSION}_linux_amd64
    popd > /dev/null 2>&1
    return 1
  }
```

> +    # Check for jq dependency when fetching latest version
+    if ! command -v jq &> /dev/null; then
+      echo "Error: jq is required to fetch latest Go version (install with: pacman -S jq)"
+      return 1
+    fi

When fetching the latest version, the function should also check for `curl` dependency (line 120 uses curl), not just `jq`. Consider checking both:

```zsh
# Check for required dependencies when fetching latest version
if ! command -v curl &> /dev/null; then
  echo "Error: curl is required to fetch latest Go version (install with: pacman -S curl)"
  return 1
fi
if ! command -v jq &> /dev/null; then
  echo "Error: jq is required to fetch latest Go version (install with: pacman -S jq)"
  return 1
fi
```

> +pkg-update() {
+  sudo pacman -Syu

[nitpick] Note: There's an existing `update` alias in `50-aliases.zsh` (line 36) that does `sudo pacman -Syu`, which is identical to this function. Consider whether to keep both or consolidate. Similarly, there's a `cleanup` alias (line 37 of 50-aliases.zsh) that performs non-interactive orphan removal, while `pkg-cleanup()` is interactive.

This could cause confusion for users who expect consistent behavior. Consider either:
1. Removing the old aliases in favor of these functions
2. Using different names for these functions
3. Documenting the difference in behavior

> +  sudo rm -rf /usr/local/go
+  
+  echo "→ Installing Go to /usr/local"
+  sudo mv go /usr/local
+  
+  popd > /dev/null 2>&1
+  echo "✓ Successfully installed Go: $(/usr/local/go/bin/go version)"
+}
+
+# ============================================================================
+# Universal Package Management Functions (Arch Linux / pacman-first)
+# ============================================================================
+
+# Install packages
+pkg-install() {
+  if [[ -z "$@" ]]; then

The test `[[ -z "$@" ]]` is incorrect for checking if arguments are provided. In zsh/bash, `$@` always expands to something (even if empty), so this test will never be true when arguments are provided. 

Use `[[ $# -eq 0 ]]` instead to check if no arguments were provided, or `[[ -z "$*" ]]` to check if all arguments are empty.
```suggestion
  if [[ $# -eq 0 ]]; then
```

> +  rm -rf pinger_${VERSION}_linux_amd64.tar.gz pinger_${VERSION}_linux_amd64
+  
+  echo "✓ pinger ${VERSION} installed"
+  popd > /dev/null 2>&1
+}
+
+# Upgrade Go to latest or specific version
+go-upgrade() {
+  local VERSION
+  if [[ -z "$1" ]]; then
+    # Check for jq dependency when fetching latest version
+    if ! command -v jq &> /dev/null; then
+      echo "Error: jq is required to fetch latest Go version (install with: pacman -S jq)"
+      return 1
+    fi
+    VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')

Missing error handling for the curl command. If the curl request fails or the API is unavailable, `VERSION` will be empty (which is checked on line 125), but it would be better to fail fast with a clear error message:

```zsh
VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version') || {
  echo "Failed to fetch latest Go version from API"
  return 1
}
```
```suggestion
    VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version') || {
      echo "Failed to fetch latest Go version from API"
      return 1
    }
```

> +  curl --silent "https://api.github.com/repos/$1/releases/latest" | \
+    grep '"tag_name":' | \
+    sed -E 's/.*"([^"]+)".*/\1/'

Missing error handling for the curl/grep/sed pipeline. If any command in the pipeline fails, the function will return an empty string without indication of what went wrong. Consider adding error checking:

```zsh
local result
result=$(curl --silent "https://api.github.com/repos/$1/releases/latest" | \
  grep '"tag_name":' | \
  sed -E 's/.*"([^"]+)".*/\1/') || {
  echo "Error: Failed to fetch release information from GitHub API" >&2
  return 1
}
if [[ -z "$result" ]]; then
  echo "Error: No release tag found for $1" >&2
  return 1
fi
echo "$result"
```
```suggestion
  local result
  result=$(curl --silent "https://api.github.com/repos/$1/releases/latest" | \
    grep '"tag_name":' | \
    sed -E 's/.*"([^"]+)".*/\1/') || {
    echo "Error: Failed to fetch release information from GitHub API" >&2
    return 1
  }
  if [[ -z "$result" ]]; then
    echo "Error: No release tag found for $1" >&2
    return 1
  fi
  echo "$result"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/27#pullrequestreview-3497808153
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/27/review/3497808153@github.com>