MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 08 Jan 2026 01:53:41 -0800
Subject: Re: [SkogAI/lore] feat: Extract inline LLM prompts to external YAML files (PR #52)
Message-ID: <SkogAI/lore/pull/52/review/3638648400@github.com>
In-Reply-To: <SkogAI/lore/pull/52@github.com>
References: <SkogAI/lore/pull/52@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695f7ea5b196e_e710d0348971"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR extracts inline LLM prompts from shell scripts into externalized YAML files, enabling offline queuing, systematic auditing, and cross-tool reuse. The changes maintain full backward compatibility with inline fallbacks.

**Key changes:**
- Created 7 YAML prompt definition files in the `prompts/` directory with standardized structure
- Added `load_prompt_template()` and `interpolate_prompt()` utility functions to shell scripts
- Updated all prompt usage locations in `llama-lore-creator.sh` and `llama-lore-integrator.sh` to load from YAML with inline fallbacks

### Reviewed changes

Copilot reviewed 10 out of 10 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `prompts/lore-entry-generation.yaml` | Prompt for generating narrative lore entries with variable category and title |
| `prompts/persona-generation.yaml` | Prompt for generating character personality traits and voice characteristics |
| `prompts/lorebook-titles-generation.yaml` | Prompt for generating categorized lists of lore entry titles |
| `prompts/lore-extraction-json.yaml` | Prompt for extracting lore entities from text as JSON output |
| `prompts/lore-extraction-markdown.yaml` | Prompt for extracting lore entities from text as Markdown output |
| `prompts/persona-from-text.yaml` | Prompt for extracting persona information from text content |
| `prompts/connection-analysis.yaml` | Prompt for analyzing relationships between lore entries |
| `prompts/README.md` | Comprehensive documentation of prompt format, usage patterns, and guidelines |
| `tools/llama-lore-creator.sh` | Added prompt loading functions and updated 3 prompt locations to use YAML files |
| `tools/llama-lore-integrator.sh` | Added prompt loading functions and updated 4 prompt locations to use YAML files |
</details>






> +load_prompt() {
+    local prompt_file="$1"
+    local prompt_content=""
+    
+    # Try to load from file
+    if [ -f "$SKOGAI_DIR/prompts/$prompt_file" ]; then
+        prompt_content=$(yq eval '.template' "$SKOGAI_DIR/prompts/$prompt_file")
+    fi
+    
+    # If file not found or yq not available, use inline fallback
+    if [ -z "$prompt_content" ]; then
+        # Return inline fallback prompt
+        echo "$FALLBACK_PROMPT"
+    else
+        echo "$prompt_content"
+    fi
+}

The documentation example uses the function name `load_prompt()`, but the actual implementation in the shell scripts uses `load_prompt_template()`. This naming inconsistency could confuse users trying to follow the documentation. Update the function name in the example to match the actual implementation.

> +  # Try to load from file if it exists and yq is available
+  if [ -f "$prompt_path" ] && command -v yq &>/dev/null; then
+    yq eval '.template' "$prompt_path" 2>/dev/null || echo "$fallback_prompt"
+  else
+    echo "$fallback_prompt"
+  fi
+}
+
+# Function to interpolate variables in prompt template
+interpolate_prompt() {
+  local template="$1"
+  shift
+  local result="$template"
+  
+  # Replace each variable pair (name, value)
+  while [ $# -gt 1 ]; do

The `interpolate_prompt` function has a potential infinite loop issue when called with an odd number of arguments after the template. The loop condition `while [ $# -gt 1 ]` will continue when there's only one argument left, then `shift 2` will fail or behave unexpectedly. Consider adding validation to ensure arguments come in pairs, or change the loop condition to `while [ $# -ge 2 ]` for clarity.

> +  
+  # Replace each variable pair (name, value)
+  while [ $# -gt 1 ]; do

The `interpolate_prompt` function has a potential infinite loop issue when called with an odd number of arguments after the template. The loop condition `while [ $# -gt 1 ]` will continue when there's only one argument left, then `shift 2` will fail or behave unexpectedly. Consider adding validation to ensure arguments come in pairs, or change the loop condition to `while [ $# -ge 2 ]` for clarity.
```suggestion

  # Ensure we have an even number of arguments (name, value) pairs
  if [ $(( $# % 2 )) -ne 0 ]; then
    echo "Error: interpolate_prompt expects variable arguments in name/value pairs, but got an odd number: $#." >&2
    return 1
  fi
  
  # Replace each variable pair (name, value)
  while [ $# -ge 2 ]; do
```

> +    if [ -z "$prompt_content" ]; then
+        # Return inline fallback prompt
+        echo "$FALLBACK_PROMPT"
+    else
+        echo "$prompt_content"
+    fi
+}
+
+# Interpolate variables
+interpolate_prompt() {
+    local template="$1"
+    shift
+    local result="$template"
+    
+    # Replace each variable pair (name, value)
+    while [ $# -gt 0 ]; do

The documentation example shows the loop condition as `while [ $# -gt 0 ]`, but the actual implementation in the shell scripts uses `while [ $# -gt 1 ]`. This inconsistency could confuse users trying to implement the pattern. The documentation should match the actual implementation to be accurate.
```suggestion
    while [ $# -gt 1 ]; do
```

> +  
+  Format EXACTLY like this:
+  {
+    "entries": [
+      {
+        "title": "Entity Name",
+        "category": "character",
+        "summary": "One sentence essence",
+        "content": "2-3 paragraphs narrative prose in present tense",
+        "tags": ["tag1", "tag2", "tag3"]
+      }
+    ]
+  }
+  
+  Rules:
+  - Categories: character, place, object, event, concept

Inconsistency in category naming convention: the JSON extraction prompt uses lowercase categories (character, place, object, event, concept) on line 30, while the Markdown extraction prompt uses uppercase categories (CHARACTER, PLACE, OBJECT, EVENT, CONCEPT) on line 29. This inconsistency could lead to parsing issues or confusion when processing the output from different extraction formats. Consider standardizing to one case convention across all prompts.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/52#pullrequestreview-3638648400
You are receiving this because you commented.

Message ID: <SkogAI/lore/pull/52/review/3638648400@github.com>