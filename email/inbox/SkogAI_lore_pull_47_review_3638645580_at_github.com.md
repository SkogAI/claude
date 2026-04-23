MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 08 Jan 2026 01:52:53 -0800
Subject: Re: [SkogAI/lore] docs: Prioritize shell tools over Python API in documentation (PR #47)
Message-ID: <SkogAI/lore/pull/47/review/3638645580@github.com>
In-Reply-To: <SkogAI/lore/pull/47@github.com>
References: <SkogAI/lore/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695f7e757ef78_e910d0168910"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR reorders API documentation in three files to prioritize shell tools (argc CLI and jq) over the Python API (`lore_api.py`). The changes address a documentation priority issue where Python examples were shown prominently despite shell tools being the canonical interface.

**Key changes:**
- Reordered all operation sections to show argc CLI first, followed by shell/jq examples, then Python API last
- Added deprecation notices to all Python API sections
- Updated example outputs to reflect actual command behavior (e.g., including random hex suffixes in IDs)

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| docs/api/persona.md | Reordered create/read/list sections to prioritize argc/shell, added deprecation notices to Python sections |
| docs/api/entry.md | Reordered create/read/list sections to prioritize argc/shell, added deprecation notices to Python sections, enhanced argc examples with filter options |
| docs/api/book.md | Reordered create/read/link/list sections to prioritize argc/shell, added deprecation notices to Python sections, but contains a critical bug in the "Read a Book" section |


<details>
<summary>Comments suppressed due to low confidence (1)</summary>

**docs/api/book.md:113**
* The section header says "Using jq" but contains Python code. This appears to be leftover Python code that should have been moved to the "Using lore_api (Python)" section below (lines 132-141). This section should contain jq/shell commands instead.
```
### Using jq

```python
book = lore.get_lore_book("book_1764992601")
print(book['title'])
# Output: Test Chronicles
```
```
</details>



>  
-### Using lore_api
+> **Note:** The Python API (`lore_api.py`) is deprecated.
+> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for canonical interface documentation.

The deprecation notice references CLAUDE.md as documentation for the "canonical interface", but CLAUDE.md doesn't explicitly state that lore_api is deprecated - it just documents both Python API and shell tools. The PR description mentions that DEPRECATION.md will be added in issue #25. Consider either: (1) referencing DEPRECATION.md with a note that it will be added, or (2) updating the text to be more accurate about what CLAUDE.md contains (e.g., "See CLAUDE.md for shell tool documentation" rather than "canonical interface documentation").
```suggestion
> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for shell tool and Claude Code integration documentation.
```

>  
-### Using lore_api
+> **Note:** The Python API (`lore_api.py`) is deprecated.
+> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for canonical interface documentation.

The deprecation notice references CLAUDE.md as documentation for the "canonical interface", but CLAUDE.md doesn't explicitly state that lore_api is deprecated - it just documents both Python API and shell tools. The PR description mentions that DEPRECATION.md will be added in issue #25. Consider either: (1) referencing DEPRECATION.md with a note that it will be added, or (2) updating the text to be more accurate about what CLAUDE.md contains (e.g., "See CLAUDE.md for shell tool documentation" rather than "canonical interface documentation").
```suggestion
> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for shell tool documentation.
```

> @@ -93,9 +76,35 @@ echo '{}' | \
   > "knowledge/expanded/lore/books/${book_id}.json"
 ```
 
+### Using lore_api (Python)
+
+> **Note:** The Python API (`lore_api.py`) is deprecated.
+> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for canonical interface documentation.

The deprecation notice references CLAUDE.md as documentation for the "canonical interface", but CLAUDE.md doesn't explicitly state that lore_api is deprecated - it just documents both Python API and shell tools. The PR description mentions that DEPRECATION.md will be added in issue #25. Consider either: (1) referencing DEPRECATION.md with a note that it will be added, or (2) updating the text to be more accurate about what CLAUDE.md contains (e.g., "See CLAUDE.md for shell tool documentation" rather than "canonical interface documentation").
```suggestion
> Use shell tools for new code. See [CLAUDE.md](../../CLAUDE.md) for shell tool usage and Claude Code integration details.
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/47#pullrequestreview-3638645580
You are receiving this because you commented.

Message ID: <SkogAI/lore/pull/47/review/3638645580@github.com>