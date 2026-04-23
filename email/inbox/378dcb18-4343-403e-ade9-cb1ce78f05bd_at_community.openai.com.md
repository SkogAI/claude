MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 20 Feb 2026 23:51:37 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <378dcb18-4343-403e-ade9-cb1ce78f05bd@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6998f389cc8f2_2a911581093676"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-02-13 23:46:06 UTC

23 New Topics
2695 New Users


  
  ### Popular Topics

    [Show: 2D game built using Codex and agent skills (zero code)][2]

      Hi everyone! 
After previously building a “flat” little 2D sandbox game level using Codex CLI and agent skills, I decided to truly step into a role of an agentic game designer and orchestrate a fully playable game level (once again, with Codex and agent skills). This time with all the bells and whistles! Tiles, enemies, sounds, music! 
You can play the game here. 
I also documented everything (and you can clone and run locally) here. 
I know you love takeaways, so I’m going to give you some takeaways: 

This was one of the most enjoyable experiences ever!
Applying harness engineering with progressive disclosure is incredibly powerful - I treated my SKILL.md as simply a ToC (a “skills map”) and took it from there
Implement -> Evaluate loops are key - I used Playwright and an evaluation checklist and the agent built and corrected automagically
I used PROGRESS.md as a memory/log mechanism for the agent, and a way to minimize context noise
The game dev agent was steered by the DESIGN-DOCUM...

    
    [MCP Apps open standard migration: still needing OpenAI extensions for CSP and widget state — expected?][3]

      Hello everyone, 
I recently migrated from an Apps SDK implementation to the MCP Apps open standard (Docs > MCP Apps compatibility in ChatGPT). 
My goal is to avoid any extra OpenAI extensions and stick purely to the MCP Apps spec, but I ran into two cases where that wasn’t possible: 

Issue 1 – Resources not shown after publishing 
I had to add the OpenAI-specific openai/widgetCSP declaration on top of the standard ui.csp block: 
"openai/widgetCSP": {
  // For ChatGPT's built-in widget hosting
  resource_domains: ["https://*.domain.com"]
}

…in addition to: 
ui: {
  csp: {
    resourceDomains: ["https://*.domain.com"]
  }
}

Without the openai/widgetCSP declaration, my resources were not displayed after publishing. 

Issue 2 – Widget loses state on page reload 
My widget did not render previously fetched results after a page reload. To fix this, I had to use the OpenAI setState extension: 
if (hasOpenAIExtensions()) {
  getOpenAIExtensions()?.setWidgetState({ toolOutput: data });
}


Q...

    
    [Model Fatigue? How to Ask Codex to Run a Subagent for a Subtask?][4]

      I am running an experiment to see whether Codex can read a bunch of reports and compile insights for each category. 
In AGENTS.md, I instructed Codex to organize the reports into categories and create one file per category. I also asked it to review each category file it created and produce insights for that category, following a scoring system (rubric) and the specific insight types and writing style I outlined. 
It organized the reports correctly and created the category files. However, the insights were very poor. 
If I take the same AGENTS.md prompt and feed ChatGPT exactly what Codex gathered, one category file at a time, the output is much better. The difference in quality is night and day. 
It seems like Codex is experiencing model fatigue, so I want to ask it to process one category at a time by spawning a sub-agent for each category rather than handling all categories in a single pass. 
Is there a way to do that? 
Thanks!

    
    [MCP App submission Scan tool not working][5]

      We are trying to set up our mcp app , the server only supports Streamable HTTP 
During scan tools , we have seen from our logs , that we don’t get a POST /mcp request 
This happens intermittently , sometimes tool scan works , sometimes it doesn’t , the initial calls for listing tools is not going to our server 
POST /mcp → This call is missing sometimes and we cant continue with app submission 
When scan tool is successful in network tab we can see an inspect call 
but when it fails there is no inspect call 
(https://api.openai.com/v1/dashapi/versions/asdk_app_v_[version]/mcp/inspect)

    
    [Codex features are prioritized by votes in GitHub issues tab][6]

      FYI 

We prioritize feature requests based on upvotes from the community. If a feature request doesn’t get enough upvotes, we’ll close it. It’s therefore important for a feature request to have a clear and compelling title and description. 
We also recommend that feature requests focus on the problem statement rather than a solution. Describe the use case and what problem you’d like to see solved. There are often multiple ways to address a given problem. 
Source 

Note: In GitHub feature request use tag enhancement 
The OpenAI GitHub Codex issues tab 


If you are reading this, then you are not in the OpenAI GitHub Codex issues tab, this is the OpenAI Developers Discourse forum, Codex category. 

To see the list by votes descending 
https://github.com/openai/codex/issues?q=is%3Aissue%20state%3Aopen%20sort%3Areactions-%2B1-desc 


Note: The list does not show the count of the votes for an enhancement, you need to open the issue to see the actual count. 

Top 10 (Feb 16 2026) 




#
Feat...

    

  


  ### Popular Posts

    polepole - [The Official ImageGen, 4o and Dall-E Megathread][7]

    ![1](https://us1.discourse-cdn.com/openai1/optimized/4X/5/0/6/5063a18b8d17ebca5877be4384c38f0ab81b9ff5_2_690x460.jpeg) 
 ![2](https://us1.discourse-cdn.com/openai1/optimized/4X/c/f/4/cf4da6b29c3d795f3faf0da6596ef328fe6d14eb_2_690x460.jpeg) 
 ![3](https://us1.discourse-cdn.com/openai1/optimized/4X/8/8/9/8891eecd6870c1da2dd518788d1bcb4f36b4f39d_2_690x460.jpeg) 
 ![4](https://us1.discourse-cdn.com/openai1/optimized/4X/4/4/9/44956431c41f615dd5e133f488b908b658ea19bc_2_690x460.jpeg) 
 ![5](https://us1.discourse-cdn.com/openai1/optimized/4X/2/a/7/2a7f43606bf2e34cc65af786d0fa777391a84aed_2_690x460.jpeg) 
 ![6](https://us1.discourse-cdn.com/openai1/optimized/4X/9/e/c/9ec8e3c996530f29f09ae84cdb121c8b0c879430_2_690x460.jpeg)
    polepole - [The Official ImageGen, 4o and Dall-E Megathread][8]

    ![5844522B-7819-4A2F-8E31-BA3FD54F40E2](https://us1.discourse-cdn.com/openai1/optimized/4X/3/0/b/30b14e6cc36f2f7e704210a28c45fa582e181570_2_333x500.jpeg) ![5D683251-DECD-4C31-9E0E-AE46DDE36C30](https://us1.discourse-cdn.com/openai1/optimized/4X/5/8/f/58fdd7ea3a62f04a03044d2196f545021cb5f01d_2_333x500.jpeg) 
 ![03](https://us1.discourse-cdn.com/openai1/optimized/4X/b/6/4/b6428acc6af7da41cc9741a15c93dc17521798fd_2_333x500.jpeg) ![04](https://us1.discourse-cdn.com/openai1/optimized/4X/8/3/8/8381e4c0b4759e8cc2541e265ea791fb7bf39c56_2_333x500.jpeg) 
 ![05](https://us1.discourse-cdn.com/openai1/optimized/4X/a/e/5/ae504d2386ce2aa306c5945f9b89c108a8c915a1_2_690x460.jpeg) 
 ![06](https://us1.discourse-cdn.com/openai1/optimized/4X/c/5/0/c5048ccfff717a832adc961bd772c9e9f8c22a91_2_690x460.jpeg) 
 ![07](https://us1.discourse-cdn.com/openai1/optimized/4X/b/2/4/b24b0df739b4d3101591fc2ba9ece669b2042d06_2_690x460.jpeg) 
 ![08](https://us1.discourse-cdn.com/openai1/optimized/4X/b/1/6/b16cc51fb17347d585...
    jeffvpace - [The Official ImageGen, 4o and Dall-E Megathread][9]

    Funny you should mention. There is a growing demand for AI art: 


I would love to sell some of my monstrosities to some twisted art lovers.
    _j - [The Official ImageGen, 4o and Dall-E Megathread][10]

    Looking directly at the stars: 
→ You see a 1:1 patch of sky (e.g. 1° by 1° of real sky in a 1° by 1° FOV). 


Looking at the JWST primary mirror reflection (from 500 m, off-axis): 
→ That same ~1° FOV is filled by the mirror, which is reflecting light from an angular region of the sky behind you of order tens of degrees (~50°). 


So: 

You see more of the sky, not less, within the same angular field of view when looking at the mirror’s reflection. 
It acts like a wide-angle “fisheye” reflector, compressing a big swath of the celestial sphere into a small angular patch in your view. 

Plus: can you see the telescope? JWST is shielded by a tennis-court sized solar sail shield. The telescope side of that shield is in the blackest black you might imagine, illuminated only by planets and stars on that side of the solar system. 
Then the sun is somewhere behind it, likely blinding you from even seen the absence of stars where the shield blocks starlight. Even Earth, a bit smaller than t...
    windysoliloquy - [The Official ImageGen, 4o and Dall-E Megathread][11]

    you know come to think of it, that is a photorealistic rendition of a known painting with some minor adjustments :thinking: 
Of course 1/3rd of my images don’t want to load in the library but- 
 ![ChatGPT Image Feb 17, 2026, 09_25_50 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/5/a/b/5abb0b3ded71ec66c3999318308c1e8a86e9abdf_2_690x460.jpeg) 
This one was trying to go for a prep scene that was older, like a memory, and the scene the guy was prepping for, like a photo realistic… it failed. 
 ![ChatGPT Image Feb 8, 2026, 04_12_07 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/7/0/a/70aae8895e1ff0fb21d3584645afccecc2644b98_2_333x500.jpeg) 
And I wouldn’t know where to find the input for this one right now, but it was supposed to be two styles… got all of the other contrasts right, but getting those two separate styles contained in one image is flakey… 
I didn’t worry about it too terribly much because the obvious workaround is to have an image generated on only half the s...


**New for you**

* [API-key specific rate and spending limits would be good][12] - 2 - [Feedback]
* [How is it cheaper: Codex credits or API?][13] - 5 - [Codex]
* [In_memory vs 24h caching; help please][14] - 4 - [API]
* [Widget uri versioning and app resubmission][15] - 4 - [ChatGPT Apps SDK]
* [OpenAI API and structured logging in Python][16] - 1 - [Community]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/show-2d-game-built-using-codex-and-agent-skills-zero-code/1374319
[3]: https://community.openai.com/t/mcp-apps-open-standard-migration-still-needing-openai-extensions-for-csp-and-widget-state-expected/1374446
[4]: https://community.openai.com/t/model-fatigue-how-to-ask-codex-to-run-a-subagent-for-a-subtask/1374247
[5]: https://community.openai.com/t/mcp-app-submission-scan-tool-not-working/1374513
[6]: https://community.openai.com/t/codex-features-are-prioritized-by-votes-in-github-issues-tab/1374249
[7]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[8]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[9]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[10]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/api-key-specific-rate-and-spending-limits-would-be-good/1374358
[13]: https://community.openai.com/t/how-is-it-cheaper-codex-credits-or-api/1374284
[14]: https://community.openai.com/t/in-memory-vs-24h-caching-help-please/1374388
[15]: https://community.openai.com/t/widget-uri-versioning-and-app-resubmission/1374584
[16]: https://community.openai.com/t/openai-api-and-structured-logging-in-python/1374262
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/c85d0f675a51b9812d8eaf10cd99b1b8020ccdb07cd694582802697f3fb7b81d



