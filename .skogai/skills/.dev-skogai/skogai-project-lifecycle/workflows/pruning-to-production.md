---
title: pruning-to-production
type: note
permalink: skogai/skills/skogai-project-lifecycle/workflows/pruning-to-production
---

# Workflow: Pruning to Production

## Entry Criteria

You should be here if:

- [x] You have a working MVP from the explosive phase
- [x] The feature/skill/tool does what it's supposed to do
- [x] You're ready to pay down the "token debt" from rapid iteration

## The Pruning Process

### Step 1: Identify What You Have

List everything created during the explosive phase:

- Files created
- Documentation written
- Comments added
- Config options exposed

Don't judge yet. Just inventory.

### Step 2: Apply the Starved Context Test

For each item, ask: **"Could Claude recreate this knowing nothing about our project?"**

| If Claude could...         | Then...                         |
| -------------------------- | ------------------------------- |
| Write it verbatim          | Delete it                       |
| Write something equivalent | Delete it                       |
| Write most of it           | Keep only the non-obvious parts |
| Not write it at all        | Keep it (this is the value)     |

### Step 3: Run the Differential Documentation Engine

For any substantial documentation:

1. Use the prompt template from `@../references/differential-documentation-engine.md`
1. Provide your current docs as `{$PROJECT_CONTEXT}`
1. Provide the topic as `{$TOPIC}`
1. Replace your docs with the `[differential_doc]` output

Expected results: 60-80% reduction in size, 100% signal preserved.

### Step 4: Validate the Pruning

**The reconstruction test:**

1. Start a fresh Claude session (no project context)
1. Give it only your pruned documentation
1. Ask it to implement/explain the feature
1. Compare to what you actually built

If Claude reconstructs it correctly → pruning successful If Claude gets confused → you pruned something essential (restore it)

### Step 5: Check Production Standards

Before moving to `.skogai/claude/`:

- [ ] All generic content removed
- [ ] Only project-specific decisions documented
- [ ] No redundant explanations
- [ ] Passes the reconstruction test
- [ ] Follows production conventions (F# where applicable, etc.)

## Common Pruning Targets

### Documentation Bloat

**Before (explosive):**

```markdown
## Database Setup

We use PostgreSQL as our database. PostgreSQL is a powerful,
open-source object-relational database system. It has a strong
reputation for reliability, feature robustness, and performance.

To connect, use the following configuration:

- Host: localhost
- Port: 5432
- Database: myapp_dev
```

**After (pruned):**

```markdown
## Database

- Non-default: `statement_timeout=30s` (compliance requirement)
- Schema: Uses `department_id` partitioning for row-level security
- Connection pool: 20 (increased from default 10, see incident #234)
```

### Code Comment Bloat

**Before:**

```python
# Initialize the database connection
# This creates a new connection to PostgreSQL using the config
db = Database(config)  # Create database instance
```

**After:**

```python
# Pool size 20 required - see incident #234
db = Database(config)
```

### Skill/Prompt Bloat

**Before:**

```markdown
You are a helpful assistant. Be accurate and thorough.
Think step by step before answering. Consider multiple
perspectives. Be concise but complete.

When analyzing code, look for:

- Bugs
- Performance issues
- Security vulnerabilities
  ...
```

**After:**

```markdown
Use skogai-notation for types. Flag any direct /atoms writes.
```

## Exit Criteria

Ready to move to production when:

- [ ] Documentation passes differential engine (>50% reduction)
- [ ] Code passes reconstruction test
- [ ] No generic content remains
- [ ] Follows `.skogai/claude/` conventions

Next: `@../workflows/migration-path.md`
