MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Wed, 29 Jan 2025 04:05:17 -0800
Subject: [Skogix/agent-gpt2] Bump grpcio from 1.59.2 to 1.70.0 in /platform (PR #14)
Message-ID: <Skogix/agent-gpt2/pull/14@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_679a197dea7a3_9ad8813941d"; charset="UTF-8"

Bumps [grpcio](https://github.com/grpc/grpc) from 1.59.2 to 1.70.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;grpcio&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;Release v1.70.0&lt;/h2&gt;
&lt;p&gt;This is release 1.70.0 (&lt;a href=&quot;https://github.com/grpc/grpc/blob/master/doc/g_stands_for.md&quot;&gt;genius&lt;/a&gt;) of gRPC Core.&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This release contains refinements, improvements, and bug fixes, with highlights listed below.&lt;/p&gt;
&lt;h2&gt;Core&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;[BoringSSL] Update third_party/boringssl-with-bazel. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38274&quot;&gt;#38274&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;C++&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;gRPC C++ begins to require C++17 or later to build and use gRPC C++.  You may need the following settings
&lt;ul&gt;
&lt;li&gt;CMake: Add &lt;code&gt;CMAKE_CXX_STANDARD=17&lt;/code&gt; to your CMake build command.&lt;/li&gt;
&lt;li&gt;Bazel: Add &lt;code&gt;--cxxopt=&#39;/std:c++17&#39;&lt;/code&gt; and &lt;code&gt;--host_cxxopt=&#39;/std:c++17&#39;&lt;/code&gt; to your Bazel build command.&lt;/li&gt;
&lt;li&gt;gRPC 1.69, the final version compatible with C++14, will be supported until December 10, 2025, according to &lt;a href=&quot;https://github.com/grpc/proposal/blob/master/L120-requiring-cpp17.md&quot;&gt;https://github.com/grpc/proposal/blob/master/L120-requiring-cpp17.md&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Release v1.70.0-pre1&lt;/h2&gt;
&lt;p&gt;This is a prerelease of gRPC Core 1.70.0 (genius).&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This prerelease contains refinements, improvements, and bug fixes.&lt;/p&gt;
&lt;h2&gt;Release v1.69.0&lt;/h2&gt;
&lt;p&gt;This is release 1.69.0 (&lt;a href=&quot;https://github.com/grpc/grpc/blob/master/doc/g_stands_for.md&quot;&gt;gridiron&lt;/a&gt;) of gRPC Core.&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This release contains refinements, improvements, and bug fixes, with highlights listed below.&lt;/p&gt;
&lt;h2&gt;Core&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;[Alarm] Fix Alarm reuse on cancellation. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38114&quot;&gt;#38114&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[xDS RBAC] Support string_match in HeaderMatcher. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38185&quot;&gt;#38185&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[pick_first] fix shutdown bug in new PF impl. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38144&quot;&gt;#38144&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[c-ares] Fix inverted length check in GrpcPolledFdWindows. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38101&quot;&gt;#38101&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[RetryFilter] Copy the SliceBuffer from RetryFilter&#39;s cache to batch payload. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38069&quot;&gt;#38069&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[EventEngine] Add stronger wording on Endpoint::Read contract. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38036&quot;&gt;#38036&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[chttp2] Fix channelz address. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38022&quot;&gt;#38022&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[XdsClient] Add missing authority to XdsClient metrics scope. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38009&quot;&gt;#38009&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[EventEngine] API contract: Endpoint::Read will provide either an error or data, but never both. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38019&quot;&gt;#38019&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[Build] Dropped Bazel 6.x support. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37979&quot;&gt;#37979&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/93571f6142f823167d54bc1169fed567b2407d94&quot;&gt;&lt;code&gt;93571f6&lt;/code&gt;&lt;/a&gt; [Backport to 1.70.x] Updated python requirements (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38524&quot;&gt;#38524&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/9d3bef715bd77b60559398fc66402264bdf80ff7&quot;&gt;&lt;code&gt;9d3bef7&lt;/code&gt;&lt;/a&gt; [Revert] &amp;quot;[ruby] [backport-1.70.x] Build/test ruby 3.4 and build native gems ...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/6788979465fa78deff593e4abf59d385439b28c5&quot;&gt;&lt;code&gt;6788979&lt;/code&gt;&lt;/a&gt; [Release] Bump version to 1.70.0 (on v1.70.x branch) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38509&quot;&gt;#38509&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/2d2d80ba0e914d4a6b53e9ecb8f068b81d6579e7&quot;&gt;&lt;code&gt;2d2d80b&lt;/code&gt;&lt;/a&gt; [Backport] Php &amp;amp; Dart interop test fixes (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38463&quot;&gt;#38463&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38507&quot;&gt;#38507&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/ab2222db264057830e887ad3bbb04a4f178c3227&quot;&gt;&lt;code&gt;ab2222d&lt;/code&gt;&lt;/a&gt; [ruby] [backport-1.70.x] Build/test ruby 3.4 and build native gems with Ruby ...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/f1e4dfaca81edf0390c0c58cb51859b63b797123&quot;&gt;&lt;code&gt;f1e4dfa&lt;/code&gt;&lt;/a&gt; [Backport-to-1.70.x] Fix python build script to handle C and C++ std options ...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/6c8df892cd1dc596c07b82242754cd7dec6e656d&quot;&gt;&lt;code&gt;6c8df89&lt;/code&gt;&lt;/a&gt; [Release] Bump version to 1.70.0-pre1 (on v1.70.x branch) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38407&quot;&gt;#38407&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/9eb9ebd19ef1f69f367ad68c41edb8bf9f4954c3&quot;&gt;&lt;code&gt;9eb9ebd&lt;/code&gt;&lt;/a&gt; [Release] Bump core version to 45.0.0 for upcoming release (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38403&quot;&gt;#38403&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/df95cf9de3733c2bdcb03d723e396c6fdee5b9d9&quot;&gt;&lt;code&gt;df95cf9&lt;/code&gt;&lt;/a&gt; [benchmark] Match case of excluded scenario. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38390&quot;&gt;#38390&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/048ea424201ec6b69fe8eb1a1c13303074c8e917&quot;&gt;&lt;code&gt;048ea42&lt;/code&gt;&lt;/a&gt; [CI] Re-enabled modernize-unary-static-assert (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38333&quot;&gt;#38333&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/grpc/grpc/compare/v1.59.2...v1.70.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=grpcio&amp;package-manager=pip&amp;previous-version=1.59.2&amp;new-version=1.70.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/14

-- Commit Summary --

  * Bump grpcio from 1.59.2 to 1.70.0 in /platform

-- File Changes --

    M platform/poetry.lock (125)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/14.patch
https://github.com/Skogix/agent-gpt2/pull/14.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/14
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/14@github.com&gt;
