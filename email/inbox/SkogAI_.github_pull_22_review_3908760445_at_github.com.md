MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Sat, 07 Mar 2026 05:05:44 -0800
Subject: Re: [SkogAI/.github] Replace grep with --jq for secret existence checks (PR #22)
Message-ID: <SkogAI/.github/pull/22/review/3908760445@github.com>
In-Reply-To: <SkogAI/.github/pull/22@github.com>
References: <SkogAI/.github/pull/22@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69ac22a84863f_f3111024746a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Updates the org-secret existence checks in the setup/test scripts to use GitHub CLI’s structured JSON output (jq) rather than parsing the human-readable list output with `grep`.

**Changes:**
- Switch secret existence detection from `grep`-based matching to `gh ... --json ... --jq ...` queries.
- Remove intermediate secret-name collection in `setup-claude-secrets.sh` in favor of a direct existence check.

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| `scripts/test-setup.sh` | Changes the CLAUDE token existence check to use `gh --json/--jq` instead of `grep`. |
| `scripts/setup-claude-secrets.sh` | Changes the “already exists” detection to use a `gh --json/--jq` check instead of grepping a list of names. |





---

💡 <a href="/SkogAI/.github/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -44,7 +44,7 @@ echo ""
 # Test 3: Check if CLAUDE_CODE_OAUTH_TOKEN exists
 echo "Test 3: Organization Secret Exists"
 echo "-----------------------------------"
-if gh secret list --org "$ORG" 2>/dev/null | grep -q "CLAUDE_CODE_OAUTH_TOKEN"; then
+if gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null; then

The `if gh ... --jq 'any(...)'` condition won’t work as intended: `gh` will typically exit 0 even when the jq expression evaluates to `false`, so the `then` branch will run regardless of whether the secret exists (and it will also print `true`/`false` into the script output). Capture the jq output and compare it (e.g., test for the string `true` in `[[ ... ]]`), or use a query/approach that yields a non-zero exit status when the secret is absent.
```suggestion
SECRET_EXISTS=$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null || echo "false")
if [[ "$SECRET_EXISTS" == "true" ]]; then
```

> @@ -63,9 +63,7 @@ echo "✅ Admin access confirmed"
 echo ""
 
 # Check for existing secrets
-EXISTING_SECRETS=$(gh secret list --org "$ORG" --json name -q '.[].name' 2>/dev/null || echo "")
-
-if echo "$EXISTING_SECRETS" | grep -q "CLAUDE_CODE_OAUTH_TOKEN"; then
+if gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null; then

This `if gh secret list ... --jq 'any(...)'` check is based on `gh`’s exit code, but `gh` will usually return exit code 0 even when the jq result is `false`. That means the script will think the secret exists when it doesn’t (and it will emit `true`/`false` to stdout). Consider capturing the jq output and explicitly checking it equals `true`, or otherwise forcing a non-zero exit when the token is not found.
```suggestion
SECRET_EXISTS=$(gh secret list --org "$ORG" --json name --jq 'any(.name == "CLAUDE_CODE_OAUTH_TOKEN")' 2>/dev/null || echo "false")
if [ "$SECRET_EXISTS" = "true" ]; then
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/22#pullrequestreview-3908760445
You are receiving this because you authored the thread.

Message ID: <SkogAI/.github/pull/22/review/3908760445@github.com>