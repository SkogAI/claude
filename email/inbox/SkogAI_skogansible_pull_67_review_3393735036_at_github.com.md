MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Wed, 29 Oct 2025 07:16:27 -0700
Subject: Re: [SkogAI/skogansible] fix: Repair test.sh molecule testing and add CI instructions=0A=0A- Remove duplicate molecule test code block (lines 264-300)=0A- Replace undefined functions with existing ones:  - print_test_header -> print_step  - command_exists -> command -v  - print_test_result -> print_success/print_error/print_warning=0A- Add proper test counters for molecule tests=0A- Add molecule tests to summary output=0A- Create MOLECULE_CI_INSTRUCTIONS.md with workflow job definition=0A=0AGitHub App permissions prevent direct workflow modifications,=0Aso instructions are provided for manual addition to CI.=0A=0ARelated to #12=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #67)
Message-ID: <SkogAI/skogansible/pull/67/review/3393735036@github.com>
In-Reply-To: <SkogAI/skogansible/pull/67@github.com>
References: <SkogAI/skogansible/pull/67@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690221bb61bf6_2470ff110059790"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes duplicate Molecule test code from the `test.sh` script and adds comprehensive CI integration documentation. The changes clean up a code duplication issue where the Molecule test section was inadvertently duplicated, and provide detailed instructions for manually adding Molecule tests to the GitHub Actions workflow.

- Removes duplicate Molecule test code block (lines 273-324 in the original)
- Updates Molecule test section to properly track test statistics with counters
- Adds new documentation file `MOLECULE_CI_INSTRUCTIONS.md` with step-by-step CI integration guidance

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| test.sh | Removes duplicate Molecule test block and adds proper test counter tracking with improved output formatting |
| MOLECULE_CI_INSTRUCTIONS.md | New documentation file providing comprehensive instructions for integrating Molecule tests into GitHub Actions CI workflow |





>    else
-    echo -e "${BLUE}Testing roles with Molecule...${NC}"
+    TESTS_RUN=$((TESTS_RUN + 1))

The test counters (TESTS_RUN, TESTS_PASSED, TESTS_FAILED, TESTS_SKIPPED) are defined and updated throughout the script but are never actually used or displayed anywhere. Consider either removing these unused counters or implementing a test summary section that displays these statistics at the end of the script execution.

>            MOLECULE_FAILED=1
         fi
         cd - > /dev/null
       fi
     done
 
-    if [ $MOLECULE_FAILED -eq 0 ]; then
-      print_test_result "Molecule Tests" "PASS"
+    if [ $ROLES_TESTED -eq 0 ]; then
+      print_warning "No roles with molecule scenarios found"
+      TESTS_SKIPPED=$((TESTS_SKIPPED + 1))
+      TESTS_RUN=$((TESTS_RUN - 1))

Decrementing TESTS_RUN after incrementing it creates confusing logic. If no roles are found, the test was never really 'run' in the first place. Consider restructuring to only increment TESTS_RUN after confirming roles exist, or remove the counter logic entirely since these counters are not displayed anywhere.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/67#pullrequestreview-3393735036
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/67/review/3393735036@github.com>