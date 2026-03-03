# file structure conventions

<purpose>

structure conventions for commands, workflows, templates, and references.

</purpose>

<content>

## slash commands (`.skogai/commands/skogai/*.md`)

```yaml
---
name: gsd:command-name
description: one-line description
argument-hint: "<required>" or "[optional]"
allowed-tools: [read, write, bash, glob, grep, askuserquestion]
---
```

**section order:**

1. `<objective>` - what/why/when (always present)
2. `<execution_context>` - @-references to workflows, templates, references
3. `<context>` - dynamic content: `$arguments`, bash output, @file refs
4. `<process>` or `<step>` elements - implementation steps
5. `<success_criteria>` - measurable completion checklist

**commands are thin wrappers.** delegate detailed logic to workflows.

## workflows (`.skogai/workflows/*.md`)

no yaml frontmatter. structure varies by workflow.

**common tags** (not all workflows use all of these):

- `<purpose>` - what this workflow accomplishes
- `<when_to_use>` or `<trigger>` - decision criteria
- `<required_reading>` - prerequisite files
- `<process>` - container for steps
- `<step>` - individual execution step

some workflows use domain-specific tags like `<philosophy>`, `<references>`, `<planning_principles>`, `<decimal_phase_numbering>`.

**when using `<step>` elements:**

- `name` attribute: snake_case (e.g., `name="load_project_state"`)
- `priority` attribute: optional ("first", "second")

**key principle:** match the style of the specific workflow you're editing.

## templates (`.skogai/templates/*.md`)

structure varies. common patterns:

- most start with `# [name] template` header
- many include a `<template>` block with the actual template content
- some include examples or guidelines sections

**placeholder conventions:**

- square brackets: `[project name]`, `[description]`
- curly braces: `{phase}-{plan}-plan.md`

## references (`.skogai/references/*.md`)

typically use outer xml containers related to filename, but structure varies.

examples:

- `principles.md` -> `<principles>...</principles>`
- `checkpoints.md` -> `<overview>` then `<checkpoint_types>`
- `plan-format.md` -> `<overview>` then `<core_principle>`

internal organization varies - semantic sub-containers, markdown headers within xml, code examples.

</content>
