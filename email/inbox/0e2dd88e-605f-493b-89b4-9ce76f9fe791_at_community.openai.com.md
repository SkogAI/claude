MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 24 Oct 2025 19:29:38 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <0e2dd88e-605f-493b-89b4-9ce76f9fe791@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fbd3a1dc67d_2b1e07c7060275e"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-10-17 19:17:40 UTC

83 New Topics
4454 New Users


  
  ### Popular Topics

    [Livestream today - OpenAI Browser ChatGPT Atlas @ 10 AM PT][2]

      Join us for OpenAI’s livestream 2025-10-21T17:00:00Z (UTC) 

  
    ![Introducing ChatGPT Atlas](https://us1.discourse-cdn.com/openai1/original/4X/7/5/0/75006b3b364cc75ed88ab144247b32f25a614440.jpeg)
  



Introducing our new browser, ChatGPT Atlas. 
Sam Altman, Will Ellsworth, Adam Fry, Ben Goodger, Ryan O’Rouke, Justin Rushing, and Pranav Vishnu introduce ChatGPT Atlas — our new browser. Now available globally on macOS. Windows, iOS, and Android are coming soon. 

Check out Sam Altman’s intriguing announcement on X: 


What could this livestream unveil? We’d love to hear your thoughts. 
Don’t miss out on this exciting opportunity to be among the first to find out!

    
    [Assistants v2 API still returning 429 “Rate Limit Exceeded” since Oct 7 — not resolved][3]

      Hi everyone, 
@OpenAI_Support I’m reopening this discussion because the Assistants v2 API 429 issue marked by community/support as resolved on Oct 7 still persists for my organization. 
Since Oct 7 (≈12:00 UTC), every request to the Assistants v2 endpoints instantly returns: 
{
  "error": {
    "message": "You've exceeded the rate limit, please slow down and try again later.",
    "type": "invalid_request_error",
    "code": "rate_limit_exceeded"
  }
}

even after hours of inactivity. 
:puzzle_piece: Environment


Organization ID: org-0WYw7rG1ZZogE3m4wuKjps70 


Project ID: proj_lOA2KbEo9QLis0pSgnXtsj34 


Billing: Paid Tier 3 (Pay-as-you-go, auto-recharge on, positive credit balance) 


Usage: Far below limits (~7 M tokens, 2 239 requests) 


Endpoints affected: 


POST /v1/threads/<id>/messages 


POST /v1/threads/<id>/runs 


POST /v1/threads/runs 




Endpoints working normally: 


/v1/chat/completions 


/v1/responses 


/v1/threads creation 




Occurs on all models (gpt-4o, gpt-...

    
    [400GB to Vector Store(s) + Assistant][4]

      We have 400GB of unique, already pared down and filtered data (large genomic). Trying to get this into a Vector Store attached to an Assistant. My understanding is 10K file limit and a 5MB file upload (attach) limit for Vector Stores. This is different than the 512MB limit for “Files”. Is my understanding correct? Is my need to break 400GB into 5MB files will require several Vector Stores to be created and attached to my Assistant due to the 10K file limit? Uploading via the API.

    
    [[BUG] SIP Realtime API - No Audio Output, Phantom Audio Input (Broken Oct 18-22, 2025)][5]

      OpenAI Realtime API SIP Audio Potentially Critical Bug Report
Date: October 22, 2025 
Affected Service: OpenAI Realtime API - SIP Integration 
Severity: Critical - Complete audio failure on SIP calls 
Status: Active bug affecting multiple users 

Executive Summary
OpenAI’s Realtime API SIP integration has a critical bug where SIP calls connect successfully and AI responses are generated (confirmed by transcripts and WebSocket events), but no audio is transmitted over the RTP stream to callers. The same codebase was working correctly on October 18, 2025 and stopped working sometime between then and October 22, 2025, with no changes to our implementation. 
This matches reports from other users in the OpenAI Developer Community experiencing identical issues in October 2025. 

Environment Details
Infrastructure

SIP Provider: SignalWire (SWML-based routing)
Platform: Railway (Node.js backend)
Region: US East
Network: Cloud-hosted (Railway infrastructure)

OpenAI Configuration

API Endpoint...

    
    [Introducing GPT-4o Transcribe Diarize: Now Available in the Audio API][6]

      GPT-4o Transcribe Diarize, a transcription model that identifies who’s speaking when, enables transcripts that clearly associate audio segments with individual speakers. This feature produces the new diarized_json response format, providing you with precise speaker labels along with segment start and end timestamps. 
What’s included: 

Automatic Speaker Identification: GPT-4o Transcribe Diarize automatically detects and labels different speakers, simplifying multi-speaker audio transcription.
Speaker Reference Clips: Optionally enhance accuracy by providing short (2–10 second) reference audio clips for up to four known speakers
API Endpoint: Available through /v1/audio/transcriptions in the Transcription API.

Speaker diarization has been frequently requested by our developer community; this feature represents a meaningful improvement to existing transcription tools. 
Check out the documentation and the API reference to get started and explore detailed examples. 
Looking forward to see...

    

  


  ### Popular Posts

    recursionrecursion1 - [Ethics of AI - Put your ethical concerns here][7]

    This is the Dev Forum… your philosophy better compile :face_with_raised_eyebrow:… :rofl::rofl::rofl:
    windysoliloquy - [The Official 4o and Dall-E image Megathread][8]

    ![ChatGPT Image Oct 18, 2025, 09_27_37 AM](https://us1.discourse-cdn.com/openai1/optimized/4X/a/6/8/a682205bc9a6f65ac6e4531f008694297152dfae_2_333x500.jpeg) 
 ![1000029551](https://us1.discourse-cdn.com/openai1/optimized/4X/1/c/4/1c4f34c3fdc9c669c6b05bdb8d31e491be04efa8_2_690x460.jpeg)
    hammergpt - [When or how to enable the ChatGPT Developer Mode UI components for Apps SDK?][9]

    Hey everyone! I’ve successfully resolved the widget rendering issue after extensive debugging. :rofl: Here’s what I found: 
The Root Cause
ChatGPT uses an event-driven mechanism to pass data to widgets, not pre-populated data. Many developers (including myself) initially assumed window.openai.toolOutput would be populated on load, but it’s actually updated asynchronously via custom events. 
The Solution
Use React’s useSyncExternalStore to subscribe to the openai:set_globals event: 
import { useSyncExternalStore } from "react";

const SET_GLOBALS_EVENT_TYPE = "openai:set_globals";

function useOpenAiGlobal<K extends keyof OpenAiGlobals>(key: K) {
  return useSyncExternalStore(
    // Subscribe to ChatGPT's data update event
    (onChange) => {
      const handleSetGlobal = (event: any) => {
        if (event.detail?.globals?.[key] !== undefined) {
          onChange(); // Trigger React re-render
        }
      };

      window.addEventListener(SET_GLOBALS_EVENT_TYPE, handleSetGlobal, {...
    _j - [Is Anyone Getting Slow Response or Internal Server Error?][10]

    The health screenshots don’t give me enough to conclude much more about volume other than this is likely a single-user scenario, with a period of no usage that would be atypical for having an established user base. 
But your comment does give rise to thoughts about ‘request rate’ - noting the routing by cache: 

The API endpoints routes to the same server based on if an initial hash of input tokens, about 256, matches prior requests or a specific formula.
If you have a deployed application that is always using the same large system prompt, it is going to employ this pinning to a server instance to increase your cache hits.
That also means parallel requests will be increasing the load you experience.

You have "prompt_cache_key" as another top-level parameter not to enhance this caching hit frequency, but to break up the routing by pattern. Its value is also included in the hashing. 

use a user ID, or even a chat session ID, and you will be signaling a preference for ‘chat’ caching, i...
    8coins - [Adding voice (Whisper) input support to ChatKit][11]

    Thank you for your quick response!


**New for you**

* [London DevDay Exchange 2025][12] - 2 - [Community]
* [Atlas Browser: Feature requests from the Developer Community][13] - 5 - [Community]
* [Agents SDK and workflow_id usage][14] - 1 - [API]
* [How to remove Sora 2 watermark?][15] - 5 - [Community]
* [Dynamic Access Token for the MCP inside the Agent Builder UI][16] - 1 - [API]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/livestream-today-openai-browser-chatgpt-atlas-10-am-pt/1363324
[3]: https://community.openai.com/t/assistants-v2-api-still-returning-429-rate-limit-exceeded-since-oct-7-not-resolved/1363305
[4]: https://community.openai.com/t/400gb-to-vector-store-s-assistant/1363219
[5]: https://community.openai.com/t/bug-sip-realtime-api-no-audio-output-phantom-audio-input-broken-oct-18-22-2025/1363498
[6]: https://community.openai.com/t/introducing-gpt-4o-transcribe-diarize-now-available-in-the-audio-api/1362933
[7]: https://community.openai.com/t/ethics-of-ai-put-your-ethical-concerns-here/1119333
[8]: https://community.openai.com/t/the-official-4o-and-dall-e-image-megathread/1230134
[9]: https://community.openai.com/t/when-or-how-to-enable-the-chatgpt-developer-mode-ui-components-for-apps-sdk/1362828
[10]: https://community.openai.com/t/is-anyone-getting-slow-response-or-internal-server-error/1363030
[11]: https://community.openai.com/t/adding-voice-whisper-input-support-to-chatkit/1362939
[12]: https://community.openai.com/t/london-devday-exchange-2025/1363310
[13]: https://community.openai.com/t/atlas-browser-feature-requests-from-the-developer-community/1363648
[14]: https://community.openai.com/t/agents-sdk-and-workflow-id-usage/1363213
[15]: https://community.openai.com/t/how-to-remove-sora-2-watermark/1363312
[16]: https://community.openai.com/t/dynamic-access-token-for-the-mcp-inside-the-agent-builder-ui/1363180
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/03fdf6b6d821742c2745ca2ff43afde620fbec21a7a4d4d00956599c38659a0c



