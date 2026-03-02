# Git Configuration

Canonical reference for git identity, auth, and conventions across all projects.

## Identity

- **GitHub user:** [Skogix](https://github.com/Skogix)
- **Git email:** `emil@skogsund.se`
- **Git name:** `Emil Skogsund`

## Authentication

- **Method:** SSH (preferred over HTTPS)
- **Key:** `~/.ssh/id_ed25519_gh_user_skogix` (ed25519, passphrase-protected)
- **GitHub CLI:** authenticated via `gh auth` with SSH protocol
- **Token scopes:** `admin:public_key`, `gist`, `read:org`, `repo`

## Conventions

- Always use SSH URLs for remotes (`git@github.com:Skogix/...`)
- GitHub CLI (`gh`) is the primary tool for repo/PR/issue management

## Status

- SSH key registered on GitHub account
- Key is passphrase-protected — requires a running `ssh-agent` (see `projects/dotfiles`)
