---
title: CLAUDE
type: note
permalink: claude/projects/dot-skogai/templates/claude
---

# templates/ - starter templates

<what_is_this>

ready-to-copy starter files for common skogai content types.

templates are filled in by copy, not by mutation.
source files in `templates/` stay unchanged as reusable stubs.

</what_is_this>

<available_templates>

| template | when to use |
| --- | --- |
| `knowledge-entry.md` | capture a lesson, pattern, or knowledge note |
| `decision-record.md` | create an architectural decision record (adr) |
| `project-status.md` | track current state of a project |

this index exists so agents can discover available templates without opening each template file first.

</available_templates>

<usage>

1. copy a template to the destination directory
1. rename with date/subject as needed
1. replace placeholder text
1. remove sections that do not apply
1. update frontmatter metadata

</usage>

<examples>

```bash
cp templates/knowledge-entry.md knowledge/lessons/2026-04-19-example-lesson.md
cp templates/decision-record.md knowledge/decisions/2026-04-19-example-decision.md
cp templates/project-status.md projects/example-project.md
```

</examples>
