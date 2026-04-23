MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "Skogix/.dotfiles" <.dotfiles@noreply.github.com>
Date: Fri, 03 Oct 2025 10:34:33 -0700
Subject: Re: [Skogix/.dotfiles] Fix malformed issue template and add validation for review process (PR #7)
Message-ID: <Skogix/.dotfiles/pull/7/review/3300115971@github.com>
In-Reply-To: <Skogix/.dotfiles/pull/7@github.com>
References: <Skogix/.dotfiles/pull/7@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0092943106_830210d81636ee"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR addresses a critical issue with the dotfile review process where issue templates were being submitted with unfilled placeholders, making them impossible to complete. The solution implements multiple safeguards to prevent malformed issues and improve the overall review workflow.

Key changes:
- Enhanced issue template with prominent warnings and examples to guide proper placeholder replacement
- Created validation script to detect and report issues with unfilled template placeholders
- Added comprehensive documentation covering the entire review process and best practices

### Reviewed Changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `.github/ISSUE_TEMPLATE/dotfile-review.md` | Added warning comments and examples to prevent placeholder submission |
| `scripts/validate-review-issues.sh` | New validation script to detect unfilled template placeholders |
| `docs/REVIEW_PROCESS.md` | Comprehensive guide documenting automated and manual issue creation workflows |
| `README.md` | Added recommendation to use automated script for issue creation |
| `ISSUE_RESOLUTION.md` | Summary of resolution actions taken for the malformed issue |
| `ISSUE_ANALYSIS.md` | Root cause analysis and detailed recommendations |
</details>






---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/Skogix/.dotfiles/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +if ! command -v gh &> /dev/null; then
+    echo "Error: GitHub CLI (gh) is not installed"
+    exit 1
+fi
+
+# Find issues with template placeholders
+issues_found=0
+
+# Check for issues with [FILE/DIR NAME] in title
+echo "Checking for issues with placeholder titles..."
+while IFS= read -r issue; do
+    if [[ -n "$issue" ]]; then
+        echo "❌ Found issue with placeholder title: $issue"
+        ((issues_found++))
+    fi
+done < <(gh issue list --limit 100 --json number,title --jq '.[] | select(.title | contains("[FILE/DIR NAME]") or contains("[PATH]")) | "#\(.number): \(.title)"')

The hardcoded limit of 100 issues may miss validation errors in repositories with many issues. Consider adding a parameter to make this configurable or removing the limit entirely for comprehensive validation.

> +        ((issues_found++))
+    fi
+done < <(gh issue list --limit 100 --json number,title --jq '.[] | select(.title | contains("[FILE/DIR NAME]") or contains("[PATH]")) | "#\(.number): \(.title)"')
+
+# Check for issues with [PATH] in body
+echo "Checking for issues with placeholder paths in body..."
+while IFS= read -r issue; do
+    if [[ -n "$issue" ]]; then
+        issue_number=$(echo "$issue" | cut -d: -f1 | tr -d '#')
+        body=$(gh issue view "$issue_number" --json body --jq '.body')
+        if echo "$body" | grep -q '\[PATH\]'; then
+            echo "❌ Issue #$issue_number has placeholder [PATH] in body"
+            ((issues_found++))
+        fi
+    fi
+done < <(gh issue list --label "review:pending" --limit 100 --json number,title --jq '.[] | "#\(.number): \(.title)"')

Same hardcoded limit issue as above. This could miss validation of review issues if there are more than 100 pending reviews.

> +while IFS= read -r issue; do
+    if [[ -n "$issue" ]]; then
+        issue_number=$(echo "$issue" | cut -d: -f1 | tr -d '#')
+        body=$(gh issue view "$issue_number" --json body --jq '.body')
+        if echo "$body" | grep -q '\[PATH\]'; then
+            echo "❌ Issue #$issue_number has placeholder [PATH] in body"
+            ((issues_found++))
+        fi
+    fi
+done < <(gh issue list --label "review:pending" --limit 100 --json number,title --jq '.[] | "#\(.number): \(.title)"')

This string parsing approach is fragile. If the issue title contains colons, it could extract the wrong issue number. Consider using a more robust parsing method or modifying the jq expression to output just the number.
```suggestion
while IFS= read -r issue_number; do
    if [[ -n "$issue_number" ]]; then
        body=$(gh issue view "$issue_number" --json body --jq '.body')
        if echo "$body" | grep -q '\[PATH\]'; then
            echo "❌ Issue #$issue_number has placeholder [PATH] in body"
            ((issues_found++))
        fi
    fi
done < <(gh issue list --label "review:pending" --limit 100 --json number,title --jq '.[] | .number')
```

> +        body=$(gh issue view "$issue_number" --json body --jq '.body')
+        if echo "$body" | grep -q '\[PATH\]'; then
+            echo "❌ Issue #$issue_number has placeholder [PATH] in body"
+            ((issues_found++))
+        fi
+    fi
+done < <(gh issue list --label "review:pending" --limit 100 --json number,title --jq '.[] | "#\(.number): \(.title)"')

The script makes individual API calls for each issue to fetch the body. This could be slow with many issues. Consider fetching both title and body in a single API call or using GitHub's search API to find issues containing '[PATH]' directly.
```suggestion
        title=$(echo "$issue" | cut -d: -f2- | sed 's/^ //')
        body=$(echo "$issue" | cut -d: -f3-)
        if echo "$body" | grep -q '\[PATH\]'; then
            echo "❌ Issue #$issue_number has placeholder [PATH] in body"
            ((issues_found++))
        fi
    fi
done < <(gh issue list --label "review:pending" --limit 100 --json number,title,body --jq '.[] | "#\(.number): \(.title): \(.body)"')
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/.dotfiles/pull/7#pullrequestreview-3300115971
You are receiving this because you were assigned.

Message ID: <Skogix/.dotfiles/pull/7/review/3300115971@github.com>