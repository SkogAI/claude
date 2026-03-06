---
state: new
created: 2026-03-06
tracking: ["https://github.com/SkogAI/claude/issues/38"]
tags: ["enhancement", "github"]
---

# skill: agent team patterns and best practices

**Source**: [Github #38](https://github.com/SkogAI/claude/issues/38)

## Description

## Context

First real CC Agent Teams run (gptme-contrib-mapping) revealed patterns worth codifying:

## Findings to document

1. **Agent cold-start**: Some agents go idle without starting work. Fix: include explicit "start with step 1 right now, use Read tool on X" in prompts.

2. **Shutdown dance**: Send shutdown_request → wait for approval → TeamDelete. Agents sometimes need 2 requests.

3. **Task dependency chains**: Use TaskUpdate addBlockedBy for sequential tasks. Parallel tasks can start 

## Notes

*Imported from external tracker. See source link for full context.*
