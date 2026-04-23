Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:6206:b0:abc:2b0f:5fd9 with SMTP id si6csp45346ejc;
        Fri, 21 Feb 2025 09:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAnZnVOEBfFROKPiwHMH4DGKBz/Y1ekUwFVEKkb+7fIgpyJZFxZhga+a801dqOs6WxFF/6
X-Received: by 2002:a05:6000:186d:b0:38b:d9a3:6cff with SMTP id ffacd0b85a97d-38f707896camr3931542f8f.16.1740159078787;
        Fri, 21 Feb 2025 09:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740159078; cv=none;
        d=google.com; s=arc-20240605;
        b=kH3ch8+MK5iBrnRYmVW4jKSZubMVVlU3kxU7ekY7XbvRbIvya3WE0ouKsEBjONHetP
         TD9K9fCpPf3WkYn4FiKP5QPf82ol46J4l+rCEiNAPBYp3ZTps6rzXhwXUi4j0WacZF6T
         yh0F18pU9a5KV30tjOfQvK1CWfn5zq0btAE5be2gHDLsOKBFUFmYUYUy9hlnBoyIKrSn
         wEM3F0zpql+aNeHwhdhzbIsAEHFRZHgAtcnYYD8gLSW0/jqC/2ZvGR3zS41RNzYCI5kr
         3lI8QIXt4uOtqyfGydHcW2xfxiz+PS/OOxprmDBVb8w37ixLJhNV+1BxdNaBPF3T3g0V
         zNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=05XOtM4PDRwrP2vGJNTazQFftP4dEQ5PK7h29J0uPsU=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Ug128xn5C0pl/ZM2LBSYpY1bweIkh2zNXqEYcxmzMNow/hFkE07tpbiOn/X9UJkGBG
         YE68DCnhjK4HGXAoe0eTrFoXoAv/llm6KxH4ZSSyK60x6VokRfaLoNUqa13JQo0OrT2F
         pi7bPBVbr30V7/E53BeQ7Hx2K1cxQA0/6x4Y9xBAC3XgfKeHrFW5XPKhNxuk3GLbP4d2
         ijuvLbp4UzeUU3p1pCEPgb5AyVSu35cLia6TArOC6fj9WtpP06iE3owRs7EgHx1CzFMa
         tNkCXrgnapR7XilDFKYOqvEd++tdx6L4zAQxRY/4qRgGEdhEx9zydVP9Skc6T4bY5dQy
         eTPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Bqqzmw1T;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=O1vO2dgN;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-439b030dcccsi11652515e9.173.2025.02.21.09.31.18
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Bqqzmw1T;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=O1vO2dgN;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=05XOtM4PDRwrP2vGJNTazQFftP4dEQ5PK7h29J0uPsU=;
	b=Bqqzmw1T2N5DwMkarHNj3YSJk41i6YsjsxwavHg7dJ1QykHQ9xKUaEc/Q3e3APVjj5PJ
	EpQqKaNKOBXqoGVWuPvLbHnsvZBU3XOk/DXVQ79EdC7HuFxyNgqN1v40yaClmm1sXZOsJv
	UpYPRADBaHIksMjelDOvhqa1EIXcANt1zR3pdh+2yU51Rn9oF7V0r1OL1xMVzCX9rhOF3N
	1tHFFMIN+jWAhk78AHaVUw3rgKHaYe1vEFsVY1GO7gCUYnTD+jjI8NjYRGwq87PP6EKmSN
	mOH07LJccXmUABn2zq4mrkQYjSwoG7GYL8nQoXelqTrXDAkQdFdSI5RuuuCm6z8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=05XOtM4PDRwrP2vGJNTazQFftP4dEQ5PK7h29J0uPsU=;
	b=O1vO2dgNWazaa5WtlUHIbK2HHGhtKT2xR64oNfR9uUlpirofQ6qO1KcWApYvcx4qEu42
	bdJ8Su6gAt5G/etUkLl8hc9f9RFcm6oRh9dD+oJkO4OQGT2Mf7XCdRcjbK45UUyrZOGrXm
	ff0cOSadioeDyyfvcVwFSRwsx9R3nyeQs=
Received: by recvd-69cbc48b94-pgsv7 with SMTP id recvd-69cbc48b94-pgsv7-1-67B8B865-37
	2025-02-21 17:31:17.544284335 +0000 UTC m=+8539657.125985352
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-7 (SG) with HTTP
	id ImLCzN43TuybIrysM3HwcQ
	Fri, 21 Feb 2025 17:31:17.534 +0000 (UTC)
Content-Type: multipart/alternative; boundary=a6762493ae7f8aa768b5adc3d5f965442bcf524f312295e4535a2324ea85
Date: Fri, 21 Feb 2025 17:31:17 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <ImLCzN43TuybIrysM3HwcQ@geopod-ismtpd-7>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7LuWse6OWAnOhyC?=
 =?us-ascii?Q?hnCqTPvwr1rR42BVAKNGfzq84nrjefKg12UNbc1?=
 =?us-ascii?Q?GAirv=2FvLpyxmkd1Bs9KvcenKFisaCNBwu9oRETg?=
 =?us-ascii?Q?ZPUzbSXN0cxZel9lenvWqNe0JG1jBitIR5Wn9t7?=
 =?us-ascii?Q?yRqiF6w1w8c19Fnf7lHhfiMAIS3ojMNIYBhNzXV?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: G7C1HfWgb+bV

--a6762493ae7f8aa768b5adc3d5f965442bcf524f312295e4535a2324ea85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The strangest hit songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that influenced his music. The song, which became a hit for Nat King=
 Cole, is described as a blend of poetic and philosophical lyrics that reso=
nate with listeners even today.Comments Summary:Many readers were surprised=
 to learn about Ahbez's background and the song's history.Some comments dis=
cussed the musical composition and its unique qualities.Overall sentiment w=
as positive, with appreciation for the article's depth.2. Making my local L=
LM voice assistant faster and more scalable with RAG
This article discusses the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares insights=
 on improving performance and scalability by leveraging embeddings and opti=
mizing context length.Comments Summary:Readers engaged in technical discuss=
ions about LLMs and their performance.There was a mix of curiosity and skep=
ticism regarding the proposed solutions.Overall sentiment was constructive,=
 with many sharing their own experiences.3. Face of ancient Australian 'gig=
a-goose' revealed after fossil skull found
The article reports on the discovery of a skull belonging to the extinct bi=
rd *Genyornis newtoni*, providing insights into its appearance and lifestyl=
e. The findings suggest that this giant bird lived over 45,000 years ago an=
d went extinct shortly after humans arrived in Australia.Comments Summary:M=
any comments debated the causes of extinction, including climate change and=
 human impact.Readers expressed fascination with the discovery and its impl=
ications for understanding prehistoric life.The overall sentiment was a mix=
 of intrigue and skepticism regarding the conclusions drawn.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--a6762493ae7f8aa768b5adc3d5f965442bcf524f312295e4535a2324ea85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The stranges=
t hit songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that influenced his music. The song, which b=
ecame a hit for Nat King Cole, is described as a blend of poetic and philos=
ophical lyrics that resonate with listeners even today.</p><h3>Comments Sum=
mary:</h3><ul><li>Many readers were surprised to learn about Ahbez's backgr=
ound and the song's history.</li><li>Some comments discussed the musical co=
mposition and its unique qualities.</li><li>Overall sentiment was positive,=
 with appreciation for the article's depth.</li></ul><h2>2. Making my local=
 LLM voice assistant faster and more scalable with RAG</h2><p>This article =
discusses the author's journey to optimize a local voice assistant using Re=
trieval Augmented Generation (RAG). The author shares insights on improving=
 performance and scalability by leveraging embeddings and optimizing contex=
t length.</p><h3>Comments Summary:</h3><ul><li>Readers engaged in technical=
 discussions about LLMs and their performance.</li><li>There was a mix of c=
uriosity and skepticism regarding the proposed solutions.</li><li>Overall s=
entiment was constructive, with many sharing their own experiences.</li></u=
l><h2>3. Face of ancient Australian 'giga-goose' revealed after fossil skul=
l found</h2><p>The article reports on the discovery of a skull belonging to=
 the extinct bird *Genyornis newtoni*, providing insights into its appearan=
ce and lifestyle. The findings suggest that this giant bird lived over 45,0=
00 years ago and went extinct shortly after humans arrived in Australia.</p=
><h3>Comments Summary:</h3><ul><li>Many comments debated the causes of exti=
nction, including climate change and human impact.</li><li>Readers expresse=
d fascination with the discovery and its implications for understanding pre=
historic life.</li><li>The overall sentiment was a mix of intrigue and skep=
ticism regarding the conclusions drawn.</li></ul><footer><p>This email has =
been sent by Toolhouse. You can change your delivery preferences at <a href=
=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-=
2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswV7Xz_zKD9qStml-2FkjU46u=
lTqeWVsrM3061nr98hteMD12SmCDaL14nDpz-2F-2F66ZhdvRpuMMse-2Bo5fNqUjfiH5hI2gv1=
f6HGjWHrthHSRUVcfl9z-2FgxONk6UOx-2FTgrWm5HOL0BsNquuGzLe0gCfoElV3P6HGcYr6Ez7=
mqP8WGZv5yCku-2Ba9fKgxffaoY-2FjTrAwm5h4pxaxeZM13FE0tlr2du5-2FLXQ-3D-3D'>Too=
lhouse Settings</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com=
/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GLGEYyOR8vaz=
daqGXB2865MyjQ82cMWUX4-2FbUz1-2F3MWAPJTsAsf5-2BoxRJe3pm27YG1UnqF9rr7Acx-2BR=
zNFTL70cr42Qro3iSmBeAqZXVvU7Rpdc2Zas54etgqex1BM87lib2P8NrB9xz9PN97KiTZGY68I=
GJoXHOKYcjWS3D5o9Rxy2z0y30qA7Xq2YcWoJlb0-3D" alt=3D"" width=3D"1" height=3D=
"1" border=3D"0" style=3D"height:1px !important;width:1px !important;border=
-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;marg=
in-right:0 !important;margin-left:0 !important;padding-top:0 !important;pad=
ding-bottom:0 !important;padding-right:0 !important;padding-left:0 !importa=
nt;"/></body></html>
--a6762493ae7f8aa768b5adc3d5f965442bcf524f312295e4535a2324ea85--
