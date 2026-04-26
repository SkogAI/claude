---
title: CLAUDE
type: note
permalink: claude/tmp/dot-claude/plugins/cache/skogai-marketplace/core/0.0.5/claude
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Core Plugin Overview

This is the **core** plugin for the skogai-marketplace system. It provides foundational agents, commands, hooks, and utilities for Claude Code development workflows.

**Key Concept**: This plugin is part of a marketplace ecosystem where components are organized in a modular, composable architecture with lifecycle hooks for automation.

## Project Structure

```
plugins/core/
├── agents/              # specialized agent definitions
├── commands/            # command definitions (invokable via /command-name)
├── hooks/               # lifecycle hooks (session-start, pre-tool-use, etc.)
├── output-style/        # output formatting specifications
├── references/          # documentation and reference materials
├── scripts/             # utility scripts
├── servers/             # MCP server examples
├── skills/              # skill definitions
├── templates/           # reusable templates
├── workflows/           # workflow definitions
├── settings.json        # plugin configuration
└── Argcfile.sh         # argc-based CLI (symlinked from parent)
```

## Version Management

This plugin uses `argc` for version management and marketplace operations.

### Bumping Versions

**Command**: `/argc bump core [patch|minor|major]`

This command:

1. Calculates the new version based on bump type
1. Updates `marketplace.json` with the new version
1. Updates `changelog.md` with commit history
1. Creates a git commit with auto-generated message
1. Creates a git tag in format `core/vX.Y.Z`
1. Pushes commit and tag to remote (unless `--no-push`)
1. Refreshes marketplace cache (unless `--no-refresh`)
1. Installs the updated plugin

**Version Bump Rules**:

- **patch** (0.0.1 → 0.0.2): Bug fixes, documentation updates, minor improvements
- **minor** (0.0.2 → 0.1.0): New agents, commands, or skills
- **major** (0.1.0 → 1.0.0): Breaking changes, major reorganization

**Flags**:

- `--no-push`: Skip pushing to git remote
- `--no-refresh`: Skip plugin refresh and reinstall
- `-m "message"`: Custom commit message (default: auto-generated)

### Other Version Commands

- `/argc list` - List all cached plugins
- `/argc list --all` - List all plugins in marketplace.json
- `/argc version core` - Show current version of core plugin
- `/argc status core` - Show plugin status across marketplace.json, folder, and cache
- `/argc install` - Install all cached plugins with install scripts
- `/argc install core` - Install specific plugin

## Lifecycle Hooks

The core plugin implements all Claude Code lifecycle hooks as **reference implementations and templates**.

### Hook Purpose

Core hooks demonstrate the correct pattern for hook development:

- Standard error handling (`set -euo pipefail`)
- JSON input/output format
- Hook-specific context injection
- Minimal, focused functionality

Other plugins implement their own hooks by registering them in their `marketplace.json`.

### Hook Execution Flow

1. **SessionStart** (`session-start.sh`): Template for session initialization (e.g., loading state, displaying messages)
1. **UserPromptSubmit** (`user-prompt-submit.sh`): Parses skogai notation (e.g., `$ref.path`, `[@action]`)
1. **PreToolUse** (`pre-tool-use.sh`): Can add context or block tool calls before execution
1. **PostToolUse** (`post-tool-use.sh`): Reacts to tool execution results
1. **PreCompact** (`pre-compact.sh`): Runs before context compaction
1. **Stop** (`stop.sh`): Session termination handler
1. **SubagentStop** (`subagent-stop.sh`): Subagent termination handler
1. **Notification** (`notification.sh`): Handles notifications

### Hook Development Pattern

All hooks follow this structure:

```bash
#!/usr/bin/env bash
set -euo pipefail

# Read JSON from stdin
input=$(cat)

# Process input
# ...

# Output JSON with hookSpecificOutput
jq -n --arg context "$context" '{
  "hookSpecificOutput": {
    "hookEventName": "HookName",
    "additionalContext": $context
  }
}'
```

## Command Development

Commands are markdown files with YAML frontmatter located in `commands/`.

### Command Structure

```markdown
---
name: command-name
description: Brief description
argument-hint: "[optional] [args]"
allowed-tools: Bash, Read, Write
---

# Command Implementation

Command instructions here...
```

### Invoking Commands

- **Marketplace prefix**: `/core:command-name` (explicit)
- **Direct**: `/command-name` (if no namespace collision)

### Argc Integration

The `/argc` command provides access to the root `Argcfile.sh` for version management:

```bash
/argc bump core patch              # Bump version
/argc status core                  # Check plugin status
/argc install core                 # Install plugin
```

## Agent Development

Agents are specialized Claude Code subagents defined in markdown files under `agents/`.

### Agent Structure

```markdown
---
name: agent-name
description: Use this agent when... (third person, describes when to invoke)
---

You are a specialized agent for...

[Agent instructions and behavior]
```

### Available Agent

- **code-simplicity-reviewer**: Final review pass for simplicity and minimalism, applies YAGNI principles

### Creating Agents

Use the `/create-agent-skill` command for guided agent creation with best practices.

## Worktree Management

The marketplace supports git worktree management via argc.

### Worktree Commands

```bash
/argc worktree:create feature-name    # Create new worktree with branch
/argc worktree:switch feature-name    # Switch to existing worktree
/argc worktree:list                   # List all worktrees
```

**Special Worktree Names**:

- `@` - Current branch
- `-` - Previous branch
- `^` - Parent commit
- `master` - Main branch

Worktrees are created in: `$MARKETPLACE_DIR/$MARKETPLACE_NAME/.worktrees/`

## Development Workflow

### Making Changes to Core Plugin

1. Make your changes to agents, commands, hooks, or other components
1. Test changes locally (plugin cache auto-refreshes on file changes via symlinks)
1. Bump version: `/argc bump core [patch|minor|major]`
1. The bump command handles: version update, changelog, git commit/tag, push, refresh, install

### Pre-commit Checklist

Before committing changes:

- [ ] Version bumped via argc
- [ ] Component counts verified (if adding/removing agents/commands)
- [ ] New agents/commands follow naming conventions
- [ ] Hooks follow standard error handling (`set -euo pipefail`)

### Marketplace Integration

The core plugin is registered in `.claude-plugin/marketplace.json` at the repository root.

**Key Settings**:

- `strict: false` - Allows flexible plugin structure without requiring plugin.json
- Hooks registered for all lifecycle events
- Uses `${CLAUDE_PLUGIN_ROOT}` variable for dynamic path resolution

## Environment Variables

The plugin relies on these environment variables (set in root marketplace or defaults):

- `CLAUDE_PLUGIN_ROOT` - Path to plugin cache directory
- `MARKETPLACE_DIR` - Path to marketplace directory
- `MARKETPLACE_NAME` - Name of marketplace (skogai-marketplace)

## Plugin Dependencies

**Note**: Claude Code does not support plugin dependencies. Each plugin must be independent. The core plugin can suggest other plugins via hooks but cannot enforce installation.

## Skogai Notation

The `user-prompt-submit.sh` hook parses custom notation patterns:

- `$ref.path` - References
- `[@action:param]` - Actions
- `$a*$b` - Binary operations

Requires `skogparse` binary at `~/.local/src/skogparse/bin/Release/net9.0/SkogParse`

If notation is detected, the hook outputs:

```
original message: <input>
parsed message: <parsed result>
```

## Architecture Patterns

### Symlink-First Design

Components can use symlinks to share resources across plugins:

```bash
ln -s ../../docs docs
ln -s ../../Argcfile.sh Argcfile.sh
```

Symlinks resolve in plugin cache and changes propagate instantly without refresh.

### Strict-False Pattern

The plugin uses `strict: false` in marketplace.json, which means:

- No `plugin.json` file required
- Flexible directory structure
- Components discovered by directory scanning
- Ideal for evolving plugin architectures

### Hook-Based Automation

Rather than requiring manual steps, the plugin uses hooks to:

- Initialize state on session start
- Parse custom notation automatically
- Track usage metrics
- Prompt for decisions at appropriate times

## Key Files

- `Argcfile.sh` - Version management, marketplace operations, worktree management
- `settings.json` - Plugin permissions, environment, marketplace registration
- `hooks/session-start.sh` - Template for session initialization hooks
- `hooks/user-prompt-submit.sh` - Skogai notation parser
- `agents/code-simplicity-reviewer.md` - YAGNI-focused code review agent
- `commands/argc.md` - Argc CLI wrapper command
- `commands/create-agent-skill.md` - Agent/skill creation helper

## Testing Changes

To test changes without committing:

1. Edit files in `plugins/core/`
1. Changes are immediately available (symlinks + cache auto-update)
1. Invoke updated commands/agents to verify behavior
1. When satisfied, run version bump workflow

## Changelog Management

The `bump` command automatically updates `changelog.md` in the repository root:

- Extracts git commits since last tag for the plugin
- Groups by version bump type (Added/Changed/Fixed)
- Follows [Keep a Changelog](https://keepachangelog.com/) format
- If no commits found, adds placeholder section

Manual editing of changelog is allowed and preserved during bumps.
