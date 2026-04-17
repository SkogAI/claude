---
title: CLAUDE
type: note
permalink: skogai/skills/skogai-worktrunk/claude
---

# Claude Code Plugin Guidelines

## Skill Boundary

- **skogai-worktrunk** (this skill) = "How does this tool work?" — wt and gita tool configuration, operation details, hooks, permission models, submodule patterns, LLM commit setup.
- **skogai-git** = "What should I do?" — git workflows, commit philosophy, PR workflows, branch management, tool selection routing.

When a user asks about *workflow* (e.g. "how do I do a feature branch flow?"), route to skogai-git. When they ask about *configuration* (e.g. "how do I set up hooks?" or "what does wt config do?"), handle it here.

## Skills Directory Location

**Working solution**: Using `source: "./.claude-plugin"` in `marketplace.json` allows skills to remain in `.claude-plugin/skills/` ✅

Configuration in `marketplace.json`:

```json
{
  "source": "./.claude-plugin",
  "skills": ["./skills/worktrunk"]
}
```

Configuration in `plugin.json`:

```json
{
  "hooks": "./hooks/hooks.json",
  "skills": ["./skills/worktrunk"]
}
```

**Path resolution**:

- Source base: `./.claude-plugin`
- Skills: `./.claude-plugin + ./skills/worktrunk = ./.claude-plugin/skills/worktrunk` ✅
- Hooks: `./.claude-plugin + ./hooks/hooks.json = ./.claude-plugin/hooks/hooks.json` ✅

This approach keeps all Claude Code components organized together in `.claude-plugin/` and avoids root directory clutter.

**Note**: The official Claude Code documentation states "All other directories (commands/, agents/, skills/, hooks/) must be at the plugin root" but using the `source` field to point to `./.claude-plugin` makes paths relative to that directory, allowing this organizational structure.

**Why this works**: The `source` field in `marketplace.json` changes the base directory for path resolution. When `source: "./"` (the default), skills paths are resolved from the plugin root. When `source: "./.claude-plugin"`, skills paths are resolved from `.claude-plugin/`, allowing the entire plugin to be self-contained in one directory.
