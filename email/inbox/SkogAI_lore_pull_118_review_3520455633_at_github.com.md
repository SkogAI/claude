MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 28 Nov 2025 19:34:13 -0800
Subject: Re: [SkogAI/lore] feat: update lore paths and add new lore data (PR #118)
Message-ID: <SkogAI/lore/pull/118/review/3520455633@github.com>
In-Reply-To: <SkogAI/lore/pull/118@github.com>
References: <SkogAI/lore/pull/118@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692a69b54ffc3_e011004583f4"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR introduces significant enhancements to the SkogAI lore system, including multi-provider LLM support, new Python tool implementations, orchestrator improvements, and extensive new lore data (personas, entries, books). The changes transform the system from Ollama-only to supporting Claude, OpenAI, and Ollama providers, while adding approximately 100+ new lore entries and several personas documenting the SkogAI mythology.

Key changes:
- Added multi-LLM provider support (Ollama, Claude, OpenAI) to shell and Python lore tools
- Created Python implementations of llama-lore-integrator and llama-lore-creator
- Enhanced orchestrator with knowledge categorization and prompt building capabilities
- Added extensive lore documentation including 50+ character/concept/place entries
- Created handoff documentation (whats-next.md) and showcase examples (showcase.md)

### Reviewed changes

Copilot reviewed 147 out of 152 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| whats-next.md | New handoff document capturing repository state and context for fresh sessions |
| showcase.md | Documentation showcasing best lore entry examples and structure practices |
| tools/llama-lore-integrator.sh | Enhanced with multi-provider LLM support and improved parsing logic |
| tools/llama-lore-creator.sh | Enhanced with multi-provider LLM support and safer jq operations |
| tools/llama-lore-integrator.py | New Python implementation for lore integration with provider abstraction |
| tools/llama-lore-creator.py | New Python implementation for lore generation with provider abstraction |
| orchestrator/orchestrator.py | Added knowledge categorization, prompt building, and persona loading |
| package-lock.json | New Node.js dependency lockfile for claude-code-mcp |
| node_modules/.pnpm-workspace-state-v1.json | Updated workspace validation timestamp |
| knowledge/expanded/personas/*.json | 5 new persona definitions (Test, Test Forest Guardian, Village Elder, Test Agent) |
| knowledge/expanded/lore/entries/*.json | 50+ new lore entries (characters, places, concepts, events, objects) |
| knowledge/expanded/lore/books/*.json | 10 new lore books organizing entries by theme |
| knowledge/expanded/lore/entries/entry_*.json | 8 existing entries updated with relationship data |
| knowledge/INDEX.md | Timestamp update for knowledge index generation |
</details>






> +    # Create the book
+    subprocess.run(
+        [str(SKOGAI_DIR / "tools/manage-lore.sh"), "create-book", book_title, book_description],
+        check=True
+    )
+
+    book_id = get_latest_file(BOOKS_DIR)
+
+    # Process each text file
+    for file_path in path.iterdir():
+        if not file_path.is_file():
+            continue
+
+        # Check if it's a text file
+        try:
+            content = file_path.read_text()

Variable content is not used.

> @@ -0,0 +1,303 @@
+#!/usr/bin/env python3
+"""Generate lore content using LLM providers."""
+
+import argparse
+import json
+import os
+import re
+import subprocess
+import sys
+import time

Import of 'time' is not used.

> +    subprocess.run(
+        [str(SKOGAI_DIR / "tools/manage-lore.sh"), "create-book", book_title, book_description],
+        check=True
+    )
+
+    book_id = get_latest_file(BOOKS_DIR)
+
+    # Process each text file
+    for file_path in path.iterdir():
+        if not file_path.is_file():
+            continue
+
+        # Check if it's a text file
+        try:
+            content = file_path.read_text()
+        except:

Except block directly handles BaseException.

> +                entry_data["tags"] = tags if isinstance(tags, list) else [t.strip() for t in tags.split(",")]
+
+                with open(entry_path, "w") as f:
+                    json.dump(entry_data, f, indent=2)
+
+                print(f"Created lore entry: {title} ({entry_id})")
+
+                if book_id:
+                    subprocess.run(
+                        [str(SKOGAI_DIR / "tools/manage-lore.sh"), "add-to-book", entry_id, book_id],
+                        check=True
+                    )
+                    print(f"Added entry to book: {book_id}")
+
+            return
+    except (json.JSONDecodeError, AttributeError):

'except' clause does nothing but pass and there is no explanatory comment.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/118#pullrequestreview-3520455633
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/118/review/3520455633@github.com>