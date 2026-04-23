MIME-Version: 1.0
From: "cloudflare-workers-and-pages[bot]" <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Mon, 17 Nov 2025 01:16:22 -0800
Subject: Re: [SkogAI/llm-chat] feat: Add markdown rendering with syntax highlighting=0A=0AImplements Issue #2 - Add Markdown Rendering for AI Responses=0A=0AFeatures added:=0A- Markdown parsing using marked.js (v11.1.1)=0A- XSS protection using DOMPurify (v3.0.8)=0A- Syntax highlighting for code blocks using highlight.js (v11.9.0)=0A- Copy-to-clipboard buttons on all code blocks=0A- Comprehensive CSS styling for markdown elements=0A=0AChanges:=0A- Added CDN links for marked.js, DOMPurify, and highlight.js=0A- Created renderMarkdown() function with XSS sanitization=0A- Created addCopyButtonsToCodeBlocks() function for code block UX=0A- Updated message rendering to use innerHTML with sanitized markdown=0A- Added CSS for code blocks, headers, lists, tables, blockquotes, and links=0A- User messages remain HTML-escaped for security=0A=0ASecurity:=0A- DOMPurify sanitizes all HTML to prevent XSS attacks=0A- User input is HTML-escaped before display=0A- Only safe HTML tags and attributes are  (PR #43)
Message-ID: <SkogAI/llm-chat/pull/43/c3540722486@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/43@github.com>
References: <SkogAI/llm-chat/pull/43@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691ae7e6d77f1_d1110873288"; charset="UTF-8"

cloudflare-workers-and-pages[bot] left a comment (SkogAI/llm-chat#43)

## Deploying with &nbsp;<a href="https://workers.dev"><img alt="Cloudflare Workers" src="https://workers.cloudflare.com/logo.svg" width="16"></a> &nbsp;Cloudflare Workers
The latest updates on your project. Learn more about [integrating Git with Workers](https://developers.cloudflare.com/workers/ci-cd/builds/git-integration/).

| Status | Name | Latest Commit | Preview URL | Updated (UTC) |
| -|-|-|-|-|
| ✅ Deployment successful! <br>[View logs](https://dash.cloudflare.com/?to=/ae931e241550e8326149eeda10ada60d/workers/services/view/llm-chat/production/builds/41acea92-b2eb-424e-bcb5-fd09b9844ee1) | llm-chat | 08e24d88 | <a href='https://1708f612-llm-chat.skogai.workers.dev'>Commit Preview URL</a><br><br><a href='https://head-llm-chat.skogai.workers.dev'>Branch Preview URL</a> | Nov 16 2025, 09:47 AM |

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/43#issuecomment-3540722486
You are receiving this because you authored the thread.

Message ID: <SkogAI/llm-chat/pull/43/c3540722486@github.com>