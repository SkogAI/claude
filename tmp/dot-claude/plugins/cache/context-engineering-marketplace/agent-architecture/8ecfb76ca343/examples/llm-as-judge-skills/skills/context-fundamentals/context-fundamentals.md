---
title: context-fundamentals
type: note
permalink: claude/tmp/dot-claude/plugins/cache/context-engineering-marketplace/agent-architecture/8ecfb76ca343/examples/llm-as-judge-skills/skills/context-fundamentals/context-fundamentals
---

# Context Fundamentals Skill

## Overview

Context engineering is the systematic approach to managing what information an LLM receives and how it processes that information. Effective context management directly impacts output quality, consistency, and task success rates.

## Core Principles

### 1. Context Window Management

The context window is finite. Every token counts. Prioritize information by relevance and recency.

**Strategies:**

- Summarize historical conversation turns
- Use retrieval to inject only relevant context
- Implement context compression for long documents

### 2. Information Hierarchy

Structure context to guide model attention:

```
1. System Instructions (highest priority)
   └── Role definition
   └── Task constraints
   └── Output format requirements

2. Relevant Context (dynamic)
   └── Retrieved documents
   └── User-specific data
   └── Recent conversation history

3. User Input (current request)
   └── Query or instruction
   └── Any inline context
```

### 3. Context Relevance

Not all context is equally useful. Apply relevance filtering:

- **Temporal Relevance**: Recent information often outweighs older data
- **Semantic Relevance**: Use embeddings to surface related content
- **Task Relevance**: Only include information needed for current task

## Context Types

### Static Context

- System prompts
- Role definitions
- Tool descriptions
- Format specifications

### Dynamic Context

- Retrieved documents (RAG)
- Conversation history
- User preferences
- Session state

### Ephemeral Context

- Current tool outputs
- Intermediate reasoning steps
- Scratchpad content

## Best Practices

1. **Explicit Over Implicit**: State requirements clearly rather than relying on inference
1. **Structured Formatting**: Use consistent delimiters and sections
1. **Redundancy Removal**: Avoid repeating information across context sections
1. **Source Attribution**: Mark where context comes from for traceability
1. **Freshness Signals**: Indicate when information was last updated

## Context Patterns

### RAG Integration Pattern

```
[System Instructions]
You are a helpful assistant. Use the provided context to answer questions.
Only use information from the context. If unsure, say so.

[Retrieved Context]
<document source="doc1.pdf" date="2024-01-15">
  Content here...
</document>

[User Query]
{user_input}
```

### Multi-Turn Context Pattern

```
[System Instructions]
...

[Conversation History]
Summary of earlier turns: {summary}

Recent exchanges:
User: {recent_user_1}
Assistant: {recent_assistant_1}
User: {recent_user_2}
Assistant: {recent_assistant_2}

[Current Turn]
User: {current_input}
```

## Metrics

- **Context Utilization Rate**: How much of provided context is used in response
- **Context Relevance Score**: Semantic similarity between context and response
- **Context Compression Ratio**: Original size vs. compressed size
- **Information Retention**: Key facts preserved after summarization
