MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 02 Feb 2025 20:56:05 -0800
Subject: [Skogix/agent-gpt2] Bump inquirer from 9.2.12 to 12.4.1 in /cli (PR #16)
Message-ID: <Skogix/agent-gpt2/pull/16@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67a04c651cc1b_67d883440db"; charset="UTF-8"

Bumps [inquirer](https://github.com/SBoudrias/Inquirer.js) from 9.2.12 to 12.4.1.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/releases&quot;&gt;inquirer&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
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
&lt;ul&gt;
&lt;li&gt;Fix broken backward compatibility issues with v9. &lt;code&gt;Choice&lt;/code&gt; objects without &lt;code&gt;value&lt;/code&gt; should default to use &lt;code&gt;name&lt;/code&gt; as the value. Note: Please don&#39;t rely on this weird behaviour, but we fixed it since it was an unintended breaking change.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@10.1.0&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Adds the new &lt;code&gt;{ type: &#39;search&#39; }&lt;/code&gt; prompt.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;inquirer@10.0.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix: Re-added missing &lt;code&gt;short&lt;/code&gt; on select and checkbox prompt.&lt;/li&gt;
&lt;li&gt;Fix: Remove type requiring a &lt;code&gt;close&lt;/code&gt; method on prompt class instances (it wasn&#39;t required.)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/b2709b82d621cd553adb26dd1c371cc957ba412e&quot;&gt;&lt;code&gt;b2709b8&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/97c8f7de93719903ac7f023e4056c047cd4181c4&quot;&gt;&lt;code&gt;97c8f7d&lt;/code&gt;&lt;/a&gt; Chore: Set &lt;code&gt;@​types/node&lt;/code&gt; as an optional peer dependency. Fix &lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1657&quot;&gt;#1657&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/799fa145a818e1bba6b517830253b4bd37185f61&quot;&gt;&lt;code&gt;799fa14&lt;/code&gt;&lt;/a&gt; Chore: Bump dependencies &amp;amp; yarn dedupe repo cleanup&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/0beb389a33484a0e08b8c39333e1441b5a56d0a1&quot;&gt;&lt;code&gt;0beb389&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/504c230b337af3c4676fbc8d083eec0f58607d67&quot;&gt;&lt;code&gt;504c230&lt;/code&gt;&lt;/a&gt; Feat: support customize shortcuts for checkbox selection/deselection (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1663&quot;&gt;#1663&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/9f535bd8c2a4555646b2f91360eead0658b7dcd9&quot;&gt;&lt;code&gt;9f535bd&lt;/code&gt;&lt;/a&gt; Doc(&lt;code&gt;@​inquirer/editor&lt;/code&gt;): Document customizing the editor&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/a8768f9e974362aed97bc47f6c3466718e8edce9&quot;&gt;&lt;code&gt;a8768f9&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/5928cf7b186e8ec7f0d3a519ec7a01c8be9c6f80&quot;&gt;&lt;code&gt;5928cf7&lt;/code&gt;&lt;/a&gt; Chore: Readme Updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1658&quot;&gt;#1658&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/9ee4930f9a22f97d50df8ac742209a5c9bdae9e1&quot;&gt;&lt;code&gt;9ee4930&lt;/code&gt;&lt;/a&gt; Chore(*): Bump dev dependencies (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1655&quot;&gt;#1655&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/1be9de18b0852cb96952e59561c478958ed75448&quot;&gt;&lt;code&gt;1be9de1&lt;/code&gt;&lt;/a&gt; Chore(dev-deps): Vitest 3 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1654&quot;&gt;#1654&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/compare/inquirer@9.2.12...inquirer@12.4.1&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=inquirer&amp;package-manager=npm_and_yarn&amp;previous-version=9.2.12&amp;new-version=12.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/16

-- Commit Summary --

  * Bump inquirer from 9.2.12 to 12.4.1 in /cli

-- File Changes --

    M cli/package-lock.json (1389)
    M cli/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/16.patch
https://github.com/Skogix/agent-gpt2/pull/16.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/16
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/16@github.com&gt;
