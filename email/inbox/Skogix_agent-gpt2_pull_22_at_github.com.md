MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 23 Feb 2025 20:40:22 -0800
Subject: [Skogix/agent-gpt2] Bump prisma from 4.13.0 to 6.4.1 in /next (PR #22)
Message-ID: <Skogix/agent-gpt2/pull/22@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67bbf836bc4b1_cada83395c7"; charset="UTF-8"

Bumps [prisma](https://github.com/prisma/prisma/tree/HEAD/packages/cli) from 4.13.0 to 6.4.1.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/prisma/prisma/releases&quot;&gt;prisma&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;6.4.1&lt;/h2&gt;
&lt;p&gt;Today, we are issuing the 6.4.1 patch release. It fixes a few issues with the NPS survey and makes it respect the &lt;code&gt;--no-hints&lt;/code&gt; CLI flag.&lt;/p&gt;
&lt;h2&gt;Fixes&lt;/h2&gt;
&lt;h4&gt;Prisma CLI&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/26364&quot;&gt;prisma/prisma#26364&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;6.4.0&lt;/h2&gt;
&lt;p&gt;Today, we are excited to share the &lt;code&gt;6.4.0&lt;/code&gt; stable release 🎉&lt;/p&gt;
&lt;p&gt;🌟 &lt;strong&gt;Help us spread the word about Prisma by starring the repo ☝️ or &lt;a href=&quot;https://twitter.com/intent/tweet?text=Check%20out%20the%20latest%20@prisma%20release%20v6.4.0%20%F0%9F%9A%80%0D%0A%0D%0Ahttps://github.com/prisma/prisma/releases/tag/6.4.0&quot;&gt;tweeting&lt;/a&gt; about the release.&lt;/strong&gt; 🌟&lt;/p&gt;
&lt;h2&gt;Highlights&lt;/h2&gt;
&lt;h3&gt;TypeScript-based configuration with &lt;code&gt;prisma.config.ts&lt;/code&gt; (Early Access)&lt;/h3&gt;
&lt;p&gt;In this release, we&#39;re introducing an Early Access version of a TypeScript-based configuration file for Prisma ORM: &lt;code&gt;prisma.config.ts&lt;/code&gt;.&lt;/p&gt;
&lt;p&gt;This file will serve as a central configuration point for Prisma ORM:&lt;/p&gt;
&lt;pre lang=&quot;ts&quot;&gt;&lt;code&gt;import path from &#39;node:path&#39;
&lt;p&gt;export default {&lt;br /&gt;
earlyAccess: true, // required while in Early Access&lt;/p&gt;
&lt;p&gt;schema: {&lt;br /&gt;
kind: &#39;single&#39;, // use &#39;multi&#39; if you&#39;re using the &lt;code&gt;prismaSchemaFolder&lt;/code&gt; preview feature&lt;br /&gt;
filePath: path.join(&#39;custom&#39;, &#39;prisma&#39;, &#39;schema.prisma&#39;)&lt;br /&gt;
}&lt;/p&gt;
&lt;p&gt;})&lt;br /&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;p&gt;With this file you are able to run any arbitrary code needed to get values required by Prisma ORM, such as database URLs from a secret store or fine-grained control of settings. It needs to live in the current working directory from where you&#39;re executing Prisma CLI commands (typically, the root of your project).&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;&lt;strong&gt;Note&lt;/strong&gt;: If you&#39;re using &lt;code&gt;prisma.config.ts&lt;/code&gt;, the Prisma CLI will not load environment variables from &lt;code&gt;.env&lt;/code&gt; files. If you want to use a &lt;code&gt;.env&lt;/code&gt; file with &lt;code&gt;prisma.config.ts&lt;/code&gt;, you&#39;ll need to load the environment variables manually using the &lt;a href=&quot;https://github.com/motdotla/dotenv&quot;&gt;&lt;code&gt;dotenv&lt;/code&gt;&lt;/a&gt; package (see &lt;a href=&quot;https://www.prisma.io/docs/orm/reference/prisma-config-reference&quot;&gt;here&lt;/a&gt;).&lt;/p&gt;
&lt;/blockquote&gt;
&lt;p&gt;Learn more about the new &lt;code&gt;prisma.config.ts&lt;/code&gt; file in the &lt;a href=&quot;https://prisma.io/docs/orm/reference/prisma-config-reference&quot;&gt;docs&lt;/a&gt;.&lt;/p&gt;
&lt;h3&gt;Case-insensitive mode in JSON filters&lt;/h3&gt;
&lt;p&gt;You can now do case-insensitive filtering on JSON data.&lt;/p&gt;
&lt;p&gt;Just use the new &lt;code&gt;mode&lt;/code&gt; option when filtering using &lt;code&gt;string_contains&lt;/code&gt;, &lt;code&gt;string_starts_with&lt;/code&gt; or &lt;code&gt;string_ends_with&lt;/code&gt; in a JSON object and set it to &lt;code&gt;&amp;quot;insensitive&amp;quot;&lt;/code&gt;:&lt;/p&gt;
&lt;pre lang=&quot;ts&quot;&gt;&lt;code&gt;await prisma.user.findMany({
&amp;lt;/tr&amp;gt;&amp;lt;/table&amp;gt; 
&lt;/code&gt;&lt;/pre&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/4b7b9b104d5ec4b8d56aa11de5f781656a942465&quot;&gt;&lt;code&gt;4b7b9b1&lt;/code&gt;&lt;/a&gt; fix(cli): be more cautious about showing the NPS survey (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26375&quot;&gt;#26375&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/c69846e1132a92dfb5c01be834558df20dc35295&quot;&gt;&lt;code&gt;c69846e&lt;/code&gt;&lt;/a&gt; fix(cli): handle &lt;code&gt;error&lt;/code&gt; event in NPS survey (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26376&quot;&gt;#26376&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/fc01fa00ffee2af10801170bd24e2a243e2306a7&quot;&gt;&lt;code&gt;fc01fa0&lt;/code&gt;&lt;/a&gt; fix: do not show NPS survey when --no-hints is provided (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26372&quot;&gt;#26372&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/718fffec9d774b4abc30cc6a4c43aff01d0ed09e&quot;&gt;&lt;code&gt;718fffe&lt;/code&gt;&lt;/a&gt; fix(cli): add esbuild and esbuild-register to runtime dependencies (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26361&quot;&gt;#26361&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/3d18405a5961403ead37bf1b6284168cc7e4dac7&quot;&gt;&lt;code&gt;3d18405&lt;/code&gt;&lt;/a&gt; chore: bumped studio to new version (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26358&quot;&gt;#26358&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/7105e05d40fd14878bc24a50e55c5bac388161cc&quot;&gt;&lt;code&gt;7105e05&lt;/code&gt;&lt;/a&gt; feat(prisma.config.ts):fix test regex for windows (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26356&quot;&gt;#26356&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/cd29583e56228ccdbf1623175d75728f2e8ddb21&quot;&gt;&lt;code&gt;cd29583&lt;/code&gt;&lt;/a&gt; fix(config): fix issue with --config cli arg (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26336&quot;&gt;#26336&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/e002705817cbcd98b233c75c069cb3f5440e26a4&quot;&gt;&lt;code&gt;e002705&lt;/code&gt;&lt;/a&gt; feat(prisma-config): ORM-628 use schema path from config file (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26333&quot;&gt;#26333&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/9b8a0214c1ac390dfc3f2958846dc3b3916266e0&quot;&gt;&lt;code&gt;9b8a021&lt;/code&gt;&lt;/a&gt; chore(config): cosmetic changes (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26328&quot;&gt;#26328&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/5ea722678e0a8953f07633eb56a588ea196dd894&quot;&gt;&lt;code&gt;5ea7226&lt;/code&gt;&lt;/a&gt; feat(config): parse Prisma Config&#39;s structure for conformance (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26303&quot;&gt;#26303&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/prisma/prisma/commits/6.4.1/packages/cli&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=prisma&amp;package-manager=npm_and_yarn&amp;previous-version=4.13.0&amp;new-version=6.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/22

-- Commit Summary --

  * Bump prisma from 4.13.0 to 6.4.1 in /next

-- File Changes --

    M next/package-lock.json (863)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/22.patch
https://github.com/Skogix/agent-gpt2/pull/22.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/22
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/22@github.com&gt;
