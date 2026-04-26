# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

One-liner bootstrap for fresh Arch Linux installs. Installs packages via pacman, decrypts a PAT with ansible-vault, authenticates gh and clones github repositories.
## Usage

See @README.md

## How it works

1. Install and update packages via pacman.
2. `ansible-vault view ./pat.vault | gh auth login --with-token`
4. `gh repo clone skogix/secrets ~/.ssh`

## Vault management

```bash
ansible-vault encrypt pat --output pat.vault   # encrypt plaintext PAT
ansible-vault decrypt pat.vault --output pat    # decrypt to plaintext
```
