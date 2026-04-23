MIME-Version: 1.0
From: OpenAI Dev Digest <noreply@email.openai.com>
To: emil.skogsund@gmail.com
Date: Thu, 29 May 2025 23:40:24 +0000
Subject: New Responses API tools, RFT, Codex, Pokémon, and more
Message-ID: <8il55PTYTxqxOxNxJwB0UA@geopod-ismtpd-6>
Content-Type: multipart/alternative; boundary="04f92382eb3c0fee4defe96650d6cfc843fea01adff48ffcb51b87a138e4"

May’s been a busy month! We hope these latest releases arm you with even greater tools as you build with OpenAI.

---------------
Product updates
---------------

( https://x.com/OpenAIDevs/status/1925214121706086523 )

*New tools and features in the Responses API.* ( https://openai.com/index/new-tools-and-features-in-the-responses-api/ ) We’ve introduced three new built-in tools: remote MCP servers, image generation (with streaming and multi-turn edits), and Code Interpreter (to allow models to write Python or deeply understand images). We’ve also added new API features: background mode, reasoning summaries, and encrypted reasoning items. Watch the demo video. ( https://x.com/OpenAIDevs/status/1925214121706086523 )

( https://platform.openai.com/docs/guides/rft-use-cases )

*Reinforcement fine-tuning* ( https://platform.openai.com/docs/guides/rft-use-cases ) is now available with OpenAI o4-mini. RFT uses chain-of-thought reasoning and task-specific grading to improve model performance (which is especially useful for complex domains!). For example, Accordance used RFT and saw a 40% improvement for their tax and accounting purposes.

( https://github.com/openai/codex )

*Codex CLI* ( https://github.com/openai/codex ) , our local coding agent, now lets you sign in with ChatGPT to connect your API org. ChatGPT Plus and Pro users can redeem $5 and $50 in free API credits, respectively, for the next 2 weeks. We also released a new model for the CLI: codex-mini, which is optimized for low-latency code Q&A and editing. Eligible developers can opt in ( https://platform.openai.com/settings/organization/data-controls/sharing ) to help improve future OpenAI models with up to 10 million free tokens a day on traffic shared with OpenAI. Learn more ( https://help.openai.com/en/articles/10306912-sharing-feedback-evaluation-and-fine-tuning-data-and-api-inputs-and-outputs-with-openai#h_f2f71332e6 ).

And on sign in with ChatGPT, we’re looking for developers interested in integrating this capability into their own apps. If you’re interested, fill out this form ( https://openai.com/form/sign-in-with-chatgpt/ ).

( https://openai.com/index/introducing-codex/ )

*Codex* ( https://openai.com/index/introducing-codex/ ) , available now through ChatGPT, is our new software engineering agent that can work on many tasks in parallel. It independently navigates your codebase, implements and tests code changes, and proposes pull requests for you to review. Available to all Pro and Team users.

*Structured Outputs improvements.* ( https://platform.openai.com/docs/guides/structured-outputs ) Parallel function calling now works with strict mode, ensuring calls reliably adhere to schema. We’ve also added support for many more keywords, including output string lengths and formats via regex.

*Use Flex Processing for o3 and o4-mini savings.* ( https://platform.openai.com/docs/guides/flex-processing ) Simply add service_tier="flex" to your API calls and you can unlock dramatically lower prices in exchange for slightly longer latency. Flex Processing is perfect for batch jobs, evaluations, data enrichment, or any workload where immediate speed isn't critical.

--------------------
Around the community
--------------------

( https://www.twitch.tv/gpt_plays_pokemon )

*Watch o3 play Pokémon—live on Twitch.* ( https://www.twitch.tv/gpt_plays_pokemon ) ** See how o3 plans its next move, explains its reasoning, analyzes the map visually, and saves to memory. Built with the Responses API.

*OpenAI to Z Challenge.* ( https://openai.com/openai-to-z-challenge/ ) Use o3, o4-mini, or GPT-4.1 to discover previously unknown archaeological sites in the Amazon. The first place winner will receive $250,000 in a cash/API credits mix as well as funding to continue their work in collaboration with archaeologists.

-------------------
Developer resources
-------------------

* Updated prompt caching guide ( https://platform.openai.com/docs/guides/prompt-caching#how-it-works ) to explain how caching works
* Updated image gen guide ( https://platform.openai.com/docs/guides/tools-image-generation ) with streaming and multi-turn edits
* Build Hours ( https://webinar.openai.com/buildhours/ ) —learn how to build voice agents, use RFT and the Responses API

( https://community.openai.com/ )

Dev Forum

( https://twitter.com/OpenAIDevs )

Twitter

( https://www.youtube.com/@OpenAI?themeRefresh=1 )

YouTube

Unsubscribe ( http://url3243.email.openai.com/asm/unsubscribe/?user_id=20216706&data=2bQvTyLNAi9nkFGFKG4cNw4TwJFsWMfhm-dMQa4YjltoMDAwdTAwMFGqCmEJrf0DigduWyqjUpbzzodomIN744IAlqpBGiJLG2ok2VuqcN70l_C2FHEHVV3IusfWqE10IyewIjGAGiL2azRCE7Oa4qOGKDE3XEpiT-iTeyAgfRHj7o2He_Ud6cl8Iq4Kao3QSjpBV3z2XbPpgwAAclBO0TVzRt3C67Vu0EhiI62fhRj-76yVUsCXhJmPC2bFvLIxVC45meOtkAeKfzRFPRXbxV33PJsny_Mw6X9_FlmVIhtZl_Uk_dLIQE2QB1DsrvrUjSokw1Q2W-gz4k4cbO9flNKebrH07h_TpXQU7mNaAngwawThSvP-K_sHGjt4g3u50q1xsWspg8uy5J6AGllDg86wFu3NT03JOYj9nxZjVG8hEX-D3U8ayGAapxu8I84tvQPmdYNYZ9ib6qEuXv3Ff2TV01fyCYnRTBwMkn_L5hQMDj2Y7kLNmlueRDGZM8l4yAJPHdjVNr_I7PR5O1K9IsY7k8t8LeBwSUc2Xl82H1YGtWFwbgjc49Zwlw94WgCfiT8WK1NP8S4TfI2if2x9eTekgd5TTDuGNRElzNiIF2shLPBYDejgvkXMOdCKfK1xcVZgqX-hVpcUoNtSLT_u28ne-KJS_FZ3cTvba9KiajZeDyJvBgFu2D7aau3xf_RuoJjvVqey-S1SnWFD-PraVMIB5ZfI7xFFyaAa1AJXNSQx3c7y2hfe1mHerLsHOjXUfdNn99tXT8N_svFypx2sIoLQsZ9zEhhY8ZityYVTsARTRIlnuWijRvJgmAcxD2eZfNDpvH2Ke2vqj7yUK_4J40p5DVGD69Qbvu5sHLILUtV-dcz5JaJPd5cKAAJJsZPq9HSEmE4gZQb66kF1M0NgZ99O7d9rfCzGAVyZCoMQ9CA1YzA1dCJz-rAkRl-R0g6WZMOQLTwziYttBRItWHKXq_PVTu203gHG-En3eLUHTWh7EbnzteeyOPfVTuXT7KAzmpwRZCMWRMHr3R-SL9k_GZpPYyKOL_XGEkxBsQ4rdGp8dKKUSBRVn6eZMWsI_W_S0ojmPyXIp6G_X7lj_a1VUkYElwLjMUG5Yi8oeW5hgaZJujSN1pDsRHtkwam9NwzVF29y2hsmYNfKXnlqXgzdaVrw8iCgZ0ZJ )