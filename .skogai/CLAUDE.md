# CLAUDE.md

# .skogai (dot-skogai)

<what_is_this>

the projects knowledge base, memory system, project tracking, and quick capture.
one place to see everything, remember everything, plan everything.

</what_is_this>

<structure>

@knowledge/  # documented decisions, learnings, patterns
@memory/     # session context, decision log, current work
@plan/       # planning docs and roadmaps
@projects/   # project tracking and overview
@scripts/    # argc-powered bash scripts
@tasks/      # task tracking
@templates/  # starter templates for new content
@tools/      # tool configs and wrappers
@workflows/  # repeatable step-by-step procedures

</structure>

<commands>

```bash
# Run bootstrap (for consumer projects using .skogai as submodule)
./scripts/bootstrap/bootstrap.sh

# Source helper functions in scripts
source "$(dirname "$0")/skogai-helper-functions.sh"
```

</commands>

<architecture>

**Script Framework:** Uses argc for declarative CLI definition:

```bash
# @describe script description
# @arg name![`_choice_validator`] Argument description
main() { ... }
eval "$(argc --argc-eval "$0" "$@")"
```

</architecture>

<always_load>

- @memory/context/current.md - what we are currently working on
- @knowledge/SKOGAI.md - knowledge base index (decisions, learnings, patterns)
- @knowledge/patterns/style/SKOGAI.md - 15 meta-patterns + style routing

</always_load>

<important>

**@ is source of truth.** The `@/path` syntax expands real files at prompt-time.
Read tool often returns cached content. Always use `@` for files that must be current.

See @knowledge/learnings/2026-01-20-at-file-reference.md for details.

</important>

<where_to_look>

| task                          | location              |
| ----------------------------- | --------------------- |
| what are we working on now    | memory/context/current.md |
| log a decision                | memory/decisions.md   |
| document a learning           | knowledge/learnings/  |
| record architectural decision | knowledge/decisions/  |
| capture reusable pattern      | knowledge/patterns/   |
| track project status          | projects/overview.md  |
| track tasks                   | tasks/                |
| plan something                | plan/                 |
| quick capture                 | inbox/                |
| create new content            | templates/            |
| reusable procedures           | workflows/            |
| tool configs / wrappers       | tools/                |

</where_to_look>

<content_creation>

to create new content, see @templates/claude.md for available templates:

- knowledge-entry.md for learnings and patterns
- project-status.md for project tracking files
- decision-record.md for architectural decisions

</content_creation>
