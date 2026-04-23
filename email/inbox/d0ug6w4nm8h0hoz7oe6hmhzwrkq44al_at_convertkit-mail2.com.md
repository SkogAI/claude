MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Tue, 17 Dec 2024 15:09:10 +0000
Subject: SearchApi Changelog: December 🎄
Message-ID: <d0ug6w4nm8h0hoz7oe6hmhzwrkq44al@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="aa2bd4f7f21d80119aad42be943c8fbbc435886493bbaf3712769860a164"

Hey Emil,

Here’s what’s new at SearchApi, along with a quick peek at what’s
coming next!

-----------------------------------------------------------------
✈️ Google Flights API (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/kkhmh6hlo8x22mik/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtYXBp
)​
-----------------------------------------------------------------

We’re excited to introduce the Google Flights API (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/kkhmh6hlo8x22mik/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtYXBp
). It delivers real-time flight data, including:

* Best flight options
* Price insights
* Airport details
* Departure and arrival times
* Flight duration
* Airline information
* In-flight amenities
* Carbon emission data
...and more!

------------------------
⚡ Amazon API Performance
------------------------

In November, we revamped our internal monitoring system to
analyze usage patterns across engines. This allowed us to
minimize spikes and stabilize the Amazon Search API. While
improvements are ongoing, we’re committed to optimizing all
engines further.

Amazon Search API Performance (2024 Nov - 2024 - December)
Furthermore, we’re confident about our upcoming Enhanced Speed
plans. After successful internal testing with select clients,
we’re rolling these out publicly next month.

-----------------------------------------------------------------
🛒 Google Shopping API (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/58hvh7hm456oolt7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXNob3BwaW5nLW5ldw==
) (November changes)
-----------------------------------------------------------------

Google has officially removed support for the old layout in
specific regions:

* United States: gl=us
* Canada: gl=ca
* New Zealand: gl=nz
* Australia: gl=au
* Japan: gl=jp​
...and several small territories (e.g., Norfolk Island: gl=nf).

Other regions continue to support the regular layout.

Parameter Updates:

* ​price_min (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/25h2hoh2q7m00ls8/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXNob3BwaW5nLW5ldyNhcGktcGFyYW1ldGVycy1maWx0ZXJzLXByaWNlLW1pbg==
) and price_max (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/qvh8h7hrl8k22zig/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXNob3BwaW5nLW5ldyNhcGktcGFyYW1ldGVycy1maWx0ZXJzLXByaWNlLW1heA==
) are now strictly applied in the new layout.
* When using the shoprs parameter:* Start with price_min and
price_max filters.
* Use shoprs with additional filters from the JSON response.
This ensures price filters are applied before further
refinements.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Fixed inline_videos missing keys: link, length, source,
channel.
* Fixed inline_tweets selectors.
* Fixed ads.phone and ads.thumbnail selectors.
* Fixed knowledge_graph.website and service_options selectors.

Bing Search API

* Fixed organic_results.sitelinks selectors.

DuckDuckGo API

* Fixed an issue causing server errors with the knowledge_graph
key.

Google Maps Reviews API

* Fixed reviews.user selectors.

Google Shopping API

* Extracted tbn images instead of base64 for shopping_results.
* Fixed price_min and price_max request parameters.

Amazon Search API

* Improved filters.text clarity (e.g., “Top Brands” filter).
* Decoded tracking links in organic_results.

Google Images API

* Fixed the parser for the new layout (keys remain unchanged).
* Fixed usage_rights request parameter values.

YouTube Search API

* Added new top-level keys: posts (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/g3hnh5h30eqoo9f3/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MveW91dHViZSNhcGktZXhhbXBsZXMtbGF0ZXN0LXBvc3Rz
) and people_also_search_for (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/9qhzhnhpeg533rbz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MveW91dHViZSNhcGktZXhhbXBsZXMtcGVvcGxlLWFsc28tc2VhcmNoLWZvcg==
).

Other

* Released Account API documentation (
https://click.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al/3ohphkh7kqp99lcp/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYWNjb3VudC1hcGk=
).
* Added OpenAPI schema for Google Search API

----------------------
⏭️ What's coming next?
----------------------

* Yahoo Search API
* Enhanced Speed plans ⚡
* Google AI Overview
* Google Hotels API
* Google Reverse Image API
* Yandex Search API
* Base64 image hosting on our side. This will shorten the LLM
context if you want to use raw JSON responses.
​

Stay tuned for more updates! We’re here to ensure you get the
best experience possible. Got feedback or questions? Just hit
reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al
) | Update your profile (
https://preferences.convertkit-mail2.com/d0ug6w4nm8h0hoz7oe6hmhzwrkq44al
) | 376, 447 Broadway, New York, NY 10013