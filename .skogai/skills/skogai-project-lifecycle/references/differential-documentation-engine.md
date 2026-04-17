---
title: differential-documentation-engine
type: note
permalink: skogai/skills/skogai-project-lifecycle/references/differential-documentation-engine
---

# Differential Documentation Engine

## Purpose

Extract only project-specific information by comparing documentation written with and without project context. This three-pass approach eliminates generic content and preserves only what's uniquely valuable.

## The Core Principle

> If Claude can write it without knowing your project, you don't need to document it.

Generic knowledge lives in Claude's training data. Your documentation should contain _only_ what Claude can't infer.

## The Three Passes

| Pass                | Context Level              | What It Produces               |
| ------------------- | -------------------------- | ------------------------------ |
| 1. Full Context     | Complete project knowledge | Signal + noise (comprehensive) |
| 2. Starved Context  | Zero project knowledge     | Pure noise (generic/inferable) |
| 3. Delta Extraction | Comparison                 | Pure signal (project-specific) |

## Measured Results

From actual testing:

- **Input**: 450 lines of documentation
- **Output**: 95 lines (79% reduction)
- **Signal preserved**: 100% of actionable information
- **Removed**: Generic explanations, standard patterns, obvious decisions

## Using the Engine

**Executable prompt:** `@../templates/differential-docs.yaml`

**Usage:**

```bash
skogcli prompt run differential-docs \
  --topic="Topic to document" \
  --context=@path/to/project-context.md
```

Or provide inputs directly to the YAML prompt template.

## When to Use

- **Documentation review**: Run existing docs through to identify bloat
- **New documentation**: Use as the writing process itself
- **Skill creation**: Identify what instructions are actually needed vs implied
- **Code comments**: Determine which comments add value
- **Architecture decisions**: Separate obvious choices from meaningful ones

## Variations

### Quick Version (Mental Model)

For informal use, just ask yourself:

1. "What would I write with full context?"
1. "What would Claude write knowing nothing?"
1. "What's the difference?"

### Iterative Pruning

Run the engine multiple times on the same content:

- First pass: Remove generic explanations
- Second pass: Remove standard patterns
- Third pass: Remove obvious implications

Each pass finds cruft the previous pass missed.

### Reverse Application (Validation)

To test if documentation is sufficiently pruned:

1. Give the pruned doc to a fresh Claude session
1. Ask it to expand/implement
1. If it can do so correctly → docs are good
1. If it gets confused → you pruned something non-inferable (add it back)

## Related

- `@../SKILL.md` - The lifecycle skill this supports
- `@../workflows/pruning-to-production.md` - Where this tool fits in the workflow
