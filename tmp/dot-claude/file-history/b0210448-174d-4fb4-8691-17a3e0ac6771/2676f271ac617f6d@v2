#!/usr/bin/env bash
# bootstrap.sh — One-liner bootstrap for fresh Arch Linux
# curl -fsSL https://raw.githubusercontent.com/SkogAI/bootstrap/master/bootstrap.sh | bash
set -euo pipefail

VAULT_URL="https://raw.githubusercontent.com/SkogAI/bootstrap/master/pat.vault"
SECRETS_REPO="skogix/secrets"

err() { printf '\033[0;31m[!]\033[0m %s\n' "$*" >&2; }
log() { printf '\033[0;32m[+]\033[0m %s\n' "$*"; }

cleanup() { rm -f /tmp/pat.vault /tmp/pat; }
trap cleanup EXIT

# Preflight
[[ -f /etc/arch-release ]] || { err "Arch Linux only"; exit 1; }
[[ $EUID -ne 0 ]]         || { err "Don't run as root"; exit 1; }

# Install deps
log "Installing packages..."
sudo pacman -S --needed --noconfirm github-cli uv ansible-core > /dev/null

# Decrypt PAT
log "Fetching vault..."
curl -fsSL "$VAULT_URL" -o /tmp/pat.vault

if [[ -n "${VAULT_PASSWORD:-}" ]]; then
    echo "$VAULT_PASSWORD" | ansible-vault decrypt /tmp/pat.vault \
        --output /tmp/pat --vault-password-file /dev/stdin
else
    ansible-vault decrypt /tmp/pat.vault --output /tmp/pat \
        --vault-password-file <(read -rsp "Vault password: " pw < /dev/tty && echo && echo "$pw")
fi

# Auth and clone secrets
log "Authenticating gh..."
gh auth login --with-token < /tmp/pat

log "Cloning secrets to ~/.ssh..."
gh repo clone "$SECRETS_REPO" ~/.ssh 2>/dev/null || {
    # If ~/.ssh exists, pull instead
    git -C ~/.ssh pull
}
chmod 700 ~/.ssh
find ~/.ssh -name "id_*" ! -name "*.pub" -exec chmod 600 {} \;
find ~/.ssh -name "*.pub" -exec chmod 644 {} \;

log "Done. SSH keys in ~/.ssh, gh authenticated."
