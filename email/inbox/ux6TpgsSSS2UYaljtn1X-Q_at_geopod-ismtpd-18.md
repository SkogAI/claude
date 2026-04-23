Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp1362532ejc;
        Sun, 20 Apr 2025 10:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHePCkiYHNbvS7MS5kGOhFF8/12BH/0hUs3YCw8ztAu5Ft/jzP+0mOldR0/d/+I71w1gEp
X-Received: by 2002:a17:903:2344:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22c53583db1mr125865285ad.15.1745170258733;
        Sun, 20 Apr 2025 10:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745170258; cv=none;
        d=google.com; s=arc-20240605;
        b=VwjR1V/wff45NWHJMAgyDApom4S1/MKJhoHm28rHLrNZJxeb8YhzA0XfSHRlPe/C6A
         djURdgHotdTv8We65rr3PEJhaMU+VBwVZYKUR6VQwhnKGg4ETZQcxFwIuwkiZXl+Dqvu
         VO6+/RBpSiOGSp1Tz+DSKOYJCOPv2NsZYYIFEOx0XsSbAgUT7EfsiniIrMhE+Q+hffY9
         +xwxx/1opa9LwFs8qsZ9Hbvfo3OugdkdFvGshxWIyyD0kwZkW2UA0NROYDb6CTs20FPY
         AOAt6aR5jx1vZKr6YJnibn/yi2v51260AVcZ3rhft+/FivmPRJRUTO4ulXszzPRNEDNE
         +VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=h7rdu83o1/tmG9wKPonfqCfrZI0xjZIoScpBg9WCcD0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=TQ3SHNbWBi8glcR9+gOPX5Mf2sA78iIPvM3l8GNc5bEuXoQ4f05vg37hK53JqUm56i
         8oDK7EEII6W1skIDr+oyIXl4XtJizF6CSG0y6RG9WQDTQ8Pz5Y9kktKxHwbQWuMQh4hN
         bCN5n3WjGQGn4ljDys1izSTaRXR7k65/c0oNVXopmyfz9lRAAVKeoolD7vm62bI9jugg
         wxlhGKRpayGcGbt9F3Pe/wZCk6r74mfyi+JIN7niFsWNvXE+FOWoIgf3Qa4OzFjJV/OQ
         o2OJtyCt7eEPnkWBGIw9UjfTUBDBaCy3yQ6EFFpT5nrnXA2x9AcWZONor4LoA/E+0+MO
         6NQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=o2Qlojhg;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=D4dkiVSv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-3087e053ad5si7578048a91.118.2025.04.20.10.30.57
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 10:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=o2Qlojhg;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=D4dkiVSv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=h7rdu83o1/tmG9wKPonfqCfrZI0xjZIoScpBg9WCcD0=;
	b=o2Qlojhgvi73MKhLLnjrNYL3DLikHSXI4DMKowrcYbUoxN08fw4R4IM6gK9FILIujk7B
	g3T/BGhAWefenPLDuBK/Nof+KFpN7z/cXcCZvuCdWZsvXHqsTsMdoe0eZJkxpqkXR7ta4v
	8Gq2O9US7VUzL90K0EBlhJ4wSdiP2MH/3ejlbuL3g2+RVw/Oe8+Y56sh9z/I8IS3SBHsuv
	ryeHyTs28iGZH3Pu3mK+TrhU/dRuScVRvBVnr2G8bhljG0Vc66W68juu8Av2Zqov4HZY7/
	JbIhizot7yes+VNMhKv0nLw5LBqTK7iygJrBea9i8DSkoimQqt0LMu5kB+hrNBGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=h7rdu83o1/tmG9wKPonfqCfrZI0xjZIoScpBg9WCcD0=;
	b=D4dkiVSvzgqKGHpMQ4L6yuJYNwvQwzNH2PvKviRzzJ1UNdq6wlivg9sYYcw8OVSsPocw
	QJ1GzKp1tJ/nNjVvMCkheX0EWFYVca7+Og5dEFf5vpxYglObm81QHyYonAL4N38Q8GH2Kv
	XLu2UoMOM/oiWK1rs7WnGdIi2hxmBiXPY=
Received: by recvd-84ff9c6c5c-s8nqj with SMTP id recvd-84ff9c6c5c-s8nqj-1-68052F51-10
	2025-04-20 17:30:57.339261621 +0000 UTC m=+1019982.526438573
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-18 (SG) with HTTP
	id ux6TpgsSSS2UYaljtn1X-Q
	Sun, 20 Apr 2025 17:30:57.312 +0000 (UTC)
Content-Type: multipart/alternative; boundary=8329a0b223342105b42e070e8de585b872005c2a25e6e09233426f282925
Date: Sun, 20 Apr 2025 17:30:57 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <ux6TpgsSSS2UYaljtn1X-Q@geopod-ismtpd-18>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7dLXpVsGCl08Y5Q?=
 =?us-ascii?Q?ISiitTkpvLua9NB9E3qCFA1nInC+mC8QteFv5TI?=
 =?us-ascii?Q?bB89DVUpZWE0Jq6rd73OSe9a8PX2nL1e8COrJlb?=
 =?us-ascii?Q?xxz3f9WoWfXaS++Zj=2FKyAbLvKvFU4=2FhcX9sL3vQ?=
 =?us-ascii?Q?bCqmDsMLAhVEbOykgwB4b1iXkMp3CH6UMnYq+6a?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: uFMaHnRbcy9a

--8329a0b223342105b42e070e8de585b872005c2a25e6e09233426f282925
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Things Zig Comptime Won't Do
Zig's comptime feature is known for its capabilities like generics, conditi=
onal compilation, and serialization. However, it is also quite restrictive =
by design, which makes it interesting. The article discusses the limitation=
s of Zig's comptime and how it manages to be expressive despite these restr=
ictions.Comments Summary:
Many commenters expressed curiosity about other languages with similar capa=
bilities. Some mentioned that while Zig's comptime is powerful, it lacks ce=
rtain features found in other languages.2. Gemma 3 QAT Models: Bringing AI =
to Consumer GPUs
This article discusses the launch of Gemma 3, a new generation of AI models=
 optimized for consumer GPUs. It highlights the performance improvements an=
d accessibility of these models, particularly through Quantization-Aware Tr=
aining (QAT).Comments Summary:
Commenters shared their experiences with the Gemma 3 models, praising their=
 performance on local hardware. There were discussions about the trade-offs=
 between local and hosted models, with many preferring the convenience of h=
osted solutions.3. Turing-Drawings
Turing-Drawings is a project that allows users to create interesting visual=
 patterns through programming. The article showcases various examples and e=
ncourages users to experiment with their own designs.Comments Summary:
Users found the project intriguing and shared their thoughts on the visual =
effects created by the drawings. Some expressed interest in the underlying =
algorithms and how they could be applied to other creative projects.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--8329a0b223342105b42e070e8de585b872005c2a25e6e09233426f282925
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Things Zig Comptime Won'=
t Do</h2><p>Zig's comptime feature is known for its capabilities like gener=
ics, conditional compilation, and serialization. However, it is also quite =
restrictive by design, which makes it interesting. The article discusses th=
e limitations of Zig's comptime and how it manages to be expressive despite=
 these restrictions.</p><h3>Comments Summary:</h3><p>Many commenters expres=
sed curiosity about other languages with similar capabilities. Some mention=
ed that while Zig's comptime is powerful, it lacks certain features found i=
n other languages.</p><h2>2. Gemma 3 QAT Models: Bringing AI to Consumer GP=
Us</h2><p>This article discusses the launch of Gemma 3, a new generation of=
 AI models optimized for consumer GPUs. It highlights the performance impro=
vements and accessibility of these models, particularly through Quantizatio=
n-Aware Training (QAT).</p><h3>Comments Summary:</h3><p>Commenters shared t=
heir experiences with the Gemma 3 models, praising their performance on loc=
al hardware. There were discussions about the trade-offs between local and =
hosted models, with many preferring the convenience of hosted solutions.</p=
><h2>3. Turing-Drawings</h2><p>Turing-Drawings is a project that allows use=
rs to create interesting visual patterns through programming. The article s=
howcases various examples and encourages users to experiment with their own=
 designs.</p><h3>Comments Summary:</h3><p>Users found the project intriguin=
g and shared their thoughts on the visual effects created by the drawings. =
Some expressed interest in the underlying algorithms and how they could be =
applied to other creative projects.</p><footer><p>This email has been sent =
by Toolhouse. You can change your delivery preferences at <a href=3D'http:/=
/url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2=
Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswxcjk_zKD9qStml-2FkjU46ulTqeWVsrM3=
061nr98hteMD12SmBqfkb4yr10hZRm8hbSv1eFdWTfimC6-2FzUrCIoS5SJ4SB3uyQAvqtR3ePh=
4-2BMbS-2BJhDujcbipfRCzPPK6YWU2UBk2WY5fyN90g0YH644-2BE2iA9qCbvzilN5i8WmVZON=
PEGTYvajJcKjgZLt-2BYAXcg95og-2FtOrqOD5vu1Poxs2XuyQ-3D-3D'>here</a>.</p></fo=
oter><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozN=
gxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJNG2Yb-2BjJPQKkuMZe8I7yLu7DnfRxjGPURz9h=
ktM-2F4Qx03eriogZetv5NGfPqAIJ8K-2BG2aJju3AQN0Sty-2FNZgSQ1MJu5k2u77S50KqGxhK=
IiCqYs9adFk2XBXfLGVBLaZRqa6HwhiudIne15fOBBawQmajAAFKYg1uW6uXGLbxOouXZFgoOgF=
OJtAxFeaeUIA-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"he=
ight:1px !important;width:1px !important;border-width:0 !important;margin-t=
op:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin=
-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pad=
ding-right:0 !important;padding-left:0 !important;"/></body></html>
--8329a0b223342105b42e070e8de585b872005c2a25e6e09233426f282925--
