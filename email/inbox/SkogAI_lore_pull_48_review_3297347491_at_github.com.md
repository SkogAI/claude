MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 21:15:06 -0700
Subject: Re: [SkogAI/lore] feat: Add interactive terminal UI for lore browsing (PR #48)
Message-ID: <SkogAI/lore/pull/48/review/3297347491@github.com>
In-Reply-To: <SkogAI/lore/pull/48@github.com>
References: <SkogAI/lore/pull/48@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df4dca395a7_3e4d10d855027"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements a comprehensive interactive terminal UI (TUI) for browsing lore entries using the Textual library. The primary purpose is to provide an intuitive, keyboard-driven interface for navigating and viewing lore books and entries in the SkogAI knowledge system.

- Adds a fully-featured TUI application with multiple screens for book browsing, entry viewing, and search functionality
- Implements real-time search capabilities and comprehensive keyboard navigation
- Provides demo data generation and complete documentation for the new TUI system

### Reviewed Changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| pyproject.toml | Adds textual library dependency for TUI functionality |
| lore_tui.py | Main TUI application with screens for book browsing, entry viewing, and search |
| lore_browse.sh | Shell script launcher with virtual environment activation |
| demo_tui.py | Demo data generator creating sample lore entries for testing |
| LORE_TUI_README.md | Comprehensive documentation covering installation, usage, and architecture |
</details>






> +                    sections_list.append(item)
+
+                yield sections_list
+
+            # Right panel - Entries
+            with Vertical(id="entries-panel"):
+                yield Label("Entries:", classes="panel-header")
+                entries_list = ListView(id="entries-list")
+
+                # Load and display entries
+                for entry_id in self.book.get('entries', []):
+                    entry = self.api.get_lore_entry(entry_id)
+                    if entry:
+                        self.entries.append(entry)
+                        title = entry.get('title', 'Untitled')
+                        summary = entry.get('summary', '')[:50] + '...' if len(entry.get('summary', '')) > 50 else entry.get('summary', '')

This line contains duplicated `entry.get('summary', '')` calls and complex inline logic. Extract to a helper method or use a variable to improve readability.

> +
+    def compose(self) -> ComposeResult:
+        yield Header()
+        yield Static("📚 Lore Books", id="title")
+
+        books_list = ListView(id="books-list")
+
+        # Load all books
+        self.books = self.api.list_lore_books()
+
+        if not self.books:
+            books_list.append(ListItem(Label("No lore books found. Create one to get started!")))
+        else:
+            for book in self.books:
+                title = book.get('title', 'Untitled')
+                description = book.get('description', '')[:80] + '...' if len(book.get('description', '')) > 80 else book.get('description', '')

This line duplicates the same pattern as line 129 with `book.get('description', '')` called multiple times. Consider creating a helper function like `truncate_text(text, max_length)` to eliminate code duplication.

> +        results_list = self.query_one("#search-results", ListView)
+        results_list.clear()
+
+        if len(query) < 2:
+            return
+
+        # Search for entries
+        self.results = self.api.search_lore(query)
+
+        # Display results
+        if not self.results:
+            results_list.append(ListItem(Label("No results found")))
+        else:
+            for entry in self.results:
+                title = entry.get('title', 'Untitled')
+                summary = entry.get('summary', '')[:60] + '...' if len(entry.get('summary', '')) > 60 else entry.get('summary', '')

This is the third instance of the same text truncation pattern. The duplicated logic should be refactored into a reusable helper function.

> @@ -0,0 +1,12 @@
+#!/bin/bash

The script should include error handling with `set -e` to exit on errors and potentially `set -u` to exit on undefined variables for more robust execution.
```suggestion
#!/bin/bash
set -e
set -u
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/48#pullrequestreview-3297347491
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/48/review/3297347491@github.com>