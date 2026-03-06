# .skogai/ — project intelligence router

<what_is_this>

tool-agnostic AI integration layer. not application code.
knowledge base, memory, templates, and session notes for AI-augmented development.

</what_is_this>

<essential_principles>

1. **routing over dumping** — load the right thing at the right time
2. **@-references are lazy loading** — signal what to read, don't pre-load everything
3. **generated artifacts are not source of truth** — edit sources, not outputs
4. **tool-agnostic first** — claude code is a consumer, not the owner

</essential_principles>

<routing>

| intent | go to |
|--------|-------|
| what am i working on? | @memory/context/current.md |
| record a quick decision | @memory/decisions.md (append) |
| full ADR / detailed decision | @knowledge/decisions/ + @templates/decision-record.md |
| record a learning / insight | @knowledge/learnings/ + @templates/knowledge-entry.md |
| style, naming, commit format | @knowledge/patterns/style/CLAUDE.md |
| session notes | @journal/YYYY-MM-DD/<topic>.md |
| start from a template | @templates/CLAUDE.md |
| how does memory work? | @memory/CLAUDE.md |
| how does knowledge work? | @knowledge/CLAUDE.md |

</routing>
