MIME-Version: 1.0
From: "Jeff Harris, OpenAI" <noreply@email.openai.com>
To: emil.skogsund@gmail.com
Date: Fri, 21 Mar 2025 00:29:23 +0000
Subject: New audio models in the API
Message-ID: <1el_oizuRk-UJ03BbNg-aw@geopod-ismtpd-29>
Content-Type: multipart/alternative; boundary="8ff607dc1ef6ce4c60bf9577a77f9432bd3328c51ec5f32c2562e63af285"

OpenAI Logo ( https://openai.com/ )

Hello,

Thanks for using OpenAI’s audio models. Today, I’m excited to share that we have three new audio models in the API ( https://platform.openai.com/docs/guides/audio ). They offer significant improvements in speech-to-text and text-to-speech capabilities, making it possible to build more powerful, customizable, and intelligent voice agents that can act as true conversational partners. We’re also updating our Agents SDK to support the new models, making it possible to convert any text-based agent into an audio agent with a few lines of code.

Speech-to-text
--------------

You can now use `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` in use cases ranging from customer service voice agents to transcribing meeting notes. We’ve added bidirectional streaming so you can stream audio in, and get a stream of text back. And the streaming API supports built-in noise cancellation and a new semantic voice activity detector so you can opt for transcriptions only when the user has finished their thought (useful for building voice agents!). These models outperform Whisper, offering better accuracy and performance. For more, check out our docs ( https://platform.openai.com/docs/models#transcription ).

Text-to-speech
-------------

With the new `gpt-4o-mini-tts` model, you can precisely control the tone, emotion, and speed of generated voices, creating more natural and engaging experiences. Starting with 10 preset voices, you can use prompts to customize speech for specific scenarios. This enables a wide range of use cases, from more empathetic and dynamic customer service voices to expressive narration for creative storytelling experiences. We’ve also built OpenAI.fm ( https://OpenAI.fm ) , a demo where you can try our new TTS model under our beta terms. You can read the docs ( https://platform.openai.com/docs/models/gpt-4o-mini-tts ) to get started.

Agents SDK updates
------------------

You can now add audio capabilities to text agents by including speech-to-text and text-to-speech endcaps with just a few lines of code. To get started, visit the Agents SDK docs ( https://platform.openai.com/docs/guides/voice-agents ).

With these new models, we want to give you more choices in how you build voice agents. If you already have a text-based agent or have a voice agent powered by speech-to-text and text-to-speech pipeline, using the new models with the Agents SDK is the best way to get started. If you’re looking to build low-latency speech-to-speech experiences, we recommend building with our speech-to-speech models in the Realtime API. You can read more about these new models in our blog, and if you have any questions, please feel free to join our developer forum ( https://community.openai.com/t/new-audio-models-in-the-api-tools-for-voice-agents/1148339 ).

Best,
Jeff Harris
OpenAI API TPM

Jeff Harris, OpenAI

1960 Bryant Street , San Francisco , CA 94110

Unsubscribe ( http://url3243.email.openai.com/asm/unsubscribe/?user_id=20216706&data=D6M-GWgpc7XJSuXOrU9AHCLXOwqT0oWpgYjnNfImleFoMDAwdTAwMHN1Jz6qkt5xqJeRDmnt5UW9RZFcDjwbj7F2Jr87rZUUsAzb8U47Ju_MijWIl2b67cdwZ8piXlULYScXk6vLbxVIMG0dgtZfaQ77vkzYjyNm6WWBoCP_LdIF36ShxK8hjByJMvPz0TatMZMi_14yiAVsQkHwF2k1dRoWU6U_evuv0ZNSLFmu68sYyikoVtyhzN52XLuS2p0GIOptkhRw56hRsSUy5Qb7whL3NKVrS2bViG6u2SNPWAFzGMk7w1izFsHc-KWDpVb4l7j2QQyi0Fabc9MNQCre9cXkwu0gf5aU_8m8a-gsX6jitShUzKesg3Oi5MRDfZ3m2UsbSgJLkebkW4xnL3J16f8LUvGdbFIJm4vJBCSihHaV8bSKFk3uM-tgE52z3fFY-cJYiGxXlUsC-RsShgFiUxjrZd9Nchoc6KRFR1x5lI5R8eswrAxE0GdANf5oOXfYTl0aS9cSj-1YnEMHeEYcSIBRZWW9qIqBR96irSpE3XgYRVq3VbUa_LJjJttw6WIhJgxZBwIbg0Vacxvt7QJTDI3ujtl99U5TrVJKBQnTjE17Kfqotb42EujrCD7qLSjHrDazhEwRD6ZrICMXF_8jV11Jon7M4DZWUjFeVRPojMxj-bCr4QknnTpDUSloNgZVQjpVIVCLfBlYR973C99tR6NUlczy3vmaEf7zJsA3w0dVif2WiDBzaEVpf2C219gyEwAbqDxIJDgsxvu8to7i4y6nvvz0IYEjbE7_qYIlSB10IFTSHsyFIitPZqV3DfzkVze28bejO8SzFmIKNHo2BXE-nAdgzAXe0lW0_w6SANO4aZ9jLFpKZGZTmQELpZhmniafcuA_myXIOj3krYl5wBGzqIEEoG9twNnlwD3aBdAVfQFsrCaM1k8Z8ybTc5sJeCfm-xElKYrleBnEgnt2-q90UE3T0PmcshhGzU_XS84I1sC0dwKaD8vRfGfgOFdgaCRvqT7d4WatZv9ZV7ZLU0VAdC6SsoyHccChULA7BPmQGs9zf7lORAEByL6pr_h1VMxgigJliR_Hvk5Z6LzMbwJBoc3CoVSN )