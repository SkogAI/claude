Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp918960ejc;
        Sat, 19 Apr 2025 10:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNw/EXU0/MpZ8Yslx394f2TGlw5XkB/w/guJ8iQr7EOY5tyL5DC5F2m5MCetcHEnw/YUvd
X-Received: by 2002:a05:6a20:3955:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-203cbc72cccmr10408167637.21.1745083856928;
        Sat, 19 Apr 2025 10:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745083856; cv=none;
        d=google.com; s=arc-20240605;
        b=MCL3buJtFnkzWb6/sC93+DF1gYMejPW4GcXWBxgWOnPsDew00JMnA6eHuTXaIYVsmP
         yzLNJSCxoAQfbDo9qBTSnvYwjQBvH/sewnVQwVfzx0LvMx85iCLYRXZGKjtCqAIGehwm
         CNJYgDQTYWlL07DLCodw1LHY1hUCVGJIXD/zq+8QAwBgQSdJGfjDt4q6ogj2x50/34TJ
         nmsONNnkn8hi8yYUU5v4CVQezI3AenpIo1hBgS7/ppSRyjSnD14te3+Mcpwy1uLpkNm5
         x71FSWF85u4X+FUg2ENSsb7q5sCkp5l5dnBpAjG5H8yyH/ojmT2A9EFfTLxfsKah6mhX
         /CQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=TLpbUaZgKQjv1uJ8J+EAMqQdx0kTNfO9D8nM6EzGuHM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=cuxrfzBA88aEBWLIJSMtpD5lmT+6eL+llEbyB7kCjxMY4gayqo4GX4qurKbnSFcuRg
         sJbivz2g5Rj5lPDG4oQg6D//rmuhAMH2pxNrQzhTq0LsnbZnqgPIkA/pLeOxfghEL3y1
         SvDCb6p4/aMkiPC7PZyaEF4TLaym1w6nAKGr/GHZQtkFPpJY6l4BN9qbHsGR5q3znQzH
         Uxjg2d/lj1UarkrfsMUSYsRn1Ghpz9wD0MnW/u2M0A+un8/AKGw0wMUnKy07WE7cWGPd
         NJW/SCOqKS39D2bYhW4IDUFbSRtJPKQsUj6YCnnJNhKPExFM7HCNQtDSyHoWYWMS+S9j
         2zXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=TvIorBNf;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=eSFbkmKG;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b0db12672eesi5429465a12.200.2025.04.19.10.30.56
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 10:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=TvIorBNf;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=eSFbkmKG;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=TLpbUaZgKQjv1uJ8J+EAMqQdx0kTNfO9D8nM6EzGuHM=;
	b=TvIorBNf8iKwD7+LyJCTHlVnyn3iYQN07paKBEz6fTwe03PgvE/DxavOdp15InFMhs51
	qDWDJR2Bk9ZhsDf/5RXnL6UXfXg01Kpe0rJWPkcH5OUny2bo06g/e5i1nwJ9Wsx3P15fI5
	0oc8bdmJ3r5a1JxNgPmBbeyWf/KzRUTiSiPaYUb4ishLy+dYh1+nAoQ3c4GSQBPt7mPfnK
	16k44cNIwLVI6ca4egfMAd2R9d3PUDWz02n7UwiLzpohBpSi9mzsGFYiWxRMS5r7WVxeBx
	JID1vxGsdWa40R44kVRsmamdED1elKobAd2aJSBqejmHN7635zJP381sSG8lFN1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=TLpbUaZgKQjv1uJ8J+EAMqQdx0kTNfO9D8nM6EzGuHM=;
	b=eSFbkmKG/RSXn0Ueat7Nt3qsC83QwtyUh7ryibEHaGrQipu9iOQJlY3UeFPz3OP4l0E6
	qAlg83uQgC4vfFESLekrNMmlTck3mVaUP/EiEmtWgtq0SG7xbSvv6unJCz+dAZlQrvMaiy
	HWQGgRB70hJ8x6wxbVzwq8s7+gCKzzrbo=
Received: by recvd-6884bf9dd7-gh9nf with SMTP id recvd-6884bf9dd7-gh9nf-1-6803DDCF-46
	2025-04-19 17:30:55.779566576 +0000 UTC m=+933730.534181359
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-33 (SG) with HTTP
	id X4_JzGkSQXS2DeaYzL7N2g
	Sat, 19 Apr 2025 17:30:55.754 +0000 (UTC)
Content-Type: multipart/alternative; boundary=5361452aee71f565e9f580f57ee4bf283a2b9a9864324cb30ceb9dedc43f
Date: Sat, 19 Apr 2025 17:30:55 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <X4_JzGkSQXS2DeaYzL7N2g@geopod-ismtpd-33>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n67uIZqApYaA3QB9?=
 =?us-ascii?Q?u0FghSdtaukV9d8TlJCUSK6vzGwn0LX04WWlcQA?=
 =?us-ascii?Q?ewk2CnKdxZqVT6DWs2EnZmAW3I7cYbx9XvNI62N?=
 =?us-ascii?Q?5wtrYAtZIaTZf0JqilNhDPqCUcXfBl5Ba93Tfz6?=
 =?us-ascii?Q?6smd0fnCNnCC1NSsr3yFWfVxiDDxfzblkgf6KAH?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: WMTDyXPQIxHr

--5361452aee71f565e9f580f57ee4bf283a2b9a9864324cb30ceb9dedc43f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Your Hacker News Digest
1. Packing Input Frame Context in Next-Frame Prediction Models for Video Ge=
neration
This article discusses a new video generation model that operates efficient=
ly on consumer hardware. It introduces the concept of FramePack, which allo=
ws for the generation of longer videos without significant quality degradat=
ion. The model utilizes innovative sampling methods to address common issue=
s in video generation.
Top Comments:
Users are impressed by the model's efficiency and potential for consumer ha=
rdware.
Some express concerns about continuity issues in video generation.
2. Librarians Are Dangerous
This article humorously argues that librarians are crucial in combating ign=
orance and misinformation. It highlights their role in providing access to =
diverse information and fostering a love for reading among children. The au=
thor emphasizes the importance of librarians in society.
Top Comments:
Many commenters share personal stories about how librarians impacted their =
lives.
There are discussions about the role of librarians in promoting access to i=
nformation.
3. Inferring the Phylogeny of Large Language Models
This paper presents a method for analyzing the relationships between large =
language models (LLMs) using phylogenetic algorithms. It aims to predict pe=
rformance characteristics based on the similarity of outputs from different=
 models.
Top Comments:
Commenters express curiosity about the implications of the findings.
Some question the effectiveness of AI detectors in light of the results.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--5361452aee71f565e9f580f57ee4bf283a2b9a9864324cb30ceb9dedc43f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <title>Your Hacker News Digest</title>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. Packing Input Frame Context in Next-Frame Prediction Models for =
Video Generation</h2>
    <p>This article discusses a new video generation model that operates ef=
ficiently on consumer hardware. It introduces the concept of FramePack, whi=
ch allows for the generation of longer videos without significant quality d=
egradation. The model utilizes innovative sampling methods to address commo=
n issues in video generation.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Users are impressed by the model's efficiency and potential for=
 consumer hardware.</li>
        <li>Some express concerns about continuity issues in video generati=
on.</li>
    </ul>
    <h2>2. Librarians Are Dangerous</h2>
    <p>This article humorously argues that librarians are crucial in combat=
ing ignorance and misinformation. It highlights their role in providing acc=
ess to diverse information and fostering a love for reading among children.=
 The author emphasizes the importance of librarians in society.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Many commenters share personal stories about how librarians imp=
acted their lives.</li>
        <li>There are discussions about the role of librarians in promoting=
 access to information.</li>
    </ul>
    <h2>3. Inferring the Phylogeny of Large Language Models</h2>
    <p>This paper presents a method for analyzing the relationships between=
 large language models (LLMs) using phylogenetic algorithms. It aims to pre=
dict performance characteristics based on the similarity of outputs from di=
fferent models.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Commenters express curiosity about the implications of the find=
ings.</li>
        <li>Some question the effectiveness of AI detectors in light of the=
 results.</li>
    </ul>
    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswUjNL_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCPRo99-2F31fbbQgiPP2b=
JjrcNL48ne3UDd6mccY48ZOyC4A-2FByMJhoxjJkUEEVUnRPoy4Mf2XEZE2a5VOr-2B-2B1XY5C=
z5exRggQbZV1r-2B30snGINWw8wQMlnYbZBMkBXySQqAdMuXuefNO7Y3mN90t99yjyjGEciQKLV=
fmzW4mLPrYA-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLIAOccC4PNU1VPsffENgSCLRDhqj0b-2FFEMbXC-2Fbs=
TGNWJR7EiRahu-2Fb7hnZdI6pHNChJrqrGp6nMKHYZ6hBWowyttV-2FCgfhaX5MMkdZYTzURbhH=
gLVQ0ACl07XJKC5UOkCfHicBAKfK-2BctSAfRqh8Ir-2BPRhgE8UWJraFvJFeVBatfK6gOdw1S-=
2FfsSPX0wgR78-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"h=
eight:1px !important;width:1px !important;border-width:0 !important;margin-=
top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margi=
n-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pa=
dding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--5361452aee71f565e9f580f57ee4bf283a2b9a9864324cb30ceb9dedc43f--
