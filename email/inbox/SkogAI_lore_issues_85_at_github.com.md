MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 10:37:48 -0700
Subject: [SkogAI/lore] Improve core lore management with validation and error handling (Issue #85)
Message-ID: <SkogAI/lore/issues/85@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e009ece89bd_b08110d8249b1"; charset="UTF-8"

claude[bot] created an issue (SkogAI/lore#85)

## Summary

Enhance the existing `tools/manage-lore.sh` bash tool with proper validation, error handling, and schema enforcement while maintaining the working centralized config approach.

## Current State

**What Works:**
- `tools/manage-lore.sh` uses centralized config (`config/lib.sh`, `config/paths.sh`)
- Respects `SKOGAI_LORE` environment from skogcli
- Basic CRUD operations for entries and books
- JSON file storage with proper path management

**What's Missing:**
- Schema validation before writing JSON
- Proper error handling and rollback
- Input validation and sanitization
- Duplicate detection
- Atomic operations (write to temp, then move)

## Proposed Improvements

### 1. Schema Validation
```bash
# Add validation function using jq
validate_entry_schema() {
    local json_file="$1"
    local schema_file="${SKOGAI_LORE}/knowledge/core/lore/schemas/entry.schema.json"
    
    # Validate JSON structure matches schema
    if ! jq -e . "$json_file" >/dev/null 2>&1; then
        echo "ERROR: Invalid JSON format" >&2
        return 1
    fi
    
    # Check required fields exist
    # ... validation logic
}
```

### 2. Better Error Handling
```bash
create_lore_entry() {
    local temp_file
    temp_file=$(mktemp) || { echo "ERROR: Failed to create temp file" >&2; return 1; }
    
    trap 'rm -f "$temp_file" EXIT
    
    # Build JSON
    # ...
    
    # Validate before writing
    if ! validate_entry_schema "$temp_file"; then
        echo "ERROR: Schema validation failed" >&2
        return 1
    fi
    
    # Atomic write
    mv "$temp_file" "$target_file" || { echo "ERROR: Failed to save entry" >&2; return 1; }
}
```

### 3. Input Validation
- Sanitize input strings (prevent JSON injection)
- Check for duplicate IDs/titles
- Validate required fields before processing

## Success Criteria

- [ ] Schema validation using jq and schema files
- [ ] Proper error handling with rollback
- [ ] Input validation and sanitization
- [ ] Atomic file operations (temp file → move)
- [ ] Duplicate detection
- [ ] Better error messages

## Non-Goals

- Don't rewrite in Python
- Don't add database layer
- Don't change file storage format
- Keep using centralized config system

---

Part of architectural cleanup from #84

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/85
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/lore/issues/85@github.com>