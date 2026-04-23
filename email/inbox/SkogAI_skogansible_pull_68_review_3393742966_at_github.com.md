MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Wed, 29 Oct 2025 07:16:57 -0700
Subject: Re: [SkogAI/skogansible] fix: Fix test.sh molecule testing and add CI workflow instructions=0A=0A- Remove duplicate molecule test code (lines 264-300)=0A- Fix undefined function references in molecule tests:  - Replace print_test_header with print_step  - Replace command_exists with command -v  - Replace print_test_result with print_success/print_error=0A- Add proper test counter tracking (TESTS_RUN, TESTS_PASSED, TESTS_FAILED, TESTS_SKIPPED)=0A- Add molecule tests to summary output=0A- Create MOLECULE_CI_INSTRUCTIONS.md with three options for adding molecule tests to CI=0A=0AThe test.sh script now properly supports the --molecule flag and can be run locally or in CI.=0A=0ANote: GitHub App permissions prevent direct workflow modifications, so CI workflow=0Achanges must be added manually following the instructions in MOLECULE_CI_INSTRUCTIONS.md.=0A=0AFixes #12=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #68)
Message-ID: <SkogAI/skogansible/pull/68/review/3393742966@github.com>
In-Reply-To: <SkogAI/skogansible/pull/68@github.com>
References: <SkogAI/skogansible/pull/68@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690221d995860_1d2017110012fd"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR fixes duplicate code and improves the molecule testing functionality in the `test.sh` script. It removes a duplicate Test 5 section and standardizes the output functions to use the existing print helpers.

- Removed duplicate molecule test code block (previously appeared twice)
- Replaced undefined function calls with existing print helper functions
- Added proper test counter tracking for molecule tests
- Created new documentation file with instructions for adding molecule testing to CI

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| test.sh | Removed duplicate molecule test code, fixed undefined function references, and added test counter tracking |
| MOLECULE_CI_INSTRUCTIONS.md | New documentation file with instructions for manually adding molecule testing to GitHub Actions CI workflow |





> -      print_test_result "Molecule Tests" "FAIL"
-      exit 1
-    fi
-  fi
-fi
-
-# Test 5: Molecule Tests (optional)
-if [ "$RUN_MOLECULE" = true ]; then
-  print_test_header "Molecule Role Tests"
-
-  if ! command_exists molecule; then
-    echo -e "${YELLOW}molecule is not installed. Install with: pip install molecule molecule-plugins[docker]${NC}"
-    print_test_result "Molecule Tests" "SKIP"
-  else
-    echo -e "${BLUE}Testing roles with Molecule...${NC}"
+    TESTS_RUN=$((TESTS_RUN + 1))

The test counters (TESTS_RUN, TESTS_PASSED, TESTS_FAILED, TESTS_SKIPPED) are incremented but never used in the output. These counters appear to be unused variables. Consider either: (1) displaying these counters in the summary section at lines 270-285, or (2) removing them if they're not needed.

> @@ -0,0 +1,140 @@
+# Adding Molecule Testing to CI Workflow
+
+## Background
+
+This file contains instructions for manually adding Molecule testing to the GitHub Actions CI workflow. Due to GitHub App permissions, automated tools cannot modify workflow files directly.
+
+## What Was Fixed
+
+The `test.sh` script has been fixed to properly support molecule testing:
+- ✅ Removed duplicate molecule test code (was at lines 236-309)

The line range 'lines 236-309' refers to the old file state, which may be confusing for future readers. Consider clarifying this is referring to the previous version of the file (e.g., 'was at lines 236-309 in the previous version').
```suggestion
- ✅ Removed duplicate molecule test code (was at lines 236-309 in the previous version)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/68#pullrequestreview-3393742966
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/68/review/3393742966@github.com>