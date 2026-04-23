MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Thu, 13 Feb 2025 13:36:23 +0000
Subject: SearchApi Changelog: February
Message-ID: <xmueow706xf6hpp8464t5h28exlllcn@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="b44f1dee94078327e2eeb4c81dcd28e1f93aa2bd75b3401b52e74ed1dcbb"

Hey Emil,

Today, we're thrilled to update you on some of the newest
enhancements and give you a sneak peek into what’s coming next.

-----------------------------------------------------------------
​Naver Search API (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/9qhzhnhp7wngpdhz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvbmF2ZXItYXBp
)​
-----------------------------------------------------------------

​
The Naver Search API has joined our expanding SERP API family
alongside Google, Bing, Baidu, and more. It delivers rich data,
including:

* Organic results
* Ads
* Knowledge graphs
* Local results
* Inline images
* Inline shopping
* Inline videos
* Related questions
* Top stories
* Blogs
* Questions and answers
* Discussions and forums

To simplify integration, the JSON response keys are consistent
across all our supported SERP engines.

-----------------------------------------------------------------
​Google Trends Trending Now API (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/3ohphkh7wmvq74sp/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyZW5kcy10cmVuZGluZy1ub3ctYXBp
)​
-----------------------------------------------------------------

​
This release deprecates Google Trends Trending Daily API (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/n2hohvh3dqen3rc0/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyZW5kcy10cmVuZGluZy1kYWlseQ==
) and replaces Google Trends Trending Realtime API.

The Google Trends Trending Now API provides real-time trending
search topics. It provides:

* Trending search queries
* Search volume estimates
* Percentage increases in interest
* Associated categories
* Trending locations
* Related keywords
* Active trend status & start date

You can track trends across different timeframes, including the
past 4 hours, 24 hours, 48 hours, and 7 days. Whether you're
monitoring breaking news, analyzing search interest, or
integrating trends into your app, this API gives you a clear
picture of what people are searching for right now.

---------------------------------------------
Google Requires Javascript for Search Results
---------------------------------------------

As of January 16, 2025, Google now requires JavaScript to display
search results. This change impacts users with JavaScript
disabled, including those relying on accessibility tools or using
certain SEO rank-checking solutions. Google claims this move will
improve search result quality and protect against bots and spam.

​
📖 Read More:TechCrunch Article (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/48hvhehrolk0rksq/aHR0cHM6Ly9wcmV2aWV3LmNvbnZlcnRraXQtbWFpbDIuY29tL2NsaWNrL2RwaGVoMGh6aG0vYUhSMGNITTZMeTkwWldOb1kzSjFibU5vTG1OdmJTOHlNREkxTHpBeEx6RTNMMmR2YjJkc1pTMWlaV2RwYm5NdGNtVnhkV2x5YVc1bkxXcGhkbUZ6WTNKcGNIUXRabTl5TFdkdmIyZHNaUzF6WldGeVkyZ3Y=
)​

This update caused disruptions across the SERP API industry,
affecting most providers. SearchApi, however, is fully equipped
to handle JavaScript-based scraping. Our system integrates
headless browser technologies and advanced proxy management to
ensure reliable, high-performance data delivery, even under these
new constraints.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Added knowledge_graph.is_entity_closed and operational_status
to handle permanently and temporarily closed cases.
* Added support for a new layout for
organic_results.rich_snippets.extensions.
* Added a check to ensure pagination.next is not returned if the
next page has no results.
* Added new parsing field - perspectives (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/wnh2hghwz78rwmsl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlI2FwaS1leGFtcGxlcy1wZXJzcGVjdGl2ZXM=
).
* Fixed knowledge_graph.description and
knowledge_graph.open_hours selectors.
* Fixed organic_results.video selectors.
* Fixed local_ads selectors.
* Fixed things_to_do selectors.

Bing Search API

* Added knowledge_graph field for business entities.
* Added default values for request parameters: language=en and
country_code=US.
* Fixed tracking_link decoding in specific cases.
* Fixed search_information.total_results extraction.
* Fixed related_questions selectors.
* Fixed about_this_result selectors.
* Fixed knowledge_graph.website and knowledge_graph.open_hours
selectors.

DuckDuckgo Search API

* Added validation for the maximum allowed characters in the q
request parameter.

Yahoo Search API

* Added a fix for ads.assets.structured_snippet.
* Added a fix for inline_images extraction.
* Added knowledge_graph for business entities.

YouTube Search API

* Added a fix for results starting at position=2 instead of
position=1.

Google Lens API

* Fixed exact_matches extraction.
* Added a new request parameter q (
https://click.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn/reh8hoh08dnq04b6/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWxlbnMjYXBpLXBhcmFtZXRlcnMtc2VhcmNoLXF1ZXJ5LXE=
), allowing image searches with a query.

Google Shopping API

* Fixed the issue where shopping_results.thumbnail would not
return any images.
* Fixed typo shopping_ads.installment.extracted_cost_per_moth and
shopping_results.installment.extracted_cost_per_moth, corrected
it to extracted_cost_per_month. Both cases are currently
supported, but extracted_cost_per_moth will be removed next
month.

Google Product API

* Fixed typo in offers.installment, correcting
extracted_cost_per_moth to extracted_cost_per_month. Both cases
are currently supported but extracted_cost_per_moth will be
removed next month.

Google Product Reviews API

* Added the new filters key and the filter_token request
parameter.

Google Images API

* Fixed pagination in the unique cases.

Google Jobs API

* Fixed pagination when the location request parameter is used.

Google Flights API

* Added more cases to booking_options.baggage_prices.

----------------------
⏭️ What's coming next?
----------------------

* Google Flights Calendar API
* Google Hotels API
* Enhanced Speed plans ⚡
* Yandex Search API
* Google AI Overview
* Google Ads Transparency API
* Base64 image hosting on our side. This will shorten the LLM
context if you want to use raw JSON responses.
* Infrastructure upgrades to improve scaling and lower latency.

Stay tuned for more updates. We're always working to improve
SearchApi for you. Got feedback? Just hit reply!

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn
) | Update your profile (
https://preferences.convertkit-mail2.com/xmueow706xf6hpp8464t5h28exlllcn
) | 376, 447 Broadway, New York, NY 10013