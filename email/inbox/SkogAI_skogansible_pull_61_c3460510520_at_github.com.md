MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Wed, 29 Oct 2025 02:15:05 -0700
Subject: Re: [SkogAI/skogansible] fix: simplify become/vault configuration to use environment variables only=0A=0ARemove all hardcoded password file paths and rely purely on environment=0Avariables from .env (loaded via .envrc).=0A=0AChanges:=0A- Simplify run.sh to pass arguments directly to ansible-playbook=0A- Remove all password file path references from CLAUDE.md=0A- Replace "Vault Setup" with "Privilege Escalation" section=0A- Document the 4 reasons a playbook might abort due to privileges=0A- Direct users to check .env/.envrc if environment is broken=0A=0AFixes #53=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #61)
Message-ID: <SkogAI/skogansible/pull/61/c3460510520@github.com>
In-Reply-To: <SkogAI/skogansible/pull/61@github.com>
References: <SkogAI/skogansible/pull/61@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6901db192fe76_16ca11100569fc"; charset="UTF-8"

Copilot left a comment (SkogAI/skogansible#61)

@Skogix I've opened a new pull request, #63, to work on those changes. Once the pull request is ready, I'll request review from you.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/61#issuecomment-3460510520
You are receiving this because you were mentioned.

Message ID: <SkogAI/skogansible/pull/61/c3460510520@github.com>