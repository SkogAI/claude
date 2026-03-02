# Decision Log

Active choices and reasoning during system setup. Newest entries at the bottom.

## 2026-02-10 — Initial Install

### Base system via archinstall
- LVM on NVMe for flexible partition management
- Separate `/home` partition spanning two LVM physical volumes
- zram for swap (no swap partition) — avoids SSD wear for swap
- systemd-boot (not GRUB) — simpler for UEFI-only systems
- nvidia-open-dkms — open kernel modules for GTX 1070, paired with dkms + linux-headers for automatic rebuilds on kernel updates
- i3 as WM — tiling, keyboard-driven, minimal

### Mounted old drive
```
sudo mkdir /mnt/sda1 && sudo mount /dev/sda1 /mnt/sda1
```
Extra SATA drive from previous installs. Contains backups, old projects (skogai, etc.), Steam library. Mounted manually — not added to fstab yet since we may want to reorganize before committing to a mount point.

### Installed Claude Code
```
curl -fsSL https://claude.ai/install.sh | bash
```
Installed to `~/.local/bin`. Added PATH export to `.bashrc`.

### System update + core packages
```
sudo pacman -Syu chromium git github-cli
```
- **chromium** — open-source browser, available in official repos (tried google-chrome but it's AUR-only)
- **git + github-cli** — version control essentials

### Bitwarden
```
sudo pacman -Syu bitwarden
```
Password manager. Desktop app from official repos.

### GitHub CLI auth
```
gh auth login --git-protocol ssh --web
```
Chose SSH protocol for git operations. Web-based auth flow. Note: auth did not persist into current session — needs to be re-done.

### Kitty terminal
```
sudo pacman -Syu kitty
```
Chose kitty over default xterm — GPU-accelerated, better font rendering, configurable.

### Keyboard layout
```
setxkbmap se -variant us_dvorak -option caps:swapescape
```
- **se us_dvorak** — Swedish international Dvorak layout (US Dvorak with Swedish characters accessible)
- **caps:swapescape** — Escape on CapsLock position, essential for vim workflow
- Persisted in `~/.bashrc` with `2>/dev/null` to suppress errors in non-X contexts (e.g. TTY, SSH)

### Neovim
```
sudo pacman -Syu neovim
```
Primary editor. Vim user — vi-style bindings are the default everywhere (editor, shell, WM, TUI tools, browser extensions, Claude Code). Neovim over vim for better defaults, Lua config, and plugin ecosystem.

### Working conventions for Claude Code sessions
Added a "Working Conventions" section to CLAUDE.md that instructs every fresh instance to:
- Update DECISIONS.md with reasoning when making changes
- Keep CLAUDE.md state accurate
- Verify installed packages with `pacman -Qe` rather than trusting the static list

**Handover model:** Between sessions, the user will provide a compact summary of prior work to bring the new instance up to speed. The goal is that CLAUDE.md and DECISIONS.md become self-sufficient over time so the manual compact is no longer needed — the docs themselves carry full context.

### TODO.md
Added a persistent `TODO.md` with markdown checkboxes (`- [ ]` / `- [x]`). Replaces the inline "Pending Setup" section in CLAUDE.md — single source of truth for outstanding tasks. CLAUDE.md now links to it under a "Tracking" section alongside DECISIONS.md.

### projects/ directory structure
Introduced `~/projects/` as the top-level organizational layer. Three initial projects:
- **git** — GitHub CLI auth, git global config, SSH keys, repo management
- **dotfiles** — user-level configuration files (i3, kitty, neovim, bashrc, etc.)
- **system** — sysadmin concerns: fstab, drivers, networking, services

TODO.md sections now map 1:1 to project folders. No git repos initialized yet — that comes later when each project has content worth tracking.

Note: the user uses `@` as a conversational shorthand for referencing paths (e.g., `@projects/git` means `./projects/git`). The `@` is never part of the actual filesystem path.

### Networking fix
IPv4 ACD conflict resolved. Details in `projects/system/NETWORKING.md`.

### Claude Code project (`projects/claude-code/`)
Created to own all Claude Code configuration concerns. Primary driver: the claude.ai web interface injects a large number of MCP servers (Cloudflare suite, Hugging Face, Linear, arch-tools) into every CLI session. These need auditing — most are noise for this system. The project also covers plugins, hooks, keybindings, settings, memory, and CLAUDE.md management. Detailed TODO in `projects/claude-code/TODO.md`.

### Claude Code role: planner/orchestrator (refined)
Claude Code is autonomous and decisive — it owns the big picture, not the user. The workflow:
- **TODO.md Inbox** is the primary interface. The user dumps vague ideas there. Claude picks them up, fleshes them out (asking only what it genuinely can't figure out), moves them to concrete project sections, and executes.
- **"Discuss" means propose, not interview.** Come with a plan and a recommendation, not a list of open-ended questions.
- **Direct requests get done directly.** "Add X to TODO" → add it. "Set up Y" → plan and do it. Don't turn simple asks into scoping exercises.

Previous version was too passive — treated every action as needing explicit approval, which put the decision-making burden on the user instead of Claude. Codified in CLAUDE.md under "Role: Planner/Orchestrator".

### `.list` format and inbox convention
Introduced `.list` as a file format for append-only flat lists — one item per line, no markup. Primary use: `INBOX.list` files as the intake mechanism for every project.

- `~/INBOX.list` — top-level catch-all for unsorted ideas
- `projects/*/INBOX.list` — project-scoped inboxes

Why `.list` over `.md`: The format encodes the contract in the filename. Markdown invites structure (headings, checkboxes, formatting) which defeats quick-capture. `.list` says "just append a line." Converted the existing `projects/dotfiles/INBOX.md` to this format.

Workflow: Claude reads all `INBOX.list` files at session start, discusses items with the user, then either executes or moves them into proper task tracking. Processed lines get removed.

### File & directory conventions documentation
Consolidated the scattered sections in CLAUDE.md (Project Structure, Custom Tools, .list Format, Tracking) into a single "File & Directory Conventions" section. Covers:
- How CLAUDE.md auto-loading works (walks up from cwd, not down/sideways)
- Directory layout with purpose for each path
- Standard file types across all projects (CLAUDE.md, INBOX.list, TODO.md, DECISIONS.md, STATE.md, README.md)
- File format conventions (`.md` for structured docs, `.list` for append-only flat files)
- Inbox workflow end-to-end
- Custom tools reference

Key insight documented: the top-level ~/CLAUDE.md must summarize anything from child directories that every instance needs, because project-level CLAUDE.md files only load when cwd is inside that project.
