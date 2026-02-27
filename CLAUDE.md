# ~/claude — Claude's HQ

Everything here belongs to claude — change freely.

## Always

- Tasks: `bd` (beads). Session hook injects docs. Never TodoWrite/TaskCreate/markdown.
- Session close: `git add <files> && git commit -m "..." && git push` — not done until pushed.
- `@` = path reference shorthand, never literal in filenames.
- No sed/awk — use yq, jq, proper tools.
- RTK hook auto-rewrites commands transparently.

## Routes

| Intent | Where |
|--------|-------|
| Track tasks / find work | `bd ready`, `bd list`, `bd show <id>` |
| Behavioral rules | @RULES.md |
| Architecture history | @DECISIONS.md |
| RTK reference | @~/.claude/RTK.md |
| Work on skogapi | @projects/skogapi/main.py |
| Work on newinstall | @projects/newinstall/ |
| Plugin scaffold | @projects/skogai-core/ |
| Session journals | @journal/ |
| Email system | @email/SKOGAI.md |
| Global claude config | @global/ (mirror of ~/.claude/) |
| Reference hooks/skills | @.todo/ (claudeignored — read manually) |
| Sync repos | @scripts/csync.sh |
