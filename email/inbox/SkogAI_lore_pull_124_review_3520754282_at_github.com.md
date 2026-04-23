MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sat, 29 Nov 2025 08:35:28 -0800
Subject: Re: [SkogAI/lore] feat: add Vim-style keybindings to lore TUI=0A=0ANavigation:=0A- j/k: move down/up in lists=0A- h: go back (same as b)=0A- l: select/open item (same as Enter)=0A- gg: go to first item=0A- G: go to last item=0A- Ctrl+d/u: page down/up=0A=0ASearch screen:=0A- Esc: switch from input to results navigation=0A- i: switch back to search input (vim insert mode)=0A=0AAlso adds VimNavigationMixin for consistent behavior across all screens. (PR #124)
Message-ID: <SkogAI/lore/pull/124/review/3520754282@github.com>
In-Reply-To: <SkogAI/lore/pull/124@github.com>
References: <SkogAI/lore/pull/124@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b20d09eab3_ec110013254b3"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR enhances the lore TUI with comprehensive Vim-style keybindings, making navigation more efficient for users familiar with Vim's modal editing paradigm. The changes introduce a reusable `VimNavigationMixin` that provides consistent keyboard navigation across all screens, adds a modal interface to the search screen (switching between input and results navigation), and updates the help documentation to reflect the new navigation model.

**Key changes:**
- Implemented `VimNavigationMixin` for consistent Vim-style navigation (j/k, h/l, gg/G, Ctrl+d/u) across list-based screens
- Enhanced search screen with modal behavior (Esc to navigate results, 'i' to return to input)
- Fixed malformed shebang in `demo_tui.py` and corrected hardcoded path to use relative directory

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 8 comments.

| File | Description |
| ---- | ----------- |
| lore_tui.py | Added VimNavigationMixin class and integrated Vim keybindings (j/k/h/l/gg/G/Ctrl+d/Ctrl+u) into all screens; added modal navigation to SearchScreen; updated help documentation with Vim navigation guide |
| demo_tui.py | Fixed missing shebang (#!) and changed hardcoded absolute path to relative demo_data directory |





> +            new_index = min(list_view.index + 10, len(list_view) - 1)
+            if new_index >= 0:
+                list_view.index = new_index
+            event.prevent_default()
+        elif key == "ctrl+u":
+            # Page up (move 10 items)
+            new_index = max(list_view.index - 10, 0)
+            list_view.index = new_index

The check `if new_index >= 0` is unnecessary since `new_index` is guaranteed to be non-negative due to the `min()` function ensuring it's at most `len(list_view) - 1`. However, there's a potential bug: if the list is empty, `len(list_view) - 1` equals `-1`, which would be used as the index. Consider adding a check `if len(list_view) > 0:` before calculating `new_index` to prevent this edge case.
```suggestion
            if len(list_view) > 0:
                new_index = min(list_view.index + 10, len(list_view) - 1)
                list_view.index = new_index
            event.prevent_default()
        elif key == "ctrl+u":
            # Page up (move 10 items)
            if len(list_view) > 0:
                new_index = max(list_view.index - 10, 0)
                list_view.index = new_index
```

>          Binding("q", "quit", "Quit", priority=True),
+        Binding("j", "scroll_down", "↓", show=False),
+        Binding("k", "scroll_up", "↑", show=False),
+        Binding("ctrl+d", "page_down", "PgDn", show=False),
+        Binding("ctrl+u", "page_up", "PgUp", show=False),
+        Binding("g", "go_top", "Top", show=False),

The binding for 'g' is mapped to "go_top" action, which will immediately call `action_go_top()` and scroll to the top. This prevents the 'gg' sequence from working properly since Textual's binding system will intercept the first 'g' press and trigger the action. Since `EntryDetailScreen` doesn't use `ListView` (it uses `VerticalScroll`), the mixin's `on_key` handler won't handle 'gg'. Consider removing the 'g' binding and only keeping 'G', or implement custom 'gg' handling similar to the help text in lines 715 and 727 that documents this feature.

> +
+        key = event.key
+
+        # Handle 'gg' for go to top
+        if self._pending_g:
+            self._pending_g = False
+            if key == "g":
+                # gg - go to first item
+                if len(list_view) > 0:
+                    list_view.index = 0
+                event.prevent_default()
+                return
+
+        if key == "j":
+            # Move down
+            if list_view.index < len(list_view) - 1:

When the list is empty (`len(list_view) == 0`), `list_view.index` could be `None` or `-1`, but the comparison `list_view.index < len(list_view) - 1` would evaluate to `index < -1`. This could cause unexpected behavior. Consider adding a check `if len(list_view) > 0 and list_view.index is not None:` before the comparison to handle empty lists gracefully.
```suggestion
            if len(list_view) > 0 and list_view.index is not None and list_view.index < len(list_view) - 1:
```

>  
 # Add the parent directory to the path so we can import our modules
 sys.path.append(os.path.dirname(os.path.abspath(__file__)))
 
 from agents.api.lore_api import LoreAPI
 
 
-class EntryDetailScreen(Screen):
+# Vim keybindings mixin for screens with ListView
+class VimNavigationMixin:
+    """Mixin providing Vim-style navigation for screens with ListViews."""
+
+    _pending_g: bool = False  # Track 'g' key for 'gg' command

The `_pending_g` attribute is defined at the class level but is also redefined in the `__init__` methods of subclasses (lines 217, 348, 441). This creates a potential issue where the class-level attribute could be shared across all instances if not properly initialized in each instance. Consider removing the class-level definition and ensuring all subclasses initialize `_pending_g = False` in their `__init__` methods, or document that this class-level default is intentionally overridden by instance attributes.
```suggestion
    # Subclasses must initialize self._pending_g = False in their __init__
```

> +        """Handle Vim-style key navigation."""
+        list_view = self.get_active_list_view()
+        if list_view is None:
+            return
+
+        key = event.key
+
+        # Handle 'gg' for go to top
+        if self._pending_g:
+            self._pending_g = False
+            if key == "g":
+                # gg - go to first item
+                if len(list_view) > 0:
+                    list_view.index = 0
+                event.prevent_default()
+                return

The `_pending_g` flag is cleared even when the second key is not 'g', but the function returns early only when it is 'g'. This means if a user presses 'g' followed by any other key, the pending flag is cleared but the second key is not processed. For example, 'g' followed by 'j' would consume both keys without moving down. Consider not returning early and allowing the key to be processed normally if it's not 'g'.
```suggestion
                return
            # If not 'g', fall through and process the key as normal
```

> +            list_view.index = new_index
+            event.prevent_default()
+        elif key == "l":
+            # Select current item (like Enter)
+            self.vim_select_current()
+            event.prevent_default()
+        elif key == "h":
+            # Go back (like 'b')
+            if hasattr(self, "action_back"):
+                self.action_back()
+            elif hasattr(self, "action_cancel"):
+                self.action_cancel()
+            event.prevent_default()
+
+
+class EntryDetailScreen(VimNavigationMixin, Screen):

`EntryDetailScreen` inherits from `VimNavigationMixin` but doesn't implement `get_active_list_view()` (which returns `None` by default). Since this screen uses `VerticalScroll` for content (not a `ListView`), and handles navigation through action bindings, the mixin's `on_key` method is effectively unused. Consider either not inheriting from `VimNavigationMixin` for this screen, or add a comment explaining that the mixin is inherited for consistency but not used since this screen uses scroll-based navigation rather than list-based navigation.
```suggestion
class EntryDetailScreen(Screen):
```

> +                Binding("G", "go_bottom", "Bottom", show=False),
             ]
 

The HelpScreen bindings include 'G' for go to bottom (line 741) but are missing the 'g' binding for go to top. This creates an inconsistency with other screens and breaks the 'gg' functionality. Add `Binding("g", "go_top", "Top", show=False)` and implement the corresponding `action_go_top()` method that calls `self.query_one("#help-scroll", VerticalScroll).scroll_home()`.
```suggestion
                Binding("G", "go_bottom", "Bottom", show=False),
                Binding("g", "go_top", "Top", show=False),
            ]

            def action_go_top(self) -> None:
                self.query_one("#help-scroll", VerticalScroll).scroll_home()
```

> +            self._pending_g = False
+            if key == "g":
+                # gg - go to first item
+                if len(list_view) > 0:
+                    list_view.index = 0
+                event.prevent_default()
+                return
+
+        if key == "j":
+            # Move down
+            if list_view.index < len(list_view) - 1:
+                list_view.index += 1
+            event.prevent_default()
+        elif key == "k":
+            # Move up
+            if list_view.index > 0:

When the list is empty, `list_view.index` could be `None`, making this comparison fail or produce unexpected results. Consider adding a check `if list_view.index is not None and list_view.index > 0:` to handle the case when there are no items or index is uninitialized.
```suggestion
            if list_view.index is not None and list_view.index > 0:
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/124#pullrequestreview-3520754282
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/124/review/3520754282@github.com>