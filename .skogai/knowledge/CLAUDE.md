# @knowledge/ - knowledge base

<what_is_this>

central repository for documented decisions, learnings, and reusable patterns.
persistent knowledge that accumulates over time.

</what_is_this>

<routing>

| intent | go to |
|--------|-------|
| style, naming, XML, commits | @patterns/style/CLAUDE.md |
| architectural decision (full) | @decisions/ |
| insight, learning, gotcha | @learnings/ |
| reusable pattern | @patterns/ |

</routing>

<frontmatter>

all entries in learnings/ and decisions/ MUST include frontmatter:

```yaml
---
title: [Descriptive Title]
date: [YYYY-MM-DD]
project: [project-name or "SkogAI"]
tags: [tag1, tag2, tag3]
source: [where this came from — session, PR, experiment, etc.]
status: active
---
```

use @../templates/knowledge-entry.md as starting point.

</frontmatter>

<file_naming>

date prefix for chronological sorting:

- decisions/YYYY-MM-DD-slug.md
- learnings/YYYY-MM-DD-slug.md
- patterns/slug.md (no date — patterns are timeless)

</file_naming>
