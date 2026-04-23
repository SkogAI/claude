MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 24 Feb 2025 00:07:28 -0800
Subject: [Skogix/agent-gpt] Bump postcss from 8.4.31 to 8.5.3 in /next (PR #21)
Message-ID: <Skogix/agent-gpt/pull/21@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67bc28c03f047_1f73da853656f"; charset="UTF-8"

Bumps [postcss](https://github.com/postcss/postcss) from 8.4.31 to 8.5.3.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/postcss/postcss/releases&quot;&gt;postcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;8.5.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Added more details to &lt;code&gt;Unknown word&lt;/code&gt; error (by &lt;a href=&quot;https://github.com/hiepxanh&quot;&gt;&lt;code&gt;@​hiepxanh&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fixed types (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fixed docs (by &lt;a href=&quot;https://github.com/catnipan&quot;&gt;&lt;code&gt;@​catnipan&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed end position of rules with semicolon (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5.1&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed backwards compatibility for complex cases (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5 “Duke Alloces”&lt;/h2&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;p&gt;PostCSS 8.5 brought API to work better with non-CSS sources like HTML, Vue.js/Svelte sources or CSS-in-JS.&lt;/p&gt;
&lt;p&gt;&lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt; during &lt;a href=&quot;https://redirect.github.com/postcss/postcss/issues/1995&quot;&gt;his work&lt;/a&gt; on &lt;a href=&quot;https://stylelint.io&quot;&gt;Stylelint&lt;/a&gt; added &lt;code&gt;Input#document&lt;/code&gt; in additional to &lt;code&gt;Input#css&lt;/code&gt;.&lt;/p&gt;
&lt;pre lang=&quot;js&quot;&gt;&lt;code&gt;root.source.input.document //=&amp;gt; &amp;quot;&amp;lt;p&amp;gt;Hello&amp;lt;/p&amp;gt;
                           //    &amp;lt;style&amp;gt;
                           //    p {
                           //      color: green;
                           //    }
                           //    &amp;lt;/style&amp;gt;&amp;quot;
root.source.input.css      //=&amp;gt; &amp;quot;p {
                           //      color: green;
                           //    }&amp;quot;
&lt;p&gt;&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;h2&gt;Thanks to Sponsors&lt;/h2&gt;
&lt;p&gt;This release was possible thanks to our community.&lt;/p&gt;
&lt;p&gt;If your company wants to support the sustainability of front-end infrastructure or wants to give some love to PostCSS, you can join our supporters by:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://tidelift.com/&quot;&gt;&lt;strong&gt;Tidelift&lt;/strong&gt;&lt;/a&gt; with a Spotify-like subscription model supporting all projects from your lock file.&lt;/li&gt;
&lt;li&gt;Direct donations at &lt;a href=&quot;https://github.com/sponsors/ai&quot;&gt;&lt;strong&gt;GitHub Sponsors&lt;/strong&gt;&lt;/a&gt; or &lt;a href=&quot;https://opencollective.com/postcss#section-contributors&quot;&gt;&lt;strong&gt;Open Collective&lt;/strong&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.49&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed custom syntax without &lt;code&gt;source.offset&lt;/code&gt; (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.48&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed position calculation in error/warnings methods (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.47&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Removed debug code.&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/postcss/postcss/blob/main/CHANGELOG.md&quot;&gt;postcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;8.5.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Added more details to &lt;code&gt;Unknown word&lt;/code&gt; error (by &lt;a href=&quot;https://github.com/hiepxanh&quot;&gt;&lt;code&gt;@​hiepxanh&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fixed types (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fixed docs (by &lt;a href=&quot;https://github.com/catnipan&quot;&gt;&lt;code&gt;@​catnipan&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5.2&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed end position of rules with semicolon (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5.1&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed backwards compatibility for complex cases (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.5 “Duke Alloces”&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Added &lt;code&gt;Input#document&lt;/code&gt; for sources like CSS-in-JS or HTML (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.49&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed custom syntax without &lt;code&gt;source.offset&lt;/code&gt; (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.48&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed position calculation in error/warnings methods (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.47&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Removed debug code.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.46&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed &lt;code&gt;Cannot read properties of undefined (reading &#39;before&#39;)&lt;/code&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.45&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Removed unnecessary fix which could lead to infinite loop.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.44&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Another way to fix &lt;code&gt;markClean is not a function&lt;/code&gt; error.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.43&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed &lt;code&gt;markClean is not a function&lt;/code&gt; error.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.42&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed CSS syntax error on long minified files (by &lt;a href=&quot;https://github.com/varpstar&quot;&gt;&lt;code&gt;@​varpstar&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.41&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed types (by &lt;a href=&quot;https://github.com/nex3&quot;&gt;&lt;code&gt;@​nex3&lt;/code&gt;&lt;/a&gt; and &lt;a href=&quot;https://github.com/querkmachine&quot;&gt;&lt;code&gt;@​querkmachine&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Cleaned up RegExps (by &lt;a href=&quot;https://github.com/bluwy&quot;&gt;&lt;code&gt;@​bluwy&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.40&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Moved to getter/setter in nodes types to help Sass team (by &lt;a href=&quot;https://github.com/nex3&quot;&gt;&lt;code&gt;@​nex3&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.39&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed &lt;code&gt;CssSyntaxError&lt;/code&gt; types (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;8.4.38&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fixed &lt;code&gt;endIndex: 0&lt;/code&gt; in errors and warnings (by &lt;a href=&quot;https://github.com/romainmenke&quot;&gt;&lt;code&gt;@​romainmenke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/22c309d32924e1eeb33c80a6a50b7ba8a43a1832&quot;&gt;&lt;code&gt;22c309d&lt;/code&gt;&lt;/a&gt; Release 8.5.3 version&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/a2b594f7826fc8e0ce2d35adcd205fde04f1134f&quot;&gt;&lt;code&gt;a2b594f&lt;/code&gt;&lt;/a&gt; Update ESLint config&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/8232ba02575fca41b14c4e2b377adc68880846fa&quot;&gt;&lt;code&gt;8232ba0&lt;/code&gt;&lt;/a&gt; Fix tests&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/5082831b842eb40f8d298e5e0ab041755a04a58b&quot;&gt;&lt;code&gt;5082831&lt;/code&gt;&lt;/a&gt; Fix text&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/4fdb54b5ce67e038ed8d1aa79752d6f6072d0736&quot;&gt;&lt;code&gt;4fdb54b&lt;/code&gt;&lt;/a&gt; update: parser.js to clarify error message&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/06006ecb04cae0ddb62c6a85f15d1068c544d861&quot;&gt;&lt;code&gt;06006ec&lt;/code&gt;&lt;/a&gt; AtRule can be empty&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/755f08f8dbdbc001906b10db3b262948f8491d82&quot;&gt;&lt;code&gt;755f08f&lt;/code&gt;&lt;/a&gt; fix typo: them -&amp;gt; then (&lt;a href=&quot;https://redirect.github.com/postcss/postcss/issues/2016&quot;&gt;#2016&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/692fcde123dbf51c7b1a178370d3e8c6fe7feeee&quot;&gt;&lt;code&gt;692fcde&lt;/code&gt;&lt;/a&gt; Release 8.5.2 version&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/b70e98f624537063d3094644b04f41bd2863bb65&quot;&gt;&lt;code&gt;b70e98f&lt;/code&gt;&lt;/a&gt; Update dependencies&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/postcss/postcss/commit/ba587e32fd51004d334421013f311017f00e5420&quot;&gt;&lt;code&gt;ba587e3&lt;/code&gt;&lt;/a&gt; Fix end position of rules with &lt;code&gt;ownSemicon&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/postcss/postcss/issues/2012&quot;&gt;#2012&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/postcss/postcss/compare/8.4.31...8.5.3&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=postcss&amp;package-manager=npm_and_yarn&amp;previous-version=8.4.31&amp;new-version=8.5.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/21

-- Commit Summary --

  * Bump postcss from 8.4.31 to 8.5.3 in /next

-- File Changes --

    M next/package-lock.json (104)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/21.patch
https://github.com/Skogix/agent-gpt/pull/21.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/21
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/21@github.com&gt;
