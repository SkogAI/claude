MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Mon, 15 Dec 2025 15:11:56 -0800
Subject: Re: [SkogAI/.github] Replace grep with --jq for secret existence checks (PR #20)
Message-ID: <SkogAI/.github/pull/20/review/3580528782@github.com>
In-Reply-To: <SkogAI/.github/pull/20@github.com>
References: <SkogAI/.github/pull/20@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694095bcce3d1_fc1118852c3"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR refactors secret existence checks in shell scripts to follow a JSON-first principle by replacing grep-based text parsing with native jq filtering in GitHub CLI commands.

- Eliminates the `EXISTING_SECRETS` intermediate variable and multi-command pipeline
- Replaces `gh secret list | grep -q` pattern with `gh secret list --json name --jq 'any(.name == "...")'`
- Applies consistent pattern across both setup and test scripts

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| scripts/setup-claude-secrets.sh | Refactored secret existence check to use `--jq` filtering instead of grep, removing intermediate variable |
| scripts/test-setup.sh | Applied same jq-based pattern for consistency with setup script |





---

💡 <a href="/SkogAI/.github/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -44,7 +44,7 @@ echo ""
 # Test 3: Check if CLAUDE_CODE_OAUTH_TOKEN exists
 echo "Test 3: Organization Secret Exists"
 echo "-----------------------------------"
-if gh secret list --org "$ORG" 2>/dev/null | grep -q "CLAUDE_CODE_OAUTH_TOKEN"; then
+if gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null; then

The `--jq` flag with the `any()` function may not behave as expected for exit codes in shell conditionals. The GitHub CLI's handling of boolean jq results in exit codes should be verified.

If `gh secret list --jq 'any(...)'` outputs "true" or "false" as text but always exits with code 0, this conditional will always evaluate as true (since a successful command execution returns 0).

Consider testing this change or using an alternative pattern like:
```bash
[[ "$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null)" == "true" ]]
```

This ensures the boolean string value is explicitly checked rather than relying on exit codes.
```suggestion
if [[ "$(gh secret list --org "$ORG" --json name --jq 'any(.name == \"CLAUDE_CODE_OAUTH_TOKEN\")' 2>/dev/null)" == "true" ]]; then
```

> @@ -63,9 +63,7 @@ echo "✅ Admin access confirmed"
 echo ""
 
 # Check for existing secrets
-EXISTING_SECRETS=$(gh secret list --org "$ORG" --json name -q '.[].name' 2>/dev/null || echo "")
-
-if echo "$EXISTING_SECRETS" | grep -q "CLAUDE_CODE_OAUTH_TOKEN"; then
+if gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null; then

The `--jq` flag with the `any()` function may not behave as expected for exit codes in shell conditionals. The GitHub CLI's handling of boolean jq results in exit codes should be verified. 

If `gh secret list --jq 'any(...)'` outputs "true" or "false" as text but always exits with code 0, this conditional will always evaluate as true (since a successful command execution returns 0). 

Consider testing this change or using an alternative pattern like:
```bash
[[ "$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null)" == "true" ]]
```

This ensures the boolean string value is explicitly checked rather than relying on exit codes.
```suggestion
if [[ "$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null)" == "true" ]]; then
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/20#pullrequestreview-3580528782
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/.github/pull/20/review/3580528782@github.com>