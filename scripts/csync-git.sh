#!/usr/bin/env bash
set -euo pipefail

LOCK="/tmp/csync-git.lock"
exec 9>"$LOCK"
flock 9

TS=$(date +%H:%M:%S)

# bare repo — tracks ~/.claude/
git --git-dir="/mnt/sda1/claude-global.git" --work-tree="/home/skogix" add "$HOME/.claude/"
git --git-dir="/mnt/sda1/claude-global.git" --work-tree="/home/skogix" add -u
git --git-dir="/mnt/sda1/claude-global.git" --work-tree="/home/skogix" commit -m "auto-sync $TS" --no-verify || true
git --git-dir="/mnt/sda1/claude-global.git" --work-tree="/home/skogix" push || true

# local repo — tracks ~/claude/
git -C "/home/skogix/claude" add -A
git -C "/home/skogix/claude" commit -m "auto-sync $TS" --no-verify || true
git -C "/home/skogix/claude" push || true
