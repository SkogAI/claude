# Plan: New Auto-Sync System

## Context

The current `scripts/` directory has three beta scripts (`csync.sh`, `cgit.sh`, `clog.sh`) that were proof-of-concepts. They use relative paths, chain through each other, and aren't wired to any hooks. `claude-dotfiles` in `~/.local/bin/` is another temporary wrapper.

We need a **new, permanent solution**: self-contained scripts that do the actual work directly (no wrapper chains), are wired into Claude Code hooks, and work from any CWD.

## Architecture

```
~/claude/scripts/
  csync.sh     — THE sync script. rsync + bare git + local git + push. Self-contained.
  clog.sh      — view recent commits from both repos
  fetch-docs.sh — download Claude Code docs for offline reference
```

Each script:
- Uses absolute paths and inline git flags — no wrappers, no dependencies on other scripts
- Works from any CWD
- Is suitable as a hook target, cron job, or manual call

## Step 1: Create `scripts/csync.sh` (replace existing)

```bash
#!/usr/bin/env bash
set -euo pipefail

LOCK="/tmp/csync.lock"
exec 9>"$LOCK"
flock -n 9 || exit 0

TS=$(date +%H:%M:%S)

# rsync ~/.claude/ state into ~/claude/global/
for d in cache plans memories teams tasks projects transcripts session-env usage-data commands agents skills hooks; do
  [ -d "$HOME/.claude/$d" ] && rsync -a "$HOME/.claude/$d/" "$HOME/claude/global/$d/"
done

# bare repo — tracks ~/.claude/ via /mnt/sda1/claude-global.git
git --git-dir=/mnt/sda1/claude-global.git --work-tree="$HOME" add "$HOME/.claude/"
git --git-dir=/mnt/sda1/claude-global.git --work-tree="$HOME" add -u
git --git-dir=/mnt/sda1/claude-global.git --work-tree="$HOME" commit -m "auto-sync $TS" --no-verify || true
git --git-dir=/mnt/sda1/claude-global.git --work-tree="$HOME" push || true

# local repo — tracks ~/claude/
git -C "$HOME/claude" add -A
git -C "$HOME/claude" commit -m "auto-sync $TS" --no-verify || true
git -C "$HOME/claude" push || true
```

No wrappers. Direct `git --git-dir=... --work-tree=...` for the bare repo. `git -C` for the local repo. `flock` prevents concurrent runs.

## Step 2: Create `scripts/clog.sh` (replace existing)

```bash
#!/usr/bin/env bash
echo "=== bare repo ==="
git --git-dir=/mnt/sda1/claude-global.git --work-tree="$HOME" log --oneline -20

echo ""
echo "=== local repo ==="
git -C "$HOME/claude" log --oneline -20
```

## Step 3: Delete `scripts/cgit.sh`

Dead script. The bare repo ops are now inline in csync.sh and clog.sh.

## Step 4: Wire hooks in `.claude/settings.json`

Add `hooks` key to existing project settings at `~/claude/.claude/settings.json`:

```json
"hooks": {
  "Stop": [
    {
      "hooks": [
        {
          "type": "command",
          "command": "/home/skogix/claude/scripts/csync.sh",
          "timeout": 30
        }
      ]
    }
  ],
  "UserPromptSubmit": [
    {
      "hooks": [
        {
          "type": "command",
          "command": "/home/skogix/claude/scripts/csync.sh",
          "timeout": 30
        }
      ]
    }
  ],
  "SessionEnd": [
    {
      "hooks": [
        {
          "type": "command",
          "command": "/home/skogix/claude/scripts/csync.sh",
          "timeout": 30
        }
      ]
    }
  ]
}
```

## Step 5: Create `scripts/fetch-docs.sh`

Downloads all Claude Code docs from code.claude.com for offline reference:

```bash
#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/claude/docs/claude-code"
mkdir -p "$DIR"
BASE="https://code.claude.com/docs/en"

for page in \
  agent-teams amazon-bedrock analytics authentication best-practices \
  changelog checkpointing chrome claude-code-on-the-web cli-reference \
  common-workflows costs data-usage desktop desktop-quickstart \
  devcontainer discover-plugins fast-mode features-overview \
  github-actions gitlab-ci-cd google-vertex-ai headless hooks \
  hooks-guide how-claude-code-works interactive-mode jetbrains \
  keybindings legal-and-compliance llm-gateway mcp memory \
  microsoft-foundry model-config monitoring-usage network-config \
  output-styles overview permissions plugin-marketplaces plugins \
  plugins-reference quickstart remote-control sandboxing security \
  server-managed-settings settings setup skills slack statusline \
  sub-agents terminal-config third-party-integrations troubleshooting \
  vs-code zero-data-retention; do
  curl -sL "$BASE/${page}.md" -o "$DIR/${page}.html"
done
```

## Step 6: Update `CLAUDE.md`

Update scripts and hooks sections to reflect the new setup. Remove `cgit.sh` reference.

## Verification

1. Run `csync.sh` from `/tmp/` — must work (absolute paths)
2. Run `csync.sh & csync.sh` — second should exit silently (flock)
3. Start a session — verify hooks fire on Stop and UserPromptSubmit
4. Run `fetch-docs.sh` — verify docs land in `docs/claude-code/`
5. Run `clog.sh` from anywhere — verify output
