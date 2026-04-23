MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Tue, 11 Mar 2025 12:04:24 +0000
Subject: SearchApi Changelog: March
Message-ID: <p9ug6pm72lh9h22pmm4bqhpn5o333hr@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="dfee4aaccdda00a4dd66f479a4aab10f58710c7555319749cdd64deb98e1"

Hey Emil,

Today, we're thrilled to update you on some of the newest
enhancements and give you a sneak peek into what’s coming next.

-----------------------------------------------------------------
​Google Flights Calendar API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/vqh3hrho293m30sw/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtY2FsZW5kYXItYXBp
)​
-----------------------------------------------------------------

​
We've expanded our Google Flights support by adding the Google
Flights Calendar API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/vqh3hrho293m30sw/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtY2FsZW5kYXItYXBp
). This API provides structured fare insights to help users find
the best travel deals with ease. The API delivers key data,
including:

* Departure and return dates
* Prices for different date combinations
* Lowest available flights
* No-flight indicators

The Google Flights Calendar API works with our Google Flights
API, delivering structured pricing data in a consistent JSON
format across our travel search engines.

-----------------------------------------------------------------
​Google Ads Transparency API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/m2h7h5h3k6020pcl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFwaQ==
)​
-----------------------------------------------------------------

​
​Google Ads Transparency Center API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/m2h7h5h3k6020pcl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFwaQ==
) helps you track ads, see where they appear, and learn more
about advertisers. The API delivers key data, including:

* Advertiser details (name & ID)
* Domain
* When ads appeared (first & last seen dates)
* Ad format (text, image, or video)
* Image of an ad
* A direct link for more details

Whether you're tracking market trends, ensuring ad compliance, or
just curious about online ads, this API gives you the insights
you need—all in a structured JSON format.

-----------------------------------------------------------------
​Google Trends Trending Now News API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/e0hph7h793wmw8i7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyZW5kcy10cmVuZGluZy1ub3ctbmV3cy1hcGk=
)​
-----------------------------------------------------------------

​
The Google Trends Trending Now News API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/e0hph7h793wmw8i7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyZW5kcy10cmVuZGluZy1ub3ctbmV3cy1hcGk=
) helps you find news articles related to trending search topics
in real-time.

This API works with the Google Trends Trending Now API (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/7qh7h8h9v2pdpnc9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXRyZW5kcy10cmVuZGluZy1ub3ctYXBp
) and requires a news_token for access. It provides structured
JSON data for tracking trending news articles.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Added a new optimization_strategy (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/z2hghnhe92r5rzcz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlI2FwaS1wYXJhbWV0ZXJzLW9wdGltaXphdGlvbg==
) query parameter. optimization_strategy=ads allows us to offer
the best ad scraping rate in every country. Tradeoff is a slight
latency increase.
* Added support for new Events block layout.
* Fixed knowledge_graph.offers selectors.
* Fixed ads.sitelinks selectors.
* Added new field latest_posts.
* Fixed knowledge_graph.people_also_search_for selectors.
* Fixed ads.products selectors.

Google Shopping API

* Fixed shopping_results.delivery selectors.
* Added a new key shopping_results.delivery_return.

Google Product & Google Product Offers API

* Added new key offers.details.
* Fixed key offers.durability.

Google Flights API

* Added show_hidden_flights (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/p8heh9h4kw5r5vhr/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtYXBpI2FwaS1wYXJhbWV0ZXJzLWZpbHRlcnMtc2hvdy1oaWRkZW4tZmxpZ2h0cw==
) request parameter.
* Added show_cheapest_flights (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/25h2hoh3rp0le0a8/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWZsaWdodHMtYXBpI2FwaS1wYXJhbWV0ZXJzLWZpbHRlcnMtc2hvdy1jaGVhcGVzdC1mbGlnaHRz
) request parameter.
* Fixed a bug with arrival_id and departure_id when passed with
kgmid location.

Google Lens API

* Fixed an issue where search_type=exact_matches and
search_type=all returned empty results.

Google Patents API

* Fixed the countries request parameter.

Apple Top Charts API

* Fixed cases when top charts were not parsed correctly.

Google Images API

* Added new request parameter - aspect_ratio (
https://click.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr/g3hnh5hm78ogkzi3/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWltYWdlcyNhcGktcGFyYW1ldGVycy1maWx0ZXJzLWFzcGVjdC1yYXRpbw==
).
* Fixed pagination issue.

YouTube Video API

* Fixed comment.total selectors.

Google Play Product

* Fixed reviews and similar_products selectors.

----------------------
⏭️ What's coming next?
----------------------

* Google Hotels API
* Google Hotels Property API
* Google Travel Explore API
* Google Ad Creative Details API (expanding Transparency Center
API)
* Yandex Search API
* Google Flights Autocomplete API
* Enhanced Speed plans ⚡
* Base64 image hosting on our side. This will shorten the LLM
context if you want to use raw JSON responses.
* Infrastructure upgrades to improve scaling and lower latency.

Stay tuned for more updates! As always, we're committed to
providing you with the best experience. Got feedback or
questions? Just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr
) | Update your profile (
https://preferences.convertkit-mail2.com/p9ug6pm72lh9h22pmm4bqhpn5o333hr
) | 376, 447 Broadway, New York, NY 10013