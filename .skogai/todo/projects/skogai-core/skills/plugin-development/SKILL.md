---
name: plugin-development
description: This skill should be used when the user asks to "add a component to skogai-core", "extend the plugin", "add a new command", "add a new agent", "add a new skill", "add a hook", "create a new plugin component", or needs guidance on plugin component structure, file formats, or how to extend an existing Claude Code plugin.
version: 0.1.0
---

# Plugin Development for skogai-core

## Overview

Guide for extending skogai-core with new components. Each component type has a specific directory, file format, and purpose. Add only what is needed — start minimal and extend when hitting a real limitation.

## Component Types

### Commands (`commands/`)

Slash commands invoked by the user. Markdown files with optional YAML frontmatter.

**To add a command:**
1. Create `commands/command-name.md`
2. Add frontmatter with `description` and optionally `allowed-tools`, `model`, `argument-hint`
3. Write the command body as instructions FOR Claude (not messages to the user)

**Minimal example:**
```markdown
---
description: Brief description shown in /help
argument-hint: [arg]
---

Do the thing with $ARGUMENTS.
```

**Key points:**
- `$ARGUMENTS` captures all args, `$1`/`$2` for positional
- `@path/to/file` includes file contents
- Commands are instructions for Claude, not documentation for humans

### Agents (`agents/`)

Autonomous subagents that Claude spawns for complex tasks. Markdown files with YAML frontmatter.

**To add an agent:**
1. Create `agents/agent-name.md`
2. Frontmatter must include: `name`, `description` (with `<example>` blocks), `model`, `color`
3. Body becomes the agent's system prompt (write in second person)

**Minimal example:**
```markdown
---
name: agent-name
description: Use this agent when [condition]. Examples:

<example>
Context: [scenario]
user: "[request]"
assistant: "[response]"
</example>

model: inherit
color: blue
---

You are an agent that [does X].

Process:
1. [Step]
2. [Step]

Output: [format]
```

**Key points:**
- Include 2-4 `<example>` blocks in description
- Use `inherit` for model unless specific need
- Restrict `tools` to minimum needed

### Skills (`skills/skill-name/`)

Auto-activating knowledge that loads when Claude detects relevant context. Each skill lives in its own subdirectory with a required `SKILL.md`.

**To add a skill:**
1. Create `skills/skill-name/SKILL.md`
2. Frontmatter must include `name` and `description` with trigger phrases (third person)
3. Body uses imperative form, target 1,500-2,000 words
4. Move detailed content to `references/`, working code to `examples/`, utilities to `scripts/`

**Key points:**
- Description triggers loading — use specific phrases users would say
- Keep SKILL.md lean, use progressive disclosure
- Write in imperative/infinitive form, not second person

### Hooks (`hooks/hooks.json`)

Event-driven scripts that fire on Claude Code events. Configured in JSON.

**To add a hook:**
1. Edit `hooks/hooks.json`
2. Add entry under the appropriate event
3. Choose `type: "command"` (deterministic) or `type: "prompt"` (LLM-driven)
4. Create scripts in `hooks/scripts/` for command hooks

**Plugin hooks.json format:**
```json
{
  "hooks": {
    "EventName": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PLUGIN_ROOT}/hooks/scripts/script.sh",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

**Available events:** PreToolUse, PostToolUse, Stop, SubagentStop, SessionStart, SessionEnd, UserPromptSubmit, PreCompact, Notification

**Key points:**
- All matching hooks run in parallel
- Use `${CLAUDE_PLUGIN_ROOT}` for portable paths
- Exit 0 = success, exit 2 = blocking error
- Hooks load at session start — changes need session restart

## Current Plugin Structure

```
skogai-core/
├── .claude-plugin/plugin.json
├── commands/learn.md
├── agents/doc-writer.md
├── skills/plugin-development/SKILL.md  (this file)
└── hooks/
    ├── hooks.json
    └── scripts/debug-hook.sh
```

## Adding Components Workflow

1. Identify the need — what problem does this solve?
2. Pick the right component type (command for user-invoked, agent for autonomous, skill for knowledge, hook for automation)
3. Create the file in the right directory
4. Follow the format for that component type
5. Restart Claude Code to pick up changes
6. Test with `claude --debug` for hooks, trigger phrases for skills, `/command` for commands
