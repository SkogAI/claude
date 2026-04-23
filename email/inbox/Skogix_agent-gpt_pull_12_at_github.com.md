MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Wed, 29 Jan 2025 00:46:33 -0800
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.0 in /next (PR #12)
Message-ID: <Skogix/agent-gpt/pull/12@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6799eae9a04f1_b8d883473e4"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.0&lt;/h2&gt;
&lt;p&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4&quot;&gt;&lt;img src=&quot;https://github.com/user-attachments/assets/cf527dc2-7e42-4884-9628-dbb27459d2aa&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Holy shit it&#39;s actually done — we just tagged Tailwind CSS v4.0.&lt;/p&gt;
&lt;p&gt;Tailwind CSS v4.0 is an all-new version of the framework optimized for performance and flexibility, with a reimagined configuration and customization experience, and taking full advantage of the latest advancements the web platform has to offer.&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#new-high-performance-engine&quot;&gt;New high-performance engine&lt;/a&gt; — where full builds are up to 5x faster, and incremental builds are over 100x faster — and measured in microseconds.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#designed-for-the-modern-web&quot;&gt;Designed for the modern web&lt;/a&gt; — built on cutting-edge CSS features like cascade layers, registered custom properties with &lt;code&gt;@property&lt;/code&gt;, and &lt;code&gt;color-mix()&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#simplified-installation&quot;&gt;Simplified installation&lt;/a&gt; — fewer dependencies, zero configuration, and just a single line of code in your CSS file.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#first-party-vite-plugin&quot;&gt;First-party Vite plugin&lt;/a&gt; — tight integration for maximum performance and minimum configuration.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#automatic-content-detection&quot;&gt;Automatic content detection&lt;/a&gt; — all of your template files are discovered automatically, with no configuration required.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#built-in-import-support&quot;&gt;Built-in import support&lt;/a&gt; — no additional tooling necessary to bundle multiple CSS files.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#css-first-configuration&quot;&gt;CSS-first configuration&lt;/a&gt; — a reimagined developer experience where you customize and extend the framework directly in CSS instead of a JavaScript configuration file.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#css-theme-variables&quot;&gt;CSS theme variables&lt;/a&gt; — all of your design tokens exposed as native CSS variables so you can access them anywhere.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#dynamic-utility-values-and-variants&quot;&gt;Dynamic utility values and variants&lt;/a&gt; — stop guessing what values exist in your spacing scale, or extending your configuration for things like basic data attributes.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#modernized-p3-color-palette&quot;&gt;Modernized P3 color palette&lt;/a&gt; — a redesigned, more vivid color palette that takes full advantage of modern display technology.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#container-queries&quot;&gt;Container queries&lt;/a&gt; — first-class APIs for styling elements based on their container size, no plugins required.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#new-3d-transform-utilities&quot;&gt;New 3D transform utilities&lt;/a&gt; — transform elements in 3D space directly in your HTML.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#expanded-gradient-apis&quot;&gt;Expanded gradient APIs&lt;/a&gt; — radial and conic gradients, interpolation modes, and more.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#starting-style-support&quot;&gt;&lt;code&gt;@​starting-style support&lt;/code&gt;&lt;/a&gt; — a new variant you can use to create enter and exit transitions, without the need for JavaScript.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#not-variant&quot;&gt;not-* variant&lt;/a&gt; — style an element only when it doesn&#39;t match another variant, custom selector, or media or feature query.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#even-more-new-utilities-and-variants&quot;&gt;Even more new utilities and variants&lt;/a&gt; — including support for &lt;code&gt;color-scheme&lt;/code&gt;, &lt;code&gt;field-sizing&lt;/code&gt;, complex shadows, &lt;code&gt;inert&lt;/code&gt;, and more.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Start using Tailwind CSS v4.0 today by &lt;a href=&quot;https://tailwindcss.com/docs/installation/&quot;&gt;installing it in a new project&lt;/a&gt;, or playing with it directly in the browser on &lt;a href=&quot;https://play.tailwindcss.com/&quot;&gt;Tailwind Play&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;For existing projects, we&#39;ve published a comprehensive &lt;a href=&quot;https://tailwindcss.com/docs/upgrade-guide&quot;&gt;upgrade guide&lt;/a&gt; and built an &lt;a href=&quot;https://tailwindcss.com/docs/upgrade-guide#using-the-upgrade-tool&quot;&gt;automated upgrade tool&lt;/a&gt; to get you on the latest version as quickly and painlessly as possible.&lt;/p&gt;
&lt;p&gt;For a deep-dive into everything that&#39;s new, &lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4&quot;&gt;check out the announcement post&lt;/a&gt;.&lt;/p&gt;
&lt;h2&gt;v4.0.0-beta.10&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add support for using &lt;code&gt;@variant&lt;/code&gt; to use variants in your CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15663&quot;&gt;#15663&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Include &lt;code&gt;outline-color&lt;/code&gt; when transitioning colors (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15690&quot;&gt;#15690&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add missing &lt;code&gt;main&lt;/code&gt; and &lt;code&gt;browser&lt;/code&gt; fields for &lt;code&gt;@tailwindcss/browser&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15594&quot;&gt;#15594&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Support escaping &lt;code&gt;*&lt;/code&gt; in theme namespace syntax (e.g.: &lt;code&gt;--color-\*: initial;&lt;/code&gt;) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15603&quot;&gt;#15603&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Respect &lt;code&gt;@theme&lt;/code&gt; options when resolving values in custom functional utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15623&quot;&gt;#15623&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard invalid variants (e.g. &lt;code&gt;data-checked-[selected=1]:*&lt;/code&gt;) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15629&quot;&gt;#15629&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;-outline-offset-*&lt;/code&gt; utilities are suggested in IntelliSense (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15646&quot;&gt;#15646&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Write to &lt;code&gt;stdout&lt;/code&gt; when &lt;code&gt;--output&lt;/code&gt; is set to &lt;code&gt;-&lt;/code&gt; or omitted with &lt;code&gt;@tailwindcss/cli&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15656&quot;&gt;#15656&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent &lt;code&gt;not-*&lt;/code&gt; from being used with variants that have multiple sibling rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15689&quot;&gt;#15689&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade (experimental)&lt;/em&gt;: Pretty print &lt;code&gt;--spacing(…)&lt;/code&gt; to prevent ambiguity (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15596&quot;&gt;#15596&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Use more modern &lt;code&gt;--alpha(color / 50%)&lt;/code&gt; syntax instead of &lt;code&gt;--alpha(color, 50%)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15665&quot;&gt;#15665&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.0] - 2025-01-21&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#new-high-performance-engine&quot;&gt;New high-performance engine&lt;/a&gt; — where full builds are up to 5x faster, and incremental builds are over 100x faster — and measured in microseconds.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#designed-for-the-modern-web&quot;&gt;Designed for the modern web&lt;/a&gt; — built on cutting-edge CSS features like cascade layers, registered custom properties with &lt;code&gt;@property&lt;/code&gt;, and &lt;code&gt;color-mix()&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#simplified-installation&quot;&gt;Simplified installation&lt;/a&gt; — fewer dependencies, zero configuration, and just a single line of code in your CSS file.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#first-party-vite-plugin&quot;&gt;First-party Vite plugin&lt;/a&gt; — tight integration for maximum performance and minimum configuration.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#automatic-content-detection&quot;&gt;Automatic content detection&lt;/a&gt; — all of your template files are discovered automatically, with no configuration required.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#built-in-import-support&quot;&gt;Built-in import support&lt;/a&gt; — no additional tooling necessary to bundle multiple CSS files.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#css-first-configuration&quot;&gt;CSS-first configuration&lt;/a&gt; — a reimagined developer experience where you customize and extend the framework directly in CSS instead of a JavaScript configuration file.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#css-theme-variables&quot;&gt;CSS theme variables&lt;/a&gt; — all of your design tokens exposed as native CSS variables so you can access them anywhere.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#dynamic-utility-values-and-variants&quot;&gt;Dynamic utility values and variants&lt;/a&gt; — stop guessing what values exist in your spacing scale, or extending your configuration for things like basic data attributes.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#modernized-p3-color-palette&quot;&gt;Modernized P3 color palette&lt;/a&gt; — a redesigned, more vivid color palette that takes full advantage of modern display technology.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#container-queries&quot;&gt;Container queries&lt;/a&gt; — first-class APIs for styling elements based on their container size, no plugins required.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#new-3d-transform-utilities&quot;&gt;New 3D transform utilities&lt;/a&gt; — transform elements in 3D space directly in your HTML.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#expanded-gradient-apis&quot;&gt;Expanded gradient APIs&lt;/a&gt; — radial and conic gradients, interpolation modes, and more.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#starting-style-support&quot;&gt;&lt;code&gt;@​starting-style support&lt;/code&gt;&lt;/a&gt; — a new variant you can use to create enter and exit transitions, without the need for JavaScript.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#not-variant&quot;&gt;not-* variant&lt;/a&gt; — style an element only when it doesn&#39;t match another variant, custom selector, or media or feature query.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4#even-more-new-utilities-and-variants&quot;&gt;Even more new utilities and variants&lt;/a&gt; — including support for &lt;code&gt;color-scheme&lt;/code&gt;, &lt;code&gt;field-sizing&lt;/code&gt;, complex shadows, &lt;code&gt;inert&lt;/code&gt;, and more.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Start using Tailwind CSS v4.0 today by &lt;a href=&quot;https://tailwindcss.com/docs/installation/&quot;&gt;installing it in a new project&lt;/a&gt;, or playing with it directly in the browser on &lt;a href=&quot;https://play.tailwindcss.com/&quot;&gt;Tailwind Play&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;For existing projects, we&#39;ve published a comprehensive &lt;a href=&quot;https://tailwindcss.com/docs/upgrade-guide&quot;&gt;upgrade guide&lt;/a&gt; and built an &lt;a href=&quot;https://tailwindcss.com/docs/upgrade-guide#using-the-upgrade-tool&quot;&gt;automated upgrade tool&lt;/a&gt; to get you on the latest version as quickly and painlessly as possible.&lt;/p&gt;
&lt;p&gt;For a deep-dive into everything that&#39;s new, &lt;a href=&quot;https://tailwindcss.com/blog/tailwindcss-v4&quot;&gt;check out the announcement post&lt;/a&gt;.&lt;/p&gt;
&lt;h2&gt;[4.0.0-beta.10] - 2025-01-21&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add support for using &lt;code&gt;@variant&lt;/code&gt; to use variants in your CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15663&quot;&gt;#15663&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Include &lt;code&gt;outline-color&lt;/code&gt; when transitioning colors (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15690&quot;&gt;#15690&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add missing &lt;code&gt;main&lt;/code&gt; and &lt;code&gt;browser&lt;/code&gt; fields for &lt;code&gt;@tailwindcss/browser&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15594&quot;&gt;#15594&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Support escaping &lt;code&gt;*&lt;/code&gt; in theme namespace syntax (e.g.: &lt;code&gt;--color-\*: initial;&lt;/code&gt;) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15603&quot;&gt;#15603&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Respect &lt;code&gt;@theme&lt;/code&gt; options when resolving values in custom functional utilities (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15623&quot;&gt;#15623&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard invalid variants (e.g. &lt;code&gt;data-checked-[selected=1]:*&lt;/code&gt;) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15629&quot;&gt;#15629&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;-outline-offset-*&lt;/code&gt; utilities are suggested in IntelliSense (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15646&quot;&gt;#15646&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Write to &lt;code&gt;stdout&lt;/code&gt; when &lt;code&gt;--output&lt;/code&gt; is set to &lt;code&gt;-&lt;/code&gt; or omitted with &lt;code&gt;@tailwindcss/cli&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15656&quot;&gt;#15656&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Prevent &lt;code&gt;not-*&lt;/code&gt; from being used with variants that have multiple sibling rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15689&quot;&gt;#15689&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;em&gt;Upgrade (experimental)&lt;/em&gt;: Pretty print &lt;code&gt;--spacing(…)&lt;/code&gt; to prevent ambiguity (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15596&quot;&gt;#15596&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Use more modern &lt;code&gt;--alpha(color / 50%)&lt;/code&gt; syntax instead of &lt;code&gt;--alpha(color, 50%)&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15665&quot;&gt;#15665&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Rename &lt;code&gt;@variant&lt;/code&gt; to &lt;code&gt;@custom-variant&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15663&quot;&gt;#15663&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Change &lt;code&gt;outline-hidden&lt;/code&gt; to set &lt;code&gt;outline-style: none&lt;/code&gt; except in forced colors mode (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15690&quot;&gt;#15690&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/a8c54acaba7d51875bd332163754fb8bc40939a4&quot;&gt;&lt;code&gt;a8c54ac&lt;/code&gt;&lt;/a&gt; Prepare v4.0.0 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15693&quot;&gt;#15693&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/8a97a6a8d989fa4574709a9a67ffcf3204f4c605&quot;&gt;&lt;code&gt;8a97a6a&lt;/code&gt;&lt;/a&gt; v4.0.0-beta.10 (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15691&quot;&gt;#15691&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4820f6bff82ce0206dfdb7f31e3f65dd37355b6d&quot;&gt;&lt;code&gt;4820f6b&lt;/code&gt;&lt;/a&gt; Transition &lt;code&gt;outline-color&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15690&quot;&gt;#15690&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/79f21a8f4575f70648428f1f6e98f48ae57adcbc&quot;&gt;&lt;code&gt;79f21a8&lt;/code&gt;&lt;/a&gt; Prevent &lt;code&gt;not-*&lt;/code&gt; from being used with variants with multiple sibling rules (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/1&quot;&gt;#1&lt;/a&gt;...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/4035ab0b76bc4ada1986898f32fa8f52f0a138af&quot;&gt;&lt;code&gt;4035ab0&lt;/code&gt;&lt;/a&gt; Implement &lt;code&gt;@variant&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15663&quot;&gt;#15663&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/a51b214c133da316583edd018102b236114a96ac&quot;&gt;&lt;code&gt;a51b214&lt;/code&gt;&lt;/a&gt; Use more modern &lt;code&gt;--alpha(color / 50%)&lt;/code&gt; syntax (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15665&quot;&gt;#15665&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/2f8c51774e6c6fa1e75bb54eef2624853ef80afe&quot;&gt;&lt;code&gt;2f8c517&lt;/code&gt;&lt;/a&gt; Ensure &lt;code&gt;-outline-offset-*&lt;/code&gt; utilities are suggested in IntelliSense (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15646&quot;&gt;#15646&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/528c848575cdf1dac7594c8277450f16a8b9794b&quot;&gt;&lt;code&gt;528c848&lt;/code&gt;&lt;/a&gt; Discard invalid variants such as &lt;code&gt;data-checked-[selected=1]:*&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15629&quot;&gt;#15629&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/2de644b20e202354e96d51f0e732408442994dcc&quot;&gt;&lt;code&gt;2de644b&lt;/code&gt;&lt;/a&gt; Remove &lt;code&gt;@property&lt;/code&gt; fallbacks for Firefox (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15622&quot;&gt;#15622&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/da2da51284280d131e1b8560dabdf04b6e75bfce&quot;&gt;&lt;code&gt;da2da51&lt;/code&gt;&lt;/a&gt; Resolve values in functional utilities based on &lt;code&gt;@theme&lt;/code&gt; options (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15623&quot;&gt;#15623&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.0/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/12

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.0 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/12.patch
https://github.com/Skogix/agent-gpt/pull/12.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/12
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/12@github.com&gt;
