---
name: knowledge-module
description: Personal knowledge base - research, bookmarks, learning resources, and notes. Use for information retrieval, research organization, and learning tracking.
permalink: claude/tmp/dot-claude/plugins/cache/context-engineering-marketplace/cognitive-architecture/8ecfb76ca343/examples/digital-brain-skill/knowledge/knowledge
---

# Knowledge Base

Your second brain for research, learning, and information organization.

## Files in This Module

| File              | Format   | Purpose                   |
| ----------------- | -------- | ------------------------- |
| `bookmarks.jsonl` | JSONL    | Saved links and resources |
| `learning.yaml`   | YAML     | Skills and learning goals |
| `competitors.md`  | Markdown | Competitive landscape     |
| `research/`       | Folder   | Deep-dive research notes  |
| `notes/`          | Folder   | Quick capture notes       |

## Data Schemas

### Bookmark Entry

```json
{
  "id": "bm_YYYYMMDD_HHMMSS",
  "saved_at": "ISO8601",
  "url": "https://...",
  "title": "Page title",
  "source": "article|video|podcast|tool|tweet|paper",
  "category": "category_name",
  "summary": "1-2 sentence summary",
  "key_insights": ["insight1", "insight2"],
  "status": "unread|read|reviewed|archived",
  "rating": 1-5,
  "tags": ["tag1", "tag2"]
}
```

## Workflows

### Saving a Resource

1. Append to `bookmarks.jsonl` with status "unread"
1. Add category and initial tags
1. Later: read, summarize, update status

### Research Projects

1. Create `research/[topic].md` for deep dives
1. Link relevant bookmarks
1. Synthesize insights
1. Extract content ideas

### Learning Tracking

1. Define skills in `learning.yaml`
1. Link resources to skills
1. Track progress and milestones
1. Review quarterly

## Agent Instructions

<instructions>
When managing knowledge:

1. **Saving links**: Always capture URL, title, and initial category
1. **Organizing**: Use consistent categories and tags
1. **Retrieving**: Search bookmarks.jsonl by category, tags, or keywords
1. **Synthesizing**: When asked about a topic, check research/ folder first
1. **Learning updates**: Update learning.yaml when completing resources

Categories to use:

- ai_agents: AI, agents, automation
- building: Startups, product, engineering
- growth: Marketing, audience, content
- productivity: Systems, tools, workflows
- leadership: Management, teams, culture
- industry: Market trends, competitors
- personal: Health, relationships, life </instructions>

## Knowledge Graph Hints

When retrieving information, consider connections:

- Bookmarks → Content ideas
- Research → Authority pieces
- Learning → Skills to highlight in brand
- Competitors → Differentiation angles
