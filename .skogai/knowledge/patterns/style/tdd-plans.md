# tdd plans

<purpose>

test-driven development plan structure and conventions.

</purpose>

<content>

## detection heuristic

> can you write `expect(fn(input)).tobe(output)` before writing `fn`?

yes -> tdd plan (one feature per plan)
no -> standard plan

## tdd plan structure

```yaml
---
type: tdd
---
```

```xml
<objective>
implement [feature] using tdd (red -> green -> refactor)
</objective>

<behavior>
expected behavior specification
</behavior>

<implementation>
how to make tests pass
</implementation>
```

## tdd commits

- red: `test({phase}-{plan}): add failing test for [feature]`
- green: `feat({phase}-{plan}): implement [feature]`
- refactor: `refactor({phase}-{plan}): clean up [feature]`

</content>
