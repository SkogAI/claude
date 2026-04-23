MIME-Version: 1.0
From: SearchApi <support@searchapi.io>
To: Emil <emil.skogsund@gmail.com>
Date: Thu, 07 Nov 2024 11:26:38 +0000
Subject: SearchApi Changelog: November
Message-ID: <e5uokn367vf7hpzdxdzu8h895e222bl@convertkit-mail2.com>
Content-Type: multipart/alternative; boundary="9d9380fa98fa38a2dfa94a04a67bf8d18c81f93d3ec02d5d25b3a4243acd"

Hey Emil,

Today, we're thrilled to update you with two new engines and a
range of fixes to existing engines. Here’s a detailed look at the
latest features and improvements and a glimpse of what’s coming
next.

-----------------------------------------------------------------
​DuckDuckGo API (
https://click.convertkit-mail2.com/e5uokn367vf7hpzdxdzu8h895e222bl/e0hph7h086z8r3f7/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvZHVja2R1Y2tnby1hcGk=
)​
-----------------------------------------------------------------

​
DuckDuckGo API is a new addition to the Google, Bing, and Baidu
SERP APIs. This API delivers data such as organic results, ads,
knowledge graphs, AI overviews, answer boxes, and many more. We
kept the JSON response keys consistent with the SERP engines to
make integration easier.

-----------------------------------------------------------------
​Apple App Store Reviews API (
https://click.convertkit-mail2.com/e5uokn367vf7hpzdxdzu8h895e222bl/7qh7h8horqernrt9/aHR0cHM6Ly93d3cuc2VhcmNoYXBpLmlvL2RvY3MvYXBwbGUtYXBwLXN0b3JlLXJldmlld3MtYXBp
)​
-----------------------------------------------------------------

​
Our new Apple App Store Reviews API works alongside the Google
Play Store Reviews API. It provides review ID, title, text,
rating, and additional review data. JSON keys are consistent with
Google Play for straightforward integration.

----------------------
🔧 Engine Improvements:
----------------------

Google Search API

* Updated `domains`, `gl`, and `hl` constants list.
* Adjusted `inline_images` selectors.
* Fixed `open_hours` in `knowledge_graph` and `answer_box`.
* Fixed `ads.sitelinks.expanded` selectors.
* Fixed `inline_videos.key_moments` selectors.
* Resolved rare issues when empty results were returned for valid
queries.

Google Lens API

* Resolved issues where invalid URL characters were causing some
searches to fail.

Google Maps API

* Added a new key - `place_result.located_in`.

Google Videos API

* Fixed an issue where tablet and mobile requests were failing.

Google Images API

* Fixed pagination issue.

Google Shopping API

* Fixed an issue where collapsed filters were not extracted.
* Resolved issues where searches in Japan & Canada were failing.

Amazon Search API

* Fixed an issue where `variants` were not parsed correctly.

Amazon Product API

* Fixed an issue where product specifications were not parsed
correctly.

YouTube API

* Fixed an issue where empty `hl` and `gl` values failed.

YouTube Transcripts API

* Added support for video links inside `video_id` parameter, for
example - `video_id=https://www.youtube.com/watch?v=RcYjXbSJBN8`.
We automatically extract the `video_id` now.
* Added a new parameter - `​transcript_type,` that defines the
transcript preference when both auto-generated and manually
uploaded transcripts are available.

YouTube Comments API

* Added `search_information`.
* Fixed `error` message if comments are disabled.

Other

* Shortened API examples in Google documentation.
* Added `subscription` details to Account API response (GET
`/api/v1/me?api_key=API_KEY`).

---------------------------
🚀 Performance Improvements:
---------------------------

We’ve upgraded our database to a larger instance, leveraging AWS
Graviton3 processors and upgrading PostgreSQL and Redis to the
latest versions. This upgrade, which required a brief 3-minute
downtime on October 3rd, scales our search capacity fourfold. In
the future, we may explore RDS Blue/Green deployments to minimize
downtime further. The result? Faster operations across API and
Web.

Next month, we’ll roll out 2x performance plans designed for
high-demand LLM use cases. Thanks to ongoing optimizations and
expanded proxy partnerships, these plans greatly boost speed and
reliability.

----------------------
⏭️ What's coming next?
----------------------

* Google AI Overview
* Google Flights API
* Google Hotels API
* Google Reverse Image API
* Yandex Search API
* Yahoo Search API
* 2x Performance plans
* Base64 image hosting on our side. This will shorten the LLM
context if you want to use raw JSON responses.

Stay tuned for more updates. As always, we're committed to
providing you with the best experience. If you have feedback or
questions, just hit reply.

Best Regards,

SearchApi Team

​Unsubscribe (
https://unsubscribe.convertkit-mail2.com/e5uokn367vf7hpzdxdzu8h895e222bl
) | Update your profile (
https://preferences.convertkit-mail2.com/e5uokn367vf7hpzdxdzu8h895e222bl
) | 376, 447 Broadway, New York, NY 10013