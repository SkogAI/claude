MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Mon, 12 May 2025 12:34:22 +0000
Subject: SearchApi Changelog: May
Message-ID: <gku72ke3pdu5hlk776kcrh87eve99cm@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="3b80d4bcc9c4e6cfc74593d074776a15aa9008d9681402aa6c69d2a620c2"

Hey Emil,

We're pleased to share the latest additions and preview upcoming
features.

-----------------------------------------------------------------
​eBay Search API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/x0hph6hezl9nnktg/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZWJheS1zZWFyY2gtYXBp
)​
-----------------------------------------------------------------

​
​eBay Search API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/x0hph6hezl9nnktg/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZWJheS1zZWFyY2gtYXBp
) returns detailed product listings directly from eBay. Each
result includes:

* Item title, ID, and product link
* Price, original price, discount, and shipping cost
* Product condition and authenticity guarantee
* Ratings, reviews, and review links
* Buying format (e.g. Buy It Now), sponsorship status, and image
thumbnails
* Fields like number of watchers, items sold, free returns, and
price ranges
* Many more fields

We maintain a JSON structure close to the Amazon Search API for
easier integration.

-----------------------------------------------------------------
​Google Travel Explore API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/6qheh8hlwdnppzi9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyYXZlbC1leHBsb3JlLWFwaQ==
)​
-----------------------------------------------------------------

​
​Google Travel Explore API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/6qheh8hlwdnppzi9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyYXZlbC1leHBsb3JlLWFwaQ==
) gives you access to curated travel suggestions. Each result
includes:

* Destination name, country, and Knowledge Graph ID (kgmid)
* Cheapest flight details (airline, stops, duration, price)
* Average hotel cost per night
* Distance, coordinates, and optional driving time

-----------------------------------------------------------------
​Google Flights Location Search API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/58hvh7hg0zk552s7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtbG9jYXRpb24tc2VhcmNoLWFwaQ==
)​
-----------------------------------------------------------------

​
​Google Flights Location Search API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/58hvh7hg0zk552s7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtbG9jYXRpb24tc2VhcmNoLWFwaQ==
) returns rich, structured data for cities, airports, train
stations, and regions. Result includes:

* IATA airport codes
* City and airport names
* Geographic context and distances
* Knowledge Graph IDs (kgmid)

-----------------------------------------------------------------
​Google Hotels Autocomplete API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/qvh8h7hdv0o88mug/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWhvdGVscy1hdXRvY29tcGxldGUtYXBp
)​
-----------------------------------------------------------------

​
​Google Hotels Autocomplete API (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/qvh8h7hdv0o88mug/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWhvdGVscy1hdXRvY29tcGxldGUtYXBp
) delivers fast, intelligent suggestions as users type. Response
includes:

* Hotel names and addresses as the subtitle
* Knowledge Graph IDs (kgmid)
* Related user search queries to capture intent

Whether a user types “Hilton Hawaiian” or explores related
searches like “Hilton fireworks”, the API guides them toward
relevant, bookable destinations in real-time.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Fixed weather_results.
* Fixed discussions_and_forums selectors.
* Fixed local_results.images.
* Fixed local_news.
* Fixed inline_tweets.
* Fixed organic_results.sitelinks.
* Fixed from_sources_across_the_web on mobile.
* Fixed related_searches on mobile.
* Fixed knowledge_graph.address.
* Fixed top_stories.
* Fixed ads.middle_ads type.
* Fixed inline_shopping.
* Added nearby_events (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/9qhzhnhdxlzgg5fz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlI2FwaS1leGFtcGxlcy1uZWFyYnktZXZlbnRz
) block.

Bing Search API

* Fixed local_map.image.
* Fixed local_results.
* Added shopping_ads (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/3ohphkh3rn4qqkhp/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYmluZyNhcGktZXhhbXBsZXMtc2hvcHBpbmctYWRz
) block.

DuckDuckGo API

* Fixed knowledge_graph.related_topics.

Google Maps API

* Updated the ll (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/n2hohvhvgk6nn4s0/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLW1hcHMjYXBpLXBhcmFtZXRlcnMtZ2VvZ3JhcGhpYy1sb2NhdGlvbi1sbA==
) request parameter to support meters (m, counts as square
meters) instead of zoom (z).

Google Maps Place API

* Added place_result.is_entity_closed field.
* Added place_result.operational_status field.

Google Lens API

* Fixed a bug that returned empty results.
* Added safe_search (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/48hvhehm9n600osq/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWxlbnMjYXBpLXBhcmFtZXRlcnMtZmlsdGVycy1zYWZlLXNlYXJjaA==
) request parameter.

Google Shopping API

* Added more gl values for the new layout.
* Fixed an issue caused by the new Google anti-bot protection.

Google Product API

* Added product.configurations.options.is_current_product

Google Product Offers API

* Fixed an issue when empty offers were returned.

Amazon Search API

* Added search_information.has_no_results boolean for filtered
results cases.

Amazon Product API

* Added delivery_country (
https://click.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm/reh8hohm7ewq02b6/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYW1hem9uLXByb2R1Y3QjYXBpLXBhcmFtZXRlcnMtbG9jYWxpemF0aW9uLWRlbGl2ZXJ5LWNvdW50cnk=
) request parameter.
* Fixed product.buybox.fulfillment.fastest_delivery.text.

-----------------------
🎨 Frontend Improvements
-----------------------

* Removed gray borders in the documentation.

----------------------
⏭️ What's coming next?
----------------------

* Google Ads Transparency Center Advertiser Search API
* Meta Ads API
* LinkedIn Ads API
* Walmart API
* eBay Product API
* Amazon Offers API
* Google Events API
* AI Overview
* Yandex Search API
* OpenApi specs
* Infrastructure upgrades to improve scaling and lower latency.

Stay tuned for more updates! As always, we're committed to
providing you with the best experience. Got feedback or
questions? Just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm
) | Update your profile (
https://preferences.convertkit-mail2.com/gku72ke3pdu5hlk776kcrh87eve99cm
) | 376, 447 Broadway, New York, NY 10013