MIME-Version: 1.0
From: "cloudflare-workers-and-pages[bot]" <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Wed, 19 Nov 2025 05:02:40 -0800
Subject: Re: [SkogAI/llm-chat] feat: Add system prompt customization UI=0A=0AImplements Issue #8 - System Prompt Customization=0A=0AFeatures:=0A- Settings modal with gear icon button in header=0A- 5 preset prompt templates (Default, Code Expert, Creative Writer, Concise, Teacher)=0A- Custom prompt textarea with 2000 character limit=0A- Real-time character counter with warning at 90% capacity=0A- localStorage persistence for user preferences=0A- Reset to default functionality=0A=0ATechnical changes:=0A- Added settings.js for prompt management and localStorage handling=0A- Updated index.html with modal UI and styling=0A- Modified backend (src/index.ts) to accept custom systemPrompt parameter=0A- Updated chat.js to send custom prompt with each request=0A- Updated config.js formatRequest to support systemPrompt parameter=0A=0AUser experience:=0A- Click Settings button to open modal=0A- Select preset or enter custom prompt=0A- Changes persist across sessions=0A- Apply to new conversations immediately (PR #47)
Message-ID: <SkogAI/llm-chat/pull/47/c3552557675@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/47@github.com>
References: <SkogAI/llm-chat/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691dbff093717_bb11002596fa"; charset="UTF-8"

cloudflare-workers-and-pages[bot] left a comment (SkogAI/llm-chat#47)

## Deploying with &nbsp;<a href="https://workers.dev"><img alt="Cloudflare Workers" src="https://workers.cloudflare.com/logo.svg" width="16"></a> &nbsp;Cloudflare Workers
The latest updates on your project. Learn more about [integrating Git with Workers](https://developers.cloudflare.com/workers/ci-cd/builds/git-integration/).

| Status | Name | Latest Commit | Updated (UTC) |
| -|-|-|-|
| ❌ Deployment failed <br>[View logs](https://dash.cloudflare.com/?to=/ae931e241550e8326149eeda10ada60d/workers/services/view/llm-chat/production/builds/6ab02cc8-f7b9-424f-a0e9-63baf2f577b3) | llm-chat | 09d8e42f | Nov 19 2025, 10:24 AM |

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/47#issuecomment-3552557675
You are receiving this because you authored the thread.

Message ID: <SkogAI/llm-chat/pull/47/c3552557675@github.com>