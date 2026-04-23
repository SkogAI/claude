MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Mon, 11 Aug 2025 13:37:16 +0000
Subject: SearchApi Changelog: August
Message-ID: <xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="6eadecdcf11132379b3c2f00b19a16a2feda3337d6193ce8b499f8ea6338"

Hey Emil,

Today, we're thrilled to update you on some of the newest
additions and give you a sneak peek into what’s coming next.

-----------------------------------------------------------------
​Google Images Light API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/dpheh0he79vk0eal/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLWltYWdlcy1saWdodC1hcGk=
)​
-----------------------------------------------------------------

Tested using the Regular Speed plan
A simplified version of the Google Images API that returns only
the essential data: image titles, thumbnails, source domains, and
original image links (mobile only). It delivers the same
structure as the Google Images API, making migration effortless.
Thanks to the reduced payload, it offers significantly faster
response times.

-----------------------------------------------------------------
​Google News Light API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/e0hph7h7n36e0qc7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZ29vZ2xlLW5ld3MtbGlnaHQtYXBp
)​
-----------------------------------------------------------------

Tested using the Regular Speed plan
A simplified version of the Google News API that returns only the
essentials: article titles, links, sources, publish dates,
snippets, and thumbnails. With the same JSON structure as the
Google News API, it’s easy to switch or scale. Optimized for
speed and simplicity.

-----------------------------------------------------------------
​LinkedIn Ad Library API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/7qh7h8h942q8ozc9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvbGlua2VkaW4tYWQtbGlicmFyeS1hcGk=
)​
-----------------------------------------------------------------

​
The LinkedIn Ad Library API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/7qh7h8h942q8ozc9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvbGlua2VkaW4tYWQtbGlicmFyeS1hcGk=
) provides structured access to sponsored content from LinkedIn
advertisers. Built for transparency and ad intelligence, it
offers:

* Ad Listings: Headlines, creatives (images), call-to-action
text, and destination URLs.
* Advertiser Details: Includes advertiser name, logo thumbnail,
and unique ad IDs.
* Ad Types: Supports both image and rich text formats from public
ad disclosures.

-----------------------------------------------------------------
​Reddit Ad Library API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/owhkhqhw8mpnr5hq/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvcmVkZGl0LWFkLWxpYnJhcnktYXBp
)​
-----------------------------------------------------------------

​
The Reddit Ad Library API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/owhkhqhw8mpnr5hq/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvcmVkZGl0LWFkLWxpYnJhcnktYXBp
) returns Reddit’s public ad archive data, enabling transparency,
creative research, and brand monitoring. It offers:

* Ad Listings: Headlines, CTAs, destination URLs, video/image
creatives, and post URLs.
* Targeting Context: Includes industry category, budget tier, ad
objective, and placement (e.g., feed, sidebar).
* Post Metadata: Captures Reddit-specific fields like profile_id,
subreddit link, and comment settings.
* Creator Insights: Each ad includes advertiser profile details
like username and avatar.
* Advanced Filters: Query by keyword, post type (e.g. VIDEO),
industry vertical, and placements.

-----------------------------------------------------------------
​Walmart Product API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/z2hghnhed2n735iz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3Mvd2FsbWFydC1wcm9kdWN0LWFwaQ==
)​
-----------------------------------------------------------------

​
The Walmart Product API (
https://click.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez/z2hghnhed2n735iz/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3Mvd2FsbWFydC1wcm9kdWN0LWFwaQ==
) delivers detailed, structured product data directly from
Walmart product pages. It offers:

* Product Details: Title, brand, price, UPC, product ID, seller,
and availability.
* Media & Descriptions: High-resolution images, short/long
descriptions, ingredients, and marketing highlights.
* Reviews & Ratings: Top positive and negative reviews, average
rating, total count, and review metadata.
* Fulfillment Options: Real-time delivery and pickup details with
expected dates and item limits.
* Variants & Attributes: Full variant trees (e.g. pack size),
unit pricing, subscription eligibility, and badges like “Best
Seller.”

JSON format matches our Amazon Product API for easier migration.

--------------------------------
YouTube Trends API is Deprecated
--------------------------------

The YouTube Trends API has been deprecated following YouTube’s
discontinuation of its Trending page in July 2025. This change
reflects a strategic shift toward personalized discovery, driven
by AI-based recommendations and genre-specific performance
charts.

* No Global Trending: The static, one-size-fits-all trending feed
has been retired.
* Personalized Surfacing: Content discovery is now tailored to
user preferences, location, and viewing history.
* New Creator Tools: YouTube is rolling out features to boost
visibility through contextual promotion rather than global
rankings.
* API Impact: The youtube_trends engine is no longer supported.

You can always contact us and let us know if you'd like us to add
or change something based on your specific use case.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Fixed a bug where ads.block_position = bottom_ads was
incorrectly extracted.
* Resolved extraction issues for organic_results.sitelinks.inline
on device=desktop.
* Fixed the extraction of organic_results.sitelinks.expanded on
device=mobile.

Google Lens API

* Fixed extraction for search_type=exact_matches.
* Fixed extraction for search_type=visual_matches and
search_type=products when used with the q request parameter.

Google Maps API

* Addressed a rare edge case that returned empty results.

Google Patents API

* Fixed extraction of organic_results.title,
organic_results.snippet, and organic_results.inventor.

Google Events API

* Added support for the chips request parameter.
* Fixed extraction of events.address and events.location.

Google Finance API

* Fixed a bug where the summary field returned no results.

Google Ads Transparency Center API

* Resolved an edge case that resulted in an error response.

Bing Search API

* Added initial support for advanced search operators, like site:
in the q parameter. Response time is currently high;
optimizations are in progress.

Amazon Product API

* Fixed extraction of product.coupon_text.

Naver Search API

* Fixed extraction of organic_results.title,
organic_results.link, organic_results.source, and
organic_results.sitelinks.inline.

----------------------
⏭️ What's coming next?
----------------------

* AI Overview
* Yandex Search API
* Google Place API
* Google News Portal API
* TikTok Ads Library API
* Google Maps Directions API
* Bing Images API
* Google Videos Light API
* OpenApi specs

Stay tuned for more updates! As always, we're committed to
providing you with the best experience. Got feedback or
questions? Just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez
) | Update your profile (
https://preferences.convertkit-mail2.com/xmueow706xf6hpw82mdu5h2pd5dllanh8w6ez
) | 376, 447 Broadway, New York, NY 10013