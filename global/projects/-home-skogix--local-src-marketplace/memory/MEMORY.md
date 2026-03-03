# Marketplace Memory

## Known Bugs

- `plugins/core/hooks/pre-tool-use.sh` reads stdin twice, causing all 9 blocking patterns to fail silently. Stdin is consumed on first read, second read gets empty input. (Discovered 2026-02-18, task #68)

## Project State

- Only 2 plugins exist: `core` (v0.0.5) and `skogai-dreamers` (v0.0.2)
- `.claude-mem/` (SQLite + vector DB) was removed
- `lesson_matcher.py` added to core hooks
- `tasks/` directory nuked 2026-03-03 — all 20 task files were stale (referenced removed plugins)

## Conventions

- Single source of truth: `.claude-plugin/marketplace.json`
- Always `strict: false` — no plugin.json in plugin dirs
- Symlink `Argcfile.sh` into every plugin directory
- Hook scripts log to `/tmp/<session-id>-<hookname>.json`
