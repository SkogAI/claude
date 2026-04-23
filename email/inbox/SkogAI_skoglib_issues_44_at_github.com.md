MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:46:11 -0700
Subject: [SkogAI/skoglib] 🧪 TEST: Add missing test scenarios (Issue #44)
Message-ID: <SkogAI/skoglib/issues/44@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf583462f_5dc510d8103319"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#44)

### Issue Description
Need to add test coverage for several important edge cases.

### Current Coverage
Excellent overall coverage (~90%) with 13 test files, but missing some critical scenarios.

### Missing Test Scenarios

#### 1. TimeoutExpired with None stdout/stderr
**Critical:** Would have caught the timeout decoding bug (see #37)
- Test timeout with no output captured
- Verify proper handling of `None` values

#### 2. Large output vs max_output_size
- Test behavior when output exceeds configured limit
- Verify memory protection (or document if not implemented)

#### 3. Concurrent subprocess execution
- Test running multiple subprocesses simultaneously
- Verify thread safety and resource management

#### 4. Windows path edge cases
- Test Windows-specific path handling
- Verify cross-platform compatibility
- Test edge cases like UNC paths, drive letters, etc.

### Required Actions
1. Add test for timeout with None output (highest priority)
2. Add tests for large output scenarios
3. Add concurrency tests
4. Add Windows-specific path tests
5. Ensure all tests are verbose for debugging purposes

### Priority
TEST - Improve test coverage to prevent regressions

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/44
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/44@github.com>