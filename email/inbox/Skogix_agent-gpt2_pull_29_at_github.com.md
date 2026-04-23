MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 06 Apr 2025 21:49:53 -0700
Subject: [Skogix/agent-gpt2] Bump inquirer from 9.2.12 to 12.5.2 in /cli (PR #29)
Message-ID: <Skogix/agent-gpt2/pull/29@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67f35971e204d_9a1030181567"; charset="UTF-8"

Bumps [inquirer](https://github.com/SBoudrias/Inquirer.js) from 9.2.12 to 12.5.2.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/releases&quot;&gt;inquirer&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
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
&lt;h2&gt;inquirer@10.2.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix the &lt;code&gt;filter&lt;/code&gt; option not working.&lt;/li&gt;
&lt;li&gt;The &lt;code&gt;signal: AbortSignal&lt;/code&gt; didn&#39;t work with class based prompts (OSS plugins.) Now it should work consistently with legacy style prompts.&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/b06133f3ff9cc782f8292fd0e474c72f39ff7537&quot;&gt;&lt;code&gt;b06133f&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/1c8a055f20b307e4bffa75c39e760da50168df6c&quot;&gt;&lt;code&gt;1c8a055&lt;/code&gt;&lt;/a&gt; Chore: Add graphite sponsor to inquirer README too&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/d367155a8d64d8b3e93f9c763adccf708aedc8a8&quot;&gt;&lt;code&gt;d367155&lt;/code&gt;&lt;/a&gt; Publish&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/4e2a6b54826618112282c774a8822a1b117b5fdf&quot;&gt;&lt;code&gt;4e2a6b5&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump the linting group with 2 updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1712&quot;&gt;#1712&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/cc5aa8c2af70c9b150fa2f104d2b73ed49da3e64&quot;&gt;&lt;code&gt;cc5aa8c&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump the testing group with 3 updates (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1708&quot;&gt;#1708&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/db2b7ea496d1eba0af6244dc55cb3b7614ed5810&quot;&gt;&lt;code&gt;db2b7ea&lt;/code&gt;&lt;/a&gt; Chore: Graphite started sponsoring Inquirer &amp;lt;3 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1710&quot;&gt;#1710&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/e7de65502cce07687df7411a569cb1096dd8cabb&quot;&gt;&lt;code&gt;e7de655&lt;/code&gt;&lt;/a&gt; Chore: Remove invalid auto-merge directives from dependabot.yml&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/a5bb33c300f8d2ca292b73607e900d7fe5d8ab37&quot;&gt;&lt;code&gt;a5bb33c&lt;/code&gt;&lt;/a&gt; Chore(deps): Bump vite from 6.2.3 to 6.2.4 in the npm_and_yarn group (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1707&quot;&gt;#1707&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/721553f6566a11ee59039dda094e9a87d0b718c4&quot;&gt;&lt;code&gt;721553f&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump eslint-plugin-unicorn from 57.0.0 to 58.0.0 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1705&quot;&gt;#1705&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/commit/a118b0d928b2c0d984eee5b2f810ecd7d56d3c93&quot;&gt;&lt;code&gt;a118b0d&lt;/code&gt;&lt;/a&gt; Chore(deps-dev): Bump eslint-plugin-prettier from 5.2.3 to 5.2.5 (&lt;a href=&quot;https://redirect.github.com/SBoudrias/Inquirer.js/issues/1701&quot;&gt;#1701&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/SBoudrias/Inquirer.js/compare/inquirer@9.2.12...inquirer@12.5.2&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=inquirer&amp;package-manager=npm_and_yarn&amp;previous-version=9.2.12&amp;new-version=12.5.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/29

-- Commit Summary --

  * Bump inquirer from 9.2.12 to 12.5.2 in /cli

-- File Changes --

    M cli/package-lock.json (1417)
    M cli/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/29.patch
https://github.com/Skogix/agent-gpt2/pull/29.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/29
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/29@github.com&gt;
