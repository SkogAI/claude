# ux patterns

<purpose>

visual patterns, next up format, and decision gates for user interaction.

</purpose>

<content>

## visual patterns

orchestrators @-reference ui-brand.md for stage banners, checkpoint boxes, status symbols, and completion displays.

## "next up" format

```markdown
---

## next up

**{identifier}: {name}** - {one-line description}

`{copy-paste command}`

<sub>`/clear` first -> fresh context window</sub>

---

**also available:**

- alternative option
- another option

---
```

## decision gates

always use AskUserQuestion with concrete options. never plain text prompts.

include escape hatch: "something else", "let me describe"

</content>
