---
state: new
created: "2026-03-06"
tracking: ["https://github.com/SkogAI/marketplace/issues/70"]
tags: ["bug", "github"]
---

# fix(core): stop-git-dirty hook uses invalid output schema

**Source**: [Github #70](https://github.com/SkogAI/marketplace/issues/70)

## Description

## Bug

`plugins/core/hooks/stop-git-dirty.sh` outputs `hookSpecificOutput` with `hookEventName: "Stop"`, but `Stop` hooks don't support the `hookSpecificOutput` schema.

### Error

```
Stop hook error: JSON validation failed: Hook JSON output validation failed:
  - : Invalid input
```

### Current output (invalid)

```json
{
  "hookSpecificOutput": {
    "hookEventName": "Stop",
    "additionalContext": "Note: there are uncommitted changes..."
  }
}
```

### Valid Stop hook schema

Per [Claude 

## Notes

*Imported from external tracker. See source link for full context.*
