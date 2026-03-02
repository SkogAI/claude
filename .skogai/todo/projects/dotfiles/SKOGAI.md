# dotfiles project summary

## Bare Repo Setup

Dotfiles are managed via a bare git repo:

- **Git dir:** `/mnt/sda1/demodotfiles.git`
- **Work tree:** `$HOME`
- **Command:** `dotfiles <git subcommand>` (wrapper in `~/bin/`)

Examples: `dotfiles status`, `dotfiles add ~/.bashrc`, `dotfiles commit -m "msg"`, `dotfiles push`.

## Philosophy

Explicit over minimal — config files are checked in with full context, not stripped-down snippets. See @DECISIONS.md for reasoning on individual config choices.

## Managed Configs

- `~/.config/i3/config` — i3 window manager. Catppuccin Mocha theme, vim hjkl navigation, Dvorak-friendly bindings.
