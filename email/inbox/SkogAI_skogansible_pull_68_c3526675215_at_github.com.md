MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Thu, 13 Nov 2025 01:18:44 -0800
Subject: Re: [SkogAI/skogansible] fix: Fix test.sh molecule testing and add CI workflow instructions=0A=0A- Remove duplicate molecule test code (lines 264-300)=0A- Fix undefined function references in molecule tests:  - Replace print_test_header with print_step  - Replace command_exists with command -v  - Replace print_test_result with print_success/print_error=0A- Add proper test counter tracking (TESTS_RUN, TESTS_PASSED, TESTS_FAILED, TESTS_SKIPPED)=0A- Add molecule tests to summary output=0A- Create MOLECULE_CI_INSTRUCTIONS.md with three options for adding molecule tests to CI=0A=0AThe test.sh script now properly supports the --molecule flag and can be run locally or in CI.=0A=0ANote: GitHub App permissions prevent direct workflow modifications, so CI workflow=0Achanges must be added manually following the instructions in MOLECULE_CI_INSTRUCTIONS.md.=0A=0AFixes #12=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #68)
Message-ID: <SkogAI/skogansible/pull/68/c3526675215@github.com>
In-Reply-To: <SkogAI/skogansible/pull/68@github.com>
References: <SkogAI/skogansible/pull/68@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6915a273f32fa_9b17110058024"; charset="UTF-8"

github-actions[bot] left a comment (SkogAI/skogansible#68)

⚠️ This PR has merge conflicts with master after the latest push. Please sync your branch and resolve conflicts.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/68#issuecomment-3526675215
You are receiving this because you were mentioned.

Message ID: <SkogAI/skogansible/pull/68/c3526675215@github.com>