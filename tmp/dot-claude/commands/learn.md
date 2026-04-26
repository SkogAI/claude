---
description: Document a new learning or pattern
argument-hint:
  - topic or description of what was learned
allowed-tools: Read, Write, Edit, Glob, Grep
permalink: claude/tmp/dot-claude/commands/learn
---

The user wants to document a learning or pattern. The topic/description is: $ARGUMENTS

Process:

1. Ask the user to explain what they learned, if $ARGUMENTS is vague or missing
1. Identify what type of learning this is:
   - A correction to something Claude assumed wrongly
   - A new pattern or convention discovered
   - A tool/command behavior that wasn't obvious
   - A workflow improvement
1. Check if a relevant doc already exists in the project's `docs/` directory using Glob
1. Either update the existing doc or create a new one in `docs/`
1. Use clear headings, bullet points, and keep it concise
1. If the learning corrects a previous misunderstanding, note what was wrong and why

Document format:

- Title: descriptive, not generic
- What: the actual learning in 1-3 sentences
- Why it matters: when this knowledge is needed
- Example: concrete example if applicable

After documenting, suggest whether this should also be added to INBOX.list or memory.
