MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/tools <tools@noreply.github.com>
Date: Sat, 22 Nov 2025 16:59:52 -0800
Subject: Re: [SkogAI/tools] Claude/improve tools2 script 01 sr1 l7fq kj9g c1v s nmynaf n (PR #1)
Message-ID: <SkogAI/tools/pull/1/review/3497220429@github.com>
In-Reply-To: <SkogAI/tools/pull/1@github.com>
References: <SkogAI/tools/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69225c8832404_e8110081403e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR refactors the `tools2.sh` script to implement a standardized argc-based tool design pattern with comprehensive documentation tooling. It introduces choice functions for input validation, removes verbose output formatting in favor of data-only output, and adds several new documentation-focused commands. The changes also include a new `docs/rules.md` file that codifies the design principles for argc tools in this codebase.

Key changes:
- Adds argc choice functions (`_choice_doc`, `_choice_doc_all`, `_choice_lang`) for parameter validation
- Refactors existing documentation functions to follow the new design rules (no error messages, no headers, data-only output)
- Adds new documentation tools: `read_doc`, `recent_docs`, `compare_docs`, `extract_code_blocks`, `doc_tree`, `concat_docs`, `find_todos`, `word_counts`
- Makes `DOCS_DIR` configurable via `SKOGAI` environment variable

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 4 comments.

| File | Description |
| ---- | ----------- |
| tools2.sh | Complete refactoring of documentation tools to follow argc-first design pattern with choice functions, default values via argc syntax, and removal of verbose output formatting |
| docs/rules.md | New documentation file establishing conventions for argc tool development including input validation, defaults, output formatting, and code style |
| CLAUDE.md | Adds reference to rules.md for AI agent guidance |





---

💡 <a href="/SkogAI/tools/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>    {
-    echo "=== Summary of $argc_doc_path ==="
-    echo
+    while IFS= read -r file; do
+      local relpath="${file#$DOCS_DIR/}"
+      local words lines
+      words=$(wc -w <"$file")
+      lines=$(wc -l <"$file")
+      printf "%s\t%d\t%d\n" "$relpath" "$words" "$lines"
+    done < <(find "$DOCS_DIR" -type f -name "*.md" | sort)
+  } | case "$argc_sort_by" in
+    words) sort -t$'\t' -k2 -n -r ;;
+    lines) sort -t$'\t' -k3 -n -r ;;

The `--sort-by` enum includes "name" as a valid option (line 142), but the case statement here only explicitly handles "words" and "lines", with "name" falling through to the default case. While the input is already sorted by name from line 151, this implicit behavior is unclear. Either add an explicit `name)` case that documents the behavior (e.g., `name) cat ;;  # already sorted by find`) or remove "name" from the enum if sorting by name isn't intended.
```suggestion
    lines) sort -t$'\t' -k3 -n -r ;;
    name) cat ;;  # already sorted by name from 'find ... | sort'
```

>  
-  if [[ ! -f "$doc_file" ]]; then
-    echo "Error: Document not found: $doc_file" >>"$LLM_OUTPUT"
-    return 1
+  if [[ -n "$argc_lang" ]]; then
+    awk -v lang="$argc_lang" '
+      $0 ~ "^```" lang { capture=1; next }
+      /^```/ && capture { capture=0; next }
+      capture { print }
+    ' "$doc_file" >>"$LLM_OUTPUT"
+  else
+    awk '
+      /^```[a-zA-Z]/ { capture=1; next }

The regex `/^```[a-zA-Z]/` will miss code blocks with language identifiers like "c++" or "c#" since it requires an alphabetic character immediately after the backticks but doesn't match special characters. Consider using `/^```[a-zA-Z0-9+#-]/` or `/^```./` to handle languages with special characters.
```suggestion
      /^```./ { capture=1; next }
```

>  
-  if [[ ! -f "$doc_file" ]]; then
-    echo "Error: Document not found: $doc_file" >>"$LLM_OUTPUT"
-    return 1
+  if [[ -n "$argc_lang" ]]; then
+    awk -v lang="$argc_lang" '
+      $0 ~ "^```" lang { capture=1; next }

The pattern `$0 ~ "^```" lang` will match partial language names. For example, filtering for "c" would incorrectly match "```cpp" and "```css". Use word boundary matching like `$0 ~ "^```" lang "($|[^a-zA-Z0-9])"` or exact matching with `$0 == "```" lang` to ensure only the specified language is matched.
```suggestion
      $0 ~ "^```" lang "($|[^a-zA-Z0-9])" { capture=1; next }
```

>    {
-    echo "=== Summary of $argc_doc_path ==="
-    echo
+    while IFS= read -r file; do
+      local relpath="${file#$DOCS_DIR/}"

The variable `$DOCS_DIR` should be quoted in the parameter expansion pattern. Use `"${file#"$DOCS_DIR"/}"` instead of `"${file#$DOCS_DIR/}"` to properly handle paths with spaces or special characters.
```suggestion
      local relpath="${file#"$DOCS_DIR"/}"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/tools/pull/1#pullrequestreview-3497220429
You are receiving this because you authored the thread.

Message ID: <SkogAI/tools/pull/1/review/3497220429@github.com>