MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 21:28:46 -0700
Subject: Re: [SkogAI/lore] Update lore_browse.sh=0A=0ACo-authored-by: Copilot <175728472+Copilot@users.noreply.github.com> (PR #53)
Message-ID: <SkogAI/lore/pull/53/review/3297366220@github.com>
In-Reply-To: <SkogAI/lore/pull/53@github.com>
References: <SkogAI/lore/pull/53@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df50fe11b7b_f310d8170294"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a new interactive terminal UI (TUI) for browsing lore entries with keyboard navigation and rich visual feedback. The implementation uses the Textual framework to create a comprehensive lore browser application.

### Key Changes:
- Introduces a full-featured TUI application with multiple screens for browsing books, entries, and search functionality
- Adds the `textual` dependency to support the new interface
- Provides launch scripts and demo functionality for easy testing and deployment

### Reviewed Changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| pyproject.toml | Adds textual>=1.0.0 dependency for TUI framework |
| lore_tui.py | Main TUI application with multiple screens for navigation and viewing |
| lore_browse.sh | Shell script launcher that activates virtual environment and runs TUI |
| demo_tui.py | Demo script that creates sample lore data for testing the TUI |
| LORE_TUI_README.md | Comprehensive documentation for the new TUI feature |
</details>






> +                        summary = entry.get('summary', '')[:50] + '...' if len(entry.get('summary', '')) > 50 else entry.get('summary', '')
+
+                        item = ListItem(
+                            Label(f"• {title}\n  {summary}"),

This line contains duplicated `entry.get('summary', '')` calls. Extract to a variable for better readability: `summary = entry.get('summary', ''); truncated_summary = summary[:50] + '...' if len(summary) > 50 else summary`
```suggestion
                        summary = entry.get('summary', '')
                        truncated_summary = summary[:50] + '...' if len(summary) > 50 else summary

                        item = ListItem(
                            Label(f"• {title}\n  {truncated_summary}"),
```

> +                description = book.get('description', '')[:80] + '...' if len(book.get('description', '')) > 80 else book.get('description', '')
+                entry_count = len(book.get('entries', []))
+
+                item = ListItem(
+                    Label(f"📖 {title}\n   {description}\n   [{entry_count} entries]"),

This line contains duplicated `book.get('description', '')` calls. Extract to a variable for better readability: `description = book.get('description', ''); truncated_desc = description[:80] + '...' if len(description) > 80 else description`
```suggestion
                description = book.get('description', '')
                truncated_desc = description[:80] + '...' if len(description) > 80 else description
                entry_count = len(book.get('entries', []))

                item = ListItem(
                    Label(f"📖 {title}\n   {truncated_desc}\n   [{entry_count} entries]"),
```

> +                summary = entry.get('summary', '')[:60] + '...' if len(entry.get('summary', '')) > 60 else entry.get('summary', '')
+                category = entry.get('category', 'unknown')
+
+                item = ListItem(
+                    Label(f"📝 {title} [{category}]\n   {summary}"),

This line contains duplicated `entry.get('summary', '')` calls. Extract to a variable for better readability: `summary = entry.get('summary', ''); truncated_summary = summary[:60] + '...' if len(summary) > 60 else summary`
```suggestion
                summary = entry.get('summary', '')
                truncated_summary = summary[:60] + '...' if len(summary) > 60 else summary
                category = entry.get('category', 'unknown')

                item = ListItem(
                    Label(f"📝 {title} [{category}]\n   {truncated_summary}"),
```

> +        class HelpScreen(Screen):
+            BINDINGS = [
+                Binding("escape", "close", "Close", priority=True),
+                Binding("b", "close", "Close", priority=True),
+                Binding("q", "quit", "Quit", priority=True),
+            ]
+
+            def compose(self) -> ComposeResult:
+                yield Header()
+                yield VerticalScroll(Markdown(help_text))
+                yield Footer()
+
+            def action_close(self) -> None:
+                self.app.pop_screen()
+
+            def action_quit(self) -> None:
+                self.app.exit()

The HelpScreen class is defined inside the action_help method. Consider moving it to the module level to improve code organization and reusability.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/53#pullrequestreview-3297366220
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/53/review/3297366220@github.com>