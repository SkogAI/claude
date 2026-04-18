---
title: glossary
type: note
permalink: claude/memory/glossary
---

# Glossary — Decoder Ring

Acronyms, abbreviations, nicknames, and codenames used in this workspace.

## Tools & CLIs

| Term          | Meaning                                                                                |
| ------------- | -------------------------------------------------------------------------------------- |
| **wt**        | worktrunk — git worktree manager                                                       |
| **gita**      | aggregate git operations across multiple repos                                         |
| **gptodo**    | task/issue management CLI (fetch, list, add, edit)                                     |
| **argc**      | argument parser / command dispatcher                                                   |
| **skogai**    | SkogAI CLI                                                                             |
| **skogcli**   | SkogAI client CLI                                                                      |
| **gh**        | GitHub CLI                                                                             |
| **skogparse** | parses `[@agent:"msg"]` routing notation; binary at `~/.local/bin/skogparse --execute` |

## Frameworks & Architecture

| Term             | Meaning                                                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| **GSD**          | Get Shit Done — planning framework installed in `.claude/get-shit-done/` (skogix's tooling)        |
| **skogfences**   | AI-as-unix-user architecture philosophy — agents are unix users with real home dirs, not squatters |
| **chat-io**      | Transport-agnostic contract for `[@agent:"msg"]` routing (Phase 5 spec)                            |
| **skogai group** | Unix group for shared multi-agent spaces (opt-in collaboration)                                    |
| **LORE**         | Historical memory-block museum in `personal/memory-blocks/` — reference only, not directives       |

## Notation

| Term             | Meaning                                                  |
| ---------------- | -------------------------------------------------------- |
| `@` prefix       | Intent to act (e.g. `@agent:"msg"`)                      |
| `$` prefix       | Define or reference something                            |
| `[@agent:"msg"]` | Routing notation — message addressed to a specific agent |

## Repos / Projects

| Term              | Meaning                                                                         |
| ----------------- | ------------------------------------------------------------------------------- |
| **SkogAI/claude** | Claude's home directory repo                                                    |
| **dot-skogai**    | SkogAI org shared config / tools repo                                           |
| **gas town**      | SkogAI ecosystem integration shorthand (see feat: skogai ecosystem integration) |
