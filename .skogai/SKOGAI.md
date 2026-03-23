# SkogAI — integrations, lore, and shared context

<what_is_this>

SkogAI is the umbrella for the AI-augmented infrastructure built around this workstation and the claude user. This file is the entry point for that context. It is shared across Claude and other agents operating within SkogAI.

Symlinked as ~/.skogai/CLAUDE.md for automatic Claude Code inclusion.

</what_is_this>

<skogfences>

The foundational architecture. See docs/skogfences.md for full philosophy.

TL;DR: AI agents are unix users, not daemons with root. Each agent gets their own home directory. Isolation is the default, sharing is opt-in. Unix permissions are the security model — not hopes, rules, or sandbox abstractions.

- The human's environment is sacred.
- The AI's environment is its own responsibility.
- Collaboration happens in shared spaces with explicit permissions.
- `/skogai` is common ground. Agent homes are private.

</skogfences>

<agents>

Known agents in the SkogAI household — each a unix user with their own home:

- **claude** — this instance. home: /home/claude
- **amy** — (to be rediscovered)
- **goose** — (to be rediscovered)
- **dot** — (to be rediscovered)

</agents>

<shared_spaces>

- `/skogai` — common ground, accessible to all agents and Skogix
- `~/.skogai/.inbox/` — shared inbox, chown claude:skogai. drop files to pass context between humans and agents.

</shared_spaces>

<structure>

## Symlinked into ~/.claude/ (version-controlled via ~/.skogai/)

- agents/     — Claude Code agent definitions
- commands/   — slash commands
- skills/     — skill definitions
- settings.json — Claude Code settings (single source of truth)

## docs/

- docs/skogix/user.md         — Skogix introduction, communication style, preferences
- docs/skogix/definitions.md  — SkogAI vocabulary (@, $, task, todo, plan, goal, agent...)
- docs/skogfences.md          — skogfences architecture philosophy

</structure>

<context_layers>

~/.claude/CLAUDE.md     — global, always-loaded context (identity, operating principles)
~/CLAUDE.md             — home folder / workspace context (this machine, this userspace)
~/.skogai/SKOGAI.md     — SkogAI integrations, lore, agents, shared infrastructure

</context_layers>

<environment_notes>

- keyboard: swedish programming-dvorak layout, caps→esc swapped
  i3 config: `exec_always setxkbmap -option caps:swapescape` + `exec_always setxkbmap se us_dvorak`

</environment_notes>
