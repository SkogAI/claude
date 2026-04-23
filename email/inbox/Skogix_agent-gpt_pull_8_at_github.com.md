MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Wed, 29 Jan 2025 00:46:00 -0800
Subject: [Skogix/agent-gpt] Bump black from 23.10.1 to 25.1.0 in /platform (PR #8)
Message-ID: <Skogix/agent-gpt/pull/8@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6799eac8be4de_acd883120b6"; charset="UTF-8"

Bumps [black](https://github.com/psf/black) from 23.10.1 to 25.1.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/psf/black/releases&quot;&gt;black&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;25.1.0&lt;/h2&gt;
&lt;h3&gt;Highlights&lt;/h3&gt;
&lt;p&gt;This release introduces the new 2025 stable style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4558&quot;&gt;#4558&lt;/a&gt;), stabilizing
the following changes:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Normalize casing of Unicode escape characters in strings to lowercase (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/2916&quot;&gt;#2916&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix inconsistencies in whether certain strings are detected as docstrings (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4095&quot;&gt;#4095&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Consistently add trailing commas to typed function parameters (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4164&quot;&gt;#4164&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Remove redundant parentheses in if guards for case blocks (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4214&quot;&gt;#4214&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add parentheses to if clauses in case blocks when the line is too long (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4269&quot;&gt;#4269&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Whitespace before &lt;code&gt;# fmt: skip&lt;/code&gt; comments is no longer normalized (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4146&quot;&gt;#4146&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix line length computation for certain expressions that involve the power operator (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4154&quot;&gt;#4154&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Check if there is a newline before the terminating quotes of a docstring (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4185&quot;&gt;#4185&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix type annotation spacing between &lt;code&gt;*&lt;/code&gt; and more complex type variable tuple (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4440&quot;&gt;#4440&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;The following changes were not in any previous release:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Remove parentheses around sole list items (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4312&quot;&gt;#4312&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Generic function definitions are now formatted more elegantly: parameters are
split over multiple lines first instead of type parameter definitions (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4553&quot;&gt;#4553&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Stable style&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix formatting cells in IPython notebooks with magic methods and starting or trailing
empty lines (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4484&quot;&gt;#4484&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix crash when formatting &lt;code&gt;with&lt;/code&gt; statements containing tuple generators/unpacking
(&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4538&quot;&gt;#4538&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Preview style&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix/remove string merging changing f-string quotes on f-strings with internal quotes
(&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4498&quot;&gt;#4498&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Collapse multiple empty lines after an import into one (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4489&quot;&gt;#4489&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent &lt;code&gt;string_processing&lt;/code&gt; and &lt;code&gt;wrap_long_dict_values_in_parens&lt;/code&gt; from removing
parentheses around long dictionary values (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4377&quot;&gt;#4377&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Move &lt;code&gt;wrap_long_dict_values_in_parens&lt;/code&gt; from the unstable to preview style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4561&quot;&gt;#4561&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Packaging&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Store license identifier inside the &lt;code&gt;License-Expression&lt;/code&gt; metadata field, see
&lt;a href=&quot;https://peps.python.org/pep-0639/&quot;&gt;PEP 639&lt;/a&gt;. (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4479&quot;&gt;#4479&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Performance&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Speed up the &lt;code&gt;is_fstring_start&lt;/code&gt; function in Black&#39;s tokenizer (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4541&quot;&gt;#4541&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Integrations&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;If using stdin with &lt;code&gt;--stdin-filename&lt;/code&gt; set to a force excluded path, stdin won&#39;t be&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/psf/black/blob/main/CHANGES.md&quot;&gt;black&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;25.1.0&lt;/h2&gt;
&lt;h3&gt;Highlights&lt;/h3&gt;
&lt;p&gt;This release introduces the new 2025 stable style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4558&quot;&gt;#4558&lt;/a&gt;), stabilizing
the following changes:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Normalize casing of Unicode escape characters in strings to lowercase (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/2916&quot;&gt;#2916&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix inconsistencies in whether certain strings are detected as docstrings (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4095&quot;&gt;#4095&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Consistently add trailing commas to typed function parameters (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4164&quot;&gt;#4164&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Remove redundant parentheses in if guards for case blocks (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4214&quot;&gt;#4214&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add parentheses to if clauses in case blocks when the line is too long (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4269&quot;&gt;#4269&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Whitespace before &lt;code&gt;# fmt: skip&lt;/code&gt; comments is no longer normalized (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4146&quot;&gt;#4146&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix line length computation for certain expressions that involve the power operator (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4154&quot;&gt;#4154&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Check if there is a newline before the terminating quotes of a docstring (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4185&quot;&gt;#4185&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix type annotation spacing between &lt;code&gt;*&lt;/code&gt; and more complex type variable tuple (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4440&quot;&gt;#4440&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;The following changes were not in any previous release:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Remove parentheses around sole list items (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4312&quot;&gt;#4312&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Generic function definitions are now formatted more elegantly: parameters are
split over multiple lines first instead of type parameter definitions (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4553&quot;&gt;#4553&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Stable style&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix formatting cells in IPython notebooks with magic methods and starting or trailing
empty lines (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4484&quot;&gt;#4484&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix crash when formatting &lt;code&gt;with&lt;/code&gt; statements containing tuple generators/unpacking
(&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4538&quot;&gt;#4538&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Preview style&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix/remove string merging changing f-string quotes on f-strings with internal quotes
(&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4498&quot;&gt;#4498&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Collapse multiple empty lines after an import into one (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4489&quot;&gt;#4489&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent &lt;code&gt;string_processing&lt;/code&gt; and &lt;code&gt;wrap_long_dict_values_in_parens&lt;/code&gt; from removing
parentheses around long dictionary values (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4377&quot;&gt;#4377&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Move &lt;code&gt;wrap_long_dict_values_in_parens&lt;/code&gt; from the unstable to preview style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4561&quot;&gt;#4561&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Packaging&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Store license identifier inside the &lt;code&gt;License-Expression&lt;/code&gt; metadata field, see
&lt;a href=&quot;https://peps.python.org/pep-0639/&quot;&gt;PEP 639&lt;/a&gt;. (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4479&quot;&gt;#4479&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Performance&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Speed up the &lt;code&gt;is_fstring_start&lt;/code&gt; function in Black&#39;s tokenizer (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4541&quot;&gt;#4541&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Integrations&lt;/h3&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/8a737e727ac5ab2f1d4cf5876720ed276dc8dc4b&quot;&gt;&lt;code&gt;8a737e7&lt;/code&gt;&lt;/a&gt; Prepare release 25.1.0 (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4563&quot;&gt;#4563&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/d330deea00e199b99dea59fb4643305408c19a9b&quot;&gt;&lt;code&gt;d330dee&lt;/code&gt;&lt;/a&gt; docs: We&#39;re not going to use backslashes for the with statement (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4564&quot;&gt;#4564&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/3d8129001f13e8c1a50eb73d8f44d26ad48f9c8c&quot;&gt;&lt;code&gt;3d81290&lt;/code&gt;&lt;/a&gt; Move &lt;code&gt;wrap_long_dict_values_in_parens&lt;/code&gt; to the preview style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4561&quot;&gt;#4561&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/459562c71a725a0a58a7cb710bd4b68417df4496&quot;&gt;&lt;code&gt;459562c&lt;/code&gt;&lt;/a&gt; Improve function declaration wrapping when it contains generic type definitio...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/99dbf3006b30dd77a0f650b25d9b1c8071f25e1e&quot;&gt;&lt;code&gt;99dbf30&lt;/code&gt;&lt;/a&gt; Cache executor to avoid hitting open file limits (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4560&quot;&gt;#4560&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/c0b92f3888a004b95e4626d8007a4b259b8f444f&quot;&gt;&lt;code&gt;c0b92f3&lt;/code&gt;&lt;/a&gt; Prepare the 2025 stable style (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4558&quot;&gt;#4558&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/e58baf15b99e0202f10bda09447d3eb246e88df9&quot;&gt;&lt;code&gt;e58baf1&lt;/code&gt;&lt;/a&gt; Add test for &lt;a href=&quot;https://redirect.github.com/psf/black/issues/1187&quot;&gt;#1187&lt;/a&gt; (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4559&quot;&gt;#4559&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/1455ae47311facfaf3ad62d2c223d86ae95c5c68&quot;&gt;&lt;code&gt;1455ae4&lt;/code&gt;&lt;/a&gt; Fix docs CI (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4555&quot;&gt;#4555&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/584d0331c8a73785af8a78fa601c540f5fe7bea2&quot;&gt;&lt;code&gt;584d033&lt;/code&gt;&lt;/a&gt; fix: Don&#39;t remove parenthesis around long dictionary values (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4377&quot;&gt;#4377&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/psf/black/commit/6e9654065ca5e4b7c7a9491431a6cd7bc4016da3&quot;&gt;&lt;code&gt;6e96540&lt;/code&gt;&lt;/a&gt; Fix CI (&lt;a href=&quot;https://redirect.github.com/psf/black/issues/4551&quot;&gt;#4551&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/psf/black/compare/23.10.1...25.1.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=black&amp;package-manager=pip&amp;previous-version=23.10.1&amp;new-version=25.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/8

-- Commit Summary --

  * Bump black from 23.10.1 to 25.1.0 in /platform

-- File Changes --

    M platform/poetry.lock (50)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/8.patch
https://github.com/Skogix/agent-gpt/pull/8.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/8
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/8@github.com&gt;
