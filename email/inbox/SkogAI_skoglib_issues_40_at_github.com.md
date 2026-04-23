MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:45:14 -0700
Subject: [SkogAI/skoglib] 🟡 HIGH: Shell injection risk in direnv_wrapper.py (Issue #40)
Message-ID: <SkogAI/skoglib/issues/40@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf54abed90_c610d81101d5"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#40)

### Issue Description
Using `shell=True` in subprocess call creates potential shell injection vulnerability.

### Location
`scripts/direnv_wrapper.py:7`

### Problem
The script uses `shell=True` when calling subprocess, which can be exploited if any user-controlled input makes its way into the command.

### Impact
- Potential for command injection attacks
- While not in the main library, still creates security risk
- Sets bad example for other scripts

### Fix Options
1. Refactor to avoid `shell=True` by using proper argument lists
2. OR thoroughly document the security assumptions and input validation requirements

### Required Actions
1. Review if `shell=True` is actually necessary
2. If yes: Add comprehensive input validation and documentation
3. If no: Refactor to use safer subprocess patterns
4. Add security testing for this code path

### Priority
HIGH - Security issue, even if only in scripts

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/40
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/40@github.com>