MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 15:21:49 -0700
Subject: Re: [SkogAI/skogansible] Document test.sh in CLAUDE.md=0A=0ACo-authored-by: Skogix <690279+Skogix@users.noreply.github.com> (PR #38)
Message-ID: <SkogAI/skogansible/pull/38/review/3301166131@github.com>
In-Reply-To: <SkogAI/skogansible/pull/38@github.com>
References: <SkogAI/skogansible/pull/38@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e04c7d2e3ee_fa10d81462d2"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

Adds a local validation script and documents how to use it to run static checks before pushing.
- Introduces test.sh to run syntax checks, yamllint, ansible-lint, and optional check mode.
- Updates CLAUDE.md to include test.sh in the repo tree and a “Testing Locally” section.

### Reviewed Changes

Copilot reviewed 2 out of 3 changed files in this pull request and generated 7 comments.

| File | Description |
| ---- | ----------- |
| test.sh | New local testing script that performs syntax and lint checks and optionally runs a dry-run. |
| CLAUDE.md | Documents test.sh usage, setup, and what it validates. |





> +if [ "$RUN_CHECK_MODE" = true ]; then
+    echo "  ✓ Check mode (dry run)"
+fi

The summary reports '✓ Check mode (dry run)' whenever --check was requested, even if the check mode was skipped due to missing vault/become files. Track whether check mode actually ran and passed (e.g., CHECK_MODE_RAN/CHECK_MODE_PASSED) and only print success when it really executed.

> +        if ansible-playbook \
+            --become-password-file ~/.ssh/ansible-become-password \
+            --vault-password-file ~/.ssh/ansible-vault-password \
+            playbooks/all.yml \
+            --check \
+            --diff; then

Per project practice, avoid invoking ansible-playbook directly for execution; route through run.sh so vault/become handling stays centralized. Replace this block to call ./run.sh with --check/--diff (and update run.sh if it doesn't accept those flags).
```suggestion
        if ./run.sh playbooks/all.yml --check --diff; then
```

> @@ -0,0 +1,205 @@
+#!/usr/bin/env bash
+#
+# test.sh - Local testing script for Ansible configuration
+#
+# This script runs static analysis tests locally before pushing to GitHub.
+# It helps catch issues early in the development cycle.
+#
+# Usage:
+#   ./test.sh           Run all static analysis tests
+#   ./test.sh --check   Run tests + optional check mode (requires vault)
+#   ./test.sh --help    Show this help message
+
+set -e  # Exit on error

[nitpick] Harden the script by enabling nounset and pipefail (and optionally errtrace): use 'set -Eeuo pipefail' so pipeline failures and undefined variables fail fast.
```suggestion
set -Eeuo pipefail  # Harden: fail on error, undefined vars, pipeline errors, propagate ERR
```

> +    echo -e "${BLUE}==>${NC} $1"
+}
+
+print_success() {
+    echo -e "${GREEN}✓${NC} $1"
+}
+
+print_warning() {
+    echo -e "${YELLOW}⚠${NC} $1"
+}
+
+print_error() {
+    echo -e "${RED}✗${NC} $1"

[nitpick] Prefer printf over 'echo -e' for portability and to avoid interpretation pitfalls: e.g., 'printf \"%b\\n\" \"${BLUE}==>${NC} $1\"'. Apply similarly to the other print_* functions.
```suggestion
    printf "%b\n" "${BLUE}==>${NC} $1"
}

print_success() {
    printf "%b\n" "${GREEN}✓${NC} $1"
}

print_warning() {
    printf "%b\n" "${YELLOW}⚠${NC} $1"
}

print_error() {
    printf "%b\n" "${RED}✗${NC} $1"
```

> +if [[ "$1" == "--help" || "$1" == "-h" ]]; then
+    show_usage
+    exit 0
+elif [[ "$1" == "--check" ]]; then
+    RUN_CHECK_MODE=true
+elif [[ -n "$1" ]]; then
+    print_error "Unknown option: $1"
+    echo "Run '$(basename "$0") --help' for usage information"
+    exit 1
+fi

[nitpick] Argument parsing only considers the first argument and ignores additional flags; switch to a loop with getopts (or while [[ $# -gt 0 ]]; do case ... esac) so multiple options and future flags are handled predictably.
```suggestion
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)
            show_usage
            exit 0
            ;;
        --check)
            RUN_CHECK_MODE=true
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Run '$(basename "$0") --help' for usage information"
            exit 1
            ;;
    esac
done
```

> +print_success "All required collections found"
+echo ""
+
+# Test 1: Ansible syntax check
+print_step "Running Ansible syntax check..."
+if ansible-playbook playbooks/all.yml --syntax-check; then
+    print_success "Ansible syntax check passed"
+else
+    print_error "Ansible syntax check failed"
+    exit 1
+fi
+echo ""
+
+# Test 2: YAML linting
+print_step "Running yamllint..."
+if yamllint .; then

[nitpick] Linting the repo root can traverse large or irrelevant directories (e.g., virtualenvs, caches). Consider scoping to project YAML paths or using a config with excludes, e.g., 'yamllint -c .yamllint playbooks/ roles/ vars/ ./*.yml'.
```suggestion
if yamllint -c .yamllint playbooks/ roles/ vars/ ./*.yml; then
```

> +    echo -e "${YELLOW}⚠${NC} $1"
+}
+
+print_error() {
+    echo -e "${RED}✗${NC} $1"
+}
+
+# Function to show usage
+show_usage() {
+    cat << EOF
+Usage: $(basename "$0") [OPTIONS]
+
+Local testing script for Ansible configuration validation.
+
+OPTIONS:
+    --check     Run Ansible check mode after static tests (requires vault setup)

Clarify the requirement to match the actual checks and CLAUDE.md: specify both vault and become password files, e.g., '(requires vault and become password files)'.
```suggestion
    --check     Run Ansible check mode after static tests (requires vault and become password files)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/38#pullrequestreview-3301166131
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/38/review/3301166131@github.com>