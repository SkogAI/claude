---
state: new
created: "2026-03-06"
tracking: ["https://github.com/SkogAI/claude-memory/issues/3"]
tags: ["enhancement", "queue", "github"]
---

# Multi-pass extraction: queue multiple jobs per conversation

**Source**: [Github #3](https://github.com/SkogAI/claude-memory/issues/3)

## Description

## Parent: #1
## Depends on: #2

## Summary

Currently `index` queues one job per conversation (summary). Extend to queue multiple extraction passes per conversation, each with a different prompt template.

## Current Flow
```
conversation → 1 summary prompt → 1 queue job → 1 summary file
```

## Target Flow
```
conversation → N prompt templates → N queue jobs → N output files
  - *-summary.txt (existing)
  - *-decisions.json
  - *-learnings.json
  - *-patterns.json
  - *-todos.json
```

## Impl

## Notes

*Imported from external tracker. See source link for full context.*
