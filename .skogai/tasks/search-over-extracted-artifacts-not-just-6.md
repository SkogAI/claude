---
state: new
created: "2026-03-06"
tracking: ["https://github.com/SkogAI/claude-memory/issues/6"]
tags: ["enhancement", "github"]
---

# Search over extracted artifacts (not just conversations)

**Source**: [Github #6](https://github.com/SkogAI/claude-memory/issues/6)

## Description

## Parent: #1
## Depends on: #3

## Summary

Currently search only finds conversation exchanges. Once we have extracted decisions, learnings, and patterns, search should index and return those too.

## Current Search
```
query → vector search over conversation exchanges → raw snippets
```

## Target Search
```
query → vector search over exchanges + extracted artifacts → rich results
  - conversation matches (existing)
  - decision matches (new)
  - learning matches (new)
  - pattern matches (new

## Notes

*Imported from external tracker. See source link for full context.*
