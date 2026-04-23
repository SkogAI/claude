MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sat, 29 Nov 2025 00:18:43 -0800
Subject: Re: [SkogAI/lore] Add validation, error handling, and atomic operations to manage-lore.sh (PR #120)
Message-ID: <SkogAI/lore/pull/120/review/3520594172@github.com>
In-Reply-To: <SkogAI/lore/pull/120@github.com>
References: <SkogAI/lore/pull/120@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692aac63347a4_fe1100564132"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR enhances `tools/manage-lore.sh` with comprehensive validation, sanitization, and atomic file operations to improve reliability and security of the lore management system. The changes add ~560 lines of defensive programming while maintaining backward compatibility with existing commands.

**Key Changes:**
- Adds schema validation using jq to validate JSON structure and field types against canonical schemas
- Implements input sanitization to prevent JSON injection attacks
- Introduces atomic file operations using temp files with automatic cleanup traps
- Adds duplicate detection for IDs (error) and titles (warning)
- Provides structured JSON output functions per argc specification





> +output_response() {
+    local type="$1"
+    local value="$2"
+    jq -n --arg type "$type" --arg value "$value" '{"type": $type, "value": $value}'
+}

The `output_response()` function is defined but never used in the actual commands. The PR description mentions following the argc specification for structured I/O with JSON `{type, value}` format, but all commands still use plain `echo` statements. Consider either: 1) Converting command outputs to use `output_response()`/`output_success()`/`output_error()` throughout, or 2) Removing these unused functions if they're intended for future use.

> +    # Remove control characters and escape problematic characters
+    echo "$input" | tr -d '\000-\011\013-\037' | sed 's/\\/\\\\/g; s/"/\\"/g'

The `sanitize_input()` function performs character escaping but the output is then passed to `jq -n --arg`, which already handles proper JSON escaping. This creates double-escaping. For example, a title `Test \"quoted\"` would become `Test \\\"quoted\\\"` after sanitization, and jq would escape it again. Consider removing the manual escaping in `sanitize_input()` and only keeping the control character removal (`tr -d`), since jq's `--arg` flag safely escapes all JSON special characters.
```suggestion
    # Remove control characters only; jq --arg handles JSON escaping
    echo "$input" | tr -d '\000-\011\013-\037'
```

> +    }
+    echo "$temp_file"
+}
+
+# Atomic write: write to temp file, validate, then move to target
+# Usage: atomic_write "$json_content" "$target_file" "entry"|"book"
+atomic_write() {
+    local json_content="$1"
+    local target_file="$2"
+    local schema_type="$3"
+    
+    local temp_file
+    temp_file=$(create_temp_file) || return 1
+    
+    # Setup cleanup trap
+    trap 'rm -f "$temp_file"' EXIT

The trap on EXIT will persist beyond the function scope and affect the entire script. When multiple atomic operations run in sequence, the trap will only reference the last `$temp_file` value. Use a more specific signal like RETURN, or better yet, remove the trap at the function end (line 324) since you're already handling cleanup explicitly with `rm -f` in error paths. The same issue exists in `atomic_update()` at line 344.

> +  if ! check_duplicate_entry_id "$entry_id"; then
+    return 1
+  fi

The duplicate ID check for generated IDs is unnecessary and can create a race condition. The `generate_id()` function uses `$(date +%s)_$(openssl rand -hex 4)` which combines timestamp with random hex, making collisions astronomically unlikely. More importantly, since the ID is generated just before this check, it can't already exist unless there's a race between concurrent script executions. Consider removing this check for entries and books, or document if concurrent execution is expected.
```suggestion

```

> +            if ! validate_json_format "$temp_file"; then
+                rm -f "$temp_file"
+                return 1
+            fi
+            ;;
+    esac
+    
+    # Atomic move to target
+    mv "$temp_file" "$target_file" || {
+        echo "ERROR: Failed to save file to $target_file" >&2
+        rm -f "$temp_file"
+        return 1
+    }
+    
+    # Clear trap
+    trap - EXIT

Using `trap - EXIT` clears ALL EXIT traps, not just the one set by this function. If there was a pre-existing EXIT trap from a parent scope, it would be removed. This is a destructive operation. Consider using a cleanup function pattern or simply removing the trap clear since the temp file is already cleaned up by the explicit `rm -f` in error paths and the successful `mv` command. The same issue exists in `atomic_update()` at line 383.

>    echo "For more information, see the documentation in knowledge/core/lore/"
 }
 
+# ============================================================================
+# Core Functions
+# ============================================================================
+
 # Generate a unique identifier
 generate_id() {
   echo "$(date +%s)_$(openssl rand -hex 4)"

The `generate_id()` function uses `openssl rand` which may not be available on all systems and could fail silently in a command substitution. This would result in IDs like `1234567890_` with no random component, significantly increasing collision risk. Add error handling: `openssl rand -hex 4 || { echo \"ERROR: Failed to generate random component\" >&2; return 1; }`
```suggestion
  local rand_component
  rand_component=$(openssl rand -hex 4) || {
    echo "ERROR: Failed to generate random component for ID (openssl not available or failed)" >&2
    return 1
  }
  echo "$(date +%s)_${rand_component}"
```

>        # Section exists, add entry to it
-      jq "(.structure[] | select(.name == \"$section\").entries) += [\"$entry_id\"]" "$book_file" >"${book_file}.tmp" && mv "${book_file}.tmp" "$book_file"
+      if ! atomic_update "$book_file" "(.structure[] | select(.name == \"$sanitized_section\").entries) += [\"$entry_id\"]" "book"; then

The jq filter uses `$sanitized_section` as a bash variable inside the jq expression string, but jq doesn't have access to bash variables. This should use jq's `--arg` flag to pass the sanitized section name safely: `atomic_update \"$book_file\" '--arg section \"$sanitized_section\" (.structure[] | select(.name == \\$section).entries) += [\"$entry_id\"]' \"book\"`. Note: `atomic_update()` would need to be modified to pass additional jq arguments, or the filter should be constructed differently.

>      echo "Added entry to book's entry list"
   fi
 
   # If section is specified, add to that section
   if [ -n "$section" ]; then
-    if jq -e ".structure[] | select(.name == \"$section\")" "$book_file" >/dev/null; then
+    local sanitized_section
+    sanitized_section=$(sanitize_input "$section")
+    
+    if jq -e ".structure[] | select(.name == \"$sanitized_section\")" "$book_file" >/dev/null; then

Even though `$sanitized_section` has been through `sanitize_input()`, embedding it directly in a jq filter string is vulnerable to jq injection. For example, a section name like `\") or true //\"` could alter the jq expression logic. Use jq's `--arg` flag to safely pass the value: `jq -e --arg section \"$sanitized_section\" '.structure[] | select(.name == \\$section)' \"$book_file\"`

> +    local jq_filter="$2"
+    local schema_type="$3"
+    
+    if [ ! -f "$file" ]; then
+        echo "ERROR: File not found: $file" >&2
+        return 1
+    fi
+    
+    local temp_file
+    temp_file=$(create_temp_file) || return 1
+    
+    # Setup cleanup trap
+    trap 'rm -f "$temp_file"' EXIT
+    
+    # Apply jq filter and write to temp file
+    if ! jq "$jq_filter" "$file" > "$temp_file" 2>/dev/null; then

The `atomic_update()` function passes the jq filter as a single string argument, but several call sites (lines 753, 769, 774, 806, 816, 823) need to pass additional jq arguments like `--arg`. The current design doesn't support this. Consider either: 1) Accepting variable arguments: `local jq_filter=\"$2\"; shift 2; jq \"$jq_filter\" \"$@\" \"$file\"`, or 2) Splitting filter and additional args: `atomic_update \"$file\" \"$jq_filter\" \"$schema_type\" \"--arg section $sanitized_section\"`

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/120#pullrequestreview-3520594172
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/120/review/3520594172@github.com>