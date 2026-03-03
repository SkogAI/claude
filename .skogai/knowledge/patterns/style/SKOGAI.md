# @knowledge/patterns/style/ - skogai style conventions

<what_is_this>

skogai style conventions reference collection.
routed references for consistent documentation across the system.

</what_is_this>

<essential_principles>

the 15 meta-patterns (cannot be skipped):

1. **xml for semantic structure, markdown for content**
2. **@-references are lazy loading signals with a hard recommend to read**
3. **commands delegate to workflows**
4. **progressive disclosure hierarchy**
5. **imperative, brief, technical** - no filler, no sycophancy
6. **solo developer + claude** - no enterprise patterns
7. **context size as quality constraint** - split aggressively
8. **temporal language banned** - current state only
9. **plans are prompts** - executable, not documents
10. **atomic commits** - git history as context source
11. **AskUserQuestion for all exploration** - always options
12. **checkpoints post-automation** - automate first, verify after
13. **deviation rules are automatic** - no permission for bugs/critical
14. **depth controls compression** - derive from actual work
15. **tdd gets dedicated plans** - cycle too heavy to embed

</essential_principles>

<progressive_disclosure>

information flows through layers:

1. **command** - high-level objective, delegates to workflow
2. **workflow** - detailed process, references templates/references
3. **template** - concrete structure with placeholders
4. **reference** - deep dive on specific concept

each layer answers different questions:

- command: "should i use this?"
- workflow: "what happens?"
- template: "what does output look like?"
- reference: "why this design?"

</progressive_disclosure>

<routing>

| need to know about... | read |
|-----------------------|------|
| XML tags, task structure | xml-conventions.md |
| file types (commands, workflows...) | file-structure.md |
| naming (files, tags, variables) | naming-conventions.md |
| writing style, tone | language-tone.md |
| @-references | at-references.md |
| what NOT to do | anti-patterns.md |
| git commits | commit-conventions.md |
| UX patterns, decision gates | ux-patterns.md |
| TDD plans | tdd-plans.md |
| context window management | context-engineering.md |

</routing>
