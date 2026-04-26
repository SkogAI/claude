#!/usr/bin/env bash
# bootstrap.sh — One-liner bootstrap for fresh Arch Linux installs
# Usage: curl -fsSL https://raw.githubusercontent.com/SkogAI/bootstrap/master/bootstrap.sh | bash
#
# Phases:
#   1. Foundation — install base packages + yay (no auth, no input)
#   2. Secret Unlock — decrypt vault (one password prompt via /dev/tty)
#   3. Identity — deploy SSH keys, git config, gh auth (automatic)
#
# Environment variables:
#   VAULT_PASSWORD  — skip interactive prompt (for CI/headless)
#   DRY_RUN=true    — print what would happen without executing
#   BOOTSTRAP_REPO  — override repo URL (default: SkogAI/bootstrap)

set -euo pipefail

# --- Constants ---
BOOTSTRAP_REPO="${BOOTSTRAP_REPO:-https://github.com/SkogAI/bootstrap.git}"
WORK_DIR=""
SECRETS_DIR=""

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- Helpers ---
log()  { printf "${GREEN}[bootstrap]${NC} %s\n" "$*"; }
warn() { printf "${YELLOW}[bootstrap]${NC} %s\n" "$*"; }
err()  { printf "${RED}[bootstrap]${NC} %s\n" "$*" >&2; }
info() { printf "${BLUE}[bootstrap]${NC} %s\n" "$*"; }

dry_run() { [[ "${DRY_RUN:-}" == "true" ]]; }

run() {
    if dry_run; then
        info "[DRY_RUN] $*"
    else
        "$@"
    fi
}

# --- Cleanup trap ---
cleanup() {
    log "Cleaning up..."
    if [[ -n "${SECRETS_DIR:-}" && -d "${SECRETS_DIR:-}" ]]; then
        # shred plaintext secrets
        find "$SECRETS_DIR" -type f -exec shred -u {} \; 2>/dev/null || true
        rm -rf "$SECRETS_DIR"
    fi
    if [[ -n "${WORK_DIR:-}" && -d "${WORK_DIR:-}" ]]; then
        rm -rf "$WORK_DIR"
    fi
    log "Cleanup complete."
}
trap cleanup EXIT INT TERM

# --- Precondition checks ---
preflight() {
    log "Running preflight checks..."

    # Must be Arch Linux
    if [[ ! -f /etc/arch-release ]]; then
        err "This script is designed for Arch Linux only."
        exit 1
    fi

    # Must not be root
    if [[ $EUID -eq 0 ]]; then
        err "Do not run as root. The script uses sudo where needed."
        exit 1
    fi

    # Network check
    if ! ping -c1 -W3 archlinux.org &>/dev/null; then
        err "No network connectivity. Check your connection."
        exit 1
    fi

    log "Preflight checks passed."
}

# =============================================================================
# Phase 1: Foundation
# =============================================================================
phase_foundation() {
    log "=== Phase 1: Foundation ==="

    # Full system upgrade
    log "Upgrading system..."
    run sudo pacman -Syu --noconfirm

    # Install essential packages
    local packages=(
        git
        base-devel
        openssh
        github-cli
        ansible-core
    )
    log "Installing packages: ${packages[*]}"
    run sudo pacman -S --needed --noconfirm "${packages[@]}"

    # Install yay if not present
    if command -v yay &>/dev/null; then
        log "yay already installed, skipping."
    else
        log "Building yay from AUR source..."
        if dry_run; then
            info "[DRY_RUN] Would build and install yay"
        else
            local yay_dir
            yay_dir="$(mktemp -d)"
            git clone https://aur.archlinux.org/yay.git "$yay_dir/yay"
            (cd "$yay_dir/yay" && makepkg -si --noconfirm)
            rm -rf "$yay_dir"
        fi
    fi

    log "Phase 1 complete."
}

# =============================================================================
# Phase 2: Secret Unlock
# =============================================================================
phase_secrets() {
    log "=== Phase 2: Secret Unlock ==="

    # Clone bootstrap repo (public, HTTPS, no auth needed)
    WORK_DIR="$(mktemp -d /tmp/bootstrap.XXXXXX)"
    log "Cloning bootstrap repo to $WORK_DIR..."
    if dry_run; then
        info "[DRY_RUN] Would clone $BOOTSTRAP_REPO to $WORK_DIR"
        # Create fake structure for dry run
        mkdir -p "$WORK_DIR"
        return
    else
        git clone --depth 1 "$BOOTSTRAP_REPO" "$WORK_DIR/repo"
    fi

    local vault_file="$WORK_DIR/repo/secrets.vault"
    if [[ ! -f "$vault_file" ]]; then
        err "secrets.vault not found in repo!"
        exit 1
    fi

    # Decrypt vault
    SECRETS_DIR="$(mktemp -d /tmp/bootstrap-secrets.XXXXXX)"
    local decrypted_archive="$SECRETS_DIR/secrets.tar.gz"

    if [[ -n "${VAULT_PASSWORD:-}" ]]; then
        log "Using VAULT_PASSWORD environment variable..."
        echo "$VAULT_PASSWORD" | ansible-vault decrypt "$vault_file" \
            --output "$decrypted_archive" \
            --vault-password-file /dev/stdin
    else
        log "Prompting for vault password (reads from /dev/tty)..."
        ansible-vault decrypt "$vault_file" \
            --output "$decrypted_archive" \
            --vault-password-file <(read -rsp "Vault password: " pw < /dev/tty && echo && echo "$pw")
    fi

    # Extract
    log "Extracting secrets..."
    tar xzf "$decrypted_archive" -C "$SECRETS_DIR"
    rm -f "$decrypted_archive"

    # Validate expected files
    local has_key=false
    for keytype in ed25519 ecdsa rsa; do
        if [[ -f "$SECRETS_DIR/ssh/id_${keytype}" ]]; then
            has_key=true
            break
        fi
    done

    if [[ "$has_key" == "false" ]]; then
        err "No SSH private key found in vault! Expected ssh/id_<type>"
        exit 1
    fi

    if [[ ! -f "$SECRETS_DIR/github_pat" ]]; then
        err "github_pat not found in vault!"
        exit 1
    fi

    if [[ ! -f "$SECRETS_DIR/gitconfig" ]]; then
        err "gitconfig not found in vault!"
        exit 1
    fi

    log "Phase 2 complete. Secrets decrypted."
}

# =============================================================================
# Phase 3: Identity
# =============================================================================
phase_identity() {
    log "=== Phase 3: Identity ==="

    if dry_run; then
        info "[DRY_RUN] Would deploy SSH keys to ~/.ssh/"
        info "[DRY_RUN] Would configure git identity"
        info "[DRY_RUN] Would authenticate gh with PAT"
        info "[DRY_RUN] Would verify SSH and gh access"
        log "Phase 3 complete (dry run)."
        return
    fi

    # --- SSH keys ---
    log "Deploying SSH keys..."
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh

    # Find and deploy SSH key files dynamically
    for keyfile in "$SECRETS_DIR"/ssh/id_*; do
        [[ -e "$keyfile" ]] || continue
        local basename
        basename="$(basename "$keyfile")"
        log "  Deploying $basename"
        cp "$keyfile" "$HOME/.ssh/$basename"
        if [[ "$basename" == *.pub ]]; then
            chmod 644 "$HOME/.ssh/$basename"
        else
            chmod 600 "$HOME/.ssh/$basename"
        fi
    done

    # Deploy SSH config if present
    if [[ -f "$SECRETS_DIR/ssh/config" ]]; then
        log "  Deploying ssh config"
        cp "$SECRETS_DIR/ssh/config" "$HOME/.ssh/config"
        chmod 600 "$HOME/.ssh/config"
    fi

    # Start ssh-agent and add key
    log "Starting ssh-agent..."
    eval "$(ssh-agent -s)"
    for keytype in ed25519 ecdsa rsa; do
        if [[ -f "$HOME/.ssh/id_${keytype}" ]]; then
            ssh-add "$HOME/.ssh/id_${keytype}"
            break
        fi
    done

    # --- Git config ---
    log "Configuring git identity..."
    local git_name git_email
    git_name="$(grep '^name=' "$SECRETS_DIR/gitconfig" | cut -d= -f2-)"
    git_email="$(grep '^email=' "$SECRETS_DIR/gitconfig" | cut -d= -f2-)"

    if [[ -n "$git_name" ]]; then
        git config --global user.name "$git_name"
        log "  user.name = $git_name"
    fi
    if [[ -n "$git_email" ]]; then
        git config --global user.email "$git_email"
        log "  user.email = $git_email"
    fi

    # --- GitHub CLI auth ---
    log "Authenticating GitHub CLI..."
    gh auth login --with-token < "$SECRETS_DIR/github_pat"
    gh config set git_protocol ssh

    # --- Verification ---
    log "Verifying access..."

    log "  SSH:"
    ssh -T git@github.com 2>&1 || true  # github returns exit 1 even on success

    log "  GitHub CLI:"
    gh auth status

    log "Phase 3 complete."
}

# =============================================================================
# Main
# =============================================================================
main() {
    echo ""
    log "SkogAI Bootstrap"
    log "================"
    echo ""

    if dry_run; then
        warn "DRY_RUN mode enabled — no changes will be made."
        echo ""
    fi

    preflight
    phase_foundation
    phase_secrets
    phase_identity

    echo ""
    log "Bootstrap complete!"
    log "Next steps:"
    log "  gh repo clone SkogAI/claude ~/claude"
    log "  gh repo clone SkogAI/skogansible ~/.ansible"
    echo ""
}

main "$@"
