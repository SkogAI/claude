MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 05 Dec 2025 21:11:30 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <3bdcae64-c1c3-4db7-8c07-42c979617ae3@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69334a8218663_2ad62864483825e"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-11-28 21:01:13 UTC

48 New Topics
3965 New Users


  
  ### Popular Topics

    [Apps SDK Confirm action button disappeared / stopped showing][2]

      I’ve been testing my app today in Dev Mode and the confirm/deny action buttons when sending a request stopped rendering. 
At the same time some bugs in ChatGPT (like message history disappearing) happened so I’m hoping that it is a small bug/quirk that will be fixed soon. 
Wanted to see if anyone else is experiencing it? Attached photo shows the bug: 
 ![Screenshot 2025-12-02 at 2.14.57 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/5/b/5/5b5adeb9a7632a581546093a6e8292c63f263611_2_690x171.png)

    
    [Persistent, Structured Memory Strategies][3]

      Hi all, if this is the wrong place for this topic, I appreciate you pointing me in the right direction, thanks! 
My end goal is to have ChatGPT store, modify, analyze and update tabular data in a way that allows for real-time retrieval in future sessions.  To start, my use case is a dosage log for some medicine I take daily.  The log records the date/time, amount (ml), source, and notes.  ChatGPT faithfully created this log in the format I requested, saying that it was stored in some hidden, persistent structured data warehouse, and I’ve been reciting my dosages every day, it has maintained this table. 
But after two months of data, the familiar feeling of little errors (like when you’ve lost old context) creeped in.  So I looked a little deeper and it seems like ChatGPT doesn’t have any kind of hidden structured data store at all, at least not one that the user can do anything with.  All of my log entries have been stored in prose, in the memory feature, along with instructions on the...

    
    [How stable is ChatGPT’s published egress IP ranges for Apps?][4]

      The Apps SDK documentation says - here: 
”A frequent question is how your MCP server can confirm that a request actually comes from ChatGPT. Today the only reliable control is network-level filtering, such as allowlisting ChatGPT’s published egress IP ranges.” 
However, this list of IPs seems to be ever changing, with just a creation timestamp to show the latest file update. The frequent changes makes allowlisting this egress IPs pointless and breaks the app/connector. 
How reliable is this list? How often does it get updated? 
What is your proposed solution to keep our MCP server allowlist updated with the changes?

    
    [Chat Completion responses suddenly returning malformed or inconsistent JSON][5]

      Starting this morning, the Chat Completion API has begun returning malformed or inconsistent JSON. 
I am using gpt-4o-2024-11-20 with JSON-style responses. My prompts have not changed, but the model is now intermittently returning JSON objects with: 


Missing dictionary keys 


Keys placed at the wrong level 


Keys spelled differently between requests 


A different structure from the one it was reliably producing until now 


The specific issue varies by request. And sometimes the response is just fine. 
Expected output format (what has always been returned):
{
    "object": {
        "key1": "REDACTED",
        "key2": "REDACTED",
        "key3": "REDACTED"
    }
}


Example of the malformed output (starting today):
{
    "key2": "REDACTED",
    "object": {
        "key1": "REDACTED"
    },
    "key3": "REDACTED"
}


In other cases, the keys are spelled differently or appear in unexpected positions. 
Has something recently changed on the model or API side that could cause previousl...

    
    [Future AI Hardware: What’s the First “Hit” Going to Be?][6]

      What do you think future AI hardware will look like? We’ve had a few misses so far. What will be the first “hit”? 

  
    ![25 Innovative Tech Products From The 1970s That FAILED Miserably!](https://us1.discourse-cdn.com/openai1/original/4X/e/d/7/ed7bcbe8c7966acac472acbbb237d90142a508be.jpeg)
  



  
    ![Your New "AI FRIEND" is a DISASTER Product](https://us1.discourse-cdn.com/openai1/original/4X/7/7/a/77aa8a311b4f8eaeeeabca3c3309679e3f75c363.jpeg)
  



  
    ![$30,000,000 AI Is Hiding a Scam](https://us1.discourse-cdn.com/openai1/original/4X/d/e/2/de290d5ab5909b7ff13ff4f59d0dfbae6b30f4e1.jpeg)
  



  
    ![In conversation: OpenAI's Sam Altman and LoveFrom's Jony Ive with Laurene Powell Jobs | #ECDemoDay](https://us1.discourse-cdn.com/openai1/original/4X/b/9/a/b9a54cbb712c3bbc4c9af65b25304c19cf506bc8.jpeg)

    

  


  ### Popular Posts

    OpenAI_Support - [Apps SDK Confirm action button disappeared / stopped showing][7]

    Hey Everyone, Our engineering team is taking a look into this issue. We will provide and update very soon. Thank you!
    jjjulllesss - [Show us what you’re building with the ChatGPT Apps SDK 🚀][8]

    :christmas_tree: Day 3 - Advent of ChatGPT Apps :christmas_tree:
App name: 14ers 
One-liner: Essential guide for preparing for the ascent of Colorado’s 14ers, matching mountains and routes to your skill level and weather forecasts.​ 
Who it’s for / problem it solves: Outdoor enthusiasts planning Colorado peak ascents, solving route selection, and weather forecast for safe, personalized hikes. 
Key features: 


Explore and filter 14ers mountains and routes. 


Real-time weather forecasts for optimal ascent days. 


How it uses the Apps SDK / what UI you’re rendering in ChatGPT: 

Map with the mountains
Mountain card with navigation to get the routes and weather
List of routes
Carousel with weather information

Stack & tools: Python with widgets in React. The app is hosted on Alpic, backed by Supabase for the database and UI components serving. 
Link(s): 


Live demo: 14ers.alpic.live 


Code: jjjulllesss/14ers-mcp-openai-apps
    Pedro_Rodrigues1 - [Show us what you’re building with the ChatGPT Apps SDK 🚀][9]

    :christmas_tree: Day 2 - Advent of ChatGPT Apps :christmas_tree: 
App name: Study Buddy :books: 
One-liner: Your personal language tutor that creates custom flashcards for learning Spanish, French, German, Italian, and Portuguese 
Who it’s for / problem it solves: Travelers and language learners who want personalized vocabulary practice. Solves the friction of traditional language learning apps that force you into rigid, one-size-fits-all curricula—instead, you simply tell ChatGPT what you want to learn and get instant, contextual flashcards. 
Key features: 

Multi-language support across 5 European languages :spain::france::germany::italy::portugal:
⁠Adaptive difficulty levels (beginner, intermediate, advanced)
⁠Topical organization (food, travel, business, greetings…)
⁠Interactive flip cards with progress tracking

How it uses the Apps SDK / what UI you’re rendering in ChatGPT: Renders interactive flashcard widgets directly in the chat interface. Users can flip cards, mark progress, ...
    Uday_Kakade - [Show us what you’re building with the ChatGPT Apps SDK 🚀][10]

    :christmas_tree: Day 4 - Advent of ChatGPT Apps :christmas_tree: 
App name: MarketFlux  :chart_decreasing: 
One-liner: Real-time stock & crypto prices, analysis, news, comparisons, and more. 
Who it’s for / problem it solves: Instead of juggling across different tabs and dashboard, users can experience stock and crypto market with ChatGPT’s AI-powered capablities. 
Key features: 


⁠Real-time prices & comprehensive analysis 


Compare stock & crypto (Up to 5) 


⁠Instant news & top headlines 


Stack & tools: Typescript mono-repo bootstrapped from alpic-ai/apps-sdk-template with MCP server SDK and React. Using skybridge framework for convenient hooks and HMR with Vite. Hosted on Alpic. 
How it uses the Apps SDK / what UI you’re rendering in ChatGPT: Renders interactive flashcard widgets directly in the chat interface. 
Link(s): 


Try it for yourself: marketflux.alpic.live 


⁠Check out the source code on GitHub at udaykakade25/marketflux
    fredisterik - [Show us what you’re building with the ChatGPT Apps SDK 🚀][11]

    :christmas_tree: Day 1 - Advent of ChatGPT Apps :christmas_tree:
App name: Time’s Up :joker: 
One-liner: Draw a card, give clues, make ChatGPT guess your word 
Who it’s for / problem it solves: Anyone who wants to play word-guessing games with ChatGPT. Solves the fundamental problem of vanilla ChatGPT: without actual cards, there’s nothing stopping either player from changing their word mid-game or claiming they had a different one all along. 
Key features: 

Deck of word cards across 5 languages (:gb: :fr: :it: :es: :portugal: )
ChatGPT genuinely can’t see the word it’s guessing, User can’t change its word mid-game - no cheating

How it uses the Apps SDK / what UI you’re rendering in ChatGPT: Uses a widget to display cards drawn from the app. Word is packaged in the meta property in tool responses—making the word visible to the UI but completely invisible to the model. ChatGPT calls another tool to check if each guess is correct, creating true information asymmetry. 
Stack & tools: Ty...


**New for you**

* [GPTs are no longer following instructions][12] - 5 - [GPT builders]
* [Why do window.openai.locale and _meta["openai/locale"] return different locale values?][13] - 1 - [ChatGPT Apps SDK]
* [Is "Background" stable for heavy usage?][14] - 3 - [API]
* [ChatGPT Apps Stop Taking User Input][15] - 1 - [ChatGPT Apps SDK]
* [GPT-5.1-Codex-Max is now available in the API][16] - 5 - [Announcements]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/apps-sdk-confirm-action-button-disappeared-stopped-showing/1368176
[3]: https://community.openai.com/t/persistent-structured-memory-strategies/1368069
[4]: https://community.openai.com/t/how-stable-is-chatgpt-s-published-egress-ip-ranges-for-apps/1368080
[5]: https://community.openai.com/t/chat-completion-responses-suddenly-returning-malformed-or-inconsistent-json/1368077
[6]: https://community.openai.com/t/future-ai-hardware-what-s-the-first-hit-going-to-be/1368105
[7]: https://community.openai.com/t/apps-sdk-confirm-action-button-disappeared-stopped-showing/1368176
[8]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[9]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[10]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[11]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[12]: https://community.openai.com/t/gpts-are-no-longer-following-instructions/1367957
[13]: https://community.openai.com/t/why-do-window-openai-locale-and-meta-openai-locale-return-different-locale-values/1367978
[14]: https://community.openai.com/t/is-background-stable-for-heavy-usage/1368364
[15]: https://community.openai.com/t/chatgpt-apps-stop-taking-user-input/1367961
[16]: https://community.openai.com/t/gpt-5-1-codex-max-is-now-available-in-the-api/1368399
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/d39b62734a23289b0c09e0b635db42a88a80c6a10e354ce44cef02c4e6b83f6e



