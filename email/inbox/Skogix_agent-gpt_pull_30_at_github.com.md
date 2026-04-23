MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 31 Mar 2025 01:03:47 -0700
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.17 in /next (PR #30)
Message-ID: <Skogix/agent-gpt/pull/30@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67ea4c638eb6_bd10281691bf"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.17.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.17&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix an issue causing the CLI to hang when processing Ruby files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17383&quot;&gt;#17383&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.16&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add support for literal values in &lt;code&gt;--value(&#39;…&#39;)&lt;/code&gt; and &lt;code&gt;--modifier(&#39;…&#39;)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17304&quot;&gt;#17304&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix class extraction followed by &lt;code&gt;(&lt;/code&gt; in Pug (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17320&quot;&gt;#17320&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@keyframes&lt;/code&gt; for theme animations are emitted if they are referenced following a comma (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17352&quot;&gt;#17352&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure that updates to an imported CSS file are properly propagated after updating source files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17347&quot;&gt;#17347&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pre process &lt;code&gt;Slim&lt;/code&gt; templates embedded in Ruby files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17336&quot;&gt;#17336&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Error when input and output files resolve to the same file when using the CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17311&quot;&gt;#17311&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add missing suggestions when &lt;code&gt;--spacing(--value(integer, number))&lt;/code&gt; is used (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17308&quot;&gt;#17308&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;::-webkit-details-marker&lt;/code&gt; pseudo to &lt;code&gt;marker&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17362&quot;&gt;#17362&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.15&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect angle in &lt;code&gt;-bg-conic-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17174&quot;&gt;#17174&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;border-[12px_4px]&lt;/code&gt; being interpreted as a &lt;code&gt;border-color&lt;/code&gt; instead of a &lt;code&gt;border-width&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17248&quot;&gt;#17248&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Work around a crash in Safari 16.4 and 16.5 when using the default Preflight styles (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17306&quot;&gt;#17306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pre-process &lt;code&gt;\&amp;lt;template lang=&amp;quot;…&amp;quot;&amp;gt;&lt;/code&gt; in Vue files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17252&quot;&gt;#17252&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that all CSS variables used by Preflight are prefixed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17036&quot;&gt;#17036&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent segfault when loaded in a worker thread on Linux (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17276&quot;&gt;#17276&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure multiple &lt;code&gt;--value(…)&lt;/code&gt; or &lt;code&gt;--modifier(…)&lt;/code&gt; calls don&#39;t delete subsequent declarations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17273&quot;&gt;#17273&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix class extraction followed by &lt;code&gt;(&lt;/code&gt; in Slim (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17278&quot;&gt;#17278&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Export &lt;code&gt;PluginUtils&lt;/code&gt; from &lt;code&gt;tailwindcss/plugin&lt;/code&gt; for compatibility with v3 (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17299&quot;&gt;#17299&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Remove redundant &lt;code&gt;line-height: initial&lt;/code&gt; from Preflight (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15212&quot;&gt;#15212&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Increase Standalone hardware compatibility on macOS x64 builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17267&quot;&gt;#17267&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that the CSS file rebuilds if a new CSS variable is used from templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17301&quot;&gt;#17301&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;The &lt;code&gt;--theme(…)&lt;/code&gt; function now returns CSS variables from your theme variables unless used inside positions where CSS variables are invalid (e.g. inside &lt;code&gt;@media&lt;/code&gt; queries) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17036&quot;&gt;#17036&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.14&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Do not extract candidates with JS string interpolation &lt;code&gt;${&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17142&quot;&gt;#17142&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix extraction of variants containing &lt;code&gt;.&lt;/code&gt; character (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17153&quot;&gt;#17153&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix extracting candidates in Clojure/ClojureScript (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17087&quot;&gt;#17087&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.13&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.17] - 2025-03-26&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix an issue causing the CLI to hang when processing Ruby files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17383&quot;&gt;#17383&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.16] - 2025-03-25&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add support for literal values in &lt;code&gt;--value(&#39;…&#39;)&lt;/code&gt; and &lt;code&gt;--modifier(&#39;…&#39;)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17304&quot;&gt;#17304&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix class extraction followed by &lt;code&gt;(&lt;/code&gt; in Pug (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17320&quot;&gt;#17320&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@keyframes&lt;/code&gt; for theme animations are emitted if they are referenced following a comma (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17352&quot;&gt;#17352&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure that updates to an imported CSS file are properly propagated after updating source files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17347&quot;&gt;#17347&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pre process &lt;code&gt;Slim&lt;/code&gt; templates embedded in Ruby files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17336&quot;&gt;#17336&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Error when input and output files resolve to the same file when using the CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17311&quot;&gt;#17311&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add missing suggestions when &lt;code&gt;--spacing(--value(integer, number))&lt;/code&gt; is used (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17308&quot;&gt;#17308&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;::-webkit-details-marker&lt;/code&gt; pseudo to &lt;code&gt;marker&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17362&quot;&gt;#17362&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.15] - 2025-03-20&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect angle in &lt;code&gt;-bg-conic-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17174&quot;&gt;#17174&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;border-[12px_4px]&lt;/code&gt; being interpreted as a &lt;code&gt;border-color&lt;/code&gt; instead of a &lt;code&gt;border-width&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17248&quot;&gt;#17248&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Work around a crash in Safari 16.4 and 16.5 when using the default Preflight styles (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17306&quot;&gt;#17306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pre-process &lt;code&gt;\&amp;lt;template lang=&amp;quot;…&amp;quot;&amp;gt;&lt;/code&gt; in Vue files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17252&quot;&gt;#17252&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that all CSS variables used by Preflight are prefixed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17036&quot;&gt;#17036&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent segfault when loaded in a worker thread on Linux (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17276&quot;&gt;#17276&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure multiple &lt;code&gt;--value(…)&lt;/code&gt; or &lt;code&gt;--modifier(…)&lt;/code&gt; calls don&#39;t delete subsequent declarations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17273&quot;&gt;#17273&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix class extraction followed by &lt;code&gt;(&lt;/code&gt; in Slim (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17278&quot;&gt;#17278&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Export &lt;code&gt;PluginUtils&lt;/code&gt; from &lt;code&gt;tailwindcss/plugin&lt;/code&gt; for compatibility with v3 (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17299&quot;&gt;#17299&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Remove redundant &lt;code&gt;line-height: initial&lt;/code&gt; from Preflight (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15212&quot;&gt;#15212&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Increase Standalone hardware compatibility on macOS x64 builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17267&quot;&gt;#17267&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that the CSS file rebuilds if a new CSS variable is used from templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17301&quot;&gt;#17301&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;The &lt;code&gt;--theme(…)&lt;/code&gt; function now returns CSS variables from your theme variables unless used inside positions where CSS variables are invalid (e.g. inside &lt;code&gt;@media&lt;/code&gt; queries) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17036&quot;&gt;#17036&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.14] - 2025-03-13&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Do not extract candidates with JS string interpolation &lt;code&gt;${&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17142&quot;&gt;#17142&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix extraction of variants containing &lt;code&gt;.&lt;/code&gt; character (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17153&quot;&gt;#17153&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix extracting candidates in Clojure/ClojureScript (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17087&quot;&gt;#17087&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/6b1c6504109010d13727ad29a7f9f73f192355e2&quot;&gt;&lt;code&gt;6b1c650&lt;/code&gt;&lt;/a&gt; Prepare v4.0.17 release&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/1c50b5c16c422160381b5df83dcf2534944a9094&quot;&gt;&lt;code&gt;1c50b5c&lt;/code&gt;&lt;/a&gt; Prepare v4.0.16 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17372&quot;&gt;#17372&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/bd501e8511c3ac0a982b0505143276492029bbc3&quot;&gt;&lt;code&gt;bd501e8&lt;/code&gt;&lt;/a&gt; Add &lt;code&gt;::-webkit-details-marker&lt;/code&gt; pseudo to &lt;code&gt;marker&lt;/code&gt; variant (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17362&quot;&gt;#17362&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/e8715d081eac683d002892b8b3e13550f0276b45&quot;&gt;&lt;code&gt;e8715d0&lt;/code&gt;&lt;/a&gt; Extract keyframe name when followed by comma (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17352&quot;&gt;#17352&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/91c0d56d0f6d5df29dda001deac655d428d40340&quot;&gt;&lt;code&gt;91c0d56&lt;/code&gt;&lt;/a&gt; Revert &amp;quot;Temporarily revert changes to `@utility&amp;quot;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/1aab04cebff39a5a1b89ff22c6655cf1f549b7a1&quot;&gt;&lt;code&gt;1aab04c&lt;/code&gt;&lt;/a&gt; Temporarily revert changes to `@utility&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/250c8433413873d102d8c79711b61d8c70559fd3&quot;&gt;&lt;code&gt;250c843&lt;/code&gt;&lt;/a&gt; Add suggestions when &lt;code&gt;--spacing(--value(integer, number))&lt;/code&gt; is used (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17308&quot;&gt;#17308&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/a3316f2ef4098013bf5779fd512fb697a5f2f343&quot;&gt;&lt;code&gt;a3316f2&lt;/code&gt;&lt;/a&gt; Add support for literal values in &lt;code&gt;--value(&#39;…&#39;)&lt;/code&gt; and &lt;code&gt;--modifier(&#39;…&#39;)&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17304&quot;&gt;#17304&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4c57d9f734bec2521124be75d76d938fd0da8caa&quot;&gt;&lt;code&gt;4c57d9f&lt;/code&gt;&lt;/a&gt; Prepare v4.0.15 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17302&quot;&gt;#17302&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/40a76e3380c57b19c9bc30be6342280c217d0cf2&quot;&gt;&lt;code&gt;40a76e3&lt;/code&gt;&lt;/a&gt; Revert &amp;quot;Don&#39;t use &lt;code&gt;color-mix(…)&lt;/code&gt; on &lt;code&gt;currentColor&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17247&quot;&gt;#17247&lt;/a&gt;)&amp;quot; and work around ...&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.17/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.17)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/30

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.17 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/30.patch
https://github.com/Skogix/agent-gpt/pull/30.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/30
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/30@github.com&gt;
