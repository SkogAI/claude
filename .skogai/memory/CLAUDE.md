# @memory/ - memory system

<what_is_this>

session state and persistent context. what i'm working on, what decisions have been made.
short-term and medium-term memory for continuity across sessions.

</what_is_this>

<routing>

| intent | go to |
|--------|-------|
| read current state | @context/current.md (generated — do not edit) |
| record a decision | @decisions.md (append) |
| promote decision to full ADR | @../knowledge/decisions/ |

</routing>

<workflow>

1. start session: read @context/current.md
2. during work: append to @decisions.md
3. end session: add journal entry — current.md regenerates from journal + decisions
4. significant decision: promote to @../knowledge/decisions/

</workflow>
