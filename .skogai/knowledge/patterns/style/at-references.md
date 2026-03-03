# @-reference patterns

<purpose>

how to use @-references for file loading and context management.

</purpose>

<content>

## static references (always load)

```
@~/.skogai/knowledge/SKOGAI.md

@project.md
```

## conditional references (based on existence)

```
@.planning/discovery.md (if exists)
```

## key principle

**@-references are lazy loading signals and permission givers.** they tell claude what to read, not always act as a pre-loader.

## source of truth

the `@` prefix expands file contents directly into the prompt at prompt-time.

| method | source | freshness |
|--------|--------|-----------|
| `@/path/to/file` | real filesystem | always current |
| Read tool | often cached | possibly stale |

**the `@` is the source of truth.** Read tool results may come from Claude Code's cache layer.

</content>
