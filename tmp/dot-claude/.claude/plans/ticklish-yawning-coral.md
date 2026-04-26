# Plan: Permanent Dolt + Beads Setup with Bootstrap Integration

## Context

Dolt sql-server currently runs via the `gt` daemon system (`/home/skogix/gt/daemon/`) — a custom process manager that isn't part of the standard system boot. If the machine reboots, dolt doesn't come back automatically. Beads (`bd`) depends on this server for all issue tracking.

The bootstrap repo (`/home/skogix/bootstrap/`) already has `dolt` in pacman packages and `beads-git` in AUR packages, but nothing to configure them post-install: no systemd service, no dolt config, no beads initialization.

## What We'll Do

### 0. SKOGIX/USER REQUESTS

- please use skogai-dolt as the systemd service
- please use /home/skogix/.config/systemd/skogai-*-start.sh as the start script for the service, following the pattern of the other scripts. i wish i had the time to set up a real system for it to begin with but alas i do not, so this is the best i can do for now.
- please separate "bd" from "gt" as best you can and 100% keep dolt out of it all together.

### 1. Create a systemd user service for dolt sql-server

**File**: `~/.config/systemd/user/dolt-server.service`

Follows the existing pattern from `skogai-skogapi.service`. The service will:

- Run `dolt sql-server --port 3307 --data-dir ~/.config/dolt/dbs --max-connections 200`
- Use the standard data dir (`~/.config/dolt/dbs/`) which already contains the DoltHub `skogix/claude` database
- Also serve beads databases by moving/symlinking them into the same data dir (or keeping the gt data dir — see question below)
- Auto-restart on failure, start on login

### 2. Dolt data directory: `~/.config/dolt/dbs/`

The systemd service manages `~/.config/dolt/dbs/` only. This is independent from gt (`/home/skogix/gt/.dolt-data/`). gt stays as-is on port 3307 — beads continues using gt for now.

The systemd dolt server runs on port **3306** (standard MySQL port), serving:

- `skogix/claude` (already there, DoltHub remote configured)
- Any future databases created in `~/.config/dolt/dbs/`

No migration of beads data. No touching gt.

### 4. Add bootstrap role for dolt + beads

**New role**: `/home/skogix/bootstrap/roles/dolt/`

```
roles/dolt/
├── tasks/
│   └── main.yml       # Install, configure, enable service
├── templates/
│   ├── dolt-server.service.j2
│   └── dolt-start.sh.j2
└── defaults/
    └── main.yml       # dolt_port, dolt_data_dir, etc.
```

Tasks:

1. Ensure `dolt` package is installed (already in packages list — just a dependency marker)
2. Create `~/.config/dolt/dbs/` data directory
3. Deploy systemd user service from template
4. Enable and start the service (`systemctl --user enable --now dolt-server`)
5. Initialize dolt global config (user.name, user.email)
6. Add DoltHub remote for `skogix/claude` if not present

### 5. Wire dolt role into bootstrap playbook

Add `dolt` role to `playbooks/bootstrap.yml` after `secrets`. Beads stays gt-managed — no bootstrap role needed for it.

## No Migration Needed

gt stays on port 3307 with its own data. The new systemd service is independent on port 3306.

## Files to Create/Modify

| File | Action |
|------|--------|
| `~/.config/systemd/user/dolt-server.service` | Create |
| `~/.config/systemd/dolt-start.sh` | Create (start script) |
| `~/bootstrap/roles/dolt/tasks/main.yml` | Create |
| `~/bootstrap/roles/dolt/templates/dolt-server.service.j2` | Create |
| `~/bootstrap/roles/dolt/defaults/main.yml` | Create |
| `~/bootstrap/playbooks/bootstrap.yml` | Edit — add dolt role |

## Verification

1. `systemctl --user status dolt-server` — active and running
2. `mysql -h 127.0.0.1 -P 3306 -u root -e "SHOW DATABASES"` — lists skogix/claude db
3. `dolt log` in `~/.config/dolt/dbs/skogix/claude/` — shows commit history
4. Reboot test: service comes back automatically
5. gt/beads unaffected: `bd dolt test` still works on port 3307
