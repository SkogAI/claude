MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 23:34:30 -0700
Subject: Re: [SkogAI/lore] Migrate OpenRouter integration scripts (Issue #63)
Message-ID: <SkogAI/lore/issues/63/3364438458@github.com>
In-Reply-To: <SkogAI/lore/issues/63@github.com>
References: <SkogAI/lore/issues/63@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df6e766d949_e810d82077cd"; charset="UTF-8"

claude[bot] left a comment (SkogAI/lore#63)

**Claude finished @Skogix's task** —— [View job](https://github.com/SkogAI/lore/actions/runs/18214855407)

---
### Creating New Issue for OpenRouter Migration

- [x] Gather context from original issue
- [x] Check current state of OpenRouter scripts
- [x] Draft new issue content
- [x] Prepare issue creation details

I don't have permission to create GitHub issues directly. Here's the issue content for you to create manually:

---

**Issue Title:** Migrate OpenRouter scripts after skogcli integration

**Issue Body:**

### Overview

Migrate OpenRouter integration scripts to use the centralized configuration system after they have been merged into skogcli scripts.

### Prerequisites

- [ ] OpenRouter scripts must be merged to skogcli first
- [ ] Configuration system must be implemented (from previous issues)

### Files to Migrate

#### Python Files

1. **OpenRouter Free** (`openrouter/or-free.py`)
   - Audit for hardcoded paths
   - Migrate to configuration system

2. **OpenRouter Helper** (`openrouter/or_free_helper.py`)
   - Audit for hardcoded paths
   - Migrate to configuration system

#### Shell Scripts

1. **OpenRouter Models (New)** (`openrouter/openrouter-models-new.sh`)
   - Audit for hardcoded paths
   - Migrate to configuration system

2. **OpenRouter Models** (`openrouter/openrouter-models.sh`)
   - Audit for hardcoded paths
   - Migrate to configuration system

3. **OpenRouter Free** (`openrouter/openrouter-free.sh`)
   - Audit for hardcoded paths
   - Migrate to configuration system

#### Additional Files Found

4. **orfree** (binary/executable)
   - Verify if this needs migration or can be removed

5. **or.free** (script/executable)
   - Verify if this needs migration or can be removed

### Migration Pattern

**Python:**
```python
# Before
cache_dir = "/home/skogix/skogai/openrouter/cache"

# After
from config import paths
cache_dir = paths.get_cache_dir("openrouter")
paths.ensure_dir(cache_dir)
```

**Shell:**
```bash
# Before
CACHE_DIR="/home/skogix/skogai/openrouter/cache"

# After
source "$(dirname "$0")/../config/paths.sh"
CACHE_DIR=$(get_cache_dir "openrouter")
ensure_dir "$CACHE_DIR"
```

### Testing Checklist

- [ ] Test OpenRouter API calls
- [ ] Verify cache directory creation
- [ ] Test with environment variables
- [ ] Test with defaults
- [ ] Verify API key handling

### Acceptance Criteria

- [ ] All OpenRouter scripts merged to skogcli
- [ ] All merged scripts use configuration system
- [ ] No hardcoded paths in openrouter scripts
- [ ] Cache and data directories work with custom paths
- [ ] API integration still functions correctly

### Related Issues

- Depends on: skogcli merge (to be created/referenced)
- Part of: Issue #5 path resolution standardization
- Successor to: Issue #63

---

You can create this issue using the GitHub web interface or by granting me permission to use the `gh issue create` command.

---
[Job Run](https://github.com/SkogAI/lore/actions/runs/) | [Branch](https://github.com/SkogAI/lore/tree/claude/issue-63-20251003-0632)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/63#issuecomment-3364438458
You are receiving this because you were mentioned.

Message ID: <SkogAI/lore/issues/63/3364438458@github.com>