#!/usr/bin/env bash
# Auto-commit changes in both claude repos

TS="$(date +%H:%M:%S)"

# sync important dirs to ./global/ (add-only, never delete)
for dir in cache plans memories teams tasks projects transcripts session-env usage-data commands agents skills hooks; do
  [ -d ~/.claude/$dir ] && rsync -a ~/.claude/$dir/ ./global/$dir/
done

# bare repo: everything in ~/.claude/
./scripts/cgit.sh add ~/.claude/
./scripts/cgit.sh add -u
./scripts/cgit.sh commit -m "auto-sync $TS" --no-verify || true

# home repo
git add -A
git commit -m "auto-sync $TS" --no-verify || true
git push
claude-dotfiles push
