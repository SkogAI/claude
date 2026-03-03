---
title: Use argc as Script Framework for .skogai
date: 2026-01-20
status: accepted
decision: All scripts in .skogai/scripts/ should use argc for argument parsing, validation, and help generation
deciders: skogix, Claude
---

## Context

`.skogai/scripts/` needs a standard way to create scripts that:
- Validate input types and constraints
- Generate help text automatically
- Integrate with intent-notation system
- Provide good error messages
- Work seamlessly with `skogparse` and `[@script:arg]` syntax

## Decision

Use `argc` as the standard framework for bash scripts in `.skogai/`.

## Rationale

### Why argc?

1. **Minimal Boilerplate**: Add 3-4 lines to get full CLI framework
2. **Declarative**: Define interface in comments, not code
3. **Auto-validation**: Choice functions define valid inputs
4. **Auto-help**: Generates help from annotations
5. **Type-aware**: Understands strings, integers, flags, etc.
6. **Battle-tested**: Established tool in bash ecosystem

### Alternatives Considered

- **Plain bash**: No validation, manual everything - too error-prone
- **Python/Node scripts**: Heavier dependencies, more complex
- **Custom validation**: Reinventing the wheel

### Trade-offs

**Pros:**
- Consistent interface across all scripts
- Dramatically reduces boilerplate
- Better error messages
- Integration with notation system

**Cons:**
- Dependency on argc installation
- Learning curve for argc syntax
- Bash-only (but that's acceptable for .skogai)

## Consequences

### Required

- All new scripts must use argc pattern
- Update fizzbuzz.sh serves as reference implementation
- Document argc patterns in templates

### Migration

- Existing plain scripts should be migrated when touched
- Provide template/example for creating new argc scripts

### Testing

Scripts become more testable:
- Can validate schema without running logic
- Choice functions can be tested independently
- Help text generated consistently

## Example

```bash
#!/usr/bin/env bash

# @describe Description here
# @arg name! The required argument
main() {
  echo "Hello ${argc_name}"
}

eval "$(argc --argc-eval "$0" "$@")"
```

## References

- argc documentation: https://github.com/sigoden/argc
- Example implementation: `.skogai/scripts/fizzbuzz.sh`
