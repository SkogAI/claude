# decision log

## 2026-01-20

- **argc for scripts**: Using argc as standard framework for .skogai/scripts/ - provides validation, help, type safety with minimal boilerplate
- **meta-usage**: .skogai uses itself (.skogai/.skogai/) for dogfooding - proves the framework works
- **XML-style tags**: SKOGAI.md
 files use `<what_is_this>`, `<structure>`, `<when_to_use>` tags for consistency (historical reason: earlier Claude models preferred this format)
- **@ notation**: Using `@` prefix for references (bootstrap, config) and `$` for variables/state
- **Submodule approach**: .skogai distributed as git submodule on `dot-skogai` branch for easy project integration
- **Project branches**: Each consumer gets own branch (project dir name) for customization while tracking upstream
- **Symlink dogfooding**: Instead of submodule inception, use symlink + `.git/info/exclude` - cleaner, no git complexity
- **Modern git**: `git switch --create`, `git submodule set-branch` over legacy `checkout -b`
- **Helper architecture**: `skogai-helper-functions.sh` is sourceable, designed for 500-1000 helpers
- **file command**: `file .git` / `file .skogai` cleanly detects all modes (submodule, symlink, real repo)
- **@ is source of truth**: `@/path` expands real files at prompt-time; Read tool often uses cached files
- **@ in SKOGAI.md
**: Always use `@` references for context that must be current - bypasses cache layer
