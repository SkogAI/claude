MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 08 Jan 2026 15:24:26 -0800
Subject: Re: [SkogAI/lore] docs: Prioritize shell tools over Python API in documentation (PR #47)
Message-ID: <SkogAI/lore/pull/47/c3726348894@github.com>
In-Reply-To: <SkogAI/lore/pull/47@github.com>
References: <SkogAI/lore/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69603caa3d5d9_fe10d01619d7"; charset="UTF-8"

claude[bot] left a comment (SkogAI/lore#47)

## PR Review: Documentation Prioritization of Shell Tools

This PR successfully addresses issue #36 by reorganizing API documentation to prioritize shell tools over the deprecated Python API. Overall, this is a **positive change** that aligns with the project's stated direction.

### ✅ Strengths

1. **Correct prioritization**: Shell tools (argc CLI) are now shown first, followed by manual jq examples, then deprecated Python API - this matches the project's canonical interface philosophy from CLAUDE.md.

2. **Consistent deprecation notices**: All Python sections now include the standard deprecation notice pointing to CLAUDE.md, which provides good migration guidance.

3. **Net reduction in lines**: -303/+175 lines shows this is primarily reorganization with some cleanup, not scope creep.

4. **Good use of collapsible sections**: The `<details>` tags help keep deprecated examples accessible without cluttering the main flow.

### ⚠️ Issues Found

#### 1. **Stray closing tag in entry.md:118**
```markdown
## Read an Entry

### Using argc (CLI)
```bash
argc show-entry entry_1764992601
```

</details>  # ❌ This shouldn't be here - no opening <details> tag
```

**Impact**: Breaks markdown rendering, may hide subsequent sections.

#### 2. **Wrong code fence in book.md:124-130**
The "Using jq" section has Python code in it instead of shell commands:

```markdown
### Using jq

```python  # ❌ Should be bash
book = lore.get_lore_book("book_1764992601")
```
```

This is followed by a `</details>` closing tag with no opening tag, then the correct "Using jq" section appears.

**Impact**: Confusing documentation, incorrect syntax highlighting, broken HTML structure.

#### 3. **Duplicate "Using jq" sections in book.md**
- Line 124: "Using jq" with Python code (incorrect)
- Line 134: "Using jq (Direct JSON manipulation)" with correct bash code

One of these should be removed.

### 📝 Minor Suggestions

1. **Consistency in section headers**: Some use "Using jq" while others use "Using jq (Direct JSON manipulation)". Consider standardizing to just "Using jq" since the context is clear.

2. **Reference to DEPRECATION.md**: The PR description mentions referencing `DEPRECATION.md` which will be added in #25. Consider using `CLAUDE.md` instead (as you already do in the deprecation notices) since it exists now and contains the migration information.

3. **argc examples missing flags**: In entry.md, the argc example doesn't show the `--tags` flag that was in the old version. While this simplifies the example, it might be worth showing as an optional parameter.

### 🔍 Testing Recommendation

The PR description states "All examples tested and working" as an acceptance criterion. I recommend verifying:
- The argc commands still work (especially with the simplified flags)
- The jq commands produce the expected output
- The markdown renders correctly (especially around the stray `</details>` tags)

### 🎯 Verdict

**Request Changes** - The stray `</details>` tags and Python code in bash sections need to be fixed before merging. These are formatting bugs that will break documentation rendering.

Once those issues are resolved, this is a solid improvement that correctly prioritizes the canonical shell-based interface.

### 🔧 Suggested Fixes

```bash
# Remove line 118 in docs/api/entry.md
# Remove lines 124-132 in docs/api/book.md (the incorrectly labeled section)
# Keep the correct "Using jq" section that starts at line 134
```

---

Great work on the reorganization! The strategic direction is correct - just needs these small formatting fixes. 👍

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/47#issuecomment-3726348894
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/47/c3726348894@github.com>