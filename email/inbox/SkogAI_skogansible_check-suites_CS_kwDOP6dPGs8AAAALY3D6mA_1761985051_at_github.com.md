MIME-Version: 1.0
From: Skogix <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 01 Nov 2025 01:17:51 -0700
Subject: [SkogAI/skogansible] PR run failed: Ansible Testing - fix: Fix test.sh molecule testing and add CI workflow instructions

- Remove duplicate molecule test code (lines 264-300)
- Fix undefined function references in molecule tests:
  - Replace print_test_header with print_step
  - Replace command_exists with command -v
  - Replace print_test_result with print_success/print_error
- Add proper test counter tracking (TESTS_RUN, TESTS_PASSED, TESTS_FAILED, TESTS_SKIPPED)
- Add molecule tests to summary output
- Create MOLECULE_CI_INSTRUCTIONS.md with three options for adding molecule tests to CI

The test.sh script now properly supports the --molecule flag and can be run locally or in CI.

Note: GitHub App permissions prevent direct workflow modifications, so CI workflow
changes must be added manually following the instructions in MOLECULE_CI_INSTRUCTIONS.md.

Fixes #12

Co-authored-by: Skogix <Skogix@users.noreply.github.com> (d309e09)
Message-ID: <SkogAI/skogansible/check-suites/CS_kwDOP6dPGs8AAAALY3D6mA/1761985051@github.com>
Content-Type: multipart/alternative; boundary="part_3f93d6aa2962aa09040bbbd57d55ebf1af45c9de844cdcc4a592eea4ed9266fb"; charset="UTF-8"

[SkogAI/skogansible] Ansible Testing workflow run

Repository: SkogAI/skogansible
Workflow: Ansible Testing
Duration: 43.0 seconds
Finished: 2025-11-01 08:17:31 UTC

View results: https://github.com/SkogAI/skogansible/actions/runs/18993944230

Jobs:
  * Ansible Syntax and Lint failed (12 annotations)

-- 
You are receiving this because you are subscribed to this thread.
Manage your GitHub Actions notifications: https://github.com/settings/notifications
