MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sun, 16 Nov 2025 13:08:59 -0800
Subject: Re: [SkogAI/skogix] Develop (PR #23)
Message-ID: <SkogAI/skogix/pull/23/c3539356279@github.com>
In-Reply-To: <SkogAI/skogix/pull/23@github.com>
References: <SkogAI/skogix/pull/23@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691a3d6b8ccd7_d4110810414b"; charset="UTF-8"

claude[bot] left a comment (SkogAI/skogix#23)

# PR Review: Develop Branch

## Summary
massive infrastructure PR: 51k+ lines, 97 files - claude code skills, plugins, tooling

## Critical Issues

### 1. hardcoded absolute path
`scripts/process-prompt.sh:9`:
```
/mnt/extra/20251104/home-backup/.local/src/skogparse/bin/Release/net9.0/linux-x64/SkogParse
```
breaks portability - use env var or PATH

### 2. insecure temp files
`plugins/voice-recorder/scripts/stop-recording.sh` uses predictable paths:
```
/tmp/voice-recording.wav
/tmp/voice-recording.pid
```
security risk: symlink attacks, race conditions
fix: use mktemp

### 3. secret exposure risk
`.envrc` loads multiple config namespaces - verify no api keys leak to environment

## Bugs

1. **bin/wt** - no validation of parameter, cd in subshell, auto-push without confirmation
2. **voice recorder** - TOCTOU race condition in pid checking
3. **sync-submodules.sh** - ssh-to-https conversion may break auth

## Security

- whisper endpoint uses http not https
- no authentication/validation
- scripts/process-prompt.sh executes user input
- 14 unpinned git submodules

## Missing

- no tests for bash scripts
- no plugin integration tests
- duplicate skill files not documented
- file 'a' at root (debug artifact?)

## Strengths

- excellent AGENTS.md documentation
- follows kebab-case conventions
- modular plugin structure
- comprehensive skill files

## Priority Fixes

**before merge:**
1. fix hardcoded path in process-prompt.sh
2. validate .envrc secret handling
3. remove file 'a'
4. validate bin/wt parameter

**medium:**
1. use mktemp for temp files
2. add script error handling
3. add tests
4. pin submodule versions

## Verdict

solid infrastructure, needs security hardening and portability fixes before merge

---
automated review by claude code

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/23#issuecomment-3539356279
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/23/c3539356279@github.com>