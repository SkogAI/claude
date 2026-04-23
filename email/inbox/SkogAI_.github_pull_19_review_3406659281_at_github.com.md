MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Fri, 31 Oct 2025 17:13:42 -0700
Subject: Re: [SkogAI/.github] Replace grep with --json --jq for secret filtering (PR #19)
Message-ID: <SkogAI/.github/pull/19/review/3406659281@github.com>
In-Reply-To: <SkogAI/.github/pull/19@github.com>
References: <SkogAI/.github/pull/19@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690550b69f722_fe110095a4"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR improves secret validation in setup and test scripts by replacing grep-based text matching with structured JSON parsing using jq. The changes make secret name matching more precise and reliable.

- Enhanced secret existence checking with JSON-based filtering instead of text-based grep
- Updated verification output to use structured JSON queries for cleaner results

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| scripts/test-setup.sh | Refactored secret existence check to use JSON output with jq for exact name matching |
| scripts/setup-claude-secrets.sh | Updated verification command to use JSON output with jq for filtering CLAUDE-related secrets |





---

💡 <a href="/SkogAI/.github/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -44,7 +44,8 @@ echo ""
 # Test 3: Check if CLAUDE_CODE_OAUTH_TOKEN exists
 echo "Test 3: Organization Secret Exists"
 echo "-----------------------------------"
-if gh secret list --org "$ORG" 2>/dev/null | grep -q "CLAUDE_CODE_OAUTH_TOKEN"; then
+RESULT=$(gh secret list --org "$ORG" --json name --jq '.[] | select(.name == "CLAUDE_CODE_OAUTH_TOKEN") | .name' 2>/dev/null)

The jq filter `.[] | select(.name == \"CLAUDE_CODE_OAUTH_TOKEN\") | .name` unnecessarily returns the name when you're only checking existence. Consider using `.[] | select(.name == \"CLAUDE_CODE_OAUTH_TOKEN\") | true` or simply checking if any elements match with `any(.name == \"CLAUDE_CODE_OAUTH_TOKEN\")`.
```suggestion
RESULT=$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null)
```

> @@ -90,7 +90,7 @@ echo ""
 echo "✅ Secret configured successfully!"
 echo ""
 echo "Verifying setup..."
-gh secret list --org "$ORG" | grep CLAUDE || true
+gh secret list --org "$ORG" --json name --jq '.[] | select(.name | contains("CLAUDE")) | .name'

Using `contains(\"CLAUDE\")` for filtering could match unintended secrets that have 'CLAUDE' anywhere in the name (e.g., 'NOT_CLAUDE_KEY', 'DECLAUDE_TOKEN'). Since line 68 uses an exact match for 'CLAUDE_CODE_OAUTH_TOKEN', consider using `startswith(\"CLAUDE\")` or an exact match pattern for consistency and accuracy.
```suggestion
gh secret list --org "$ORG" --json name --jq '.[] | select(.name | startswith("CLAUDE")) | .name'
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/19#pullrequestreview-3406659281
You are receiving this because you were assigned.

Message ID: <SkogAI/.github/pull/19/review/3406659281@github.com>