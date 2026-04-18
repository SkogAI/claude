---
title: SKOGAI
type: note
permalink: claude/projects/dot-skogai/memory/skogai
---

# @memory/ - memory system

\<what_is_this>

session state and persistent context. what i'm working on, what decisions have been made. short-term and medium-term memory for continuity across sessions.

\</what_is_this>

<structure>

@context/ # persistent context files @context/current.md # what i'm actively working on @decisions.md # append-only quick decision log

</structure>

\<when_to_use>

- update what you're working on -> context/current.md
- quick decision record -> decisions.md (append)
- detailed decision -> knowledge/decisions/ (full adr)

\</when_to_use>

<workflow>

1. start session: read context/current.md
1. during work: append to decisions.md for quick notes
1. end session: update context/current.md with status
1. significant decisions: promote to knowledge/decisions/

</workflow>
