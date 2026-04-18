---
title: README
type: note
permalink: claude/projects/dot-skogai/scripts/readme
---

# Scripts Directory

This directory contains scripts for agent workspace automation and operations.

## Structure

```txt
scripts/
├── context/                    # Context generation scripts
│   ├── context.sh              # Main context orchestrator
│   ├── context-enhanced.sh     # Enhanced orchestrator (outputs to tmp/context.md)
│   ├── context-claude.sh       # Claude-specific context
│   ├── context-claude-enhanced.sh # Enhanced Claude context
│   ├── context-end.sh
│   ├── context-env.sh
│   ├── context-git.sh
│   ├── context-git-diff.sh
│   ├── context-git-log.sh
│   ├── context-git-status.sh
│   ├── context-git-status-verbose.sh
│   ├── context-interaction.sh
│   ├── context-journal.sh
│   ├── context-memory.sh
│   ├── context-message.sh
│   ├── context-model.sh
│   ├── context-path.sh
│   ├── context-persona.sh
│   ├── context-regular-git-diff.sh
│   ├── context-start.sh
│   ├── context-todo.sh
│   └── context-workspace.sh
├── utils/                      # Utility scripts
│   ├── search.py               # Python search
│   ├── search.sh               # Multi-source search across workspace
│   ├── wordcount.py            # Word/token counting
│   ├── state-status.py         # State status reporting
│   └── migrate-journals.py     # Journal migration (flat → subdirectory)
├── bootstrap/                  # Bootstrap and init scripts
│   ├── bootstrap.sh            # Submodule bootstrap (creates branch, symlinks)
│   ├── consumer-init.sh        # Test harness for bootstrap
│   └── symlink.sh              # Symlink helper
├── github/                     # GitHub integration (context-gh.sh, repo-status.sh)
├── pre-commit/                 # Pre-commit hooks
├── precommit/                  # Pre-commit validation scripts
├── runs/                       # Autonomous run infrastructure
├── status/                     # Status scripts
├── workspace_validator/        # Workspace validation
├── __init__.py                 # Python package marker
├── claude-question.sh          # claude -p wrapper for one-shot queries
└── skogai-helper-functions.sh  # Sourceable helper functions
```

## Context Generation System

The context scripts in `scripts/context/` gather dynamic context for AI agent sessions.

### Main Scripts

**context.sh** - Orchestrates context from multiple providers (journal, workspace, tasks, git).

```bash
./scripts/context/context.sh
```

**context-enhanced.sh** - Enhanced orchestrator that writes output to `tmp/context.md`.

```bash
./scripts/context/context-enhanced.sh --display
```

### Component Scripts

Each `context-*.sh` script generates a section of context:

- **context-journal.sh** - Recent journal entries
- **context-workspace.sh** - Workspace structure overview
- **context-git*.sh*\* - Git status, diff, log
- **context-claude*.sh*\* - Claude-specific context
- **context-env.sh** - Environment info
- **context-memory.sh** - Memory context
- **context-persona.sh** - Agent persona
- **context-todo.sh** - Task/todo context

## Bootstrap

```bash
# For consumer projects using .skogai as submodule
git submodule add git@github.com:SkogAI/.skogai .skogai
(cd .skogai && ./scripts/bootstrap/bootstrap.sh)
```

## Utilities

```bash
./scripts/utils/search.sh "query"           # Search across workspace
./scripts/utils/migrate-journals.py          # Dry run journal migration
./scripts/utils/migrate-journals.py --execute # Execute migration
```

## Related

- gptme.toml - Context command configuration
- state/README.md - Work queue system
- scripts/runs/autonomous/README.md - Autonomous run details
