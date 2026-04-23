MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 07 Apr 2025 01:06:37 -0700
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.1.3 in /next (PR #32)
Message-ID: <Skogix/agent-gpt/pull/32@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67f3878d4811d_dd1030233312"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.1.3.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.1.3&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Show warning when using unsupported bare value data type in &lt;code&gt;--value(…)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17464&quot;&gt;#17464&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Ensure changes to the input CSS file don&#39;t generate stale output when using Turbopack (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17554&quot;&gt;#17554&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes are detected in Ruby&#39;s &lt;code&gt;%w&lt;/code&gt; syntax in Slim templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17557&quot;&gt;#17557&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.1.2&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t rely on the presence of &lt;code&gt;@layer base&lt;/code&gt; to polyfill &lt;code&gt;@property&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17506&quot;&gt;#17506&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Support setting multiple inset shadows as arbitrary values (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17523&quot;&gt;#17523&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;drop-shadow-*&lt;/code&gt; utilities that are defined with multiple shadows (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17515&quot;&gt;#17515&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Fix race condition when two changes are queued concurrently (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17514&quot;&gt;#17514&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Ensure files containing &lt;code&gt;@tailwind utilities&lt;/code&gt; are processed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17514&quot;&gt;#17514&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure the &lt;code&gt;color-mix(…)&lt;/code&gt; polyfill creates fallbacks even when using colors that cannot be statically analyzed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17513&quot;&gt;#17513&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix slow incremental builds with &lt;code&gt;@tailwindcss/vite&lt;/code&gt; and &lt;code&gt;@tailwindcss/postscss&lt;/code&gt; (especially on Windows) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17511&quot;&gt;#17511&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Fix missing CSS file in Qwik setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17533&quot;&gt;#17533&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.1.1&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Disable padding in &lt;code&gt;@source inline(…)&lt;/code&gt; brace expansion (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17491&quot;&gt;#17491&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Inject polyfills after &lt;code&gt;@import&lt;/code&gt; and body-less &lt;code&gt;@layer&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17493&quot;&gt;#17493&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@tailwindcss/cli&lt;/code&gt; does not contain an import for &lt;code&gt;jiti&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17502&quot;&gt;#17502&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.1.0&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;details-content&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15319&quot;&gt;#15319&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;inverted-colors&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/11693&quot;&gt;#11693&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;noscript&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/11929&quot;&gt;#11929&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17431&quot;&gt;#17431&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;items-baseline-last&lt;/code&gt; and &lt;code&gt;self-baseline-last&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/13888&quot;&gt;#13888&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17476&quot;&gt;#17476&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;pointer-none&lt;/code&gt;, &lt;code&gt;pointer-coarse&lt;/code&gt;, and &lt;code&gt;pointer-fine&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16946&quot;&gt;#16946&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;any-pointer-none&lt;/code&gt;, &lt;code&gt;any-pointer-coarse&lt;/code&gt;, and &lt;code&gt;any-pointer-fine&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16941&quot;&gt;#16941&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add safe alignment utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/14607&quot;&gt;#14607&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;user-valid&lt;/code&gt; and &lt;code&gt;user-invalid&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/12370&quot;&gt;#12370&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;wrap-anywhere&lt;/code&gt;, &lt;code&gt;wrap-break-word&lt;/code&gt;, and &lt;code&gt;wrap-normal&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/12128&quot;&gt;#12128&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;@source inline(…)&lt;/code&gt; and &lt;code&gt;@source not inline(…)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17147&quot;&gt;#17147&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;@source not &amp;quot;…&amp;quot;&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17255&quot;&gt;#17255&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;text-shadow-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17389&quot;&gt;#17389&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;mask-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17134&quot;&gt;#17134&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;bg-{position,size}-*&lt;/code&gt; utilities for arbitrary values (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17432&quot;&gt;#17432&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, &lt;code&gt;inset-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, &lt;code&gt;drop-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, and &lt;code&gt;text-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt; utilities to control shadow opacity (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17398&quot;&gt;#17398&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17434&quot;&gt;#17434&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;drop-shadow-&amp;lt;color&amp;gt;&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17434&quot;&gt;#17434&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Improve compatibility with older versions of Safari and Firefox (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17435&quot;&gt;#17435&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Follow symlinks when resolving &lt;code&gt;@source&lt;/code&gt; directives (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17391&quot;&gt;#17391&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.1.3] - 2025-04-04&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Show warning when using unsupported bare value data type in &lt;code&gt;--value(…)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17464&quot;&gt;#17464&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Ensure changes to the input CSS file don&#39;t generate stale output when using Turbopack (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17554&quot;&gt;#17554&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes are detected in Ruby&#39;s &lt;code&gt;%w&lt;/code&gt; syntax in Slim templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17557&quot;&gt;#17557&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.1.2] - 2025-04-03&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t rely on the presence of &lt;code&gt;@layer base&lt;/code&gt; to polyfill &lt;code&gt;@property&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17506&quot;&gt;#17506&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Support setting multiple inset shadows as arbitrary values (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17523&quot;&gt;#17523&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;drop-shadow-*&lt;/code&gt; utilities that are defined with multiple shadows (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17515&quot;&gt;#17515&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Fix race condition when two changes are queued concurrently (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17514&quot;&gt;#17514&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Ensure files containing &lt;code&gt;@tailwind utilities&lt;/code&gt; are processed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17514&quot;&gt;#17514&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure the &lt;code&gt;color-mix(…)&lt;/code&gt; polyfill creates fallbacks even when using colors that cannot be statically analyzed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17513&quot;&gt;#17513&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix slow incremental builds with &lt;code&gt;@tailwindcss/vite&lt;/code&gt; and &lt;code&gt;@tailwindcss/postscss&lt;/code&gt; (especially on Windows) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17511&quot;&gt;#17511&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Fix missing CSS file in Qwik setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17533&quot;&gt;#17533&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.1.1] - 2025-04-02&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Disable padding in &lt;code&gt;@source inline(…)&lt;/code&gt; brace expansion (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17491&quot;&gt;#17491&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Inject polyfills after &lt;code&gt;@import&lt;/code&gt; and body-less &lt;code&gt;@layer&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17493&quot;&gt;#17493&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@tailwindcss/cli&lt;/code&gt; does not contain an import for &lt;code&gt;jiti&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17502&quot;&gt;#17502&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.1.0] - 2025-04-01&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;details-content&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15319&quot;&gt;#15319&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;inverted-colors&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/11693&quot;&gt;#11693&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;noscript&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/11929&quot;&gt;#11929&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17431&quot;&gt;#17431&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;items-baseline-last&lt;/code&gt; and &lt;code&gt;self-baseline-last&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/13888&quot;&gt;#13888&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17476&quot;&gt;#17476&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;pointer-none&lt;/code&gt;, &lt;code&gt;pointer-coarse&lt;/code&gt;, and &lt;code&gt;pointer-fine&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16946&quot;&gt;#16946&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;any-pointer-none&lt;/code&gt;, &lt;code&gt;any-pointer-coarse&lt;/code&gt;, and &lt;code&gt;any-pointer-fine&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16941&quot;&gt;#16941&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add safe alignment utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/14607&quot;&gt;#14607&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;user-valid&lt;/code&gt; and &lt;code&gt;user-invalid&lt;/code&gt; variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/12370&quot;&gt;#12370&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;wrap-anywhere&lt;/code&gt;, &lt;code&gt;wrap-break-word&lt;/code&gt;, and &lt;code&gt;wrap-normal&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/12128&quot;&gt;#12128&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;@source inline(…)&lt;/code&gt; and &lt;code&gt;@source not inline(…)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17147&quot;&gt;#17147&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;@source not &amp;quot;…&amp;quot;&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17255&quot;&gt;#17255&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;text-shadow-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17389&quot;&gt;#17389&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;mask-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17134&quot;&gt;#17134&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;bg-{position,size}-*&lt;/code&gt; utilities for arbitrary values (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17432&quot;&gt;#17432&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, &lt;code&gt;inset-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, &lt;code&gt;drop-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt;, and &lt;code&gt;text-shadow-*/&amp;lt;alpha&amp;gt;&lt;/code&gt; utilities to control shadow opacity (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17398&quot;&gt;#17398&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17434&quot;&gt;#17434&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Add &lt;code&gt;drop-shadow-&amp;lt;color&amp;gt;&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17434&quot;&gt;#17434&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Improve compatibility with older versions of Safari and Firefox (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17435&quot;&gt;#17435&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/5a77c9dfc4bcc1f83fe3269fbbcc27386d5e8572&quot;&gt;&lt;code&gt;5a77c9d&lt;/code&gt;&lt;/a&gt; Prepare v4.1.3 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17563&quot;&gt;#17563&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/2fd7c8d9672347120f86bb446785aa2750c0a603&quot;&gt;&lt;code&gt;2fd7c8d&lt;/code&gt;&lt;/a&gt; Show warning when using unsupported bare value data type (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17464&quot;&gt;#17464&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4c99367b7b1ca3a01d30950dee8908354ed4a415&quot;&gt;&lt;code&gt;4c99367&lt;/code&gt;&lt;/a&gt; Prepare release v4.1.2 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17530&quot;&gt;#17530&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/60b0da90cee9e71a2d3117053cc4cc2d6e9196fe&quot;&gt;&lt;code&gt;60b0da9&lt;/code&gt;&lt;/a&gt; Polyfill: Fall back to first color value when &lt;code&gt;color-mix(…)&lt;/code&gt; contains unresol...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/e45302b910c3ed79e325b00f7fdd1c0c4198a2a7&quot;&gt;&lt;code&gt;e45302b&lt;/code&gt;&lt;/a&gt; Fix drop shadow filters with multiple shadows (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17515&quot;&gt;#17515&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3e41e9ffe61d618e5db070692997eb1ebc973d0f&quot;&gt;&lt;code&gt;3e41e9f&lt;/code&gt;&lt;/a&gt; Replace currentColor with currentcolor (lowercase) (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17510&quot;&gt;#17510&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/80f9578bfad25e6b3e1ddf20f517998c35ff8fff&quot;&gt;&lt;code&gt;80f9578&lt;/code&gt;&lt;/a&gt; Fix multi-value arbitrary inset shadow (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17523&quot;&gt;#17523&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4484192ca310fa5865e796c25a1aeed9b2d2a9f5&quot;&gt;&lt;code&gt;4484192&lt;/code&gt;&lt;/a&gt; Use &lt;code&gt;@layer properties&lt;/code&gt; for &lt;code&gt;@property&lt;/code&gt; polyfills (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17506&quot;&gt;#17506&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/6a0a3ec0fab2cc5fae36729da6b8a2894050eafd&quot;&gt;&lt;code&gt;6a0a3ec&lt;/code&gt;&lt;/a&gt; Prepare release v4.1.1 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17503&quot;&gt;#17503&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3c937ecee78c9e87548c34a5851bf8c7fb52b455&quot;&gt;&lt;code&gt;3c937ec&lt;/code&gt;&lt;/a&gt; Inject polyfills after &lt;code&gt;@import&lt;/code&gt; and body-less &lt;code&gt;@layer&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17493&quot;&gt;#17493&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.1.3/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.1.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/32

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.1.3 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/32.patch
https://github.com/Skogix/agent-gpt/pull/32.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/32
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/32@github.com&gt;
