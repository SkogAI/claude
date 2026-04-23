MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Sat, 25 Oct 2025 20:40:57 -0700
Subject: Re: [Skogix/SParse] Expand string character support and add escape sequences (PR #3)
Message-ID: <Skogix/SParse/pull/3/review/3380404513@github.com>
In-Reply-To: <Skogix/SParse/pull/3@github.com>
References: <Skogix/SParse/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fd9849d91fe_11e1811007017"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR expands string parsing capabilities by supporting all printable characters and escape sequences in quoted strings. The changes address the limitation where strings could only contain letters and parentheses.

**Key Changes:**
- Added escape sequence parser for `\"`, `\\`, `\n`, `\t`, and `\r`
- Modified quoted string parser to accept any character except quotes and backslashes
- Changed array and object parsers from `separatedBy1` to `separateBy` to allow empty collections





---

💡 <a href="/Skogix/SParse/new/master/.github?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>    string
   <?> "string parser"
+/// parsear escape-sekvenser i strängar

Corrected spelling of 'parsear' to 'parsea' (Swedish for 'parse').
```suggestion
/// parsea escape-sekvenser i strängar
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/3#pullrequestreview-3380404513
You are receiving this because you authored the thread.

Message ID: <Skogix/SParse/pull/3/review/3380404513@github.com>