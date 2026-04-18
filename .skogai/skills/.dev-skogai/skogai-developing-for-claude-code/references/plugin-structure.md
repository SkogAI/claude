---
title: plugin-structure
type: note
permalink: skogai/skills/skogai-developing-for-claude-code/references/plugin-structure
---

# Plugin Structure Reference

## Standard Directory Layout

All paths relative to plugin root:

```
my-plugin/
├── .claude-plugin/
│   ├── plugin.json          # REQUIRED - Plugin metadata
│   └── marketplace.json     # Optional - For local dev/distribution
├── skills/                  # Optional - Agent Skills
│   └── skill-name/
│       ├── SKILL.md         # Required for each skill
│       ├── scripts/         # Optional - Executable helpers
│       ├── references/      # Optional - Documentation
│       └── assets/          # Optional - Templates/files
├── commands/                # Optional - Custom slash commands
│   └── command-name.md
├── agents/                  # Optional - Specialized subagents
│   └── agent-name.md
├── hooks/                   # Optional - Event handlers
│   └── hooks.json
├── .mcp.json               # Optional - MCP server config
├── LICENSE
└── README.md
```

## Critical Rules

### 1. `.claude-plugin/` Contains ONLY Manifests

**❌ WRONG:**

```
.claude-plugin/
├── plugin.json
├── skills/              # NO! Skills don't go here
└── commands/            # NO! Commands don't go here
```

**✅ CORRECT:**

```
.claude-plugin/
├── plugin.json          # Only manifests
└── marketplace.json     # Only manifests

skills/                  # Skills at plugin root
commands/                # Commands at plugin root
```

### 2. Always Use `${CLAUDE_PLUGIN_ROOT}` for Paths in Config

**❌ WRONG - Hardcoded paths:**

```json
{
  "mcpServers": {
    "my-server": {
      "command": "/Users/name/plugins/my-plugin/server.js"
    }
  }
}
```

**✅ CORRECT - Variable paths:**

```json
{
  "mcpServers": {
    "my-server": {
      "command": "${CLAUDE_PLUGIN_ROOT}/server.js"
    }
  }
}
```

### 3. Use Relative Paths in `plugin.json`

All paths in `plugin.json` must:

- Start with `./`
- Be relative to plugin root

**❌ WRONG:**

```json
{
  "mcpServers": {
    "server": {
      "args": ["server/index.js"]  // Missing ./
    }
  }
}
```

**✅ CORRECT:**

```json
{
  "mcpServers": {
    "server": {
      "args": ["${CLAUDE_PLUGIN_ROOT}/server/index.js"]
    }
  }
}
```

## Plugin Manifest (plugin.json)

### Minimal Version

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Brief description of what the plugin does",
  "author": {
    "name": "Your Name"
  }
}
```

### Complete Version

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Comprehensive plugin description",
  "author": {
    "name": "Your Name",
    "email": "you@example.com",
    "url": "https://github.com/you"
  },
  "homepage": "https://github.com/you/my-plugin",
  "repository": "https://github.com/you/my-plugin",
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"],
  "mcpServers": {
    "server-name": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/path/to/server.js"],
      "env": {
        "ENV_VAR": "value"
      }
    }
  }
}
```

## Development Marketplace (marketplace.json)

For local testing, create in `.claude-plugin/`:

```json
{
  "name": "my-plugin-dev",
  "description": "Development marketplace for my plugin",
  "owner": {
    "name": "Your Name"
  },
  "plugins": [
    {
      "name": "my-plugin",
      "description": "Plugin description",
      "version": "1.0.0",
      "source": "./",
      "author": {
        "name": "Your Name"
      }
    }
  ]
}
```

**Installation:**

```bash
/plugin marketplace add /path/to/my-plugin
/plugin install my-plugin@my-plugin-dev
```

## Component Formats

### Skills (skills/skill-name/SKILL.md)

```markdown
---
name: skill-name
description: Use when [triggering conditions] - [what it does]
---

# Skill Name

## Overview

What this skill does in 1-2 sentences.

## When to Use

- Specific scenario 1
- Specific scenario 2

## Workflow

1. Step one
2. Step two
3. Step three
```

### Commands (commands/command-name.md)

```markdown
---
description: Brief description of what this command does
---

# Command Instructions

Tell Claude what to do when this command is invoked.
Be specific and clear about the expected behavior.
```

### Hooks (hooks/hooks.json)

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/format.sh"
          }
        ]
      }
    ],
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/init.sh"
          }
        ]
      }
    ]
  }
}
```

**Available hook events:**

- `PreToolUse`, `PostToolUse`
- `UserPromptSubmit`
- `SessionStart`, `SessionEnd`
- `Stop`, `SubagentStop`
- `PreCompact`
- `Notification`

### MCP Servers

**Option 1: In plugin.json**

```json
{
  "name": "my-plugin",
  "mcpServers": {
    "server-name": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/server/index.js"],
      "env": {
        "API_KEY": "${PLUGIN_ENV_API_KEY}"
      }
    }
  }
}
```

**Option 2: Separate .mcp.json file**

```json
{
  "mcpServers": {
    "server-name": {
      "command": "${CLAUDE_PLUGIN_ROOT}/bin/server",
      "args": ["--config", "${CLAUDE_PLUGIN_ROOT}/config.json"]
    }
  }
}
```

### Agents (agents/agent-name.md)

```markdown
---
description: What this agent specializes in
capabilities: ["capability1", "capability2"]
---

# Agent Name

Detailed description of when to invoke this specialized agent.

## Expertise

- Specific domain knowledge
- Specialized techniques
- When to use vs other agents
```

## File Permissions

Scripts must be executable:

```bash
chmod +x scripts/helper.sh
chmod +x bin/server
```
