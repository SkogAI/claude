MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 24 Mar 2025 01:00:28 -0700
Subject: [Skogix/agent-gpt] Bump pre-commit from 3.5.0 to 4.2.0 in /platform (PR #28)
Message-ID: <Skogix/agent-gpt/pull/28@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67e1111c3b1b2_6e10287943e2"; charset="UTF-8"

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 3.5.0 to 4.2.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pre-commit/pre-commit/releases&quot;&gt;pre-commit&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;pre-commit v4.2.0&lt;/h2&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;For &lt;code&gt;language: python&lt;/code&gt; first attempt a versioned python executable for the default language version before consulting a potentially unversioned &lt;code&gt;sys.executable&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3430&quot;&gt;#3430&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Handle error during conflict detection when a file is named &amp;quot;HEAD&amp;quot;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3425&quot;&gt;#3425&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/tusharsadhwani&quot;&gt;&lt;code&gt;@​tusharsadhwani&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;pre-commit v4.1.0&lt;/h2&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;language: julia&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3348&quot;&gt;#3348&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/fredrikekre&quot;&gt;&lt;code&gt;@​fredrikekre&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/2689&quot;&gt;#2689&lt;/a&gt; issue &lt;a href=&quot;https://github.com/jmuchovej&quot;&gt;&lt;code&gt;@​jmuchovej&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Disable automatic toolchain switching for &lt;code&gt;language: golang&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3304&quot;&gt;#3304&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/AleksaC&quot;&gt;&lt;code&gt;@​AleksaC&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3300&quot;&gt;#3300&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/AleksaC&quot;&gt;&lt;code&gt;@​AleksaC&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3149&quot;&gt;#3149&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/nijel&quot;&gt;&lt;code&gt;@​nijel&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;language: r&lt;/code&gt; installation when initiated by RStudio.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3389&quot;&gt;#3389&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3385&quot;&gt;#3385&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;pre-commit v4.0.1&lt;/h2&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix &lt;code&gt;pre-commit migrate-config&lt;/code&gt; for unquoted deprecated stages names with
purelib &lt;code&gt;pyyaml&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3324&quot;&gt;#3324&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit-ci/issues/issues/234&quot;&gt;pre-commit-ci/issues#234&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;pre-commit v4.0.0&lt;/h2&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Improve &lt;code&gt;pre-commit migrate-config&lt;/code&gt; to handle more yaml formats.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3301&quot;&gt;#3301&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Handle &lt;code&gt;stages&lt;/code&gt; deprecation in &lt;code&gt;pre-commit migrate-config&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3302&quot;&gt;#3302&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/2732&quot;&gt;#2732&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Upgrade &lt;code&gt;ruby-build&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3199&quot;&gt;#3199&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/ThisGuyCodes&quot;&gt;&lt;code&gt;@​ThisGuyCodes&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Add &amp;quot;sensible regex&amp;quot; warnings to &lt;code&gt;repo: meta&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3311&quot;&gt;#3311&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Add warnings for deprecated &lt;code&gt;stages&lt;/code&gt; (&lt;code&gt;commit&lt;/code&gt; -&amp;gt; &lt;code&gt;pre-commit&lt;/code&gt;, &lt;code&gt;push&lt;/code&gt; -&amp;gt;
&lt;code&gt;pre-push&lt;/code&gt;, &lt;code&gt;merge-commit&lt;/code&gt; -&amp;gt; &lt;code&gt;pre-merge-commit&lt;/code&gt;).
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3312&quot;&gt;#3312&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3313&quot;&gt;#3313&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3315&quot;&gt;#3315&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/2732&quot;&gt;#2732&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Migrating&lt;/h3&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md&quot;&gt;pre-commit&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h1&gt;4.2.0 - 2025-03-18&lt;/h1&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;For &lt;code&gt;language: python&lt;/code&gt; first attempt a versioned python executable for
the default language version before consulting a potentially unversioned
&lt;code&gt;sys.executable&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3430&quot;&gt;#3430&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Handle error during conflict detection when a file is named &amp;quot;HEAD&amp;quot;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3425&quot;&gt;#3425&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/tusharsadhwani&quot;&gt;&lt;code&gt;@​tusharsadhwani&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h1&gt;4.1.0 - 2025-01-20&lt;/h1&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;language: julia&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3348&quot;&gt;#3348&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/fredrikekre&quot;&gt;&lt;code&gt;@​fredrikekre&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/2689&quot;&gt;#2689&lt;/a&gt; issue &lt;a href=&quot;https://github.com/jmuchovej&quot;&gt;&lt;code&gt;@​jmuchovej&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Disable automatic toolchain switching for &lt;code&gt;language: golang&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3304&quot;&gt;#3304&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/AleksaC&quot;&gt;&lt;code&gt;@​AleksaC&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3300&quot;&gt;#3300&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/AleksaC&quot;&gt;&lt;code&gt;@​AleksaC&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3149&quot;&gt;#3149&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/nijel&quot;&gt;&lt;code&gt;@​nijel&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;language: r&lt;/code&gt; installation when initiated by RStudio.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3389&quot;&gt;#3389&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3385&quot;&gt;#3385&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h1&gt;4.0.1 - 2024-10-08&lt;/h1&gt;
&lt;h3&gt;Fixes&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix &lt;code&gt;pre-commit migrate-config&lt;/code&gt; for unquoted deprecated stages names with
purelib &lt;code&gt;pyyaml&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3324&quot;&gt;#3324&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit-ci/issues/issues/234&quot;&gt;pre-commit-ci/issues#234&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/lorenzwalthert&quot;&gt;&lt;code&gt;@​lorenzwalthert&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h1&gt;4.0.0 - 2024-10-05&lt;/h1&gt;
&lt;h3&gt;Features&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Improve &lt;code&gt;pre-commit migrate-config&lt;/code&gt; to handle more yaml formats.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3301&quot;&gt;#3301&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Handle &lt;code&gt;stages&lt;/code&gt; deprecation in &lt;code&gt;pre-commit migrate-config&lt;/code&gt;.
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3302&quot;&gt;#3302&lt;/a&gt; PR by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/2732&quot;&gt;#2732&lt;/a&gt; issue by &lt;a href=&quot;https://github.com/asottile&quot;&gt;&lt;code&gt;@​asottile&lt;/code&gt;&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;li&gt;Upgrade &lt;code&gt;ruby-build&lt;/code&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/aa48766b888990e7b118d12cf757109d96e65a7e&quot;&gt;&lt;code&gt;aa48766&lt;/code&gt;&lt;/a&gt; v4.2.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/bf6f11dc6ce59f2f12e5d02a6449ea2449aa64c4&quot;&gt;&lt;code&gt;bf6f11d&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3430&quot;&gt;#3430&lt;/a&gt; from pre-commit/preferential-sys-impl&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/3e8d0f5e1c449381272b80241140e985631f9912&quot;&gt;&lt;code&gt;3e8d0f5&lt;/code&gt;&lt;/a&gt; adjust python default_language_version to prefer versioned exe&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/ff7256cedf8c78b326f4503373d142a5a9827e90&quot;&gt;&lt;code&gt;ff7256c&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3425&quot;&gt;#3425&lt;/a&gt; from tusharsadhwani/ambiguous-ref&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/b7eb412c798424a94ca83c72eed6f97271545dc4&quot;&gt;&lt;code&gt;b7eb412&lt;/code&gt;&lt;/a&gt; fix: crash on ambiguous ref &#39;HEAD&#39;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/7b88c63ae691cb243c3137bce8fb870523e0a884&quot;&gt;&lt;code&gt;7b88c63&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3404&quot;&gt;#3404&lt;/a&gt; from pre-commit/pre-commit-ci-update-config&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/94b97e28f7cc7d9bcb536d7a3cf7ef6311e076fd&quot;&gt;&lt;code&gt;94b97e2&lt;/code&gt;&lt;/a&gt; [pre-commit.ci] pre-commit autoupdate&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/2f93b804849e9237561417fbca29cb8d8ea4c905&quot;&gt;&lt;code&gt;2f93b80&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3401&quot;&gt;#3401&lt;/a&gt; from pre-commit/pre-commit-ci-update-config&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/4f90a1e88a80dd460f36e21d774d06bf0e73921b&quot;&gt;&lt;code&gt;4f90a1e&lt;/code&gt;&lt;/a&gt; [pre-commit.ci] pre-commit autoupdate&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pre-commit/pre-commit/commit/aba1ce04e70162ca48b12f809ceffb253b788fe6&quot;&gt;&lt;code&gt;aba1ce0&lt;/code&gt;&lt;/a&gt; Merge pull request &lt;a href=&quot;https://redirect.github.com/pre-commit/pre-commit/issues/3396&quot;&gt;#3396&lt;/a&gt; from pre-commit/all-repos_autofix_all-repos-sed&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/pre-commit/pre-commit/compare/v3.5.0...v4.2.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&amp;package-manager=pip&amp;previous-version=3.5.0&amp;new-version=4.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/28

-- Commit Summary --

  * Bump pre-commit from 3.5.0 to 4.2.0 in /platform

-- File Changes --

    M platform/poetry.lock (203)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/28.patch
https://github.com/Skogix/agent-gpt/pull/28.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/28
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/28@github.com&gt;
