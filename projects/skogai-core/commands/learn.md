---
description: Document a new learning or pattern
argument-hint: [topic or description of what was learned]
allowed-tools: Read, Write, Edit, Glob, Grep
---

The user wants to document a learning or pattern. The topic/description is: $ARGUMENTS

Process:
1. Ask the user to explain what they learned, if $ARGUMENTS is vague or missing
2. Identify what type of learning this is:
   - A correction to something Claude assumed wrongly
   - A new pattern or convention discovered
   - A tool/command behavior that wasn't obvious
   - A workflow improvement
3. Check if a relevant doc already exists in the project's `docs/` directory using Glob
4. Either update the existing doc or create a new one in `docs/`
5. Use clear headings, bullet points, and keep it concise
6. If the learning corrects a previous misunderstanding, note what was wrong and why

Document format:
- Title: descriptive, not generic
- What: the actual learning in 1-3 sentences
- Why it matters: when this knowledge is needed
- Example: concrete example if applicable

After documenting, suggest whether this should also be added to INBOX.list or memory.
