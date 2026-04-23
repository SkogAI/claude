MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 06 Apr 2025 21:56:40 -0700
Subject: [Skogix/agent-gpt2] Bump prisma from 4.13.0 to 6.5.0 in /next (PR #30)
Message-ID: <Skogix/agent-gpt2/pull/30@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67f35b08a4dce_623e103013707e"; charset="UTF-8"

Bumps [prisma](https://github.com/prisma/prisma/tree/HEAD/packages/cli) from 4.13.0 to 6.5.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/prisma/prisma/releases&quot;&gt;prisma&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;6.5.0&lt;/h2&gt;
&lt;p&gt;Today, we are excited to share the &lt;code&gt;6.5.0&lt;/code&gt; stable release 🎉&lt;/p&gt;
&lt;p&gt;🌟 &lt;strong&gt;Help us spread the word about Prisma by starring the repo ☝️ or &lt;a href=&quot;https://twitter.com/intent/tweet?text=Check%20out%20the%20latest%20@prisma%20release%20v6.5.0%20%F0%9F%9A%80%0D%0A%0D%0Ahttps://github.com/prisma/prisma/releases/tag/6.5.0&quot;&gt;tweeting&lt;/a&gt; about the release.&lt;/strong&gt; 🌟&lt;/p&gt;
&lt;h2&gt;Highlights&lt;/h2&gt;
&lt;h3&gt;Databases can only be reset manually and explicitly&lt;/h3&gt;
&lt;p&gt;In previous versions, if Prisma ORM determined that a &lt;code&gt;migrate&lt;/code&gt; command could not be applied cleanly to the underlying database, you would get a message like this one:&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;? We need to reset the &amp;quot;public&amp;quot; schema at &amp;quot;db.url.com:5432&amp;quot;
Do you want to continue? All data will be lost. (y/N)
&lt;/code&gt;&lt;/pre&gt;
&lt;p&gt;While &amp;quot;no&amp;quot; was the default, we&#39;ve determined that having this prompt in the first place was a mistake. In this version we&#39;re removing the prompt entirely and instead exiting with an appropriate error message.&lt;/p&gt;
&lt;p&gt;To get the previous behavior, you will need to run &lt;code&gt;prisma migrate reset&lt;/code&gt; directly.&lt;/p&gt;
&lt;h3&gt;Support for &lt;code&gt;prisma.config.ts&lt;/code&gt; in Prisma Studio&lt;/h3&gt;
&lt;p&gt;We&#39;ve expanded support for our &lt;code&gt;prisma.config.ts&lt;/code&gt; file to include Prisma Studio!&lt;/p&gt;
&lt;p&gt;To use the new config file, including the ability to connect to driver adapter enabled databases with Prisma Studio, add a &lt;code&gt;studio&lt;/code&gt; block to your &lt;code&gt;prisma.config.ts&lt;/code&gt; file:&lt;/p&gt;
&lt;pre lang=&quot;ts&quot;&gt;&lt;code&gt;import path from &#39;node:path&#39;
import type { PrismaConfig } from &#39;prisma&#39;
import { PrismaLibSQL } from &#39;@prisma/adapter-libsql&#39;
import { createClient } from &#39;@libsql/client&#39;
&lt;p&gt;export default {&lt;br /&gt;
earlyAccess: true,&lt;br /&gt;
schema: {&lt;br /&gt;
kind: &#39;single&#39;,&lt;br /&gt;
filePath: &#39;./prisma/schema.prisma&#39;,&lt;br /&gt;
},&lt;br /&gt;
studio: {&lt;br /&gt;
adapter: async (env: unknown) =&amp;gt; {&lt;br /&gt;
const connectionString = `file:./dev.db&#39;&lt;br /&gt;
const libsql = createClient({&lt;br /&gt;
url: connectionString,&lt;br /&gt;
})&lt;br /&gt;
return new PrismaLibSQL(libsql)&lt;br /&gt;
},&lt;br /&gt;
},&lt;br /&gt;
} satisfies PrismaConfig&lt;br /&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/5e5a2b839d7c1a88895c9b38f2d60edfc6301f4c&quot;&gt;&lt;code&gt;5e5a2b8&lt;/code&gt;&lt;/a&gt; chore(deps-dev): bump rimraf from 3.0.2 to 6.0.1 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26522&quot;&gt;#26522&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/4bb204066fa75ff4caca805ec6bad12a1edb92a0&quot;&gt;&lt;code&gt;4bb2040&lt;/code&gt;&lt;/a&gt; chore(deps-dev): bump &lt;code&gt;@​inquirer/prompts&lt;/code&gt; from 7.3.2 to 7.3.3 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26563&quot;&gt;#26563&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/13d2709d9d6a034527e534fdb06c7f67838d32dd&quot;&gt;&lt;code&gt;13d2709&lt;/code&gt;&lt;/a&gt; fix: export index.js for compatibility (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26536&quot;&gt;#26536&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/e3fd10d05a00136c4a01fc4d92cf208e4813be23&quot;&gt;&lt;code&gt;e3fd10d&lt;/code&gt;&lt;/a&gt; feat(cli): define &lt;code&gt;prisma.config.ts&lt;/code&gt; without requiring &lt;code&gt;@prisma/config&lt;/code&gt; (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26483&quot;&gt;#26483&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/ddd5f7b83d8a8614fe9ca0f36da11fcc3c52e0a6&quot;&gt;&lt;code&gt;ddd5f7b&lt;/code&gt;&lt;/a&gt; fix(cli): init url showing unnecessary step (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26511&quot;&gt;#26511&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/9a4dba77b37e5ebfba0a213bc2593cf4b3ccb600&quot;&gt;&lt;code&gt;9a4dba7&lt;/code&gt;&lt;/a&gt; chore(deps-dev): bump &lt;code&gt;@​inquirer/prompts&lt;/code&gt; from 5.0.5 to 7.3.2 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26479&quot;&gt;#26479&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/f0a2f8fb46e18e214bfa8af7922b5d24a3b8626c&quot;&gt;&lt;code&gt;f0a2f8f&lt;/code&gt;&lt;/a&gt; chore(depsDev): replace unmaintained eslint plugins (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/25058&quot;&gt;#25058&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/b737cced30f0a494e824ccb788140b7b7fa12580&quot;&gt;&lt;code&gt;b737cce&lt;/code&gt;&lt;/a&gt; chore(deps-dev): bump &lt;code&gt;@​swc/core&lt;/code&gt; from 1.2.204 to 1.11.5 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26471&quot;&gt;#26471&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/f1ef568037b7b3027837bcf25a7874bdaa8dbc0c&quot;&gt;&lt;code&gt;f1ef568&lt;/code&gt;&lt;/a&gt; chore(deps): bump fs-extra and &lt;code&gt;@​types/fs-extra&lt;/code&gt; (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26457&quot;&gt;#26457&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/87e8507e167b67fef747e8a532e2e5efebcc0ff3&quot;&gt;&lt;code&gt;87e8507&lt;/code&gt;&lt;/a&gt; feat(studio): ORM-578 enable use of driver adapters in prisma studio (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26329&quot;&gt;#26329&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/prisma/prisma/commits/6.5.0/packages/cli&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=prisma&amp;package-manager=npm_and_yarn&amp;previous-version=4.13.0&amp;new-version=6.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don&#39;t alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

&lt;details&gt;
&lt;summary&gt;Dependabot commands and options&lt;/summary&gt;
&lt;br /&gt;

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show &lt;dependency name&gt; ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)


&lt;/details&gt;
You can view, comment on, or merge this pull request online at:

  https://github.com/Skogix/agent-gpt2/pull/30

-- Commit Summary --

  * Bump prisma from 4.13.0 to 6.5.0 in /next

-- File Changes --

    M next/package-lock.json (882)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/30.patch
https://github.com/Skogix/agent-gpt2/pull/30.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/30
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/30@github.com&gt;
