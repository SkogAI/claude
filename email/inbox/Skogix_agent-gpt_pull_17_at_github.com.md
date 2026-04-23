MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 17 Feb 2025 00:03:18 -0800
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.6 in /next (PR #17)
Message-ID: <Skogix/agent-gpt/pull/17@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67b2ed469a13c_2a008d9818237c"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.6.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.6&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Revert change to no longer include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16403&quot;&gt;#16403&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.5&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;@theme static&lt;/code&gt; option for always including theme variables in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Remove rogue &lt;code&gt;console.log&lt;/code&gt; from &lt;code&gt;@tailwindcss/vite&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16307&quot;&gt;#16307&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.4&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix a crash when setting JS theme values to &lt;code&gt;null&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16210&quot;&gt;#16210&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure escaped underscores in CSS variables in arbitrary values are properly unescaped (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16206&quot;&gt;#16206&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that the &lt;code&gt;containers&lt;/code&gt; JS theme key is added to the &lt;code&gt;--container-*&lt;/code&gt; namespace (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16169&quot;&gt;#16169&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure theme &lt;code&gt;@keyframes&lt;/code&gt; are generated even if an &lt;code&gt;--animation-*&lt;/code&gt; variable spans multiple lines (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16237&quot;&gt;#16237&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Skip parsing stylesheets with the &lt;code&gt;?commonjs-proxy&lt;/code&gt; flag (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16238&quot;&gt;#16238&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;order-first&lt;/code&gt; and &lt;code&gt;order-last&lt;/code&gt; for Firefox (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16266&quot;&gt;#16266&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix support for older instruction sets on Linux x64 builds of the standalone CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16244&quot;&gt;#16244&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;NODE_PATH&lt;/code&gt; is respected when resolving JavaScript and CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16274&quot;&gt;#16274&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure Node addons are packaged correctly with FreeBSD builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16277&quot;&gt;#16277&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix an issue where &lt;code&gt;@variant&lt;/code&gt; inside a referenced stylesheet could cause a stack overflow (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16300&quot;&gt;#16300&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.3&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect removal of &lt;code&gt;@import url();&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16144&quot;&gt;#16144&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.2&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Only generate positive &lt;code&gt;grid-cols-*&lt;/code&gt; and &lt;code&gt;grid-rows-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16020&quot;&gt;#16020&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure escaped theme variables are handled correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16064&quot;&gt;#16064&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure we process Tailwind CSS features when only using &lt;code&gt;@reference&lt;/code&gt; or &lt;code&gt;@variant&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16057&quot;&gt;#16057&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Refactor gradient implementation to work around &lt;a href=&quot;https://redirect.github.com/prettier/prettier/issues/17058&quot;&gt;prettier/prettier#17058&lt;/a&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16072&quot;&gt;#16072&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure hot-reloading works with SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Fix a crash when starting the development server in SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t rebase URLs that appear to be aliases (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16078&quot;&gt;#16078&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Transform &lt;code&gt;&amp;lt;style&amp;gt;&lt;/code&gt; blocks in HTML files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16069&quot;&gt;#16069&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent camel-casing CSS custom properties added by JavaScript plugins (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16103&quot;&gt;#16103&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Do not emit &lt;code&gt;@keyframes&lt;/code&gt; in &lt;code&gt;@theme reference&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16120&quot;&gt;#16120&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.6] - 2025-02-10&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Revert change to no longer include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16403&quot;&gt;#16403&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Upgrade: Don&#39;t migrate &lt;code&gt;blur&lt;/code&gt; to &lt;code&gt;blur-sm&lt;/code&gt; when used with Next.js &lt;code&gt;&amp;lt;Image placeholder=&amp;quot;blur&amp;quot; /&amp;gt;&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16405&quot;&gt;#16405&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.5] - 2025-02-08&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;@theme static&lt;/code&gt; option for always including theme variables in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Remove rogue &lt;code&gt;console.log&lt;/code&gt; from &lt;code&gt;@tailwindcss/vite&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16307&quot;&gt;#16307&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.4] - 2025-02-06&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix a crash when setting JS theme values to &lt;code&gt;null&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16210&quot;&gt;#16210&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure escaped underscores in CSS variables in arbitrary values are properly unescaped (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16206&quot;&gt;#16206&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that the &lt;code&gt;containers&lt;/code&gt; JS theme key is added to the &lt;code&gt;--container-*&lt;/code&gt; namespace (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16169&quot;&gt;#16169&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure theme &lt;code&gt;@keyframes&lt;/code&gt; are generated even if an &lt;code&gt;--animation-*&lt;/code&gt; variable spans multiple lines (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16237&quot;&gt;#16237&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Skip parsing stylesheets with the &lt;code&gt;?commonjs-proxy&lt;/code&gt; flag (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16238&quot;&gt;#16238&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;order-first&lt;/code&gt; and &lt;code&gt;order-last&lt;/code&gt; for Firefox (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16266&quot;&gt;#16266&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix support for older instruction sets on Linux x64 builds of the standalone CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16244&quot;&gt;#16244&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;NODE_PATH&lt;/code&gt; is respected when resolving JavaScript and CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16274&quot;&gt;#16274&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure Node addons are packaged correctly with FreeBSD builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16277&quot;&gt;#16277&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix an issue where &lt;code&gt;@variant&lt;/code&gt; inside a referenced stylesheet could cause a stack overflow (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16300&quot;&gt;#16300&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.3] - 2025-02-01&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect removal of &lt;code&gt;@import url();&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16144&quot;&gt;#16144&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.2] - 2025-01-31&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Only generate positive &lt;code&gt;grid-cols-*&lt;/code&gt; and &lt;code&gt;grid-rows-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16020&quot;&gt;#16020&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/d045aaa75edb8ee6b69c4b1e2551c2a844377927&quot;&gt;&lt;code&gt;d045aaa&lt;/code&gt;&lt;/a&gt; Prepare v4.0.6 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16407&quot;&gt;#16407&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/9bbe2e3d08ac7d38c2f6e64cf34eb0fc931ba07f&quot;&gt;&lt;code&gt;9bbe2e3&lt;/code&gt;&lt;/a&gt; Revert: Only expose used CSS variables (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16403&quot;&gt;#16403&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/aaf66b014f8456e640903d8ef9fa68196a8177a5&quot;&gt;&lt;code&gt;aaf66b0&lt;/code&gt;&lt;/a&gt; Fix mismatched comment numbers in styles (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16380&quot;&gt;#16380&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/a659159bf11e74273134ead9fcf44857758912e9&quot;&gt;&lt;code&gt;a659159&lt;/code&gt;&lt;/a&gt; Bump and pin &lt;code&gt;prettier&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16382&quot;&gt;#16382&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/ad001199f6e3ce64472de1b3d5f5a424c9d065c8&quot;&gt;&lt;code&gt;ad00119&lt;/code&gt;&lt;/a&gt; Prepare v4.0.5 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16373&quot;&gt;#16373&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/d684733d804a0b8951d13c94fe27350271e076b6&quot;&gt;&lt;code&gt;d684733&lt;/code&gt;&lt;/a&gt; Only expose used CSS variables (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16211&quot;&gt;#16211&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/83fdf373aa729bc1beae1a64c9c0bba76f3b2c2f&quot;&gt;&lt;code&gt;83fdf37&lt;/code&gt;&lt;/a&gt; Prepare v4.0.4 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16302&quot;&gt;#16302&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/144581d3e46510ffbbf1d96330d46d308cdf0509&quot;&gt;&lt;code&gt;144581d&lt;/code&gt;&lt;/a&gt; Properly skip over nodes when using &lt;code&gt;replaceNode&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16300&quot;&gt;#16300&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/d566dbdef658b8c98a8c596466d74f11c72295e2&quot;&gt;&lt;code&gt;d566dbd&lt;/code&gt;&lt;/a&gt; Improve performance of rebuilds (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16283&quot;&gt;#16283&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/82d486adb535d50f11ed9ec7f6a8a7ccf7c2bc07&quot;&gt;&lt;code&gt;82d486a&lt;/code&gt;&lt;/a&gt; Fix &lt;code&gt;order-first&lt;/code&gt; and &lt;code&gt;order-last&lt;/code&gt; for Firefox (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16266&quot;&gt;#16266&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.6/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/17

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.6 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/17.patch
https://github.com/Skogix/agent-gpt/pull/17.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/17
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/17@github.com&gt;
