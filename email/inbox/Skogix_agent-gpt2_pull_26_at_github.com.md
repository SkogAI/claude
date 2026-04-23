MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 09 Mar 2025 21:17:10 -0700
Subject: [Skogix/agent-gpt2] Bump inquirer from 9.2.12 to 12.4.3 in /cli (PR #26)
Message-ID: <Skogix/agent-gpt2/pull/26@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67ce67c681cea_9ade0117233"; charset="UTF-8"

Bumps [inquirer](https://github.com/SBoudrias/Inquirer.js) from 9.2.12 to 12.4.3.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/releases&quot;&gt;inquirer&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
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
&lt;h2&gt;inquirer@10.2.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix the &lt;code&gt;filter&lt;/code&gt; option not working.&lt;/li&gt;
&lt;li&gt;The &lt;code&gt;signal: AbortSignal&lt;/code&gt; didn&#39;t work with class based prompts (OSS plugins.) Now it should work consistently with legacy style prompts.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@10.2.1&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix &lt;code&gt;expand&lt;/code&gt; prompt being broken if a Separator was in the &lt;code&gt;choices&lt;/code&gt; array.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@10.2.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Includes various fixes &amp;amp; new features to the different built-in prompts&lt;/li&gt;
&lt;li&gt;Fix: Major rework of the Typescript types. Hoping to reduce the amount of finicky type errors (or wrong types) you might&#39;ve ran into.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@10.1.2&lt;/h2&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/79a0b3e7446b4a3de09445bf2f4031e4190b6382&quot;&gt;&lt;code&gt;79a0b3e&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/f64af8c84e7afb4ca45c347b8db75489a74be081&quot;&gt;&lt;code&gt;f64af8c&lt;/code&gt;&lt;/a&gt; Chore(deps): Bump axios from 1.7.7 to 1.8.2 in the npm_and_yarn group (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1684&quot;&gt;#1684&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/6e5d4339190119b58a2c0432b6b08e55e7060fd2&quot;&gt;&lt;code&gt;6e5d433&lt;/code&gt;&lt;/a&gt; Chore: Bump dependencies&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/dc3da8951d39ab76f7a7f9e4ec67f0157049beca&quot;&gt;&lt;code&gt;dc3da89&lt;/code&gt;&lt;/a&gt; Support Node&#39;s --frozen-intrinsics flag (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1683&quot;&gt;#1683&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/3e04fe198ada5a381f87e56e67ccc1923f4619a8&quot;&gt;&lt;code&gt;3e04fe1&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump eslint-plugin-n from 17.15.1 to 17.16.1 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1681&quot;&gt;#1681&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/834715aeadde9839617a18a0002849b03bb78afd&quot;&gt;&lt;code&gt;834715a&lt;/code&gt;&lt;/a&gt; Chore: Bump dependencies&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/b1241f4979881f06766f5767fefde3dac5e93c24&quot;&gt;&lt;code&gt;b1241f4&lt;/code&gt;&lt;/a&gt; Chore: Bump to Typescript 5.8 and set erasableSyntaxOnly&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/83ec6ab9dc3fd3a837c52ab099c59f8f4740b49b&quot;&gt;&lt;code&gt;83ec6ab&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump eslint from 9.20.1 to 9.21.0 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1679&quot;&gt;#1679&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/7555fc14901ecfc283c9d6a15d91d1f2bb2ec953&quot;&gt;&lt;code&gt;7555fc1&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump &lt;code&gt;@​types/node&lt;/code&gt; from 22.13.4 to 22.13.5 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1676&quot;&gt;#1676&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/2bc68c0d02b9bd177875bd8e1c4f0a96e5f808aa&quot;&gt;&lt;code&gt;2bc68c0&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump &lt;code&gt;@​eslint/js&lt;/code&gt; from 9.20.0 to 9.21.0 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1677&quot;&gt;#1677&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/compare/inquirer@9.2.12...inquirer@12.4.3&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=inquirer&amp;package-manager=npm_and_yarn&amp;previous-version=9.2.12&amp;new-version=12.4.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/26

-- Commit Summary --

  * Bump inquirer from 9.2.12 to 12.4.3 in /cli

-- File Changes --

    M cli/package-lock.json (1409)
    M cli/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/26.patch
https://github.com/Skogix/agent-gpt2/pull/26.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/26
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/26@github.com&gt;
