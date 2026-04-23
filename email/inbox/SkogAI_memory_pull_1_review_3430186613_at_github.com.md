MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/memory <memory@noreply.github.com>
Date: Thu, 06 Nov 2025 11:39:43 -0800
Subject: Re: [SkogAI/memory] fix: implement case-insensitive project switching=0A=0A- Fix switch_project() to work with any case input (e.g., "Minerva" or "minerva")  =0A- Fix delete_project() to handle case-insensitive project names=0A- Both functions now find projects using case-insensitive comparison=0A- Preserve actual stored project names for API calls=0A- Maintains backward compatibility with existing exact matches=0A=0AFixes #127=0A=0ACo-authored-by: phernandez <phernandez@users.noreply.github.com> (PR #1)
Message-ID: <SkogAI/memory/pull/1/review/3430186613@github.com>
In-Reply-To: <SkogAI/memory/pull/1@github.com>
References: <SkogAI/memory/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690cf97f18b82_1192e1100322bd"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds case-insensitive project name matching to the `switch_project` and `delete_project` functions, improving user experience by allowing users to reference projects regardless of case. The implementation ensures that the actual project name (with correct casing) is used in all subsequent operations, API calls, and user-facing messages.

**Key changes:**
- Case-insensitive project lookup in both `switch_project` and `delete_project` functions
- Consistent use of the correctly-cased project name throughout all operations and messages
- Clear inline comments documenting the case-insensitive behavior





---

💡 <a href="/SkogAI/memory/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +        # Check if project exists (case-insensitive)
+        matching_project = None
+        for p in project_list.projects:
+            if p.name.lower() == project_name.lower():
+                matching_project = p
+                break

The case-insensitive project name lookup logic (lines 86-91 and 318-322) is duplicated between `switch_project` and `delete_project`. This duplicated code makes maintenance harder and increases the risk of inconsistencies if changes are needed in the future.

**Recommendation:** Consider extracting this logic into a shared helper function:
```python
def find_project_by_name(project_list: ProjectList, project_name: str) -> Optional[Project]:
    """Find a project by name (case-insensitive).
    
    Args:
        project_list: List of available projects
        project_name: Name to search for (case-insensitive)
        
    Returns:
        Matching project or None if not found
    """
    for p in project_list.projects:
        if p.name.lower() == project_name.lower():
            return p
    return None
```

This would make the code more maintainable and ensure consistent behavior across functions.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/memory/pull/1#pullrequestreview-3430186613
You are receiving this because you authored the thread.

Message ID: <SkogAI/memory/pull/1/review/3430186613@github.com>