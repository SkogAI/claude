MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Tue, 06 Jan 2026 00:41:42 -0800
Subject: Re: [SkogAI/lore] Add validation, stripping, and retry logic to reduce LLM meta-commentary in lore generation (PR #55)
Message-ID: <SkogAI/lore/pull/55/review/3629965807@github.com>
In-Reply-To: <SkogAI/lore/pull/55@github.com>
References: <SkogAI/lore/pull/55@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695ccac6c1277_c010d095115"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR implements validation, stripping, and retry logic to reduce LLM meta-commentary in lore generation. It addresses issue #5 by strengthening prompts, centralizing pattern detection, and adding retry mechanisms when meta-commentary is detected.

Key changes:
- Introduces centralized `META_PATTERNS` constant covering 14+ common meta-commentary phrases
- Enhances validation to scan entire content (not just first line) for meta-commentary
- Implements retry loop (max 2 attempts) with validation → strip → re-validate cycle
- Restructures prompts with numbered CRITICAL RULES and explicit format requirements

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 10 comments.

| File | Description |
| ---- | ----------- |
| tools/llama-lore-creator.sh | Adds META_PATTERNS constant, enhances validate/strip functions to check entire content, implements retry loop with max 2 attempts, and strengthens prompts with numbered rules |
| tools/llama-lore-creator.py | Mirrors bash implementation with META_PATTERNS list, adds validate_lore_output() and strip_meta_commentary() functions, implements identical retry logic, and updates all prompts with structured format requirements |





> +    lines = content.split('\n')
+    cleaned_lines = []
+    
+    for line in lines:
+        # Check if line matches any meta-commentary pattern
+        is_meta = False
+        for pattern in META_PATTERNS:
+            if re.search(pattern, line, re.IGNORECASE):
+                is_meta = True
+                break
+        
+        if not is_meta:
+            cleaned_lines.append(line)
+    
+    # Join and remove leading empty lines
+    cleaned = '\n'.join(cleaned_lines).lstrip()

The function uses `.lstrip()` to remove leading whitespace, but similar to the bash version, if the aggressive pattern filtering removes too much content, this could return nearly-empty text that fails validation.

Consider adding a safety check after stripping to verify that sufficient content remains (e.g., minimum word count), and if the cleaned content is too short, return the original content instead to preserve more information for debugging or fallback handling.
```suggestion
    cleaned = '\n'.join(cleaned_lines).lstrip()
    
    # Safety check: if aggressive stripping removed too much content,
    # fall back to the original content to preserve information.
    cleaned_word_count = len(cleaned.split())
    original_word_count = len(content.split())
    MIN_CLEANED_WORDS = 20
    if cleaned_word_count < MIN_CLEANED_WORDS and original_word_count > cleaned_word_count:
        return content
    
```

> +  if echo "$content" | grep -qiE "$META_PATTERNS"; then
+    errors+=("⚠️  Contains meta-commentary")

The error message "Contains meta-commentary" doesn't provide information about which pattern was matched or where in the content it was found. This makes it harder to debug why validation failed and to refine prompts or patterns.

Consider enhancing the error message to include which specific pattern triggered the validation failure, to aid in debugging and iterative improvement of the meta-commentary detection.
```suggestion
  local meta_match meta_line
  meta_match=$(echo "$content" | grep -oiE -m1 "$META_PATTERNS" || true)
  if [ -n "$meta_match" ]; then
    meta_line=$(echo "$content" | grep -niE -m1 "$META_PATTERNS" | cut -d: -f1 || true)
    if [ -n "$meta_line" ]; then
      errors+=("⚠️  Contains meta-commentary (matched: '$meta_match' on line $meta_line)")
    else
      errors+=("⚠️  Contains meta-commentary (matched: '$meta_match')")
    fi
```

> +META_PATTERNS = [
+    r'^\s*(I will|Let me|Here is|Here\'s|This entry|This is)',
+    r'^\s*(I need your|should I|would you like|First,? I|Now,? I)',
+    r'^\s*(I\'ve created|I have created|As requested|Based on your request)'
+]

The META_PATTERNS constant in bash uses a single-quoted string with escaped single quotes for contractions (e.g., `Here'\''s`), while the Python version uses raw strings with backslash-escaped single quotes (e.g., `Here\'s`). While both work, this inconsistency makes maintenance more difficult.

Additionally, the bash version includes all patterns in one regex string, while Python splits them into a list. This means the two implementations don't match exactly - the bash pattern is a single alternation while Python checks multiple patterns sequentially. Consider standardizing the approach between both implementations to ensure they behave identically.

> +  while [ $attempt -lt $max_retries ]; do
+    attempt=$((attempt + 1))
+    
+    if [ $attempt -gt 1 ]; then
+      echo "Retry attempt $attempt/$max_retries..."
+    fi
 
-  # Validate and clean content
-  if ! validate_lore_output "$CONTENT"; then
-    echo "⚠️  Validation issues detected, attempting to clean content..."
-    CONTENT=$(strip_meta_commentary "$CONTENT")
-  fi
+    # Run LLM to generate content
+    CONTENT=$(run_llm "$PROMPT")
+
+    # Validate and clean content
+    if validate_lore_output "$CONTENT"; then
+      # Content is valid, break out of retry loop
+      break
+    else
+      echo "⚠️  Validation failed on attempt $attempt, cleaning content..."
+      CONTENT=$(strip_meta_commentary "$CONTENT")
+      
+      # Re-validate after cleaning
+      if validate_lore_output "$CONTENT"; then
+        echo "✅ Content cleaned successfully"
+        break
+      elif [ $attempt -ge $max_retries ]; then
+        echo "⚠️  Max retries reached. Using best available content."
+      fi
+    fi
+  done

The retry loop doesn't provide the LLM with feedback about what went wrong. On retry attempts, the exact same prompt is used without any indication that the previous attempt failed or what patterns to avoid. This means retries are unlikely to produce different results.

Consider enhancing the prompt on retry attempts to explicitly mention that meta-commentary was detected in the previous attempt and must be avoided, or add the detected patterns to a "DO NOT USE" list in the retry prompt.

> +        if re.search(pattern, content, re.IGNORECASE | re.MULTILINE):
+            errors.append("⚠️  Contains meta-commentary")

The validation function checks for meta-commentary patterns "anywhere in content" but breaks after finding the first match. While this is correct for determining validity (one match is enough to fail), the error message "Contains meta-commentary" doesn't indicate WHERE the meta-commentary was found or WHICH pattern matched. This makes debugging difficult.

Consider enhancing the error message to include which pattern was matched and potentially the line number or excerpt where it was found, to help with troubleshooting and prompt refinement.
```suggestion
        match = re.search(pattern, content, re.IGNORECASE | re.MULTILINE)
        if match:
            # Compute line number for the first match
            line_no = content.count("\n", 0, match.start()) + 1
            # Safely extract the matching line and create a short excerpt
            lines = content.splitlines()
            if 1 <= line_no <= len(lines):
                line_text = lines[line_no - 1].strip()
            else:
                line_text = ""
            snippet = line_text
            if len(snippet) > 80:
                snippet = snippet[:77] + "..."
            errors.append(
                f"⚠️  Contains meta-commentary (pattern {pattern!r} on line {line_no}: {snippet})"
            )
```

> @@ -69,13 +74,16 @@ validate_lore_output() {
 # Function to strip meta-commentary from content
 strip_meta_commentary() {
   local content="$1"
-
-  # If first line contains meta-commentary, remove it
-  if echo "$content" | head -n 1 | grep -qiE '^[[:space:]]*(I will|Let me|Here is|This entry|I need your|should I|First,? I)'; then
-    echo "$content" | tail -n +2
-  else
-    echo "$content"
-  fi
+  local cleaned="$content"
+
+  # Remove common meta-commentary patterns from anywhere in content
+  # Using the META_PATTERNS variable defined at top of script
+  cleaned=$(echo "$cleaned" | grep -viE "$META_PATTERNS")

The `grep -viE` command will filter out lines matching the meta-commentary patterns, but this approach has a critical flaw: it will remove ALL lines that match ANY of the patterns, even if they appear as legitimate narrative content within sentences. For example, a narrative sentence like "The architect paused. Here is where the story begins to unfold..." would be completely removed because it contains "Here is". This is too aggressive and could destroy valid narrative content.

Consider using a more targeted approach that only strips complete lines that consist primarily of meta-commentary, or only removes patterns at the very beginning of the content. Alternatively, use word boundaries and more context-aware matching to avoid removing legitimate narrative text.

> +    for line in lines:
+        # Check if line matches any meta-commentary pattern
+        is_meta = False
+        for pattern in META_PATTERNS:
+            if re.search(pattern, line, re.IGNORECASE):
+                is_meta = True
+                break
+        
+        if not is_meta:
+            cleaned_lines.append(line)

The Python implementation has the same critical issue as the bash version. The line-by-line filtering with `re.search(pattern, line, re.IGNORECASE)` will remove ANY line containing these patterns, even if they're part of legitimate narrative content. For example, a line like "The ancient tome revealed secrets. Here is where legends are born..." would be completely removed because it contains "Here is".

This approach is too aggressive and could destroy valid narrative prose. Consider using more precise matching that only targets standalone meta-commentary (e.g., checking if the pattern is at the start of the line and followed by punctuation or specific sentence structures), or limit stripping to only the first few lines of content.

> +    # Retry loop for generating valid content
+    while attempt < max_retries:
+        attempt += 1
+        
+        if attempt > 1:
+            print(f"Retry attempt {attempt}/{max_retries}...")
+
+        content = run_llm(prompt, provider, model)
+
+        # Validate and clean content
+        if validate_lore_output(content):
+            # Content is valid, break out of retry loop
+            break
+        else:
+            print(f"⚠️  Validation failed on attempt {attempt}, cleaning content...")
+            content = strip_meta_commentary(content)
+            
+            # Re-validate after cleaning
+            if validate_lore_output(content):
+                print("✅ Content cleaned successfully")
+                break
+            elif attempt >= max_retries:
+                print("⚠️  Max retries reached. Using best available content.")
 

The retry loop has the same issue as the bash version - it doesn't provide feedback to the LLM about what went wrong. Retrying with the identical prompt is unlikely to yield different results since the LLM has no information about why the previous attempt failed.

Consider modifying the prompt on subsequent attempts to explicitly indicate that meta-commentary was detected and must be avoided, or inject the specific detected patterns into a "PREVIOUS ERRORS" section of the retry prompt.

> @@ -7,6 +7,11 @@ SKOGAI_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
 MODEL_NAME=${1:-"llama3.2:3b"}
 PROVIDER=${LLM_PROVIDER:-"ollama"} # Set via env var or defaults to ollama
 
+# Meta-commentary patterns to detect/remove
+# These are common phrases LLMs use instead of direct content
+META_PATTERNS='^\s*(I will|Let me|Here is|Here'\''s|This entry|This is|I need your|should I|would you like|First,? I|Now,? I|I'\''ve created|I have created|As requested|Based on your request)'

The pattern `^\s*(I will|Let me|Here is|Here's|This entry|This is)` will match lines that START with these phrases (after whitespace), but when used with `grep -viE`, the entire line containing the match is removed. This means if "Here is" appears anywhere in a line that starts with these patterns, the whole line is lost.

However, there's a more subtle issue: the bash pattern uses single quotes with escaped quotes for contractions (e.g., `Here'\''s`), which is correct bash syntax, but this pattern needs to be used consistently with grep's extended regex mode. Consider testing this pattern thoroughly to ensure contractions with apostrophes are being matched correctly.

> +  
+  # Remove empty lines at the start
+  cleaned=$(echo "$cleaned" | sed '/./,$!d')
+  
+  echo "$cleaned"

The `sed '/./,$!d'` command removes leading empty lines, but the cleaned content comes from `grep -viE` which already filters lines by pattern. If all meaningful content lines are accidentally removed by the overly aggressive filtering, this could result in returning empty or nearly-empty content that passes no validation checks.

Consider adding a safety check after the strip operation to verify that sufficient content remains (e.g., minimum line count or word count) before returning the cleaned result, and if not, return the original content instead.
```suggestion

  # Remove empty lines at the start
  cleaned=$(echo "$cleaned" | sed '/./,$!d')

  # Safety check: if stripping removed too much content, fall back to original
  local cleaned_word_count
  cleaned_word_count=$(echo "$cleaned" | wc -w)
  if [ "$cleaned_word_count" -lt 20 ]; then
    echo "$content"
  else
    echo "$cleaned"
  fi
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/55#pullrequestreview-3629965807
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/55/review/3629965807@github.com>