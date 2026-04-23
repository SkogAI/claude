MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sat, 27 Sep 2025 08:06:57 -0700
Subject: Re: [SkogAI/lore] Update tools/create-issue.sh=0A=0ACo-authored-by: Copilot <175728472+Copilot@users.noreply.github.com> (PR #18)
Message-ID: <SkogAI/lore/pull/18/review/3274977208@github.com>
In-Reply-To: <SkogAI/lore/pull/18@github.com>
References: <SkogAI/lore/pull/18@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d7fd91d84a_33c2010c8124619"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR improves the issue creation tooling by making configuration more secure and fixing JSON escaping issues. The changes remove hardcoded team IDs, implement proper environment variable validation, and fix potential JSON formatting problems in MCP commands.

- Replaces hardcoded SKOGAI_TEAM_ID with mandatory environment variable validation
- Refactors template initialization to use external JSON file for better maintainability
- Fixes JSON escaping issues in MCP command generation to prevent malformed output

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| tools/issue-creator.py | Removes hardcoded team ID, adds environment validation, refactors template loading, and fixes JSON escaping |
| tools/create-issue.sh | Adds python3 availability check before script execution |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/lore/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

>  ### Actual Behavior
 {actual}
 

These lines appear to be orphaned template content that should have been removed during the refactoring. Lines 63-65 contain template fragments that are no longer part of the templates dictionary structure and will cause syntax errors.
```suggestion

```

> -                "title_template": "Fix {bug_description} in {component}",
-                "description_template": """## Bug Report
-
-### Description
-{description}
-
-### Steps to Reproduce
-{steps}
-
-### Expected Behavior
-{expected}
-
+        """Ensure issue templates exist in the templates directory by copying from a single source of truth if needed."""
+        default_templates_path = os.path.join(self.base_dir, "default_templates.json")
+        if not os.path.exists(default_templates_path):
+            logger.error(f"Default templates file not found: {default_templates_path}")

[nitpick] The error message is duplicated between the logger.error call and the FileNotFoundError. Consider logging a more detailed message or removing the logger.error since the exception will be handled elsewhere.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/18#pullrequestreview-3274977208
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/18/review/3274977208@github.com>