MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Wed, 29 Jan 2025 04:03:42 -0800
Subject: [Skogix/agent-gpt2] Bump prisma from 4.13.0 to 6.3.0 in /next (PR #5)
Message-ID: <Skogix/agent-gpt2/pull/5@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_679a191ee6f31_7fd881829a0"; charset="UTF-8"

Bumps [prisma](https://github.com/prisma/prisma/tree/HEAD/packages/cli) from 4.13.0 to 6.3.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/prisma/prisma/releases&quot;&gt;prisma&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;6.3.0&lt;/h2&gt;
&lt;p&gt;Today, we are excited to share the &lt;code&gt;6.3.0&lt;/code&gt; stable release 🎉&lt;/p&gt;
&lt;p&gt;🌟 &lt;strong&gt;Help us spread the word about Prisma by starring the repo ☝️ or &lt;a href=&quot;https://twitter.com/intent/tweet?text=Check%20out%20the%20latest%20@prisma%20release%20v6.3.0%20%F0%9F%9A%80%0D%0A%0D%0Ahttps://github.com/prisma/prisma/releases/tag/6.3.0&quot;&gt;tweeting&lt;/a&gt; about the release.&lt;/strong&gt; 🌟&lt;/p&gt;
&lt;h2&gt;Highlights&lt;/h2&gt;
&lt;h3&gt;Add &lt;code&gt;limit&lt;/code&gt; to &lt;code&gt;updateMany()&lt;/code&gt; and &lt;code&gt;deleteMany()&lt;/code&gt;&lt;/h3&gt;
&lt;p&gt;Previously, &lt;code&gt;limit&lt;/code&gt; has not existed as a valid option in top level &lt;code&gt;updateMany()&lt;/code&gt; and &lt;code&gt;deleteMany()&lt;/code&gt; queries. In 6.3.0 &lt;code&gt;limit&lt;/code&gt; is now available in these queries, bringing their features more in line with other query types.&lt;/p&gt;
&lt;p&gt;You can use &lt;code&gt;limit&lt;/code&gt; like the following:&lt;/p&gt;
&lt;pre lang=&quot;tsx&quot;&gt;&lt;code&gt;await prisma.user.deleteMany({
  where: { column: &#39;value&#39; },
  limit: 100,
});
&lt;/code&gt;&lt;/pre&gt;
&lt;p&gt;This will limit the number of deleted users to 100 at maximum.&lt;/p&gt;
&lt;h3&gt;Sort &lt;code&gt;generator&lt;/code&gt; fields deterministically&lt;/h3&gt;
&lt;p&gt;In previous version of Prisma ORM, the fields inside of a &lt;code&gt;generator&lt;/code&gt; block in your Prisma Schema were not deterministically sorted. This could lead to cases where &lt;code&gt;prisma db pull&lt;/code&gt; could lead to re-ordering of fields.&lt;/p&gt;
&lt;p&gt;In 6.3.0, the sorting of fields in this block is now deterministic. You may see re-ordering on the first &lt;code&gt;prisma db pull&lt;/code&gt; after you upgrade, but it will remain consistent afterwards.&lt;/p&gt;
&lt;h3&gt;Replace &lt;code&gt;NOT IN&lt;/code&gt; with &lt;code&gt;NOT EXISTS&lt;/code&gt; for PostgreSQL relation filters&lt;/h3&gt;
&lt;p&gt;In previous versions of Prisma ORM, when using the &lt;code&gt;none&lt;/code&gt; or &lt;code&gt;some&lt;/code&gt; relation filters, the SQL queries generated used &lt;code&gt;NOT IN&lt;/code&gt;. In many cases this lead to performance issues as the size of the related table grew. In 6.3.0, we’ve replaced these usages of &lt;code&gt;IN&lt;/code&gt; with &lt;code&gt;EXISTS&lt;/code&gt; in order to improve query performance.&lt;/p&gt;
&lt;h2&gt;A special thank you&lt;/h2&gt;
&lt;p&gt;We&#39;d like to extend our heartfelt thanks to &lt;a href=&quot;https://github.com/loren&quot;&gt;&lt;code&gt;@​loren&lt;/code&gt;&lt;/a&gt; and his team for the collaboration and trust in our enterprise support plan. Working closely with them allowed us to address important issues like &lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/19249&quot;&gt;#19249&lt;/a&gt; and &lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/17303&quot;&gt;#17303&lt;/a&gt;. Their insights and partnership have been invaluable in improving our product.&lt;/p&gt;
&lt;p&gt;If your team could benefit from dedicated support and tailored solutions, &lt;a href=&quot;https://www.prisma.io/enterprise?utm_source=release-notes&amp;amp;utm_campaign=thanks#contact-us&quot;&gt;learn more&lt;/a&gt; about our enterprise support plan.&lt;/p&gt;
&lt;h2&gt;Fixes and improvements&lt;/h2&gt;
&lt;h3&gt;Prisma Client&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/6957&quot;&gt;Add &lt;code&gt;take&lt;/code&gt; or &lt;code&gt;limit&lt;/code&gt; to &lt;code&gt;updateMany()&lt;/code&gt; &amp;amp; &lt;code&gt;deleteMany()&lt;/code&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Prisma&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/17303&quot;&gt;Prisma interactive transaction ignores DB exception on commit (with triggers)&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/17899&quot;&gt;&lt;code&gt;prisma db pull&lt;/code&gt; non-deterministically sorts generator fields&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/19249&quot;&gt;&lt;code&gt;no entry found for key&lt;/code&gt; error on views&lt;!-- raw HTML omitted --&gt;model relations&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/prisma/prisma/issues/25944&quot;&gt;Adding &lt;code&gt;onUpdate&lt;/code&gt; data to the DMMF in &lt;code&gt;@prisma/generator-helper&lt;/code&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/3d913b5ea5ff3f9fd47c66104fdfbeaba9909a2a&quot;&gt;&lt;code&gt;3d913b5&lt;/code&gt;&lt;/a&gt; feat: allow init --db if prisma folder exists (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26181&quot;&gt;#26181&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/2aa68fc096db1f97d17533deb0ad4f9ffa61c163&quot;&gt;&lt;code&gt;2aa68fc&lt;/code&gt;&lt;/a&gt; chore(deps): update studio to v0.508.0 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26180&quot;&gt;#26180&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/d45607dfa10c4ef08cb8f79f18fa84ef33910150&quot;&gt;&lt;code&gt;d45607d&lt;/code&gt;&lt;/a&gt; fix(cli, sub-commands): better handling of esm packages (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26161&quot;&gt;#26161&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/00b79e5bf79d2c00c6f91b8c006704d2fdf81ffa&quot;&gt;&lt;code&gt;00b79e5&lt;/code&gt;&lt;/a&gt; fix(build): make typescript optional peer dependency to not accidentally bund...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/b413705b0a926af378b2a7d0c686b4cbcb95468d&quot;&gt;&lt;code&gt;b413705&lt;/code&gt;&lt;/a&gt; chore(deps): update studio to v0.505.0 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26152&quot;&gt;#26152&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/995c00f01ae9fe0bc617419ec753d953b1311596&quot;&gt;&lt;code&gt;995c00f&lt;/code&gt;&lt;/a&gt; chore(platform-cli): ppg copy changes (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26115&quot;&gt;#26115&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/8d9f075ba8d7f1a716fc1cfc06e04a6caabe7f75&quot;&gt;&lt;code&gt;8d9f075&lt;/code&gt;&lt;/a&gt; chore(deps): update studio to v0.504.0 (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26131&quot;&gt;#26131&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/d1a12be0db57b9749867f31fe39996c104e1d782&quot;&gt;&lt;code&gt;d1a12be&lt;/code&gt;&lt;/a&gt; chore(deps): update devdependencies patch (non-major) (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26141&quot;&gt;#26141&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/049753e327c830afa7c0d8f6b52679c0fd03a41e&quot;&gt;&lt;code&gt;049753e&lt;/code&gt;&lt;/a&gt; feat(cli): implement generic sub-commands (+ policy) (&lt;a href=&quot;https://github.com/prisma/prisma/tree/HEAD/packages/cli/issues/26134&quot;&gt;#26134&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/prisma/prisma/commit/3046f260f51f890ce5cbdd4f6edcd0b9edb0cd3b&quot;&gt;&lt;code&gt;3046f26&lt;/code&gt;&lt;/a&gt; feat(migrate): on &lt;code&gt;prisma+postgres&lt;/code&gt; URLs, pass &lt;code&gt;--no-engine&lt;/code&gt; flag to client g...&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/prisma/prisma/commits/6.3.0/packages/cli&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=prisma&amp;package-manager=npm_and_yarn&amp;previous-version=4.13.0&amp;new-version=6.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/5

-- Commit Summary --

  * Bump prisma from 4.13.0 to 6.3.0 in /next

-- File Changes --

    M next/package-lock.json (163)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/5.patch
https://github.com/Skogix/agent-gpt2/pull/5.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/5
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/5@github.com&gt;
