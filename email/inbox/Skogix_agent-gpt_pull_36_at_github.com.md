MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 28 Apr 2025 03:49:37 -0700
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.1.4 in /next (PR #36)
Message-ID: <Skogix/agent-gpt/pull/36@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_680f5d41dc075_8610281158a8"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.1.4.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.1.4&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add experimental &lt;code&gt;@tailwindcss/oxide-wasm32-wasi&lt;/code&gt; target for running Tailwind in browser environments like StackBlitz (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17558&quot;&gt;#17558&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure &lt;code&gt;color-mix(…)&lt;/code&gt; polyfills do not cause used CSS variables to be removed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17555&quot;&gt;#17555&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;color-mix(…)&lt;/code&gt; polyfills create fallbacks for theme variables that reference other theme variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17562&quot;&gt;#17562&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix brace expansion in declining ranges like &lt;code&gt;{10..0..5}&lt;/code&gt; and &lt;code&gt;{0..10..-5}&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17591&quot;&gt;#17591&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Work around a Chrome rendering bug when using the &lt;code&gt;skew-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17627&quot;&gt;#17627&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure container query variant names can contain hyphens (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17628&quot;&gt;#17628&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;shadow-inherit&lt;/code&gt;, &lt;code&gt;inset-shadow-inherit&lt;/code&gt;, &lt;code&gt;drop-shadow-inherit&lt;/code&gt;, and &lt;code&gt;text-shadow-inherit&lt;/code&gt; inherit the shadow color (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17647&quot;&gt;#17647&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure compatibility with array tuples used in &lt;code&gt;fontSize&lt;/code&gt; JS theme keys (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17630&quot;&gt;#17630&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure folders with binary file extensions in their names are scanned for utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17595&quot;&gt;#17595&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Upgrade: Convert &lt;code&gt;fontSize&lt;/code&gt; array tuple syntax to CSS theme variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17630&quot;&gt;#17630&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
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
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.1.4] - 2025-04-14&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add experimental &lt;code&gt;@tailwindcss/oxide-wasm32-wasi&lt;/code&gt; target for running Tailwind in browser environments like StackBlitz (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17558&quot;&gt;#17558&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure &lt;code&gt;color-mix(…)&lt;/code&gt; polyfills do not cause used CSS variables to be removed (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17555&quot;&gt;#17555&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;color-mix(…)&lt;/code&gt; polyfills create fallbacks for theme variables that reference other theme variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17562&quot;&gt;#17562&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix brace expansion in declining ranges like &lt;code&gt;{10..0..5}&lt;/code&gt; and &lt;code&gt;{0..10..-5}&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17591&quot;&gt;#17591&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Work around a Chrome rendering bug when using the &lt;code&gt;skew-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17627&quot;&gt;#17627&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure container query variant names can contain hyphens (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17628&quot;&gt;#17628&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;shadow-inherit&lt;/code&gt;, &lt;code&gt;inset-shadow-inherit&lt;/code&gt;, &lt;code&gt;drop-shadow-inherit&lt;/code&gt;, and &lt;code&gt;text-shadow-inherit&lt;/code&gt; inherit the shadow color (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17647&quot;&gt;#17647&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure compatibility with array tuples used in &lt;code&gt;fontSize&lt;/code&gt; JS theme keys (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17630&quot;&gt;#17630&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure folders with binary file extensions in their names are scanned for utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17595&quot;&gt;#17595&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Upgrade: Convert &lt;code&gt;fontSize&lt;/code&gt; array tuple syntax to CSS theme variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17630&quot;&gt;#17630&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
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
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/aa836d344281c02b7aabe896be1632dcebb48b8e&quot;&gt;&lt;code&gt;aa836d3&lt;/code&gt;&lt;/a&gt; Prepare v4.1.4 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17669&quot;&gt;#17669&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/6e1f53348d581bdb3c03b437186ae0129651b406&quot;&gt;&lt;code&gt;6e1f533&lt;/code&gt;&lt;/a&gt; Workaround Chrome rendering bug for &lt;code&gt;skew-*&lt;/code&gt; utilities (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17627&quot;&gt;#17627&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3bea760ff21b66a616d99d833eaf05a2f99ad839&quot;&gt;&lt;code&gt;3bea760&lt;/code&gt;&lt;/a&gt; Add test coverage for property-specific colors (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17436&quot;&gt;#17436&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/6d8dd82c4084208e4d7a8fc8c2f6437b587814c2&quot;&gt;&lt;code&gt;6d8dd82&lt;/code&gt;&lt;/a&gt; Fix &lt;code&gt;shadow-inherit&lt;/code&gt;, &lt;code&gt;inset-shadow-inherit&lt;/code&gt;, &lt;code&gt;drop-shadow-inherit&lt;/code&gt;, and `tex...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/c0af1e2129828110fb4498f57b77d2e3bc1d3396&quot;&gt;&lt;code&gt;c0af1e2&lt;/code&gt;&lt;/a&gt; Fix &lt;code&gt;fontSize&lt;/code&gt; array upgrade (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17630&quot;&gt;#17630&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3ab7f1256371d604b4058fa6e67ffb6bac210678&quot;&gt;&lt;code&gt;3ab7f12&lt;/code&gt;&lt;/a&gt; Fix container names with hyphens (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17628&quot;&gt;#17628&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/f66d287436e845d8a684abc338a805f13382fac7&quot;&gt;&lt;code&gt;f66d287&lt;/code&gt;&lt;/a&gt; Fix brace expansion with range going down (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17591&quot;&gt;#17591&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3e9cf87adf8e226ff8421d1f8b8d7317123c2702&quot;&gt;&lt;code&gt;3e9cf87&lt;/code&gt;&lt;/a&gt; Make  polyfill work when the theme variable resolves to another var (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17562&quot;&gt;#17562&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/811e97d61afabcda8858183add91772abd6b4cb6&quot;&gt;&lt;code&gt;811e97d&lt;/code&gt;&lt;/a&gt; Fix  polyfill in combination with unused CSS variable removal (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17555&quot;&gt;#17555&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/5a77c9dfc4bcc1f83fe3269fbbcc27386d5e8572&quot;&gt;&lt;code&gt;5a77c9d&lt;/code&gt;&lt;/a&gt; Prepare v4.1.3 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17563&quot;&gt;#17563&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.1.4/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.1.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/36

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.1.4 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/36.patch
https://github.com/Skogix/agent-gpt/pull/36.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/36
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/36@github.com&gt;
