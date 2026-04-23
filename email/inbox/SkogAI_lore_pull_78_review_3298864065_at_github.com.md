MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 06:01:35 -0700
Subject: Re: [SkogAI/lore] docs: add lib.sh documentation to config README- Document all helper functions in lib.sh- Add before/after examples showing simplification- Explain simplicity standards and safe JSON manipulation- Update files list in config directory

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-Authored-By: Claude <noreply@anthropic.com>Co-Authored-By: Skogix <Skogix@users.noreply.github.com> (PR #78)
Message-ID: <SkogAI/lore/pull/78/review/3298864065@github.com>
In-Reply-To: <SkogAI/lore/pull/78@github.com>
References: <SkogAI/lore/pull/78@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfc92f6f816_955f10d8799bc"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors three shell scripts in the `tools/` directory to use centralized helper functions from the new `config/lib.sh`. The main purpose is to simplify complex sed/awk chains, promote code reuse, and standardize JSON manipulation patterns across shell scripts.

Key changes:
- Replace manual path calculations with centralized library functions
- Use safe JSON manipulation with jq instead of complex sed chains
- Standardize environment variable loading and configuration patterns

### Reviewed Changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tools/manage-lore.sh | Refactored to use lib.sh functions for path handling, ID generation, and timestamps |
| tools/llama-lore-integrator.sh | Updated to use centralized JSON array conversion and key-value extraction functions |
| tools/llama-lore-creator.sh | Simplified to use helper functions for parsing model output and path management |
| config/lib.sh | New centralized library providing reusable shell functions for common operations |
| config/README.md | Added comprehensive documentation for the lib.sh helper functions with before/after examples |
</details>






> +# Output: ["item1","item2","item3"]
+json_array_from_csv() {
+    local csv="$1"
+
+    # Handle empty input
+    if [ -z "$csv" ]; then
+        echo "[]"
+        return
+    fi
+
+    # Use jq for proper JSON formatting (handles escaping)
+    if command -v jq &> /dev/null; then
+        echo "$csv" | jq -R 'split(",") | map(gsub("^\\s+|\\s+$";""))'
+    else
+        # Fallback to bash if jq not available (less robust)
+        echo "[$csv]" | sed 's/,/","/g' | sed 's/\[/["/' | sed 's/\]/"]/''

Missing closing quote in sed expression - should be `sed 's/\]/\"]/''`
```suggestion
        echo "[$csv]" | sed 's/,/","/g' | sed 's/\[/["/' | sed 's/\]/"]/'
```

> +# Output: extracted value
+extract_key_value() {
+    local text="$1"
+    local key="$2"
+
+    echo "$text" | grep -oP "^${key}: \K.*" | head -n 1
+}
+
+# Extract value from "KEY: value" formatted text (case-insensitive)
+# Usage: extract_key_value_i "$text" "TRAITS"
+# Output: extracted value
+extract_key_value_i() {
+    local text="$1"
+    local key="$2"
+
+    echo "$text" | grep -i "^${key}:" | head -n 1 | sed "s/${key}://i" | xargs

The sed expression `s/${key}://i` should use case-insensitive flag correctly. It should be `s/${key}://I` (uppercase I) for case-insensitive substitution in sed.
```suggestion
    echo "$text" | grep -i "^${key}:" | head -n 1 | sed "s/${key}://I" | xargs
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/78#pullrequestreview-3298864065
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/78/review/3298864065@github.com>