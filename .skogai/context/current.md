# current context

## 2026-01-20: Building .skogai Framework

Currently working on establishing the `.skogai/` dotfolder framework for AI-augmented project development.

### What We're Building
- Tool-agnostic AI integration layer (works with Claude Code, Cursor, Aider, etc.)
- Intent-notation system for executable documentation
- Script infrastructure using argc for auto-validation
- Knowledge/memory/project tracking system
- Self-contained project framework that auto-activates

### Today's Progress
- ✓ Created base `.skogai/` structure (knowledge, memory, projects, inbox, templates, scripts)
- ✓ Established SKOGAI.md
 documentation pattern with XML-style tags
- ✓ Learned intent-notation system (`[@action:arg]`, operators, type algebra)
- ✓ Integrated argc for script framework (fizzbuzz example)
- ✓ Bootstrap mechanism: creates project branch, pushes, updates .gitmodules, commits
- ✓ Symlink dogfooding: `.skogai -> /home/skogix/.skogai` + `.git/info/exclude`

### Bootstrap Flow (for consumer projects)
```
git submodule add git@github.com:SkogAI/.skogai .skogai
(cd .skogai && ./scripts/bootstrap/bootstrap.sh)
```

Bootstrap detects submodule mode (`[ -f .git ]`), creates branch named after project, pushes, configures tracking.

### Mode Detection
```
file .skogai  → symbolic link  = dogfooding (development)
file .skogai  → directory      = submodule (consumer)
file .git     → directory      = real repo
file .git     → ASCII text     = submodule
```

### Dogfooding Setup
Instead of submodule inception (`.skogai/.skogai/` as submodule), use:
1. Symlink: `.skogai -> /home/skogix/.skogai`
2. Local exclude: `.git/info/exclude` contains `.skogai`

Result: Claude (me) uses `.skogai/scripts/...` paths as if consumer, no git complexity.

### Scripts
- `bootstrap.sh` - submodule init, creates project branch
- `consumer-init.sh` - test harness for bootstrap
- `skogai-helper-functions.sh` - sourceable helpers (will grow to 500-1000)
- `claude-question.sh` - `claude -p` wrapper for one-shot queries

### Next Steps
- Tests for scripts
- Git hooks (pre-commit/pre-push)
- Config layering (project overrides global)
