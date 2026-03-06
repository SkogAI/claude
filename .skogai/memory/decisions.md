# decision log

## 2026-02-27

- **argc for scripts**: Using argc as standard framework for .skogai/scripts/ - provides validation, help, type safety with minimal boilerplate
- **XML-style tags**: SKOGAI.md files use `<what_is_this>`, `<structure>`, `<when_to_use>` tags for consistency (historical reason: earlier Claude models preferred this format)
- **@ notation**: Using `@` prefix for references (bootstrap, config) and `$` for variables/state
- **@ is source of truth**: `@/path` expands real files at prompt-time; Read tool often uses cached files
- **@ in SKOGAI.md**: Always use `@` references for context that must be current - bypasses cache layer
