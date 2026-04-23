MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 28 Nov 2025 03:33:01 -0800
Subject: [SkogAI/lore] [WIP] Fix lore TUI duplicate IDs and improve search handling (PR #110)
Message-ID: <SkogAI/lore/pull/110@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6929886d33fe8_fb1100850e8"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;


----

*This section details on the original issue you should resolve*

&lt;issue_title&gt;Fix lore TUI duplicate IDs, hard-coded paths, and search result handling&lt;/issue_title&gt;
&lt;issue_description&gt;## Problem

The lore TUI (textual-based browser) crashes when displaying search results due to duplicate widget IDs. The TUI is intended to browse lore books/entries without needing to copy hundreds of UIDs.

### Error

```
DuplicateIds: Tried to insert a widget with ID &#39;result-entry_1759547270&#39;, but a widget 
already exists with that ID (ListItem(id=&#39;result-entry_1759547270&#39;)); ensure all child 
widgets have a unique ID.
```

### Stack Trace Location
`ListView.append() → ListView.extend() → Widget.mount() → App._register() → _register_child() → NodeList._append() → _ensure_unique_id()`

The crash shows 263+ items in the ListView with duplicate `result-entry_1759547270` IDs.

---

## Root Causes Identified

### 1. Duplicate ListItem IDs in SearchScreen (`lore_tui.py:307`)

**Current code:**
```python
item = ListItem(
    Label(f&quot;📝 {title} [{category}]\n   {truncated_summary}&quot;),
    id=f&quot;result-{entry[&#39;id&#39;]}&quot;,  # ← DUPLICATE IDs if same entry appears multiple times
)
results_list.append(item)
```

**Problem:** If the search API returns the same entry multiple times (or the same entry ID with different content), all ListItems get identical IDs, violating Textual&#39;s unique ID requirement.

**Fix:** Add an index/counter to ensure unique IDs:
```python
for idx, entry in enumerate(self.results):
    item = ListItem(
        Label(f&quot;📝 {title} [{category}]\n   {truncated_summary}&quot;),
        id=f&quot;result-{entry[&#39;id&#39;]}-{idx}&quot;,  # ← Now unique
    )
```

And update the ID parsing in `on_list_view_selected` (line 314):
```python
if item_id and item_id.startswith(&quot;result-&quot;):
    # Extract entry ID before the index suffix
    entry_id = item_id[7:].rsplit(&quot;-&quot;, 1)[0]  # Remove &quot;result-&quot; and trailing &quot;-{idx}&quot;
```

### 2. Hard-coded Base Path (`agents/api/lore_api.py:20`)

**Current code:**
```python
def __init__(self, base_dir: str = &quot;/home/skogix/skogix/src/lore/&quot;):
```

**Problem:** Hard-coded absolute path breaks portability and multi-user support.

**Fix:** Use relative paths or environment variables:
```python
def __init__(self, base_dir: str = None):
    if base_dir is None:
        base_dir = os.environ.get(&quot;LORE_BASE_DIR&quot;) or os.path.join(
            os.path.expanduser(&quot;~&quot;), &quot;lore&quot;
        )
    self.base_dir = base_dir
```

### 3. Potential API Duplicate Results (`agents/api/lore_api.py:381-398`)

The `search_lore` method doesn&#39;t deduplicate results. While unlikely, if `list_lore_entries()` returns duplicate entry IDs, they&#39;ll all appear in search results.

**Suggested enhancement:**
```python
def search_lore(self, query: str) -&gt; List[Dict[str, Any]]:
    &quot;&quot;&quot;Search lore entries by keyword.&quot;&quot;&quot;
    results = []
    seen_ids = set()  # ← Track seen entry IDs
    
    for entry in self.list_lore_entries():
        # Skip duplicates
        if entry.get(&quot;id&quot;) in seen_ids:
            continue
            
        searchable_text = &quot; &quot;.join([...]).lower()
        
        if query.lower() in searchable_text:
            results.append(entry)
            seen_ids.add(entry.get(&quot;id&quot;))
    
    return results
```

---

## Additional Context

### Shell Script Issues (mentioned by user)

The user also mentioned sed/awk bugs and string handling failures in shell scripts. These scripts have known issues (per `CLAUDE.md`):

**Broken shell tools:**
- ❌ `tools/llama-lore-creator.sh` - jq escaping breaks content save
- ❌ `tools/llama-lore-integrator.sh` - markdown parsing broken
- ❌ `tools/manage-lore.sh` - potential string handling issues

**Workaround:** Python versions exist (`tools/*.py`) and are preferred.

### Related Issues

- SkogAI/lore#88 - Document migration path from bash tools to API-based architecture
- SkogAI/lore#87 - Build CLI tool that consumes REST API endpoints
- SkogAI/lore#86 - Create proper REST API service layer for lore management
- SkogAI/lore#85 - Improve core lore management with validation and error handling

---

## Proposed Solution

### Phase 1: Fix TUI Crash (Immediate)
1. ✅ Add index suffix to search result ListItem IDs (`lore_tui.py:307`)
2. ✅ Update ID parsing to handle suffix (`lore_tui.py:315`)
3. ✅ Test with search queries that return many results

### Phase 2: Fix Hard-coded Paths
1. ✅ Make `LoreAPI.base_dir` use environment variable or user home
2. ✅ Update all hard-coded paths in API to be relative
3. ✅ Document `LORE_BASE_DIR` environment variable usage

### Phase 3: API Improvements
1. ✅ Add deduplication to `search_lore()`
2. ✅ Add deduplication to `list_lore_entries()` if needed
3. ✅ Add logging for duplicate entry detection

### Phase 4: Shell Script Deprecation (Optional)
1. Document Python API as canonical interface
2. Mark shell scripts as deprecated
3. Migrate remaining shell script users to Python API

---

## Testing Checklist

- [ ] Search for common terms returns &gt;50 results without cras...

&lt;/details&gt;

- Fixes SkogAI/lore#108

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/110

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/110.patch
https://github.com/SkogAI/lore/pull/110.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/110
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/110@github.com&gt;
