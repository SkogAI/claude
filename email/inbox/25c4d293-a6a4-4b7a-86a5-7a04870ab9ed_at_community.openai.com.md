MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 10 Oct 2025 19:08:29 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <25c4d293-a6a4-4b7a-86a5-7a04870ab9ed@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e959ace9172_2ad5cc5b071573f"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-10-03 18:57:49 UTC

82 New Topics
5015 New Users


  
  ### Popular Topics

    [Saying Goodbye and Thank You to Edwin Arbus][2]

      The time has come to say goodbye to @edwinarbus, OpenAI’s Developer Community Lead. 
During his time, Edwin helped bring greater clarity and focus to the forum, keeping developer needs front and center, whether it involved API guidance or Coding with ChatGPT. He promoted a culture of mutual support, personally helping community members navigate challenging issues directly in the forum and in the background. Staff involvement also increased notably during his tenure, highlighted by memorable events such as the Christmas AMA hosted by the Developer Relations team. Thanks to these combined efforts from Edwin, the broader OpenAI team, and our community members, the forum has continued to grow as a friendly, supportive, and developer-focused space. 
Beyond his professional achievements, Edwin has been wonderful to work with—friendly, encouraging, and genuinely committed to supporting developers who build with OpenAI. 
Thank you, Edwin! You will be missed and we wish you health, happiness, a...

    
    [Custom MCP connector no longer showing all tools as enabled][3]

      With all the current changes that seem to be happening on a daily basis, my custom MCP connector now shows all my tools, with the exception of the Deep Research search and fetch, as being unavailable. 
It shows the actions in the list, but they’re all greyed out. 
 ![image](https://us1.discourse-cdn.com/openai1/original/4X/7/2/c/72ccd252a323489d5d242ed3aedec176a03d5981.png) 
The connector has not changed, and it works when testing the live connector. 
I’ve tried disconnecting/reconnecting and deleting/recreating, but it doesn’t help. 
Can anyone suggest what might be going on? 
Cheers

    
    [How to get started with Agent Builder][4]

      Christina Huang from OpenAI guides you through Agent Builder—a new visual tool to create agentic workflows. Drag and drop nodes, connect tools, and publish your workflows with ChatKit and the Agents SDK. https://platform.openai.com/agent-builder 

  
    ![Intro to Agent Builder](https://us1.discourse-cdn.com/openai1/original/4X/e/2/f/e2f469b945e9609bd1ac8d7b18a0fe042b8ad7cc.jpeg)

    
    [DevDay [2025] is here! First look at the shipments inside!][5]

      The official page for DevDay [2025] has been updated with all deliveries. 
https://openai.com/devday/ 
Below is the stream of posts and messages leading up to the event. 

We’re expecting a shipload of exciting API updates today. 

Sam Altman kicks off DevDay 2025 with a keynote to explore ideas that will challenge how you think about building. Join us for announcements, live demos, and a vision of how developers are reshaping the future with AI. 

For everyone who couldn’t make it to San Francisco in person there will be a live stream. 
If you’re attending on-site, feel free to share your impressions here — @Foxalabs is one of ours at the event today! 
Let’s watch the stream together and share thoughts as the announcements roll in: 
2025-10-06T17:00:00Z (UTC) 
:backhand_index_pointing_right: https://openai.com/live/ 
This topic will be updated throughout the day. 
Yesterday’s Twitter announcement: 

Link to the announcement topic

    
    [Sora 2 API - Video Generation Stuck in in_progress State][6]

      Hi Everyone 
I started 2 video generation jobs around 7 hours ago, one on sora-2 and one on sora-2-pro, and both of the jobs are still stuck in the in_progress state, 7 hours later. 
I was billed for them within minutes of starting the job, so they’ve been paid for but no result… 
Any idea how I can get them across the line? 
Below is the CURL result: 
{ 
“object”: “list”, 
“data”: [ 
{ 
“id”: “video_68e44ae5f84c…, 
“object”: “video”, 
“created_at”: 1759791846, 
“status”: “in_progress”, 
“completed_at”: null, 
“error”: null, 
“expires_at”: null, 
“model”: “sora-2”, 
“progress”: 100, 
“remixed_from_video_id”: null, 
“seconds”: “12”, 
“size”: “1280x720” 
}, 
{ 
“id”: “video_68e44718a2b…”, 
“object”: “video”, 
“created_at”: 1759790873, 
“status”: “in_progress”, 
“completed_at”: null, 
“error”: null, 
“expires_at”: null, 
“model”: “sora-2-pro”, 
“progress”: 100, 
“remixed_from_video_id”: null, 
“seconds”: “12”, 
“size”: “1280x720” 
}, 
{ 
“id”: “video_68e43788033c…”, 
“object”: “video”, 
“...

    

  


  ### Popular Posts

    vb - [DevDay [2025] is here! First look at the shipments inside!][7]

    
    bsunter - [Custom MCP connector no longer showing all tools as enabled][8]

    My MCP server works in the playground, claude, and MCP inspector, but not ChatGPT, so this looks like a bug. Seeing the same grayed out and no tools in developer mode.
    dhananjay1405 - [Custom MCP connector no longer showing all tools as enabled][9]

    Same here for me. Tools were working till couple of days with on/off switch, but started appearing greyed out. 
 ![ChatGPT](https://us1.discourse-cdn.com/openai1/optimized/4X/8/6/2/862fa6f3a15b4455550e76329f7bd1795ecb047f_2_556x500.png) 
Previously it was showing me WRITE and disabled, but managed to remove WRITE by adding annotation JSON as below 
annotations: {
  readOnlyHint: true,
  openWorldHint: false
}

But tools disabled / grayed out issue still persists. 
Request to Open AI team to inspect issue from their back-end and resolve this, as the same tools are working perfectly in Claude AI. It will be nice to have custom MCP support in ChatGPT too, being preferred choice of end-users.
    roy24x7 - [Sora 2 API - Video Generation Stuck in in_progress State][10]

    Yes , hit the same issue yesterday on agent. Several pipeline runs got stuck at progress 100% for individual scenes. 
See this task ID for example - video_68e5b1cb755081918b0c51027a44494a050546e42aa64899 
Stuck at progress 100% since last hour. 
{ 
“id”: “video_68e5b1cb755081918b0c51027a44494a050546e42aa64899”, 
“object”: “video”, 
“created_at”: 1759883723, 
“status”: “in_progress”, 
“completed_at”: null, 
“error”: null, 
“expires_at”: null, 
“model”: “sora-2-pro”, 
“progress”: 100, 
“remixed_from_video_id”: null, 
“seconds”: “8”, 
“size”: “1792x1024” 
} 
Currently working around to force the task to expire if created_at > 20 min ago. :saluting_face:
    dhananjay1405 - [Custom MCP connector no longer showing all tools as enabled][11]

    @Rich_Jeffries  Even I am on Plus subscription, but I do not encounter workspace error at all. ChatGPT is able to call the tools smoothly without any error. Only issue left is tools are greyed out (but internally they are enabled). 
Maybe you should check the oAuth section of your code. I remember that when I had tested my MCP server in Claude AI, I did not return client_secret in my HTTP POST “/register“ section. But the same code did not worked for ChatGPT. Then I introduced client_secret property in JSON object and it started working for ChatGPT 
{
    client_id: clientId,
    client_name: clientName,
    client_secret: clientSecret,
    redirect_uris: redirectUris
  }

Above is JSON response where you can see client_secret. To my surprize, Claude AI ignored client_secret where-as ChatGPT required it as mandatory (I asked ChatGPT to fix my code)


**New for you**

* [Chatkit Session Create - Where is "openai.chatkit.sessions.create"?][12] - 14 - [API]
* [DevDay 2025: Apps SDK, Sora 2, GPT-5 Pro, AgentKit, new image generation and speech-to-speech mini models, and more][13] - 4 - [Announcements]
* [OpenAI Realtime API SIP REFER Endpoint Returns 500 Internal Server Error][14] - 20 - [Bugs]
* [Tokens of Appreciation — milestone awards for OpenAI API token usage][15] - 4 - [Community]
* [Service degradation affecting API, ChatGPT and Sora][16] - 3 - [Community]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/saying-goodbye-and-thank-you-to-edwin-arbus/1361178
[3]: https://community.openai.com/t/custom-mcp-connector-no-longer-showing-all-tools-as-enabled/1361121
[4]: https://community.openai.com/t/how-to-get-started-with-agent-builder/1361280
[5]: https://community.openai.com/t/devday-2025-is-here-first-look-at-the-shipments-inside/1361200
[6]: https://community.openai.com/t/sora-2-api-video-generation-stuck-in-in-progress-state/1361307
[7]: https://community.openai.com/t/devday-2025-is-here-first-look-at-the-shipments-inside/1361200
[8]: https://community.openai.com/t/custom-mcp-connector-no-longer-showing-all-tools-as-enabled/1361121
[9]: https://community.openai.com/t/custom-mcp-connector-no-longer-showing-all-tools-as-enabled/1361121
[10]: https://community.openai.com/t/sora-2-api-video-generation-stuck-in-in-progress-state/1361307
[11]: https://community.openai.com/t/custom-mcp-connector-no-longer-showing-all-tools-as-enabled/1361121
[12]: https://community.openai.com/t/chatkit-session-create-where-is-openai-chatkit-sessions-create/1361276
[13]: https://community.openai.com/t/devday-2025-apps-sdk-sora-2-gpt-5-pro-agentkit-new-image-generation-and-speech-to-speech-mini-models-and-more/1361279
[14]: https://community.openai.com/t/openai-realtime-api-sip-refer-endpoint-returns-500-internal-server-error/1360937
[15]: https://community.openai.com/t/tokens-of-appreciation-milestone-awards-for-openai-api-token-usage/1361639
[16]: https://community.openai.com/t/service-degradation-affecting-api-chatgpt-and-sora/1361588
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/0632d015f7dbb1278d8d4087c4bf6a16cdfa065b06516379a21eb1e3717b450b



