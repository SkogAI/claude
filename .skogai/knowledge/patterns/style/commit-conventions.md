# commit conventions

<purpose>

git commit format, types, and rules for skogai projects.

</purpose>

<content>

## format

```
{type}({phase}-{plan}): {description}
```

## types

| type       | use                         |
| ---------- | --------------------------- |
| `feat`     | new feature                 |
| `fix`      | bug fix                     |
| `test`     | tests only (tdd red)        |
| `refactor` | code cleanup (tdd refactor) |
| `docs`     | documentation/metadata      |
| `chore`    | config/dependencies         |

## rules

- one commit per task during execution
- stage files individually (never `git add .`)
- capture hash for summary.md
- include co-authored-by line

</content>
