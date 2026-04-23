Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp2536840ejc;
        Tue, 22 Apr 2025 10:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD35ilh7audkbtJW4qH7jHBrgwNX0xEI5j9RUQEjAnEgpmdB32CvY/evf4qUwJCMOrHM5+
X-Received: by 2002:a17:90b:2d0d:b0:2f9:9ddd:689b with SMTP id 98e67ed59e1d1-3087bbbcdbfmr20533299a91.22.1745343055756;
        Tue, 22 Apr 2025 10:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745343055; cv=none;
        d=google.com; s=arc-20240605;
        b=eqwT8cN2WUsWg+xvT08MYh3bzA/lc5A/Xm6mykgp7a+duTQqiKJboiKZTEJxAABuDW
         BypG7Y5flsgOL+YU2A0QJsc3RXxBFD0KI8HtFRmCWAxWcI6MsSDl8BqOH5MkHiUWzU19
         lNV3sFQoVTMXBkenN5PorbY4leJvu246QAUdMZEtwWUv3kMJ7gF/P9U5K2e4uhlgKGXP
         UvKVa0xlZiiLx30Q7CKETxUvH00WsuYccJUSdpJy5UanXgr1KU3mAXxIWbpEMs85VlYa
         tGRwYhhQJ1zNhSv7I0Vn5mnu1YjgdJ+NISsVVnf3q244gGG6oMJyU45NykLG1SkaOUzB
         9Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=nupczAyfjumdljtLySBchAC7OAwopnMsX5OelqgDQck=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=h8gpJ4TF+79nmgE7/see3sMf2tcgctwmV5SlBRfck7aZ7dS4coJJyi16TOqNq8quxA
         O6upPsmC5IDg81Er7qt+s1cHs0XGk/6Kzp5jToDOZvm9U0e+/sxvwBeO58xBSZhLEVXO
         vt2jog7awuKcj4+U7Yyyg3nOZ5rXlCQHB9Knogv3jFT/WdE9TDshpRzGq3rfEpALejA0
         Vg4BUScUbcAXWIF6qcCIkvwmCvuLLr3SU9vZj9UjEPFj1gygcVbRaKcJcIgmPLsoBkJ/
         96reX84AUYQqyPAOWkwaaWXESx3tgLkD4RYc6sG1QMj1wGle09v2PqdObN9jYG75ZYN1
         7uJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Oh6OWc3p;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=e3bLqFkw;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-3087df1b2absi13430859a91.66.2025.04.22.10.30.54
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 10:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Oh6OWc3p;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=e3bLqFkw;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=nupczAyfjumdljtLySBchAC7OAwopnMsX5OelqgDQck=;
	b=Oh6OWc3pYbTJBGsdMZfTTCz9d+BB7wniopJ8qUnLIOgG46CTyzODcBjYmQk5eUpasni2
	z7Hq9dlFyO12nkl+XSFj1FjtHz+Je161QMXhBjDEnkBjnSpvBS7YR3kXk3JMtR6cEiWsRL
	Oe5Yx+rsklp32QTreoJWMkjcL7XBF0BeSxOfTW+XgCGBO+T6oY45tfyUkMdP18dc29CIw0
	qDorGGr1OhX6R4pEB82ogR+FsGN7Jq3yQECgWbIQs6qNDspbJ3EjvUHbgDBPl0XmTuyOjm
	s2upOYM7SnTFprdMXYCpw0kPZGY4l51UN8qSY7QXmD+jwQXFFLYSk+szlOcQWoCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=nupczAyfjumdljtLySBchAC7OAwopnMsX5OelqgDQck=;
	b=e3bLqFkwHBjJJfFQAdp6EwQh3x1bGfH4tdHyfFzkE3vN3g08gdhwYePnhcAjhrNARXOl
	wG2S4bs3wlEEI2nmVPWGWfJB0rVedzLiSdisQEjxX79w98c/nzooau70S5YyoR/3PFvq4o
	GFkxeFLjmQX2gZ2BFAob1j3WSBThDdqc4=
Received: by recvd-84ff9c6c5c-5zs24 with SMTP id recvd-84ff9c6c5c-5zs24-1-6807D24C-6B
	2025-04-22 17:30:52.701847805 +0000 UTC m=+1192809.353277503
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-6 (SG) with HTTP
	id hVci0B2jQTGVpmbla2o8wQ
	Tue, 22 Apr 2025 17:30:52.649 +0000 (UTC)
Content-Type: multipart/alternative; boundary=f1ac51e6cc22277c978d2bdf27b46bdb69155e4c04a13f33b64e98e4af27
Date: Tue, 22 Apr 2025 17:30:52 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <hVci0B2jQTGVpmbla2o8wQ@geopod-ismtpd-6>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4y0fWFdog4O7Vbl?=
 =?us-ascii?Q?A5Qb2=2F4RKyrOEoR1nX17JPliZTvKoiBrMh+PoDW?=
 =?us-ascii?Q?+ltVLTYcP+BQUQQMxyA=2FAGuk9t6IEQ8w0sZFxNb?=
 =?us-ascii?Q?ybJ2I8Yh1=2Frd86q65F+B0te3cz9YSLXPF8HF59L?=
 =?us-ascii?Q?xXHoTIUFAKwg8Ba8Dw+F1XI1kgEMQ5+5awttUk4?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: em8r8vysO53n

--f1ac51e6cc22277c978d2bdf27b46bdb69155e4c04a13f33b64e98e4af27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Algebraic Semantics for Machine Knitting
This article discusses the need for rigorous semantics in machine knitting,=
 comparing it to traditional programming languages. It explores how semanti=
cs can help in error checking and optimizing code for machine knitting, whi=
ch involves controlling arrays of needles to create 3D objects.Top Comments=
:One user reflected on the connection between knitting and programming, sug=
gesting that knitting can be seen as a form of code.Another commenter appre=
ciated the clarity of the article and its diagrams.2. ClickHouse gets lazie=
r (and faster): Introducing lazy materialization
This article introduces a new optimization in ClickHouse that delays readin=
g column data until it is actually needed, significantly speeding up query =
performance, especially for large datasets.Top Comments:Users discussed the=
 implications of this optimization on query performance, with one noting a =
dramatic speedup in a real-world query.Another commenter shared insights on=
 the efficiency of sorting large datasets in ClickHouse.3. I should have lo=
ved biology too
The author reflects on their journey from disinterest in biology to a newfo=
und passion, inspired by engaging writing and personal experiences. They di=
scuss how storytelling in science can ignite curiosity and interest.Top Com=
ments:One user related their own experiences as a teacher, noting the chall=
enges of making the curriculum engaging.Another commenter shared their thou=
ghts on the importance of storytelling in science education.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--f1ac51e6cc22277c978d2bdf27b46bdb69155e4c04a13f33b64e98e4af27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Algebraic Semantics for =
Machine Knitting</h2><p>This article discusses the need for rigorous semant=
ics in machine knitting, comparing it to traditional programming languages.=
 It explores how semantics can help in error checking and optimizing code f=
or machine knitting, which involves controlling arrays of needles to create=
 3D objects.</p><h3>Top Comments:</h3><ul><li>One user reflected on the con=
nection between knitting and programming, suggesting that knitting can be s=
een as a form of code.</li><li>Another commenter appreciated the clarity of=
 the article and its diagrams.</li></ul><h2>2. ClickHouse gets lazier (and =
faster): Introducing lazy materialization</h2><p>This article introduces a =
new optimization in ClickHouse that delays reading column data until it is =
actually needed, significantly speeding up query performance, especially fo=
r large datasets.</p><h3>Top Comments:</h3><ul><li>Users discussed the impl=
ications of this optimization on query performance, with one noting a drama=
tic speedup in a real-world query.</li><li>Another commenter shared insight=
s on the efficiency of sorting large datasets in ClickHouse.</li></ul><h2>3=
. I should have loved biology too</h2><p>The author reflects on their journ=
ey from disinterest in biology to a newfound passion, inspired by engaging =
writing and personal experiences. They discuss how storytelling in science =
can ignite curiosity and interest.</p><h3>Top Comments:</h3><ul><li>One use=
r related their own experiences as a teacher, noting the challenges of maki=
ng the curriculum engaging.</li><li>Another commenter shared their thoughts=
 on the importance of storytelling in science education.</li></ul><footer><=
p>This email has been sent by Toolhouse. You can change your delivery prefe=
rences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duo=
kMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswKO48_z=
KD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBpMpGj4gPzmpf8DzE-2FnstQHREAZREU=
gxrI2fvKS7zaCSKcf-2F1PF8QDuEMzUYUQDXMVZL2vAgajYin828fgJtyNI-2BCCakstTv8pqRQ=
YQYHDt5PPVIiGrfzKWeEUE4mb-2FR3atjGkvHL22Lj9WD-2BPAvJRnPRMpYflanUqHe-2FYmofF=
2w-3D-3D'>Toolhouse Settings</a>.</p></footer><img src=3D"http://url1228.to=
olhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF=
0GJT-2B2MUV1aXsib1bYrDR-2FP9IXM-2FvQPRBUL-2BRtn06T34Cf1U-2BD1OqD5piS2wNdhwb=
pSkssdolrX8CB5pGQH2WNTlh45dSwPlu1CfcN06Cq5gcZJHMqn9LvHZseX8cp6sACeXq-2FV5ni=
MCVURYeF-2BUVtQv7m-2BdO80TCsfl-2BN8QkGZtwvlLeEkktViC1-2BXDuvIPZUA-3D" alt=
=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;=
width:1px !important;border-width:0 !important;margin-top:0 !important;marg=
in-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;p=
adding-top:0 !important;padding-bottom:0 !important;padding-right:0 !import=
ant;padding-left:0 !important;"/></body></html>
--f1ac51e6cc22277c978d2bdf27b46bdb69155e4c04a13f33b64e98e4af27--
