# Bootstrap Project Memory

## Project Structure
- `bootstrap.sh` — entry point, installs packages + gh auth + ansible
- `playbooks/bootstrap.yml` — runs roles: users, packages, secrets, bitwarden
- `roles/` — ansible roles (users, packages, secrets, bitwarden, dolt)
- `vars/` — main.yml (user info), packages.yml (pacman + AUR lists)
- `pat.vault` — ansible-vault encrypted GitHub PAT

## Key Patterns
- Commit messages are terse (2-5 words typical)
- rbw config uses JSON format (`~/.config/rbw/config.json`), NOT TOML
- Packages role handles all package installation; other roles shouldn't duplicate

## Lessons
- Previous AI sessions created 68 troubleshooting files for bitwarden setup — cleaned up 2026-02-27
- Keep roles minimal: config + reminder, don't over-document
