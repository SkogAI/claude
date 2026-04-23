MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Wed, 01 Oct 2025 20:45:00 -0700
Subject: [SkogAI/skoglib] 🟡 HIGH: Unused max_output_size config (Issue #39)
Message-ID: <SkogAI/skoglib/issues/39@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68ddf53c53765_774f10d86175b"; charset="UTF-8"

github-actions[bot] created an issue (SkogAI/skoglib#39)

### Issue Description
Config defines `max_output_size` but it's never enforced, creating risk of memory exhaustion.

### Location
`src/skoglib/executable.py:375-382`

### Problem
The configuration system allows setting `max_output_size` to limit subprocess output, but this limit is never actually checked or enforced in the code.

### Impact
- Risk of memory exhaustion from unbounded subprocess output
- Configuration option misleads users into thinking they're protected
- False sense of security

### Fix Options
1. Implement actual size checking against `max_output_size`
2. OR remove the unused configuration option entirely

### Required Actions
1. Decide whether to implement or remove
2. If implementing: Add size enforcement logic
3. If removing: Clean up config and documentation
4. Add tests for whichever approach is chosen

### Priority
HIGH - Configuration mismatch is a design flaw

### Source
Identified in PR #29 code review

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/issues/39
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/skoglib/issues/39@github.com>