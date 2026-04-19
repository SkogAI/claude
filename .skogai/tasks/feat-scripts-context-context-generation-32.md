---
created: 2026-04-18
permalink: claude/tasks/feat-scripts-context-context-generation-32
state: active
tracking:
- https://github.com/SkogAI/claude/issues/32
---

# feat: scripts/context/ — context generation scripts

**Source**: [Github #32](https://github.com/SkogAI/claude/issues/32)

## Description

Shell scripts that generate system prompt context for AI agents from project state.

## Structure

```
.skogai/scripts/context/
├── context.sh           # orchestrator, calls component scripts
├── context-git.sh       # git status + recent commits
├── context-workspace.sh # workspace tree
├── context-journal.sh   # recent journal/memory entries
└── context-memory.sh    # current.md contents
```

## Notes

- All scripts accept optional `AGENT_DIR` argument (defaults to git root)
- Output is markd

## Notes

*Imported from external tracker. See source link for full context.*

## Completion

- Context script suite exists under `.skogai/scripts/context/`
- Orchestrator and component scripts are present, including root detection and prompt builder

## Verification

Confirmed presence of:

- `context.sh` and all `context-*.sh` component scripts listed in task scope
- `build-system-prompt.sh`
- `find-agent-root.sh`
- `tasks.py`

## Notes

*Imported from external tracker. Updated locally with completion details.*