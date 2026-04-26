# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

One-liner bootstrap for fresh Arch Linux installs. Installs github-cli, decrypts a PAT from an ansible-vault, authenticates gh, and clones `skogix/secrets` to `~/.ssh/`.

## Usage

```bash
curl -fsSL https://raw.githubusercontent.com/SkogAI/bootstrap/master/bootstrap.sh | bash
```

## How it works

1. `pacman -S` github-cli, uv, ansible-core
2. `curl` + `ansible-vault decrypt` the encrypted PAT (`pat.vault`)
3. `gh auth login --with-token` with the PAT
4. `gh repo clone skogix/secrets ~/.ssh`

## Vault management

```bash
ansible-vault encrypt pat --output pat.vault   # encrypt plaintext PAT
ansible-vault decrypt pat.vault --output pat    # decrypt to plaintext
```

## Environment Variables

- `VAULT_PASSWORD` — skip interactive vault password prompt (for CI/headless)
