MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:44:52 -0700
Subject: [SkogAI/skoglib] 🟡 HIGH: Fix TimeoutError inheritance issue (Issue #38)
Message-ID: <SkogAI/skoglib/issues/38@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf53420a2e_923810d8705f8"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#38)

### Issue Description
`TimeoutError` doesn't properly initialize `ExecutionError` parent, breaking the type contract.

### Location
`src/skoglib/exceptions.py:392-393`

### Problem
Code expecting the `exit_code` attribute from the `ExecutionError` parent class will fail because `TimeoutError` doesn't properly initialize its parent.

### Impact
- Breaks the type contract established by `ExecutionError`
- Any code handling `ExecutionError` exceptions that accesses `exit_code` will fail when it's a `TimeoutError`

### Fix Options
1. Properly initialize the `ExecutionError` parent class with appropriate parameters
2. OR reparent `TimeoutError` to `SkogAIError` if it shouldn't inherit from `ExecutionError`

### Required Actions
1. Review the exception hierarchy design
2. Either fix the parent initialization or change the inheritance
3. Add tests to verify the exception contract

### Priority
HIGH - Fix soon to prevent runtime errors

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/38
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/38@github.com>