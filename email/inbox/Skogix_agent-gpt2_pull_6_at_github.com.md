MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Wed, 29 Jan 2025 04:03:45 -0800
Subject: [Skogix/agent-gpt2] Bump dotenv from 16.3.1 to 16.4.7 in /cli (PR #6)
Message-ID: <Skogix/agent-gpt2/pull/6@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_679a1921b049e_8dd882484dc"; charset="UTF-8"

Bumps [dotenv](https://github.com/motdotla/dotenv) from 16.3.1 to 16.4.7.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/motdotla/dotenv/blob/master/CHANGELOG.md&quot;&gt;dotenv&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.6...v16.4.7&quot;&gt;16.4.7&lt;/a&gt; (2024-12-03)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ignore &lt;code&gt;.tap&lt;/code&gt; folder when publishing. (oops, sorry about that everyone. - &lt;a href=&quot;https://github.com/motdotla&quot;&gt;&lt;code&gt;@​motdotla&lt;/code&gt;&lt;/a&gt;) &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/848&quot;&gt;#848&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.5...v16.4.6&quot;&gt;16.4.6&lt;/a&gt; (2024-12-02)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Clean up stale dev dependencies &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/847&quot;&gt;#847&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;Various README updates clarifying usage and alternative solutions using &lt;a href=&quot;https://github.com/dotenvx/dotenvx&quot;&gt;dotenvx&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.4...v16.4.5&quot;&gt;16.4.5&lt;/a&gt; (2024-02-19)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;🐞 Fix recent regression when using &lt;code&gt;path&lt;/code&gt; option. return to historical behavior: do not attempt to auto find &lt;code&gt;.env&lt;/code&gt; if &lt;code&gt;path&lt;/code&gt; set. (regression was introduced in &lt;code&gt;16.4.3&lt;/code&gt;) &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/814&quot;&gt;#814&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.3...v16.4.4&quot;&gt;16.4.4&lt;/a&gt; (2024-02-13)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;🐞 Replaced chaining operator &lt;code&gt;?.&lt;/code&gt; with old school &lt;code&gt;&amp;amp;&amp;amp;&lt;/code&gt; (fixing node 12 failures) &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/812&quot;&gt;#812&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.2...v16.4.3&quot;&gt;16.4.3&lt;/a&gt; (2024-02-12)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fixed processing of multiple files in &lt;code&gt;options.path&lt;/code&gt; &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/805&quot;&gt;#805&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.1...v16.4.2&quot;&gt;16.4.2&lt;/a&gt; (2024-02-10)&lt;/h2&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Changed funding link in package.json to &lt;a href=&quot;https://dotenvx.com&quot;&gt;&lt;code&gt;dotenvx.com&lt;/code&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.4.0...v16.4.1&quot;&gt;16.4.1&lt;/a&gt; (2024-01-24)&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Patch support for array as &lt;code&gt;path&lt;/code&gt; option &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/797&quot;&gt;#797&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.3.2...v16.4.0&quot;&gt;16.4.0&lt;/a&gt; (2024-01-23)&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;error.code&lt;/code&gt; to error messages around &lt;code&gt;.env.vault&lt;/code&gt; decryption handling &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/795&quot;&gt;#795&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;Add ability to find &lt;code&gt;.env.vault&lt;/code&gt; file when filename(s) passed as an array &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/pull/784&quot;&gt;#784&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.3.1...v16.3.2&quot;&gt;16.3.2&lt;/a&gt; (2024-01-18)&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/a338d68264b00fafd1730233ff04127228908e9c&quot;&gt;&lt;code&gt;a338d68&lt;/code&gt;&lt;/a&gt; 16.4.7&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/daf3e3d5cc3bc220c4dd14a540d4382c5fd5e750&quot;&gt;&lt;code&gt;daf3e3d&lt;/code&gt;&lt;/a&gt; changelog 🪵&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/fb74f6809fd4f7a5a0e45dac2e6e2d664de3b812&quot;&gt;&lt;code&gt;fb74f68&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/issues/848&quot;&gt;#848&lt;/a&gt; from Spice-King/patch-1&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/fe87ba23b5098eb6ea86d3fdbdb773e83cf5662f&quot;&gt;&lt;code&gt;fe87ba2&lt;/code&gt;&lt;/a&gt; Add .tap to .npmignore&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/0c9f764c66f291a418185068eef2b13e2ec840b0&quot;&gt;&lt;code&gt;0c9f764&lt;/code&gt;&lt;/a&gt; 16.4.6&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/fd5f26b6c726142d7c3365ab3ce628765db74bd6&quot;&gt;&lt;code&gt;fd5f26b&lt;/code&gt;&lt;/a&gt; changelog 🪵&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/bb19b6bb55abb3dbed3e183557f4198bad3a6a3f&quot;&gt;&lt;code&gt;bb19b6b&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/motdotla/dotenv/issues/847&quot;&gt;#847&lt;/a&gt; from motdotla/deps-updates&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/2f4e36bbe2a0ad42f9b3736bbd19f6cda146b381&quot;&gt;&lt;code&gt;2f4e36b&lt;/code&gt;&lt;/a&gt; further dev dependency cleanup&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/c2fdd0169d1d833d1d3dba7752f3f0a52b5ec4b0&quot;&gt;&lt;code&gt;c2fdd01&lt;/code&gt;&lt;/a&gt; send to codecov&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/motdotla/dotenv/commit/6707487b9e4070e7769048c75e769ba504bb84e1&quot;&gt;&lt;code&gt;6707487&lt;/code&gt;&lt;/a&gt; add test coverage&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/motdotla/dotenv/compare/v16.3.1...v16.4.7&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=dotenv&amp;package-manager=npm_and_yarn&amp;previous-version=16.3.1&amp;new-version=16.4.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/6

-- Commit Summary --

  * Bump dotenv from 16.3.1 to 16.4.7 in /cli

-- File Changes --

    M cli/package-lock.json (17)
    M cli/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/6.patch
https://github.com/Skogix/agent-gpt2/pull/6.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/6
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/6@github.com&gt;
