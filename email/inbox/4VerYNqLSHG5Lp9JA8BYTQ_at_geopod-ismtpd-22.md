Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:57d4:b0:ab7:3ba4:7d71 with SMTP id u20csp2007771ejr;
        Mon, 10 Feb 2025 09:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1r//9iFf1nO+I0Pyx/zeseavWQJLnvqWOWiQXQQebYTwHNuaQzVqQBtrkPnAp6u2+d4nQ
X-Received: by 2002:a05:6e02:1948:b0:3cf:cb93:de02 with SMTP id e9e14a558f8ab-3d13de78c94mr144030775ab.3.1739208679723;
        Mon, 10 Feb 2025 09:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739208679; cv=none;
        d=google.com; s=arc-20240605;
        b=g7VspeK03oOJstXApkDthhTvCngr2dA5sEd5IcKa1iYFiMi0+vq/gYAjqmlfRBAf/5
         PjhgnW/yUjpzRXpOyvkMB1Yj2B32F2j3sTrx6NsvE2Jbcgz3W9V8DXj0Od0oVxu/tZx5
         /NN7ol6ly3rZEvNpl9XW/Q9gVmxBne8HKgxlva3qkm/CV/kUj7SplHN6ugTLTWwoW7hO
         +JCmja6X3nsw8N41pZJQbWmhdaRaKVAcyaCt9oFE4OStKcOdlJCfXDCxJOv81YAkph7r
         F/l4ozOL+hWvToMnaAgnyP8fGaNSqlkr1Pb4tCgvqdsEwYVy1clojK4Kpw4R4HPpyXUS
         9KDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=sfo3MnHKtQr0VKo0g+yxIzccncbcOfcAXTBhj81Z5F0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Jb75AjDKkAnDC0pQq+/WiWA01JfcAIL9jXwIh5YUh4RATTpqirjyONy151RG7J0yeG
         c8HAecPoVUK9tmQielxD94kJkxT0xOhjfwyaaYRFGekC9Ob5ediyHhpWaOSQF3DWfOvx
         5Q9Rp4oAZR1SE9b1pjN6475TbItKmVLRkOj9816FEVV/qK2clcJ2CYkmZNmD38DYCvFb
         OU3cSSMKWfxAlzd+hs6uLIZZvPRH2LHWe4QMdviYMDJ7LE2R6T23dbQAN98QBxg+eeIv
         wulVIJk0O8cHN46u0TOK9aLLNyc8deSKiRLCp2Xx4mr5XQVDRUDwupDdMsaSWF3TFhap
         OUyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="HqXRfus/";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=b6rjEDdD;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wrqvtwtt.outbound-mail.sendgrid.net (s.wrqvtwtt.outbound-mail.sendgrid.net. [149.72.121.119])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d05e9fcd4csi70191955ab.156.2025.02.10.09.31.19
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) client-ip=149.72.121.119;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="HqXRfus/";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=b6rjEDdD;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=sfo3MnHKtQr0VKo0g+yxIzccncbcOfcAXTBhj81Z5F0=;
	b=HqXRfus/sJG0LNmq7pFzv4lJqykfFyFUgD+Ae2CMoEKVWLpHJFDTxYnZc7HbTQaD/3nP
	DvlBPtTFJqhhr0U49Na50Ixd1PL2/AoTVBzEpBTexfB4To7RUtFkfEKtp8rY7pphqf/MBQ
	B4n5xLl/viVMSj9o1jCg0oGGFmoda6MmoCDeVe2eQAJ08nGPv3OKey/vCX6CpVpwlxxfmK
	30XK2bm8C7Sb8VGwEppPQsLF26rl//oHWDWrRV0TANt1I/Lh0Uh7w8ZNv3TWez3R36PUSk
	LurUmRb+DueXMKSuj04662q74kp5oIYrduJwCqa5klcdUpj+T8Uj0N2kYqULQJDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=sfo3MnHKtQr0VKo0g+yxIzccncbcOfcAXTBhj81Z5F0=;
	b=b6rjEDdDlviuuV4nFNmezM9rxmSkQpcLU9iJPvt99wd+sjaw9thvg8m8cqPvymDRX0Vg
	WaUwkc0xRZaog43xswe3Pj2LLU/Ka/7EN3W4QZLBbEiJa/V+1nrwGhrGELMniNyzTtH6PP
	3qEpcjB3+64yrsCDT8jzPWQEzH3Ia3sxc=
Received: by recvd-69cbc48b94-cc5f7 with SMTP id recvd-69cbc48b94-cc5f7-1-67AA37E6-AA
	2025-02-10 17:31:18.885577053 +0000 UTC m=+7589216.165331282
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-22 (SG) with HTTP
	id 4VerYNqLSHG5Lp9JA8BYTQ
	Mon, 10 Feb 2025 17:31:18.843 +0000 (UTC)
Content-Type: multipart/alternative; boundary=0dfb35a8dcb4d57363392c27d8d34dd3d7f002c24a74392aa58bb9a16434
Date: Mon, 10 Feb 2025 17:31:18 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <4VerYNqLSHG5Lp9JA8BYTQ@geopod-ismtpd-22>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6MydB6PP4CDHpwa?=
 =?us-ascii?Q?=2FR2J+2BJMX02wTAtmbEn3CksSXoeh4+zypYeN7L?=
 =?us-ascii?Q?nmr5InQMmZOn0Eob0TAFqcHuHUv+cBsJnlFqRpk?=
 =?us-ascii?Q?LzlYzH2697rcvC65xRNTlqk4YGlfIxgwnFmn5oF?=
 =?us-ascii?Q?GvLllmCuw35wyiHGhgygFfZCG1TgNPCXOb3lzlS?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: Epuv9jne4Wvw

--0dfb35a8dcb4d57363392c27d8d34dd3d7f002c24a74392aa58bb9a16434
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The Strangest Hit Songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that influenced his music. Despite the song's success, Ahbez struggl=
ed with fame and remained an eccentric figure in the music world.Comments S=
ummary:Many readers were surprised to learn about Ahbez's background and th=
e song's history.Some commenters discussed the musical composition and its =
impact on modern music.Overall sentiment was positive, with appreciation fo=
r Ahbez's artistry.2. Making my local LLM voice assistant faster and more s=
calable with RAG
This blog post discusses the author's efforts to enhance the performance of=
 a local voice assistant using Retrieval Augmented Generation (RAG). The au=
thor shares technical insights and personal experiences in optimizing the a=
ssistant's speed and efficiency.Comments Summary:Readers engaged with techn=
ical questions about the LLM model and its performance.There was a mix of c=
uriosity and skepticism regarding the proposed solutions.The overall sentim=
ent was constructive, with many sharing their own experiences and suggestio=
ns.3. Face of ancient Australian 'giga-goose' revealed after fossil skull f=
ound
This article reports on the discovery of a well-preserved skull of the exti=
nct bird *Genyornis newtoni*, providing insights into its appearance and li=
festyle. The findings suggest that this giant bird lived in ancient Austral=
ia and went extinct shortly after humans arrived.Comments Summary:Commenter=
s debated the causes of extinction, discussing climate change and human imp=
act.There was interest in the scientific implications of the discovery.The =
sentiment was mixed, with some expressing skepticism about the conclusions =
drawn.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--0dfb35a8dcb4d57363392c27d8d34dd3d7f002c24a74392aa58bb9a16434
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The Stranges=
t Hit Songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that influenced his music. Despite the song'=
s success, Ahbez struggled with fame and remained an eccentric figure in th=
e music world.</p><h3>Comments Summary:</h3><ul><li>Many readers were surpr=
ised to learn about Ahbez's background and the song's history.</li><li>Some=
 commenters discussed the musical composition and its impact on modern musi=
c.</li><li>Overall sentiment was positive, with appreciation for Ahbez's ar=
tistry.</li></ul><h2>2. Making my local LLM voice assistant faster and more=
 scalable with RAG</h2><p>This blog post discusses the author's efforts to =
enhance the performance of a local voice assistant using Retrieval Augmente=
d Generation (RAG). The author shares technical insights and personal exper=
iences in optimizing the assistant's speed and efficiency.</p><h3>Comments =
Summary:</h3><ul><li>Readers engaged with technical questions about the LLM=
 model and its performance.</li><li>There was a mix of curiosity and skepti=
cism regarding the proposed solutions.</li><li>The overall sentiment was co=
nstructive, with many sharing their own experiences and suggestions.</li></=
ul><h2>3. Face of ancient Australian 'giga-goose' revealed after fossil sku=
ll found</h2><p>This article reports on the discovery of a well-preserved s=
kull of the extinct bird *Genyornis newtoni*, providing insights into its a=
ppearance and lifestyle. The findings suggest that this giant bird lived in=
 ancient Australia and went extinct shortly after humans arrived.</p><h3>Co=
mments Summary:</h3><ul><li>Commenters debated the causes of extinction, di=
scussing climate change and human impact.</li><li>There was interest in the=
 scientific implications of the discovery.</li><li>The sentiment was mixed,=
 with some expressing skepticism about the conclusions drawn.</li></ul><foo=
ter><p>This email has been sent by Toolhouse. You can change your delivery =
preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du00=
1.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswt=
KZ4_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmChxPFcYIQz0zeUbndC96tlkj617=
R-2Bun3OY284gRn1EvFkT6due16ViUUHtTvHk8Bd6tS-2FDYJOZWaC6qSoY81ceWXSc9eI2C-2F=
4rv-2FbZhRMoZYVdV-2FUIqKWSrvzFFT9yTQ7m0Jb15AFj1ktgm9cyuynqTH6PlD2yEr0TAcKJl=
u-2FrYw-3D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhouseai=
.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJQMHWqz=
MYN6wRx6kvPUg7N3hb1qEB6VpTox6rLclwBJ9s2gE1TQzNRWAxYSqLBKRAyGASpmuV6OdqSfbzD=
-2FgLKTqGsNtib-2BeT2M5-2Fa1eECS2UwjLStt0Gr-2BJHm2K1el-2Fo-2FsAxkfYdU-2FUqIc=
vRXvDOqMUtmP17Qa2h0mEnCQvcg87MueHXsskkoCtGnAISYLzk-3D" alt=3D"" width=3D"1"=
 height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !import=
ant;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !impo=
rtant;margin-right:0 !important;margin-left:0 !important;padding-top:0 !imp=
ortant;padding-bottom:0 !important;padding-right:0 !important;padding-left:=
0 !important;"/></body></html>
--0dfb35a8dcb4d57363392c27d8d34dd3d7f002c24a74392aa58bb9a16434--
