MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 03:54:40 -0700
Subject: Re: [SkogAI/skogansible] Add test.sh script for local development testing (PR #27)
Message-ID: <SkogAI/skogansible/pull/27/review/3298445938@github.com>
In-Reply-To: <SkogAI/skogansible/pull/27@github.com>
References: <SkogAI/skogansible/pull/27@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfab7091e7c_eb10d8136921"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a comprehensive local testing script (`test.sh`) that mirrors the CI workflow checks, allowing developers to validate their changes locally before pushing to reduce failed CI runs and provide faster feedback.

- Added a feature-rich `test.sh` script with smart tool detection, graceful degradation, and developer-friendly UX
- Enhanced documentation in `CLAUDE.md` with detailed testing instructions and usage examples

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| test.sh | New comprehensive testing script that runs Ansible syntax checks, linting, and optional dry-run mode with color-coded output and error handling |
| CLAUDE.md | Added "Testing Locally" section with usage instructions, tool installation guidance, and result interpretation |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/skogansible/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +  VAULT_FILE="/home/skogix/.ssh/ansible-vault-password"
+  BECOME_FILE="/home/skogix/.ssh/ansible-become-password"

Hard-coded file paths make the script less portable across different environments. Consider making these configurable via environment variables or command-line options, with these as defaults.

> +  echo -e "${YELLOW}⚠ yamllint is NOT installed (optional)${NC}"
+  echo -e "${YELLOW}  Install with: pip install yamllint${NC}"
+  YAMLLINT_AVAILABLE=false
+else
+  echo -e "${GREEN}✓ yamllint is installed${NC}"
+  yamllint --version
+  YAMLLINT_AVAILABLE=true
+fi
+
+echo ""
+echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
+
+# Test 1: Ansible Syntax Check
+print_test_header "Ansible Playbook Syntax Check"
+# Capture output and filter out collection loading warnings
+SYNTAX_OUTPUT=$(ansible-playbook playbooks/all.yml --syntax-check 2>&1)

Hard-coded playbook path 'playbooks/all.yml' makes the script less flexible. Consider making the playbook path configurable or auto-discovering playbooks in the playbooks/ directory.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/27#pullrequestreview-3298445938
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/27/review/3298445938@github.com>