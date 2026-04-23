MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 10:39:03 -0700
Subject: [SkogAI/lore] Document migration path from bash tools to API-based architecture (Issue #88)
Message-ID: <SkogAI/lore/issues/88@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e00a3741eba_d6e410d874091"; charset="UTF-8"

claude[bot] created an issue (SkogAI/lore#88)

## Summary

Create documentation and migration tooling to help transition from direct file manipulation (bash tools) to the new API-based architecture while maintaining backward compatibility during the transition.

## Migration Strategy

### Phase 1: Parallel Operation (Current)
```
Bash tools (tools/manage-lore.sh) ─┐
                                    ├─→ JSON Files
REST API Service                   ─┘
```

Both systems can coexist and modify the same JSON files.

### Phase 2: Gradual Migration
```
Bash tools (read-only warnings) ─┐
                                  ├─→ JSON Files
REST API Service (primary)       ─┘
CLI tool (via API)               ─┘
```

Bash tools emit deprecation warnings but still work.

### Phase 3: API-Only
```
REST API Service ─→ JSON Files (or future: SQLite)
CLI tool (via API) ─┘
```

Bash tools removed or converted to API clients.

## Documentation Needed

### 1. Architecture Decision Record (ADR)
```markdown
# ADR: Migration from File-Based to API-Based Lore Management

## Context
Current system uses bash scripts with direct JSON file manipulation.
Need proper API layer for tooling integration and validation.

## Decision
Build REST API service while maintaining file compatibility.
Migrate CLI tools to consume API instead of direct file access.

## Consequences
- Temporary duplicate functionality during migration
- Better separation of concerns
- Easier to add features (web UI, integrations)
- Can eventually migrate storage layer without breaking tools
```

### 2. Migration Guide
```markdown
# Migrating from Bash Tools to API-Based Tools

## For Users

### Current (Bash)
```bash
./tools/manage-lore.sh create-entry
```

### New (API + CLI)
```bash
# Start API service
lore-api start

# Use CLI
lore entry create --title "..." --content "..."
```

## For Developers

### Old Way (Direct File I/O)
```bash
# Don't do this anymore
echo '{"title":"..."}' > "$ENTRIES_DIR/entry_123.json"
```

### New Way (API Client)
```python
import requests
response = requests.post("http://localhost:8000/api/v1/entries", json={...})
```
```

### 3. Compatibility Matrix
| Tool | Status | Migration Path |
|------|--------|----------------|
| `tools/manage-lore.sh` | Keep for now | Add deprecation warnings |
| `generate-agent-lore.py` | Keep | Update to use API client |
| `st-lore-export.py` | Keep | Update to use API endpoints |
| `lore_api.py` (old) | Remove | Replaced by REST service |

## Migration Tooling

### 1. Data Validation Script
```bash
#!/bin/bash
# validate-migration.sh
# Verify all JSON files are valid and match schemas

for file in "$ENTRIES_DIR"/*.json; do
    if ! jq -e . "$file" >/dev/null 2>&1; then
        echo "Invalid JSON: $file"
    fi
done
```

### 2. API Health Check
```bash
#!/bin/bash
# check-api-health.sh
# Verify API service is running and accessible

if curl -f http://localhost:8000/api/v1/health >/dev/null 2>&1; then
    echo "✓ API service is healthy"
else
    echo "✗ API service is not responding"
    exit 1
fi
```

### 3. Deprecation Warnings in Bash Tools
```bash
# Add to tools/manage-lore.sh
show_deprecation_warning() {
    echo "⚠️  WARNING: Direct file manipulation is deprecated"
    echo "    Consider using the new API-based CLI: 'lore entry create'"
    echo "    This tool will be removed in a future version"
    echo ""
}
```

## Success Criteria

- [ ] ADR document explaining architectural decisions
- [ ] Migration guide for users and developers
- [ ] Compatibility matrix showing tool status
- [ ] Data validation scripts
- [ ] API health check utilities
- [ ] Deprecation warnings in bash tools
- [ ] Timeline for migration phases

## Timeline

1. **Week 1-2**: Build API service (#86) and CLI (#87)
2. **Week 3-4**: Add deprecation warnings, write documentation
3. **Week 5-6**: Migrate AI generation tools to use API
4. **Week 7+**: Monitor usage, eventual removal of bash tools

## Rollback Plan

If API approach fails:
1. Remove deprecation warnings
2. Keep bash tools as primary
3. Document lessons learned

---

Part of architectural cleanup from #84  
Depends on: #85, #86, #87

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/88
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/lore/issues/88@github.com>