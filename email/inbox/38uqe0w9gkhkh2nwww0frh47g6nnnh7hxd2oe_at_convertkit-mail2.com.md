MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Tue, 10 Jun 2025 15:33:26 +0000
Subject: SearchApi Changelog: June
Message-ID: <38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="aed0c28a9247f2558d2b00d6051f6b4e2258085ad17dc62f849465b5f697"

Hey Emil,

Here’s what’s new across our APIs, infrastructure, and what’s
coming next.

-----------------------------------------------------------------
​Google Light API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/8ghqhohopgxgedhl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWxpZ2h0LWFwaQ==
)​
-----------------------------------------------------------------

​
A stripped-down version of the Google Search API returning only
core results: organic listings, knowledge graph, answer boxes,
and related questions. Thanks to the reduced payload, it delivers
faster responses and lower latency. Ideal for LLM integrations
and content retrieval workflows.

------------------------------------
Performance & infrastructure updates
------------------------------------

We’ve made backend upgrades to scale more efficiently, improve
response times, and prepare for significantly higher traffic.

* Infrastructure scaling tested up to 5k QPS
* API caching added
* Removed all DB-level write/read locks
* Deeply profiled the API to remove any bottlenecks
* Next milestone: 10k QPS test this month
* Work included multiple weekend sprints. We're happy with the
results.

Google Search API Performance Improvements

​
Amazon Product API Performance Improvements

​

-------------------------------------
Zero retention mode (Enterprise only)
-------------------------------------

A high-compliance mode available via zero_retention=true (custom
Enterprise contracts only).

* A special parameter on our side enables ZDR mode.
(zero_retention=true)
* Request parameters are held in memory only.
* HTML and JSON are deleted after response is built.
* No logs at application, infrastructure, or subprocessor level
* Continous Integration (CI) checks on every commit that identify
data retention regressions
* Manual infrastructure audits added for safety

For debugging, send zero_retention=false and we’ll log & save in
the usual way.

-----------------------------------------------------------------
​eBay Product API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/vqh3hrho3ndn2ruw/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZWJheS1wcm9kdWN0LWFwaQ==
)​
-----------------------------------------------------------------

​
​eBay Product API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/vqh3hrho3ndn2ruw/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZWJheS1wcm9kdWN0LWFwaQ==
) returns detailed product information, including:

* Item title, ID, and seller details.
* Price, shipping costs, location, and delivery estimates.
* Condition, authenticity guarantee, and return policy.
* Payment methods and installment plans.
* Ratings, reviews, and review histograms.
* Product specifications (RAM, battery, connectivity, etc.).
* Item description and images.
* “People also viewed”, “Similar items”, and other sections.
* Seller’s store profile and popular categories.

JSON format matches our Amazon Product API for easy migration.

-----------------------------------------------------------------
​Amazon Offers API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/l2hehmhlvozo59cg/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYW1hem9uLW9mZmVycy1hcGk=
)​
-----------------------------------------------------------------

​
​Amazon Offers API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/l2hehmhlvozo59cg/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYW1hem9uLW9mZmVycy1hcGk=
) returns detailed offers for a specific ASIN from Amazon,
including:

* Price, original price, and discount information.
* Offer position and buy box winner status.
* Condition (new, used, like new, etc.).
* Fulfillment details (standard and fastest delivery, shipping
source, and seller).
* Prime eligibility and third-party seller info.
* Quantity restrictions (min/max order quantities).
* Seller ratings, reviews, and store details.

Structure mirrors our Amazon APIs.

-----------------------------------------------------------------
​Google Events API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/dpheh0hewqmqzlhl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWV2ZW50cy1hcGk=
)​
-----------------------------------------------------------------

​
​Google Events API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/dpheh0hewqmqzlhl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWV2ZW50cy1hcGk=
)returns detailed event listings from Google, including:

* Event title, date, time, and venue details.
* Location information and event address.
* Event description and ticketing links.
* Venue ratings and reviews.
* “People also viewed” events and related content.
* Seller links for tickets (Spotify, Eventbrite, StubHub, etc.).

JSON matches Google Search API’s events block.

-----------------------------------------------------------------
​Google Ads Transparency Center Ad Details API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/e0hph7h7wk2k9rt7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFkLWRldGFpbHMtYXBp
)​
-----------------------------------------------------------------

​
​Google Ads Transparency Center Ad Details API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/e0hph7h7wk2k9rt7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFkLWRldGFpbHMtYXBp
) provides detailed information about Google Ads campaigns,
including:

* Ad format (e.g., video, image, text).
* Topic, first and last shown dates, and region-level data.
* Audience selection and targeting parameters.
* Variations of ad creatives, headlines, and descriptions.
* Thumbnail, video, and display links for each ad creative.
* Video details (YouTube video ID, duration, aspect ratio,
channel name).

-----------------------------------------------------------------
​Google Ads Transparency Center Advertiser Search API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/7qh7h8h9p0m0vxh9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFkdmVydGlzZXItc2VhcmNoLWFwaQ==
)​
-----------------------------------------------------------------

​
​Google Ads Transparency Center Advertiser Search API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/7qh7h8h9p0m0vxh9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFkcy10cmFuc3BhcmVuY3ktY2VudGVyLWFkdmVydGlzZXItc2VhcmNoLWFwaQ==
) delivers information on advertisers linked to search queries,
including:

* List of advertisers (name, ID, region, verified status).
* Number of ads currently active for each advertiser.
* Verified and non-verified advertiser status.
* Top associated domains.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Fixed inline_shopping selectors.
* Added kgmid (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/owhkhqhwl4743eaq/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlI2FwaS1wYXJhbWV0ZXJzLXNlYXJjaC1xdWVyeS1rZ21pZA==
) request parameter.
* Added a unique ad case with block_position=bottom for Google.
* Added shopping_ads.block_position=right case.
* Added local_news (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/z2hghnhero8o9gtz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlI2FwaS1leGFtcGxlcy1sb2NhbC1uZXdz
) block.

Bing Search API

* Added block_position=right ads.
* Added top_stories (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/p8heh9h459l93kur/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYmluZyNhcGktZXhhbXBsZXMtdG9wLXN0b3JpZXM=
) block.
* Added AI-generated local_results.
* Fixed an issue that caused Bing Search API to return an error.

Baidu Search API

* Fixed organic_results selectors.
* Fixed inline_images selectors.

Google Scholar API

* Added organizations (
https://click.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe/x0hph6hednlnrrug/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXNjaG9sYXIjYXBpLWV4YW1wbGVzLW9yZ2FuaXphdGlvbnM=
) block.

Google Scholar Profiles API

* Removed mauthors request parameter; replaced with org_id.
* Profiles can no longer be retrieved, as this data is now behind
a login wall.

Google Jobs API

* Fixed an issue that caused empty results.

Google Lens API

* Fixed an issue that caused visual_matches to return empty
results.

Google Shopping API

* Fixed shopping_results selectors.
* Added more gl values for the new layout.
* Fixed shopping_results.price selectors.

Amazon Search API

* Fixed organic_results.fulfillment selectors.

----------------------
⏭️ What's coming next?
----------------------

* LinkedIn Ad Library API
* Facebook Ad Library API
* Walmart Search API
* Walmart Product API
* Google Shopping Light API
* AI Overview
* Yandex Search API
* Google Maps Directions API
* OpenApi specs
* MCP server
* Infrastructure & performance improvements

Stay tuned for more updates! As always, we're committed to
providing you with the best experience. Got feedback or
questions? Just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe
) | Update your profile (
https://preferences.convertkit-mail2.com/38uqe0w9gkhkh2nwww0frh47g6nnnh7hxd2oe
) | 376, 447 Broadway, New York, NY 10013