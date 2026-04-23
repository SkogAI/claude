MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 02 Mar 2025 20:38:16 -0800
Subject: [Skogix/agent-gpt2] Bump react-i18next from 12.3.1 to 15.4.1 in /next (PR #23)
Message-ID: <Skogix/agent-gpt2/pull/23@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67c53238e9a07_a7de043617f"; charset="UTF-8"

Bumps [react-i18next](https://github.com/i18next/react-i18next) from 12.3.1 to 15.4.1.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/i18next/react-i18next/blob/master/CHANGELOG.md&quot;&gt;react-i18next&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h3&gt;15.4.1&lt;/h3&gt;
&lt;p&gt;fix: unique key warning on componentized element &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1835&quot;&gt;1835&lt;/a&gt;&lt;/p&gt;
&lt;h3&gt;15.4.0&lt;/h3&gt;
&lt;p&gt;feat: add meta with codes on warnings to allow conditional logging &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1826&quot;&gt;1826&lt;/a&gt;&lt;/p&gt;
&lt;h3&gt;15.3.0&lt;/h3&gt;
&lt;p&gt;Uses the i18next logger instead of the default console logger, if there is a valid i18next instance. Now the debug i18next option is respected, and you can also inject your own logger module: &lt;a href=&quot;https://www.i18next.com/misc/creating-own-plugins#logger&quot;&gt;https://www.i18next.com/misc/creating-own-plugins#logger&lt;/a&gt;&lt;/p&gt;
&lt;h3&gt;15.2.0&lt;/h3&gt;
&lt;p&gt;This version may be breaking if you still use React &amp;lt; v18 with TypeScript.
For JS users this version is equal to v15.1.4&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;fix: Global JSX namespace is deprecated &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1823&quot;&gt;1823&lt;/a&gt; with &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1822&quot;&gt;1822&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.1.4&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix: warning each child should have a unique key &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1820&quot;&gt;1820&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.1.3&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;fix: Self-closing REACT components in translation strings should not attempt to replace the component&#39;s children &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1815&quot;&gt;1815&lt;/a&gt; &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1816&quot;&gt;1816&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.1.2&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;fix: Attempted to assign to readonly property &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1813&quot;&gt;1813&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.1.1&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;fix: Not all namespaces are loaded when passing the lng option to useTranslate &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1809&quot;&gt;1809&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.1.0&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;fix: &lt;code&gt;&amp;lt;Trans /&amp;gt;&lt;/code&gt; warns &#39;Each child in a list should have a unique &amp;quot;key&amp;quot; prop.&#39; for react 19 &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/pull/1806&quot;&gt;1806&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.0.3&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;try to fix &lt;a href=&quot;https://redirect.github.com/i18next/next-i18next/issues/2302&quot;&gt;unexpected token issue&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.0.2&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;try to fix Trans handling with alwaysFormat set to true &lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1801&quot;&gt;1801&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;15.0.1&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;revert arrow function in class property to address &lt;a href=&quot;https://github.com/i18next/react-i18next/commit/46e8ea5ff69325b73087811a2ce6a2b1faffa971#r145061161&quot;&gt;this&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/e3221261df515fd2d1039cc3c3a494a960a6a4f1&quot;&gt;&lt;code&gt;e322126&lt;/code&gt;&lt;/a&gt; 15.4.1&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/71886a95dddce4d04abbe66f31ca00f2b198c5bd&quot;&gt;&lt;code&gt;71886a9&lt;/code&gt;&lt;/a&gt; release&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/f8068d3764e965561f4c40e77bac62c3efa95e16&quot;&gt;&lt;code&gt;f8068d3&lt;/code&gt;&lt;/a&gt; fix: unique key warning on componentized element (&lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1835&quot;&gt;#1835&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/330a8e72e33ead1194812a4dce7c912eed10381e&quot;&gt;&lt;code&gt;330a8e7&lt;/code&gt;&lt;/a&gt; 15.4.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/26ab5a3e8134efd775ee5e7d10cc77442a634ff3&quot;&gt;&lt;code&gt;26ab5a3&lt;/code&gt;&lt;/a&gt; release&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/3cd025f034ed2b0e65e8b2516885ac3ba4a2605e&quot;&gt;&lt;code&gt;3cd025f&lt;/code&gt;&lt;/a&gt; feat: format warning with code and data to allow conditional logging (&lt;a href=&quot;https://redirect.github.com/i18next/react-i18next/issues/1826&quot;&gt;#1826&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/ff509baabd7dda6f6a22ac21ed4b92a40c7704ea&quot;&gt;&lt;code&gt;ff509ba&lt;/code&gt;&lt;/a&gt; 15.3.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/26616eba2fdbf2813f6514c5883dcda7c769d5ae&quot;&gt;&lt;code&gt;26616eb&lt;/code&gt;&lt;/a&gt; use i18next logger if possible&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/9b194b1be6fa1f38dca3ef010c3ba440240a80ab&quot;&gt;&lt;code&gt;9b194b1&lt;/code&gt;&lt;/a&gt; 15.2.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/i18next/react-i18next/commit/073feff0ea802ce672c8aee7a138c1e5ac3d57b4&quot;&gt;&lt;code&gt;073feff&lt;/code&gt;&lt;/a&gt; release&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/i18next/react-i18next/compare/v12.3.1...v15.4.1&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=react-i18next&amp;package-manager=npm_and_yarn&amp;previous-version=12.3.1&amp;new-version=15.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/23

-- Commit Summary --

  * Bump react-i18next from 12.3.1 to 15.4.1 in /next

-- File Changes --

    M next/package-lock.json (51)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/23.patch
https://github.com/Skogix/agent-gpt2/pull/23.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/23
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/23@github.com&gt;
