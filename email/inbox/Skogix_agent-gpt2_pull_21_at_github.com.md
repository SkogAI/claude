MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 16 Feb 2025 21:16:15 -0800
Subject: [Skogix/agent-gpt2] Bump tiktoken from 0.5.1 to 0.9.0 in /platform (PR #21)
Message-ID: <Skogix/agent-gpt2/pull/21@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67b2c61f3bc29_11c3ad98395051"; charset="UTF-8"

Bumps [tiktoken](https://github.com/openai/tiktoken) from 0.5.1 to 0.9.0.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/openai/tiktoken/blob/main/CHANGELOG.md&quot;&gt;tiktoken&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[v0.9.0]&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Support for &lt;code&gt;o1&lt;/code&gt; and &lt;code&gt;o3&lt;/code&gt; models&lt;/li&gt;
&lt;li&gt;Better error messages when loading invalid vocabulary files&lt;/li&gt;
&lt;li&gt;Support for encoding to numpy arrays&lt;/li&gt;
&lt;li&gt;Delayed imports when not strictly necessary&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[v0.8.0]&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Support for &lt;code&gt;o1-&lt;/code&gt; and &lt;code&gt;chatgpt-4o-&lt;/code&gt; models&lt;/li&gt;
&lt;li&gt;Build wheels for Python 3.13&lt;/li&gt;
&lt;li&gt;Add possessive quantifiers to limit backtracking in regular expressions, thanks to &lt;a href=&quot;https://github.com/l0rinc&quot;&gt;&lt;code&gt;@​l0rinc&lt;/code&gt;&lt;/a&gt;!&lt;/li&gt;
&lt;li&gt;Provide a better error message and type for invalid token decode&lt;/li&gt;
&lt;li&gt;Permit tuples in type hints&lt;/li&gt;
&lt;li&gt;Better error message for passing invalid input to &lt;code&gt;get_encoding&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;Better error messages during plugin loading&lt;/li&gt;
&lt;li&gt;Add a &lt;code&gt;__version__&lt;/code&gt; attribute&lt;/li&gt;
&lt;li&gt;Update versions of &lt;code&gt;pyo3&lt;/code&gt;, &lt;code&gt;regex&lt;/code&gt;, &lt;code&gt;fancy-regex&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;Drop support for Python 3.8&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[v0.7.0]&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Support for &lt;code&gt;gpt-4o&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;Performance improvements&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[v0.6.0]&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Optimise regular expressions for a 20% performance improvement, thanks to &lt;a href=&quot;https://github.com/paplorinc&quot;&gt;&lt;code&gt;@​paplorinc&lt;/code&gt;&lt;/a&gt;!&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;text-embedding-3-*&lt;/code&gt; models to &lt;code&gt;encoding_for_model&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;Check content hash for downloaded files&lt;/li&gt;
&lt;li&gt;Allow pickling &lt;code&gt;Encoding&lt;/code&gt; objects. Registered &lt;code&gt;Encoding&lt;/code&gt; will be pickled by reference&lt;/li&gt;
&lt;li&gt;Workaround PyO3 bug for frozenset conversion&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Thank you to &lt;a href=&quot;https://github.com/paplorinc&quot;&gt;&lt;code&gt;@​paplorinc&lt;/code&gt;&lt;/a&gt;, &lt;a href=&quot;https://github.com/mdwelsh&quot;&gt;&lt;code&gt;@​mdwelsh&lt;/code&gt;&lt;/a&gt;, &lt;a href=&quot;https://github.com/Praneet460&quot;&gt;&lt;code&gt;@​Praneet460&lt;/code&gt;&lt;/a&gt;!&lt;/p&gt;
&lt;h2&gt;[v0.5.2]&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Build wheels for Python 3.12&lt;/li&gt;
&lt;li&gt;Update version of PyO3 to allow multiple imports&lt;/li&gt;
&lt;li&gt;Avoid permission errors when using default cache logic&lt;/li&gt;
&lt;/ul&gt;
&lt;/blockquote&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/e35ab0915e37b919946b70947f1d0854196cb72c&quot;&gt;&lt;code&gt;e35ab09&lt;/code&gt;&lt;/a&gt; Join artifacts&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/f15f7dfba5dce6ffcbc95e3a3810b7e140adcb17&quot;&gt;&lt;code&gt;f15f7df&lt;/code&gt;&lt;/a&gt; Partial sync of codebase&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/00813b3f987a083ee9f631620d0271b0169da58b&quot;&gt;&lt;code&gt;00813b3&lt;/code&gt;&lt;/a&gt; Partial sync of codebase (&lt;a href=&quot;https://redirect.github.com/openai/tiktoken/issues/381&quot;&gt;#381&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/bb5805d0a3eec476e2571bb40651790d83612983&quot;&gt;&lt;code&gt;bb5805d&lt;/code&gt;&lt;/a&gt; Add a link to PyPI in README (&lt;a href=&quot;https://redirect.github.com/openai/tiktoken/issues/318&quot;&gt;#318&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/853da97e9feacd209d4df33d49fb24e2005a9388&quot;&gt;&lt;code&gt;853da97&lt;/code&gt;&lt;/a&gt; Improve aarch64 and mac builds (&lt;a href=&quot;https://redirect.github.com/openai/tiktoken/issues/380&quot;&gt;#380&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/9fa2832547e68c59ee8d797c685bb4636cd078bc&quot;&gt;&lt;code&gt;9fa2832&lt;/code&gt;&lt;/a&gt; Partial sync of codebase (&lt;a href=&quot;https://redirect.github.com/openai/tiktoken/issues/379&quot;&gt;#379&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/63527649963def8c759b0f91f2eb69a40934e468&quot;&gt;&lt;code&gt;6352764&lt;/code&gt;&lt;/a&gt; Alas, emulation&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/ed27aa34fe943fc7cdda9d2c22e9f06df0de4360&quot;&gt;&lt;code&gt;ed27aa3&lt;/code&gt;&lt;/a&gt; Attempt to fix emulated builds&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/05e66e8db7ef220d3c0b1aafbee5af289345684b&quot;&gt;&lt;code&gt;05e66e8&lt;/code&gt;&lt;/a&gt; Partial sync of codebase&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/openai/tiktoken/commit/9f7f69d62d6052dcc2fd54357df6ae9ae2590518&quot;&gt;&lt;code&gt;9f7f69d&lt;/code&gt;&lt;/a&gt; Add possessive quantifiers to avoid catastrophic backtracking (&lt;a href=&quot;https://redirect.github.com/openai/tiktoken/issues/258&quot;&gt;#258&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/openai/tiktoken/compare/0.5.1...0.9.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tiktoken&amp;package-manager=pip&amp;previous-version=0.5.1&amp;new-version=0.9.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/21

-- Commit Summary --

  * Bump tiktoken from 0.5.1 to 0.9.0 in /platform

-- File Changes --

    M platform/poetry.lock (68)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/21.patch
https://github.com/Skogix/agent-gpt2/pull/21.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/21
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/21@github.com&gt;
