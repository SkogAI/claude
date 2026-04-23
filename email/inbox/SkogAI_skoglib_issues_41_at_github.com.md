MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:45:37 -0700
Subject: [SkogAI/skoglib] 🟠 MEDIUM: Add path traversal validation (Issue #41)
Message-ID: <SkogAI/skoglib/issues/41@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf561852c_ee10d81389bf"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#41)

### Issue Description
Need to add validation to prevent directory escape attacks via path traversal.

### Location
`config.py:269-290`

### Problem
The code doesn't validate paths to prevent directory traversal attacks (e.g., using `../` sequences to escape intended directories).

### Impact
- Potential security issue if paths come from untrusted sources
- Could allow access to files outside intended directories
- Technical debt that should be addressed

### Fix
Add path validation logic to detect and prevent:
- Sequences like `../` or `..\`
- Absolute paths when relative paths are expected
- Symlinks that escape the intended directory structure

### Required Actions
1. Review all path handling code in config.py
2. Implement path validation functions
3. Add validation before path operations
4. Add tests for path traversal attempts

### Priority
MEDIUM - Technical debt, fix when convenient

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/41
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/41@github.com>