Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp1362553ejc;
        Sun, 20 Apr 2025 10:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+MIve/WmlkhRGmoWmn4WamtVCNofY7sQLHLUA0+07SOiEN4L5n50G1ZIZ5luqh9E4zB3q
X-Received: by 2002:a05:620a:4453:b0:7c5:58b0:42c1 with SMTP id af79cd13be357-7c927fbae9emr1293946385a.34.1745170263477;
        Sun, 20 Apr 2025 10:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745170263; cv=none;
        d=google.com; s=arc-20240605;
        b=aJI9w1G0HbLEmdl42BOlQYPio6uzss2mgJjfdwnru+/FP3jjJZpW/MxuilBFns9M85
         bk5iejnH0y/iaoPElzoaUy3NqaxzavWnOlOuCNePp7q1+NGHKfTP8hOFO4i4ptYH5Bb6
         uKVYf5LrPZXmVwoE+pS0KNqtKrhPdSstvX2HlnzcAk8LtkUv51+971c/MUF8X/1mwhVW
         IyoIVbLiqU1A51Dfarh0B9w2HztAAOoXYfJuRY+H48zZ5t/XUm+9bCMOIKQAGuAFbiYA
         T8uVUyBvmJ8TiObjU2QqZINklu73+Ll8z8lAjW6oeOgvlQGc94YDo0H4yIT4Ph6VVbjW
         c9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=w1ldsZqqznt3qutWfbTc8urtkekEwkWUrQ65h3Hf7Hw=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=PVtd9quRix4yiN4v3A5PNSgtQ9A/eR87lBQPk2PNoLVFyi62dyXLiIe00thRSa5M98
         AEQKYm5gWHGuyNvVZoYX4xnbG9O4Jwab6BbqMEqZxBOXjEVNb2erptQi+ck2lggV6Km5
         bfrtDPetslEbfPQMv6OV2QvwtrrNeN2d6nMNuKM2N54mkct4IrNlKRyAYYUxpNBFjGKm
         S1Ec1Q/X8E2Mv9Sj91CwfMv0Omo40VqOp/J4fWrIIBMmqqdvBNn/CcaeQk0cFabF2K/s
         P5PHetSu6DBMsVyYprV5iyw7mLP4Cgrx00FypDjTZCIYC4TnjIf9vsbnDjkx6qa2GdQK
         Oo1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="vvgG/Ew+";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fgupKcax;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id af79cd13be357-7c925abebf7si675823085a.121.2025.04.20.10.31.03
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 10:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="vvgG/Ew+";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fgupKcax;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=w1ldsZqqznt3qutWfbTc8urtkekEwkWUrQ65h3Hf7Hw=;
	b=vvgG/Ew+HsRFf0qew6HHq4rlHCy4fxL6JX0Ud4J67inS82snjJiFgRNEZpJn/nywAogM
	bFp9fBRDM6H0ZKjCPlcHzJtrMHmrFxOx23T2LhU2Kt89E82hyvlZQKus89a/ZmAANO475X
	z1T24n1JzFNIzxxRLUfnpA8OJy4xNb94HD2l3EOwtoZCk72G2lR/poAI2zMO7XgK7aglwL
	pIqe+wAAON2h9fSJXVHyYygvyR2Fnn+PROufhXt4ITXQITqgMnDeZ1kkpmNCEWjJPdsiU6
	xtJEPdw/4JnPA1ygU0mOfiayUFwhP/2WQdB3DBL856yBRuySTngbqL0/kvss1X+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=w1ldsZqqznt3qutWfbTc8urtkekEwkWUrQ65h3Hf7Hw=;
	b=fgupKcaxGWP7UchTgkbapHXfOIyTVf5FQbe7cvxbOOXu0XlpAMz7W+YfeH5xqSyyI79n
	pn5+BQDrynEfOXpSGm0gy9kkulzrdsIXRDnV3KNOwMCd6psTtt3pSjIGEHfdwnNJrMQfEM
	31EoM4ea2hgz9mO5GA1jqDh8VYhV5P8m4=
Received: by recvd-57d69887f8-bbnwh with SMTP id recvd-57d69887f8-bbnwh-1-68052F56-5F
	2025-04-20 17:31:02.847260578 +0000 UTC m=+1020190.436717115
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-24 (SG) with HTTP
	id hAy2AqptTEKYduiaUz4aLQ
	Sun, 20 Apr 2025 17:31:02.836 +0000 (UTC)
Content-Type: multipart/alternative; boundary=fbf2fe8bb05ab8231f5da167d47504a6a1bef59776128466ada2b1f255f8
Date: Sun, 20 Apr 2025 17:31:02 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <hAy2AqptTEKYduiaUz4aLQ@geopod-ismtpd-24>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4kMMYywZaIhhcnM?=
 =?us-ascii?Q?6m5u1D61ix9oo=2FwytiVpO+g=2FbKXXK0zpA4Il3Em?=
 =?us-ascii?Q?sn1cHd44QtFo7VAvSq0cYURwaasC9=2FK0QWdK+DB?=
 =?us-ascii?Q?KMZq600wN5X4A1Ax+aPdXIboVI6YM3ANecN8Ol3?=
 =?us-ascii?Q?vEaRv6B7jWk7SIjI6o8DraUdW1sEHc2=2FiBAw6Pk?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: bCNYE+n+TPjD

--fbf2fe8bb05ab8231f5da167d47504a6a1bef59776128466ada2b1f255f8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Your Hacker News Digest
1. Things Zig Comptime Won't Do
Zig's comptime feature is known for its capabilities like generics, conditi=
onal compilation, and serialization. However, it is also quite restrictive =
by design, which makes it interesting. The article discusses the limitation=
s of Zig's comptime and how it manages to be expressive despite these limit=
ations.
Top Comments:
Curious about other languages with similar capabilities.
Discussion on the effectiveness of Java's annotation processing.
2. Gemma 3 QAT Models: Bringing AI to Consumer GPUs
The article introduces the new Gemma 3 models optimized with Quantization-A=
ware Training (QAT), allowing powerful AI models to run on consumer-grade G=
PUs. It highlights the performance improvements and accessibility of these =
models.
Top Comments:
Users report excellent performance on local setups.
Concerns about the speed of local models compared to hosted solutions.
3. Turing-Drawings
This project allows users to create interesting visual patterns based on Tu=
ring machines. The article showcases various examples and encourages users =
to experiment with the code.
Top Comments:
Users find the patterns visually appealing.
Discussion on the nature of randomness in the drawings.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--fbf2fe8bb05ab8231f5da167d47504a6a1bef59776128466ada2b1f255f8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <title>Your Hacker News Digest</title>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. Things Zig Comptime Won't Do</h2>
    <p>Zig's comptime feature is known for its capabilities like generics, =
conditional compilation, and serialization. However, it is also quite restr=
ictive by design, which makes it interesting. The article discusses the lim=
itations of Zig's comptime and how it manages to be expressive despite thes=
e limitations.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Curious about other languages with similar capabilities.</li>
        <li>Discussion on the effectiveness of Java's annotation processing=
.</li>
    </ul>

    <h2>2. Gemma 3 QAT Models: Bringing AI to Consumer GPUs</h2>
    <p>The article introduces the new Gemma 3 models optimized with Quantiz=
ation-Aware Training (QAT), allowing powerful AI models to run on consumer-=
grade GPUs. It highlights the performance improvements and accessibility of=
 these models.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Users report excellent performance on local setups.</li>
        <li>Concerns about the speed of local models compared to hosted sol=
utions.</li>
    </ul>

    <h2>3. Turing-Drawings</h2>
    <p>This project allows users to create interesting visual patterns base=
d on Turing machines. The article showcases various examples and encourages=
 users to experiment with the code.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Users find the patterns visually appealing.</li>
        <li>Discussion on the nature of randomness in the drawings.</li>
    </ul>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswsdVy_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmC8g-2FCfo7nEmBrvwLXEu=
Un7VMKrYeKtnsOaXeB88TifD-2F0dMGBFmmRNlFsyRGv9F03u6gCJpmLOXa7VSWFWH-2BiVUdQH=
CW586KTjNUEZYAG2493Q3ecOo50r9PZtXjyHK6SOrZF6u0fI4Yt-2Bq8cVXsZP-2FxH8yS9QfxU=
uZNcClftrIA-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKQlQ9nKBPMTA02Gw-2FdsHKph2iCeWkbanGsP6F9zBs3=
rgYjjKJ6ablcZ5cgo8wG1rFAFHaMh74NKgiiMXYk13X-2BnmhLlgyHBkuOfkUxbrU6SNHEMLCVQ=
g-2FYJCvV46fbfnXW35KiobaHyWTVl-2FrZ1jbFJg8ASwJjjam61Kze9Q3Igp8QaDiMNvTZGZ48=
dxMKJ2k-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:=
1px !important;width:1px !important;border-width:0 !important;margin-top:0 =
!important;margin-bottom:0 !important;margin-right:0 !important;margin-left=
:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-=
right:0 !important;padding-left:0 !important;"/></body>
</html>
--fbf2fe8bb05ab8231f5da167d47504a6a1bef59776128466ada2b1f255f8--
