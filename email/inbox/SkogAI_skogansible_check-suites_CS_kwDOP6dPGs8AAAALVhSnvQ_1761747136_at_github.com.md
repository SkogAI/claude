MIME-Version: 1.0
From: Skogix <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Wed, 29 Oct 2025 07:12:36 -0700
Subject: [SkogAI/skogansible] PR run failed: Ansible Testing - fix: Repair test.sh molecule testing and add CI instructions

- Remove duplicate molecule test code block (lines 264-300)
- Replace undefined functions with existing ones:
  - print_test_header -> print_step
  - command_exists -> command -v
  - print_test_result -> print_success/print_error/print_warning
- Add proper test counters for molecule tests
- Add molecule tests to summary output
- Create MOLECULE_CI_INSTRUCTIONS.md with workflow job definition

GitHub App permissions prevent direct workflow modifications,
so instructions are provided for manual addition to CI.

Related to #12

Co-authored-by: Skogix <Skogix@users.noreply.github.com> (34e3f43)
Message-ID: <SkogAI/skogansible/check-suites/CS_kwDOP6dPGs8AAAALVhSnvQ/1761747136@github.com>
Content-Type: multipart/alternative; boundary="part_9a22050b905fd54e0154c1d75e4e6992582f519e8a8bd6bc37ebc4359efa5a9f"; charset="UTF-8"

[SkogAI/skogansible] Ansible Testing workflow run

Repository: SkogAI/skogansible
Workflow: Ansible Testing
Duration: 54.0 seconds
Finished: 2025-10-29 14:12:16 UTC

View results: https://github.com/SkogAI/skogansible/actions/runs/18910818301

Jobs:
  * Ansible Syntax and Lint failed (21 annotations)

-- 
You are receiving this because you are subscribed to this thread.
Manage your GitHub Actions notifications: https://github.com/settings/notifications
