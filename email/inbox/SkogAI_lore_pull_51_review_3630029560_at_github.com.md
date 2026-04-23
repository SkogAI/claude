MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Tue, 06 Jan 2026 01:00:06 -0800
Subject: Re: [SkogAI/lore] refactor: Replace deprecated LoreAPI with direct JSON parsing in lore_tui.py (PR #51)
Message-ID: <SkogAI/lore/pull/51/review/3630029560@github.com>
In-Reply-To: <SkogAI/lore/pull/51@github.com>
References: <SkogAI/lore/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695ccf164568d_e110d01284f8"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR successfully refactors `lore_tui.py` to replace the deprecated `LoreAPI` with direct JSON file access, removing the dependency on `agents/api/lore_api.py` that is being phased out.

**Key Changes:**
- Introduces `LoreDataAccess` class providing lightweight, read-only JSON file operations
- Replaces all `LoreAPI` references with `LoreDataAccess` across 4 screen classes
- Removes deprecated import and unnecessary `sys.path` manipulation





>  import os
 import sys

The `os` and `sys` imports are no longer used after removing the deprecated LoreAPI import and sys.path manipulation. These unused imports should be removed to keep the code clean.
```suggestion

```

> +    def search_lore(self, query: str) -> List[Dict[str, Any]]:
+        """Search lore entries by keyword."""
+        results = []
+        seen_ids = set()
+        query_lower = query.lower()
+
+        for entry in self.list_lore_entries():
+            entry_id = entry.get("id")
+            if entry_id is None or entry_id in seen_ids:
+                continue
+
+            searchable_text = " ".join([
+                entry.get("title", ""),
+                entry.get("content", ""),
+                entry.get("summary", ""),
+                " ".join(entry.get("tags", [])),
+            ]).lower()
+
+            if query_lower in searchable_text:
+                results.append(entry)
+                seen_ids.add(entry_id)
+
+        return results

The search_lore method reads and parses all lore entry JSON files on every invocation. Since this method is called from on_input_changed (triggered on every keystroke in the search input), it will repeatedly read all 368 entry files from disk during interactive searching. Consider caching the loaded entries in memory during initialization or on first access to improve search responsiveness.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/51#pullrequestreview-3630029560
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/51/review/3630029560@github.com>