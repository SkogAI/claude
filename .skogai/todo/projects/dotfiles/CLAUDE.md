# dotfiles

This project manages all user-level dotfiles and configuration for the system. It is the canonical source for configs like i3, kitty, neovim, bashrc, and any other user-facing tooling.

## Dotfiles Bare Repo

Dotfiles are managed via a bare git repo. The `dotfiles` command (in `~/bin/`) wraps `git` with:

- **Git dir:** `/mnt/sda1/demodotfiles.git`
- **Work tree:** `$HOME`

Usage: `dotfiles <any git subcommand>` — e.g. `dotfiles status`, `dotfiles add ~/.bashrc`, `dotfiles commit -m "msg"`, `dotfiles push`.

## Workflow

Check @INBOX.list at the start of each session. It contains the user's "things I want done" list — pick up items, figure out what's needed, and execute. When figuring out what's needed, **ask the user first** before researching — the user has the answer 99% of the time and it won't be found on the local system.

## Files to read

- @SKOGAI.md - bare repo setup and config philosophy
- @DECISIONS.md - config choices and reasoning
- @INBOX.list - incoming items
