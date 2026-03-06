---
state: new
created: "2026-03-06"
tracking: ["https://github.com/SkogAI/claude-memory/issues/7"]
tags: ["enhancement", "queue", "github"]
---

# Queue improvements: CLAUDECODE= env, concurrency, progress tracking

**Source**: [Github #7](https://github.com/SkogAI/claude-memory/issues/7)

## Description

## Parent: #1

## Summary

Queue improvements needed for the extraction pipeline to work at scale.

## Items

### 1. CLAUDECODE= env bypass
When `queue run` executes inside a Claude Code session, `claude -p` jobs fail with "cannot launch nested session." Queue runner should unset `CLAUDECODE` env var automatically when running jobs.

### 2. Concurrency control
Currently sequential. For ollama jobs, parallel processing is fine (model handles batching). Add `--concurrency N` flag.

```bash
queue r

## Notes

*Imported from external tracker. See source link for full context.*
