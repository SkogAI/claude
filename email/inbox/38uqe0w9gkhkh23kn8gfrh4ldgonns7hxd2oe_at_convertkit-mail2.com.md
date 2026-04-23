MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Thu, 02 Oct 2025 17:47:59 +0000
Subject: SearchApi Changelog: October & num=100
Message-ID: <38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="86252d553de521b0da8148dcdcce13c328b0972c35f3a8e8ceebf9d5a629"

Hey Emil,

Today, we're thrilled to update you on some of the newest updates
and give you a quick look at what’s coming next.

-----------------------------------------------------------------
​Google Rank Tracker API (num=100) (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/reh8hohmm2r227u6/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXJhbmstdHJhY2tpbmctYXBp
)​
-----------------------------------------------------------------

Google has deprecated the num parameter in standard search
requests, which disrupted rank trackers and made it unreliable to
fetch more than the default results. Our new Google Rank Tracker
API solves this by letting you retrieve up to 100 organic results
in a single request.

Highlights:

* Organic results – identical JSON keys and fields as the Google
Search API
* Flexible results control – specify how many results to return
(up to 100)
* Consistent structure – no integration changes required

Context​
As of September 11, 2025, Google began phasing out the num=100
parameter. Many SEO tools relying on it have shown gaps, inflated
impressions, corrections, or required multiple requests to
achieve the same output. Our API maintains the browser session
and returns 100 results by default (configurable), ensuring
uninterrupted rank tracking while others adapt.

-----------------------------------------------------------------
​Google AI Mode API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/08hwh9h22o5oowip/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFpLW1vZGUtYXBp
)​
-----------------------------------------------------------------

Google AI Mode
The Google AI Mode API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/08hwh9h22o5oowip/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWFpLW1vZGUtYXBp
) returns results from Google’s new AI-generated answers
interface (the “AI Overview” style results). The response
includes generated text blocks, references, and supporting
content, alongside regular search results. It provides:

* Text Blocks - Structured AI output, returned as paragraph,
header, code_blocks, unordered_list, etc. Each block contains the
generated content and optional reference_indexes mapping back to
sources.
* Markdown - Combined structured text blocks available as a
single markdown string.
* Reference Links - Sources cited by the AI, including title,
link, snippet, and source.
* Web Results - Standard organic search results (title, link,
displayed_link, source, snippet).
* Local Results - Place listings with position, title, link,
rating, reviews, price, type, address, and is_closed.
* Inline Shopping - Product listings with position, title, link,
rating, reviews, price, extracted_price, and optional original
pricing fields.

---------------------------------------------------
Google Product, Offers, Reviews, Specs APIs changes
---------------------------------------------------

The Google Product, Offers, and Reviews APIs have been migrated
to the new Google Shopping UI. Existing keys remain unchanged,
and behavior is consistent with previous versions. The separate
Google Product Specs API has been deprecated. All specifications
are now included in the Google Product response when using the
product_token parameter. Here are the latest changes for every
engine:

​Google Product API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/8ghqhohoo0v00xcl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXByb2R1Y3Q=
)​
-----------------------------------------------------------------

* product_id and prds parameters are still supported and continue
to return offers and essential product information.
* Use the product_token parameter from the Google Shopping API
for more detailed product data, including specifications,
variations, review_results, and more.
* All product specifications are now included directly in the
Product API (Specs API is no longer available).

​Google Product Offers API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/l2hehmhll0900otg/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXByb2R1Y3Qtb2ZmZXJz
)​
-----------------------------------------------------------------

* product_id and prds parameters are still supported and continue
to return offers.
* sort_by, durability, and filters request parameters are no
longer supported.
* Pagination update:* Page 1 returns up to 3 offers.
* Page 2+ returns up to 10 offers per page.

​Google Product Reviews API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/m2h7h5h33gpgg8cl/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLXByb2R1Y3QtcmV2aWV3cw==
)​
-----------------------------------------------------------------

* Only the product_token parameter (from the Google Shopping API)
is supported.
* rating parameter remains unchanged.
* sort_by parameter remains unchanged.
* filters_token parameter is deprecated.

​

-----------------------------------------------------------------
​Yandex Search API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/e0hph7h77pgppqh7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MveWFuZGV4LWFwaQ==
)​
-----------------------------------------------------------------

​
The Yandex Search API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/e0hph7h77pgppqh7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MveWFuZGV4LWFwaQ==
) returns rich, mixed-result SERPs from Yandex. It provides:

* Knowledge Graph – Entity cards with title, description, source
(name/link), attributes (e.g., birth date, height,
relationships), profile links, and images.
* Ads – Paid listings with position, title, tracking_link,
destination link, domain, displayed_link, snippet, and optional
sitelinks.
* Organic Results – Web results with position, title, link,
domain, displayed_link, snippet, and cached_page_link when
available.
* Inline Images – Image results embedded in the web SERP, each
with title, original image (link/height/width), and thumbnail.
* Inline Videos – Video previews with position, title, link,
source, channel, duration, views, date, and thumbnail image.

JSON keys are kept the same as in the Google Search API.

-----------------------------------------------------------------
​Bing Videos API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/7qh7h8h99k7kkzb9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYmluZy12aWRlb3MtYXBp
)​
-----------------------------------------------------------------

​
The Bing Videos API (
https://click.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe/7qh7h8h99k7kkzb9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYmluZy12aWRlb3MtYXBp
) returns video search results from Bing, with structured data
for videos, ads, and recommendations. It provides:

* Video Results – Each video includes position, title, link,
snippet (description), length, source (e.g., YouTube), date,
channel, views, and a thumbnail.
* Shorts – Compact video results in short format, with position,
title, link, channel, views, duration, and thumbnail.
* Suggestions – Related search topics with quick-access links and
preview thumbnails for refining the query.
* Ads – Sponsored video listings with position, title, link,
tracking_link, displayed_link, snippet, sitelinks (extra links),
and extensions (additional highlights).

JSON keys are kept the same as in the Google Videos API.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Fixed answer_box keys when type=currency_converter.

Google Images API

* Fixed an issue where the first page did not return images.

Google Lens API

* Fixed support for search_type=all requests.
* Added support for an additional Google Lens layout.

Google Shopping API

* Added include_favicon request parameter.
* Added new Sort By values in filters.
* Updated product_link and offers_link paths to match the new UI
format.

Google Flights API

* Fixed a case where passing a kgmid value prevented flights from
being returned.

Google Ads Transparency Center API

* Fixed an issue where empty responses were returned.

Amazon Offers API

* Fixed an issue where pagination was incorrectly included on the
last page.

Google Play Store API

* Added a new layout for searching for specific apps.
* Added organic_results.logos key.

Google Play Product API

* Fixed product.description key.

Baidu Search API

* Fixed pagination.next key.

DuckDuckGo API

* Improved request reliability.

----------------------
⏭️ What's coming next?
----------------------

* Google AI Overview API
* Google Place API
* Google News Portal API
* Google Maps Directions API
* TikTok Profiles API
* TikTok Video Transcripts API
* Facebook Business Page API
* Instagram Profile API
* Walmart Reviews API

Stay tuned for more updates! As always, we're committed to
providing you with the best experience. Got feedback or
questions? Just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe
) | Update your profile (
https://preferences.convertkit-mail2.com/38uqe0w9gkhkh23kn8gfrh4ldgonns7hxd2oe
) | 376, 447 Broadway, New York, NY 10013