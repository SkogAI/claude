MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 03 Feb 2025 00:09:55 -0800
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.3 in /next (PR #16)
Message-ID: <Skogix/agent-gpt/pull/16@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67a079d31ab7f_7ad8811220b0"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.3.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.3&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect removal of &lt;code&gt;@import url();&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16144&quot;&gt;#16144&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.2&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Only generate positive &lt;code&gt;grid-cols-*&lt;/code&gt; and &lt;code&gt;grid-rows-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16020&quot;&gt;#16020&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure escaped theme variables are handled correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16064&quot;&gt;#16064&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure we process Tailwind CSS features when only using &lt;code&gt;@reference&lt;/code&gt; or &lt;code&gt;@variant&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16057&quot;&gt;#16057&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Refactor gradient implementation to work around &lt;a href=&quot;https://redirect.github.com/prettier/prettier/issues/17058&quot;&gt;prettier/prettier#17058&lt;/a&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16072&quot;&gt;#16072&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure hot-reloading works with SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Fix a crash when starting the development server in SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t rebase URLs that appear to be aliases (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16078&quot;&gt;#16078&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Transform &lt;code&gt;&amp;lt;style&amp;gt;&lt;/code&gt; blocks in HTML files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16069&quot;&gt;#16069&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent camel-casing CSS custom properties added by JavaScript plugins (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16103&quot;&gt;#16103&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Do not emit &lt;code&gt;@keyframes&lt;/code&gt; in &lt;code&gt;@theme reference&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16120&quot;&gt;#16120&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard invalid declarations when parsing CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16093&quot;&gt;#16093&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Do not emit empty CSS rules and at-rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16121&quot;&gt;#16121&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Handle &lt;code&gt;@variant&lt;/code&gt; when at the top-level of a stylesheet (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16129&quot;&gt;#16129&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.1&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Include &lt;code&gt;:open&lt;/code&gt; pseudo-class in existing &lt;code&gt;open&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15349&quot;&gt;#15349&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Remove invalid &lt;code&gt;min-w/h-none&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15845&quot;&gt;#15845&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard CSS variable shorthand utilities that don&#39;t use valid CSS variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15738&quot;&gt;#15738&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure font-size utilities with &lt;code&gt;none&lt;/code&gt; modifier have a line-height set e.g. &lt;code&gt;text-sm/none&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15921&quot;&gt;#15921&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure font-size utilities with unknown modifier don&#39;t generate CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15921&quot;&gt;#15921&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t suggest font weight utilities more than once (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Suggest container query variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Disable bare value suggestions when not using the &lt;code&gt;--spacing&lt;/code&gt; variable (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure suggested classes are properly sorted (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t look at .gitignore files outside initialized repos (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15941&quot;&gt;#15941&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using the Svelte class shorthand syntax across multiple lines (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using the Angular class shorthand syntax (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using functions inside arrays (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that &lt;code&gt;@tailwindcss/browser&lt;/code&gt; does not pollute the global namespace (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15978&quot;&gt;#15978&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that &lt;code&gt;tailwind-merge&lt;/code&gt; is not scanned when using the Vite plugin (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16005&quot;&gt;#16005&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure CSS theme variables are available within shadow roots (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15975&quot;&gt;#15975&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix crash when project lives in the &lt;code&gt;/&lt;/code&gt; directory (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15988&quot;&gt;#15988&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure custom variants have a non-empty selector list (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16009&quot;&gt;#16009&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade&lt;/em&gt;: Ensure JavaScript config files on different drives are correctly migrated (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15927&quot;&gt;#15927&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade&lt;/em&gt;: Migrate &lt;code&gt;leading-[1]&lt;/code&gt; to &lt;code&gt;leading-none&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16004&quot;&gt;#16004&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade&lt;/em&gt;: Do not migrate arbitrary leading utilities to bare values (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16004&quot;&gt;#16004&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.3] - 2025-02-01&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Fix incorrect removal of &lt;code&gt;@import url();&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16144&quot;&gt;#16144&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.2] - 2025-01-31&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Only generate positive &lt;code&gt;grid-cols-*&lt;/code&gt; and &lt;code&gt;grid-rows-*&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16020&quot;&gt;#16020&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure escaped theme variables are handled correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16064&quot;&gt;#16064&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure we process Tailwind CSS features when only using &lt;code&gt;@reference&lt;/code&gt; or &lt;code&gt;@variant&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16057&quot;&gt;#16057&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Refactor gradient implementation to work around &lt;a href=&quot;https://redirect.github.com/prettier/prettier/issues/17058&quot;&gt;prettier/prettier#17058&lt;/a&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16072&quot;&gt;#16072&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure hot-reloading works with SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Fix a crash when starting the development server in SolidStart setups (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16052&quot;&gt;#16052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t rebase URLs that appear to be aliases (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16078&quot;&gt;#16078&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Transform &lt;code&gt;&amp;lt;style&amp;gt;&lt;/code&gt; blocks in HTML files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16069&quot;&gt;#16069&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent camel-casing CSS custom properties added by JavaScript plugins (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16103&quot;&gt;#16103&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Do not emit &lt;code&gt;@keyframes&lt;/code&gt; in &lt;code&gt;@theme reference&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16120&quot;&gt;#16120&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard invalid declarations when parsing CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16093&quot;&gt;#16093&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Do not emit empty CSS rules and at-rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16121&quot;&gt;#16121&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Handle &lt;code&gt;@variant&lt;/code&gt; when at the top-level of a stylesheet (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16129&quot;&gt;#16129&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.1] - 2025-01-29&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Include &lt;code&gt;:open&lt;/code&gt; pseudo-class in existing &lt;code&gt;open&lt;/code&gt; variant (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15349&quot;&gt;#15349&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Remove invalid &lt;code&gt;min-w/h-none&lt;/code&gt; utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15845&quot;&gt;#15845&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard CSS variable shorthand utilities that don&#39;t use valid CSS variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15738&quot;&gt;#15738&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure font-size utilities with &lt;code&gt;none&lt;/code&gt; modifier have a line-height set e.g. &lt;code&gt;text-sm/none&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15921&quot;&gt;#15921&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure font-size utilities with unknown modifier don&#39;t generate CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15921&quot;&gt;#15921&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t suggest font weight utilities more than once (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Suggest container query variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Disable bare value suggestions when not using the &lt;code&gt;--spacing&lt;/code&gt; variable (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure suggested classes are properly sorted (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15857&quot;&gt;#15857&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t look at .gitignore files outside initialized repos (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15941&quot;&gt;#15941&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using the Svelte class shorthand syntax across multiple lines (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using the Angular class shorthand syntax (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Find utilities when using functions inside arrays (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15974&quot;&gt;#15974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that &lt;code&gt;@tailwindcss/browser&lt;/code&gt; does not pollute the global namespace (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15978&quot;&gt;#15978&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that &lt;code&gt;tailwind-merge&lt;/code&gt; is not scanned when using the Vite plugin (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16005&quot;&gt;#16005&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure CSS theme variables are available within shadow roots (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15975&quot;&gt;#15975&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix crash when project lives in the &lt;code&gt;/&lt;/code&gt; directory (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15988&quot;&gt;#15988&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure custom variants have a non-empty selector list (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16009&quot;&gt;#16009&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade&lt;/em&gt;: Ensure JavaScript config files on different drives are correctly migrated (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15927&quot;&gt;#15927&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b7c3f50143860b144ec2addc61d63bd146661c7c&quot;&gt;&lt;code&gt;b7c3f50&lt;/code&gt;&lt;/a&gt; Prepare v4.0.3 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16146&quot;&gt;#16146&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b7436f8b5942d9e64765eb5fced0eabd46ca717b&quot;&gt;&lt;code&gt;b7436f8&lt;/code&gt;&lt;/a&gt; Fix &lt;code&gt;@import url()&lt;/code&gt; being stripped (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16144&quot;&gt;#16144&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/50bafce75623a5a5b7171ef278b445c437c6be48&quot;&gt;&lt;code&gt;50bafce&lt;/code&gt;&lt;/a&gt; Prepare for v4.0.2 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16131&quot;&gt;#16131&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4052eb24bfd7f027300beed6f0485893deceeb4c&quot;&gt;&lt;code&gt;4052eb2&lt;/code&gt;&lt;/a&gt; Allow &lt;code&gt;@variant&lt;/code&gt; to be used at the top-level (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16129&quot;&gt;#16129&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/7f1d0970c3bd91da6c860a77b0b63f12d18d5a9d&quot;&gt;&lt;code&gt;7f1d097&lt;/code&gt;&lt;/a&gt; Do not emit empty rules/at-rules (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16121&quot;&gt;#16121&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/35a5e8cb64fde0b8611ea1968ad25e5d2dafe544&quot;&gt;&lt;code&gt;35a5e8c&lt;/code&gt;&lt;/a&gt; Discard invalid declarations when parsing CSS (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16093&quot;&gt;#16093&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/60e61950b9bb62d9290f2a9df3330f2e36fc3b8e&quot;&gt;&lt;code&gt;60e6195&lt;/code&gt;&lt;/a&gt; Ensure escaped theme variables are handled correctly (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16064&quot;&gt;#16064&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3aa0e494bf9b913a8e6f461fafe74e5a5c50e5e9&quot;&gt;&lt;code&gt;3aa0e49&lt;/code&gt;&lt;/a&gt; Do not emit &lt;code&gt;@keyframes&lt;/code&gt; in &lt;code&gt;@theme reference&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16120&quot;&gt;#16120&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/88c890615a529cc8f7f253d75e25bd19bcf7e306&quot;&gt;&lt;code&gt;88c8906&lt;/code&gt;&lt;/a&gt; Prevent modifying CSS variables in plugins (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16103&quot;&gt;#16103&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/224294122b9743410dcb24d94ecf5d1468dde066&quot;&gt;&lt;code&gt;2242941&lt;/code&gt;&lt;/a&gt; Refactor gradient implementation to work around &lt;a href=&quot;https://redirect.github.com/prettier/prettier/issues/17058&quot;&gt;prettier/prettier#17058&lt;/a&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16072&quot;&gt;#16072&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.3/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/16

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.3 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/16.patch
https://github.com/Skogix/agent-gpt/pull/16.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/16
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/16@github.com&gt;
