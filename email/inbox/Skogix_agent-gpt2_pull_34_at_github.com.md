MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 27 Apr 2025 21:40:33 -0700
Subject: [Skogix/agent-gpt2] Bump inquirer from 9.2.12 to 12.6.0 in /cli (PR #34)
Message-ID: <Skogix/agent-gpt2/pull/34@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_680f06c1d3aa4_7a102846443f"; charset="UTF-8"

Bumps [inquirer](https://github.com/SBoudrias/Inquirer.js) from 9.2.12 to 12.6.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/releases&quot;&gt;inquirer&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;inquirer@12.6.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Feat(&lt;code&gt;@​inquirer/select&lt;/code&gt;): Added an &lt;code&gt;instructions&lt;/code&gt; option allowing to customize the messages in the help tips.&lt;/li&gt;
&lt;li&gt;Feat(&lt;code&gt;@​inquirer/rawlist&lt;/code&gt;): Arrow keys will now cycle through the option, just like the &lt;code&gt;@inquirer/select&lt;/code&gt; prompt. Also added a &lt;code&gt;loop&lt;/code&gt; option to control the list loop behaviour when reaching the boundaries.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.5.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;README: Add new sponsor&lt;/li&gt;
&lt;li&gt;Chore: dependency updates&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.5.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Feat (&lt;code&gt;select&lt;/code&gt;): Introduce &lt;code&gt;theme.indexMode&lt;/code&gt; to control displaying an index prefix in front of each choice. (defaults to hidden)&lt;/li&gt;
&lt;li&gt;Fix (&lt;code&gt;select&lt;/code&gt;): Improve search when number keys are pressed&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.4.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix an issue where inquirer would throw if Node is ran with the new &lt;a href=&quot;https://nodejs.org/api/cli.html#--frozen-intrinsics&quot;&gt;&lt;code&gt;--frozen-intrinsics&lt;/code&gt;&lt;/a&gt; flag.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.4.1&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Mark &lt;code&gt;@types/node&lt;/code&gt; as an optional peer dependency across all packages.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.4.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Added new &lt;code&gt;shortcut&lt;/code&gt; config to the &lt;code&gt;checkbox&lt;/code&gt; prompt. Allows to customize or disable shortcut keys for select all and invert selection.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.3.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Replace 3rd party dependency &lt;code&gt;strip-ansi&lt;/code&gt; in favour of &lt;a href=&quot;https://nodejs.org/api/util.html#utilstripvtcontrolcharactersstr&quot;&gt;Node built-in &lt;code&gt;stripVTControlCharacters&lt;/code&gt; util&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.3.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Checkbox prompt: re-added support for an array of &lt;code&gt;default&lt;/code&gt; to be provided listing pre-checked checkboxes. This is a legacy interface brought back given this feature removal was an involuntary breaking change during the &lt;code&gt;v12&lt;/code&gt; release. The preferred interface is to provide the &lt;code&gt;checked&lt;/code&gt; property to choices &lt;code&gt;{ value: &#39;bar&#39;, checked: true }&lt;/code&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@12.0.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;&lt;code&gt;@types/node&lt;/code&gt; is now only a &lt;code&gt;peerDependencies&lt;/code&gt;. This reduces the install size of inquirer dramatically for folks not using Typescript. It&#39;s unlikely to break your builds if you used TS already, if it does run &lt;code&gt;npm install --dev @types/node&lt;/code&gt;/&lt;code&gt;yarn add --dev @types/node&lt;/code&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@11.1.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Now exports base utility Typescript types: &lt;code&gt;import type { Question, DistinctQuestion, Answers } from &#39;inquirer&#39;;&lt;/code&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;You should use as follow to keep the inference working properly:&lt;/p&gt;
&lt;pre lang=&quot;ts&quot;&gt;&lt;code&gt;const questions = [
    { ... }
] as const satisfies Question[];
// If you&#39;re not using inquirer plugins, `Question` could alternatively be replaced by `DistinctQuestion` for stricter checks.
&lt;/code&gt;&lt;/pre&gt;
&lt;h2&gt;inquirer@11.0.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix &lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1555&quot;&gt;#1555&lt;/a&gt;: &lt;code&gt;when&lt;/code&gt; behaviour changed unexpectedly when returning a falsy value.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@11.0.0&lt;/h2&gt;
&lt;p&gt;No technical breaking changes; but we changed the style of the question &lt;code&gt;prefix&lt;/code&gt; once the answer is provided. Once a question is answer, the prefix becomes a tick mark (previously it was the same &lt;code&gt;?&lt;/code&gt; as when the prompt is idle.)&lt;/p&gt;
&lt;p&gt;This is theme-able, and so can be overwritten to with &lt;code&gt;theme.prefix&lt;/code&gt;.&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/238c3af2ecf5fefb9b010fda99bb3a532fa4f61a&quot;&gt;&lt;code&gt;238c3af&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/cad9af0e1aa911259b02c0d6969d1b9f76c7155d&quot;&gt;&lt;code&gt;cad9af0&lt;/code&gt;&lt;/a&gt; Feat(&lt;code&gt;@​inquirer/rawlist&lt;/code&gt;): Support using arrow keys on the rawlist prompt (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1728&quot;&gt;#1728&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/57463816b7056e703148b3bacadda9ebccdc8273&quot;&gt;&lt;code&gt;5746381&lt;/code&gt;&lt;/a&gt; Feat(&lt;code&gt;@​inquirer/select&lt;/code&gt;): Expose customization of the usage instructions (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1727&quot;&gt;#1727&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/9853460923162fc745d7bc3e771cd5c7a53e3d72&quot;&gt;&lt;code&gt;9853460&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump the linting group with 3 updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1726&quot;&gt;#1726&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/4a33400eb48d7e929f84714d45ce5f0d756e65e0&quot;&gt;&lt;code&gt;4a33400&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump the linting group with 2 updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1718&quot;&gt;#1718&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/79832b4201582cb1cf16dfb9012f9e3ac3fb0338&quot;&gt;&lt;code&gt;79832b4&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump lerna from 8.2.1 to 8.2.2 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1719&quot;&gt;#1719&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/65547a4f4e7b79e33b2ee327ea13c7d48b4c8c2c&quot;&gt;&lt;code&gt;65547a4&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump &lt;code&gt;@​types/node&lt;/code&gt; from 22.14.0 to 22.14.1 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1720&quot;&gt;#1720&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/27d4a95ef9b68090763984a5374855a907693d5d&quot;&gt;&lt;code&gt;27d4a95&lt;/code&gt;&lt;/a&gt; Chore(deps): Bump vite from 6.2.5 to 6.2.6 in the npm_and_yarn group (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1717&quot;&gt;#1717&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/24857f7b9d1ad153762dc6cc5fab57665ba24f3a&quot;&gt;&lt;code&gt;24857f7&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump typescript from 5.8.2 to 5.8.3 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1716&quot;&gt;#1716&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/3ef8b436435c1f89e046b20bca34af4c0f80494c&quot;&gt;&lt;code&gt;3ef8b43&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump the linting group with 2 updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1715&quot;&gt;#1715&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/compare/inquirer@9.2.12...inquirer@12.6.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=inquirer&amp;package-manager=npm_and_yarn&amp;previous-version=9.2.12&amp;new-version=12.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/34

-- Commit Summary --

  * Bump inquirer from 9.2.12 to 12.6.0 in /cli

-- File Changes --

    M cli/package-lock.json (1415)
    M cli/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/34.patch
https://github.com/Skogix/agent-gpt2/pull/34.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/34
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/34@github.com&gt;
