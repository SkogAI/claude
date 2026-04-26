#!/usr/bin/env bash
# bootstrap.sh — Bootstrap for fresh Arch Linux
# git clone https://github.com/SkogAI/bootstrap && cd bootstrap && ./bootstrap.sh
set -euo pipefail

log() { printf '\033[0;32m[+]\033[0m %s\n' "$*"; }

# Install minimum deps
log "Installing base packages..."
sudo -A pacman -S --needed --noconfirm github-cli uv ansible-core git

# Setup ansible via uv
log "Setting up ansible..."
uv venv --seed --clear
source .venv/bin/activate
uv tool install ansible-core

# Auth gh
log "Authenticating gh..."
ansible-vault view ./pat.vault | gh auth login --with-token
gh auth status

# Install ansible collections and run playbook
log "Running ansible..."
ansible-galaxy collection install -r .requirements.yml
ansible-playbook playbooks/bootstrap.yml
