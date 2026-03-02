# How a Claude Code Plugin is Built

## What

A plugin is a directory with a `.claude-plugin/plugin.json` manifest and one or more component directories. Claude Code auto-discovers components by scanning known directories at session start.

## The Four Component Types

- **Commands** (`commands/*.md`) — user-invoked `/slash-commands`. Markdown files with optional YAML frontmatter. The body is instructions FOR Claude, not documentation for humans.
- **Skills** (`skills/*/SKILL.md`) — auto-activating knowledge. Each skill is a subdirectory with a `SKILL.md`. Claude loads them when the `description` field matches what the user is asking about. Progressive disclosure: metadata always loaded, body on trigger, references on demand.
- **Agents** (`agents/*.md`) — autonomous subagents spawned via the Task tool. Frontmatter defines triggering conditions with `<example>` blocks. Body is the agent's system prompt (written in second person).
- **Hooks** (`hooks/hooks.json`) — event-driven automation. Fire on Claude Code events (PreToolUse, PostToolUse, Stop, SessionStart, etc). Can be `command` type (bash script) or `prompt` type (LLM-driven). All matching hooks run in parallel.

## Minimal Plugin Structure

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json    # only "name" is required
└── commands/
    └── hello.md       # one component is enough
```

## Key Patterns Learned

- **`${CLAUDE_PLUGIN_ROOT}`** — environment variable pointing to the plugin's install location. Use it everywhere instead of hardcoded paths.
- **Plugin hooks.json needs a wrapper** — `{"hooks": {"EventName": [...]}}`, not events at top level (that's the settings.json format).
- **Skills use third-person descriptions** with specific trigger phrases ("This skill should be used when the user asks to...").
- **Commands are instructions for Claude** — write them as directives, not as help text for the user.
- **Agents need `<example>` blocks** in the description to trigger properly. Include 2-4 showing different use cases.
- **Hooks load at session start** — editing hooks.json won't affect the current session. Restart required.
- **Auto-discovery** scans `commands/`, `agents/`, `skills/*/SKILL.md`, and `hooks/hooks.json` automatically. No registration needed.

## Inline Content Inclusion

Two mechanisms for pulling content into commands/skills:

### `@path` — Read tool equivalent

- `@src/auth.ts` includes file contents in the prompt
- Same @-linking mechanism as in CLAUDE.md and user messages
- In normal context you see both the reference and the output
- Grants permission to the file (same rules as @-linking everywhere)

### `!`command`` — Bash tool equivalent

- `!`git diff --name-only`` runs bash and includes the output
- **Preprocessed** — runs before the message is even composed on the user's side
- The cache treats the entire rendered result as a **static prompt chunk** (doesn't re-execute on cache hits)
- In plan mode (no execution possible), the raw `!`command`` text is visible instead
- Cannot take Claude-provided parameters — the system can't tell who's invoking the skill (user vs internal). Messages differentiate via a sender/type field ("real user" vs "faked/internal")
- Execution order: `!`commands`` first, then `$ARGUMENTS`/`$1`/`$2` substitution

### Why this matters

The `!`command`` caching behavior means you can use it to cache large chunks of dynamic context. The expression is the cache key, the output becomes static text. This is why docs describe it as "inline replacement" — it's about the caching, not literal text substitution.

## Commands vs Skills (the "almost" transition)

Old slash-commands and new skills are nearly the same format. The difference is `context: fork` and the subagent model:

- **Without `context: fork`**: skill/command runs in the main conversation. The rendered content (with `!`command`` output baked in) stays as a cached static prompt chunk.
- **With `context: fork`**: the skill's content becomes the task for a subagent. The execution happens elsewhere (not cache-friendly), but the command definition itself stays cached on your side.

### Skill frontmatter for forking

```yaml
---
name: pr-summary
context: fork          # run in isolated subagent
agent: Explore         # which agent type executes it
allowed-tools: Bash(gh *)
---
```

### Two directions for skills + subagents

| Approach | System prompt | Task | Also loads |
|----------|--------------|------|------------|
| Skill with `context: fork` | From agent type (Explore, Plan, etc.) | SKILL.md content | CLAUDE.md |
| Subagent with `skills` field | Subagent's markdown body | Claude's delegation message | Preloaded skills + CLAUDE.md |

**Warning**: `context: fork` without an explicit task = subagent gets guidelines but nothing to do, returns nothing useful.

## What's Not Obvious

- The plugin hooks.json format wraps events inside a `"hooks"` key. The settings.json format doesn't. Easy to mix up.
- Skills are NOT loaded by default — only the ~100-word description is always in context. The body loads on trigger. This is the progressive disclosure system.
- Command `$ARGUMENTS` captures everything, `$1`/`$2` are positional. `@path` includes file contents.
- Prompt-based hooks only work on: PreToolUse, Stop, SubagentStop, UserPromptSubmit. Other events need command hooks.
- Stale docs exist — e.g. "ultrathink" keyword was removed a while back but still appears in official docs.
