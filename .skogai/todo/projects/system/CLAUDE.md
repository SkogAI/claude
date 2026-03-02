# System Project

This project manages system-level administration for `skogix-workstation` — the stuff that lives below the user's dotfiles and apps. Networking, drivers, disks, services, boot config, firewall, and anything that requires `sudo` to change.

## Scope

- Network configuration (interfaces, DNS, firewall)
- Disk and filesystem management (LVM, fstab, mounts)
- Kernel, boot, and hardware (systemd-boot, nvidia, audio)
- System services (systemd units, timers)
- Security (firewall, certificates)

Things that do **not** belong here: user dotfiles (`projects/dotfiles`), git/GitHub config (`projects/git`), application-level setup.

## Key Files

| File | Purpose |
|---|---|
| `SKOGAI.md` | Inventory of current system state — hardware, network, desktop, locale, installed software. Quick-reference key-value format. Update when state changes. |
| `TODO.md` | Pending tasks with context and commands. Check items off as they're completed. |
| `NETWORKING.md` | Detailed notes on the network setup, the IPv4/DHCP conflict, applied fix, and revert instructions. |
| `DECISIONS.md` | Log of choices and reasoning (create when first decision is logged). |

## Workflow

1. Check @INBOX.list for new items — one per line, append-only. Pick up items, execute or discuss, then remove processed lines.
2. Check `SKOGAI.md` to understand what's currently configured
3. Check `TODO.md` for pending work
4. After making changes, update `SKOGAI.md` with new facts and check off completed items in `TODO.md`
5. Log non-obvious decisions in `DECISIONS.md` with reasoning

## Files to read

- @SKOGAI.md - system inventory (hardware, network, desktop, locale, packages)
- @TODO.md - pending system tasks
- @NETWORKING.md - network setup details and IPv4/DHCP workaround
- @INBOX.list - incoming items
