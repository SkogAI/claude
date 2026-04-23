MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:44:29 -0700
Subject: [SkogAI/skoglib] 🔴 CRITICAL: Fix subprocess timeout decoding bug (Issue #37)
Message-ID: <SkogAI/skoglib/issues/37@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf51d5fdbc_11610d81369d4"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#37)

### Issue Description
`AttributeError` when stdout/stderr are `None` in `TimeoutExpired` exception

### Location
`src/skoglib/executable.py:422-424`

### Current Code (Broken)
```python
stdout=e.stdout.decode("utf-8") if e.stdout else None,
stderr=e.stderr.decode("utf-8") if e.stderr else None,
```

### Problem
The code attempts to call `.decode()` on `None` values when the subprocess timeout occurs without any output captured.

### Fix
```python
stdout=e.stdout.decode("utf-8") if e.stdout and isinstance(e.stdout, bytes) else None,
stderr=e.stderr.decode("utf-8") if e.stderr and isinstance(e.stderr, bytes) else None,
```

### Required Actions
1. Fix the timeout decoding logic
2. Add test case for timeout with `None` output to prevent regression

### Priority
CRITICAL - Must fix before next release

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/37
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/37@github.com>