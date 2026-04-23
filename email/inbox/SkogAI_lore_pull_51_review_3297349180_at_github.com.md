MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 21:16:44 -0700
Subject: Re: [SkogAI/lore] Update issues_data.json=0A=0ACo-authored-by: Copilot <175728472+Copilot@users.noreply.github.com> (PR #51)
Message-ID: <SkogAI/lore/pull/51/review/3297349180@github.com>
In-Reply-To: <SkogAI/lore/pull/51@github.com>
References: <SkogAI/lore/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df4e2c5da0f_fa10d873883"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds comprehensive issue templates for refactoring shell scripts in the SkogAI repository. The changes create 10 well-structured GitHub issue templates that focus on eliminating `sed`/`awk` usage in favor of `jq` and replacing hardcoded paths with `SKOGAI_*` environment variables.

Key changes include:
- Creation of 10 detailed issue templates (issues 1-10) for shell script refactoring
- Addition of a Python script to programmatically create issues from shell script definitions
- Comprehensive documentation on multiple methods to create these issues

### Reviewed Changes

Copilot reviewed 14 out of 15 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| issues_to_create/issue_01.md through issue_10.md | Individual issue templates for refactoring specific shell scripts with detailed requirements and examples |
| issues_to_create/README.md | Summary of all 10 issues with creation instructions |
| create_issues_from_script.py | Python utility to parse shell scripts and create GitHub issues programmatically |
| HOW_TO_CREATE_ISSUES.md | Comprehensive guide with 5 different methods to create the issues |
| issues_data.json | Placeholder file with rename instructions |
</details>






> +# No code changes required in the file contents.
+# Rename the file from `issues_data.json` to `issues_data_sample.json` (or `issues_data_template.json`).

This file contains comments in JSON format which is invalid. Consider creating an actual JSON structure or renaming to a .txt file if it's meant to be documentation.

> +        f.write("### Option 1: Using gh CLI\n")
+        f.write("```bash\n")
+        f.write("# Set GH_TOKEN environment variable with your GitHub token\n")
+        f.write("export GH_TOKEN=your_token_here\n\n")
+        f.write("# Run the original script\n")
+        f.write("./create-script-refactor-issues.sh\n")
+        f.write("```\n\n")
+        f.write("### Option 2: Manual Creation\n")
+        f.write("Use the individual markdown files in this directory to create issues manually.\n")
+    
+    print(f"\nSummary saved to {summary_path}")
+
+
+def main():
+    """Main execution function."""
+    script_path = '/home/runner/work/lore/lore/create-script-refactor-issues.sh'

The hardcoded path '/home/runner/work/lore/lore/create-script-refactor-issues.sh' should be made configurable or use a relative path to improve portability.
```suggestion
    script_path = os.environ.get('ISSUE_SCRIPT_PATH', './create-script-refactor-issues.sh')
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/51#pullrequestreview-3297349180
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/51/review/3297349180@github.com>