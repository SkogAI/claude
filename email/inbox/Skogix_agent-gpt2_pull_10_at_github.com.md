MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Wed, 29 Jan 2025 04:04:19 -0800
Subject: [Skogix/agent-gpt2] Bump loguru from 0.7.2 to 0.7.3 in /platform (PR #10)
Message-ID: <Skogix/agent-gpt2/pull/10@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_679a1943a6662_73d88315298"; charset="UTF-8"

Bumps [loguru](https://github.com/Delgan/loguru) from 0.7.2 to 0.7.3.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/Delgan/loguru/releases&quot;&gt;loguru&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;0.7.3&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Fix Cython incompatibility caused by the absence of underlying stack frames, which resulted in a &lt;code&gt;ValueError&lt;/code&gt; during logging (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/88&quot;&gt;#88&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fix possible &lt;code&gt;RuntimeError&lt;/code&gt; when removing all handlers with &lt;code&gt;logger.remove()&lt;/code&gt; due to thread-safety issue (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1183&quot;&gt;#1183&lt;/a&gt;, thanks &lt;a href=&quot;https://github.com/jeremyk&quot;&gt;&lt;code&gt;@​jeremyk&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;diagnose=True&lt;/code&gt; option of exception formatting not working as expected with Python 3.13 (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1235&quot;&gt;#1235&lt;/a&gt;, thanks &lt;a href=&quot;https://github.com/etianen&quot;&gt;&lt;code&gt;@​etianen&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fix non-standard level names not fully compatible with &lt;code&gt;logging.Formatter()&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1231&quot;&gt;#1231&lt;/a&gt;, thanks &lt;a href=&quot;https://github.com/yechielb2000&quot;&gt;&lt;code&gt;@​yechielb2000&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fix inability to display a literal &lt;code&gt;&amp;quot;\&amp;quot;&lt;/code&gt; immediately before color markups (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/988&quot;&gt;#988&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Fix possible infinite recursion when an exception is raised from a &lt;code&gt;__repr__&lt;/code&gt;  method decorated with &lt;code&gt;logger.catch()&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1044&quot;&gt;#1044&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Improve performance of &lt;code&gt;datetime&lt;/code&gt; formatting while logging messages (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1201&quot;&gt;#1201&lt;/a&gt;, thanks &lt;a href=&quot;https://github.com/trim21&quot;&gt;&lt;code&gt;@​trim21&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;li&gt;Reduce startup time in the presence of installed but unused &lt;code&gt;IPython&lt;/code&gt; third-party library (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1001&quot;&gt;#1001&lt;/a&gt;, thanks &lt;a href=&quot;https://github.com/zakstucke&quot;&gt;&lt;code&gt;@​zakstucke&lt;/code&gt;&lt;/a&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;/blockquote&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/Delgan/loguru/blob/master/CHANGELOG.rst&quot;&gt;loguru&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h1&gt;&lt;code&gt;0.7.3&lt;/code&gt;_ (2024-12-06)&lt;/h1&gt;
&lt;ul&gt;
&lt;li&gt;Fix Cython incompatibility caused by the absence of underlying stack frames, which resulted in a &lt;code&gt;ValueError&lt;/code&gt; during logging (&lt;code&gt;[#88](https://github.com/Delgan/loguru/issues/88) &amp;lt;https://github.com/Delgan/loguru/issues/88&amp;gt;&lt;/code&gt;_).&lt;/li&gt;
&lt;li&gt;Fix possible &lt;code&gt;RuntimeError&lt;/code&gt; when removing all handlers with &lt;code&gt;logger.remove()&lt;/code&gt; due to thread-safety issue (&lt;code&gt;[#1183](https://github.com/Delgan/loguru/issues/1183) &amp;lt;https://github.com/Delgan/loguru/issues/1183&amp;gt;&lt;/code&gt;&lt;em&gt;, thanks &lt;code&gt;@jeremyk &amp;lt;https://github.com/jeremyk&amp;gt;&lt;/code&gt;&lt;/em&gt;).&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;diagnose=True&lt;/code&gt; option of exception formatting not working as expected with Python 3.13 (&lt;code&gt;[#1235](https://github.com/Delgan/loguru/issues/1235) &amp;lt;https://github.com/Delgan/loguru/issues/1235&amp;gt;&lt;/code&gt;&lt;em&gt;, thanks &lt;code&gt;@etianen &amp;lt;https://github.com/etianen&amp;gt;&lt;/code&gt;&lt;/em&gt;).&lt;/li&gt;
&lt;li&gt;Fix non-standard level names not fully compatible with &lt;code&gt;logging.Formatter()&lt;/code&gt; (&lt;code&gt;[#1231](https://github.com/Delgan/loguru/issues/1231) &amp;lt;https://github.com/Delgan/loguru/issues/1231&amp;gt;&lt;/code&gt;&lt;em&gt;, thanks &lt;code&gt;@yechielb2000 &amp;lt;https://github.com/yechielb2000&amp;gt;&lt;/code&gt;&lt;/em&gt;).&lt;/li&gt;
&lt;li&gt;Fix inability to display a literal &lt;code&gt;&amp;quot;\&amp;quot;&lt;/code&gt; immediately before color markups (&lt;code&gt;[#988](https://github.com/Delgan/loguru/issues/988) &amp;lt;https://github.com/Delgan/loguru/issues/988&amp;gt;&lt;/code&gt;_).&lt;/li&gt;
&lt;li&gt;Fix possible infinite recursion when an exception is raised from a &lt;code&gt;__repr__&lt;/code&gt;  method decorated with &lt;code&gt;logger.catch()&lt;/code&gt; (&lt;code&gt;[#1044](https://github.com/Delgan/loguru/issues/1044) &amp;lt;https://github.com/Delgan/loguru/issues/1044&amp;gt;&lt;/code&gt;_).&lt;/li&gt;
&lt;li&gt;Improve performance of &lt;code&gt;datetime&lt;/code&gt; formatting while logging messages (&lt;code&gt;[#1201](https://github.com/Delgan/loguru/issues/1201) &amp;lt;https://github.com/Delgan/loguru/issues/1201&amp;gt;&lt;/code&gt;&lt;em&gt;, thanks &lt;code&gt;@trim21 &amp;lt;https://github.com/trim21&amp;gt;&lt;/code&gt;&lt;/em&gt;).&lt;/li&gt;
&lt;li&gt;Reduce startup time in the presence of installed but unused &lt;code&gt;IPython&lt;/code&gt; third-party library (&lt;code&gt;[#1001](https://github.com/Delgan/loguru/issues/1001) &amp;lt;https://github.com/Delgan/loguru/issues/1001&amp;gt;&lt;/code&gt;&lt;em&gt;, thanks &lt;code&gt;@zakstucke &amp;lt;https://github.com/zakstucke&amp;gt;&lt;/code&gt;&lt;/em&gt;).&lt;/li&gt;
&lt;/ul&gt;
&lt;/blockquote&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/ae3bfd1b85b6b4a3db535f69b975687c79498be4&quot;&gt;&lt;code&gt;ae3bfd1&lt;/code&gt;&lt;/a&gt; Bump version to 0.7.3&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/ccca3566cc00c22eed8659705e45386fa2101b5d&quot;&gt;&lt;code&gt;ccca356&lt;/code&gt;&lt;/a&gt; Replace &amp;quot;notifiers&amp;quot; (seems unmaintained) with &amp;quot;apprise&amp;quot; in docs (&lt;a href=&quot;https://redirect.github.com/Delgan/loguru/issues/1251&quot;&gt;#1251&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/a372814bf79d47628e66ca9a91072f53fba032f8&quot;&gt;&lt;code&gt;a372814&lt;/code&gt;&lt;/a&gt; Configure &amp;quot;trusted publishing&amp;quot; in Github workflow&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/633016db07e5dff63bc05dd3c4d5aa81b6190700&quot;&gt;&lt;code&gt;633016d&lt;/code&gt;&lt;/a&gt; Use tox to define the &amp;quot;release&amp;quot; command&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/ef12cbbaf54fb2e64ca66b0a90675cdf9e8a522f&quot;&gt;&lt;code&gt;ef12cbb&lt;/code&gt;&lt;/a&gt; Convert README from RST to MD (fix PyPI packaging)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/cb3314a5af107ad175a9bafa11b1b79670e3067a&quot;&gt;&lt;code&gt;cb3314a&lt;/code&gt;&lt;/a&gt; Add Github action to verify packaging&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/6161a13b79e1a3a29e922926b44f26edbcc3c06a&quot;&gt;&lt;code&gt;6161a13&lt;/code&gt;&lt;/a&gt; Complete the &amp;quot;Troubleshooting&amp;quot; docs with more examples&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/7f5001fe46393627ced287bba2c4064442c3fd25&quot;&gt;&lt;code&gt;7f5001f&lt;/code&gt;&lt;/a&gt; Simplify the example of dynamic handler level&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/2e0cd7bb5105461057c56aefb225da569882ad29&quot;&gt;&lt;code&gt;2e0cd7b&lt;/code&gt;&lt;/a&gt; Move &amp;quot;Introduction to logging&amp;quot; docs to a new section&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/Delgan/loguru/commit/72b93d1a24d1491ce7ba752fe36c14f9570a5d63&quot;&gt;&lt;code&gt;72b93d1&lt;/code&gt;&lt;/a&gt; Correct outdated instructions for reporting a vulnerability&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/Delgan/loguru/compare/0.7.2...0.7.3&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=loguru&amp;package-manager=pip&amp;previous-version=0.7.2&amp;new-version=0.7.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/10

-- Commit Summary --

  * Bump loguru from 0.7.2 to 0.7.3 in /platform

-- File Changes --

    M platform/poetry.lock (14)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/10.patch
https://github.com/Skogix/agent-gpt2/pull/10.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/10
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/10@github.com&gt;
