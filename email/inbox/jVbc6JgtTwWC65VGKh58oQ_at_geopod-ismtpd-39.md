Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp918968ejc;
        Sat, 19 Apr 2025 10:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+kumH9IS0iBjHFxND4nGs2yzjs3xMka70oOewoea3VDcnr+VSJOdH5x//VJPngyRg+Ro
X-Received: by 2002:aa7:88d2:0:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73dc1566852mr8662421b3a.18.1745083858539;
        Sat, 19 Apr 2025 10:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745083858; cv=none;
        d=google.com; s=arc-20240605;
        b=ftfQmvY57uadijSkKDsuX6qnAss8V6zoTqy8FWz2TtZ2OYgkmOzDrOwTnO72A7sQuz
         vunv+Oc5y7XqZtpYACopTTOyYqHjkTu1O4kTFJM/LzyXgTqlVNfZc/FAleGNWAgSmifo
         wZhGyJC+LT6V93J9Tq0IOIc80aShPlBRJUe6poaDt60EVF8mhajnyUaWRlA2OivD1lch
         +jhHcnMbfcBB5ORqm0ZEXJ/XwKdpouHtP77C8Xi7v2ldkT5/HnXeObv9kG7ZCoG0XCBb
         lsUohDMAj3UbMwwli5vCib1tnl2eaqQ6jdD1sRoIXIxdfKDbXjINz8NKRuGsAHOOax8v
         zjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=iWI4sqpwPY8yOfzvRt0tJb5MxpBunRJ1vxvpxjHN7Lc=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=FjZzvhOOLHHtXms+ChVGYS1sY8xCEvufufiQF5bGoTC7xy8XGrJCBqfmb9VEAoNIMN
         HZECnpER2VlWdemSuHT1DBHB1S6DugeyoAwHEF1Vutq09MsqFdR4p+Vr0m8sDUwPbIG6
         GhGLcr4ENwTApmRCLzGe7onsVF5la6/ntAURd4Os+gfzEVTnBbb0UFIqo2Y5e+oubJ4g
         Vm5N26Lf+K1Sgj2KE39nwHLskvS0CevpmoeFcSf/qmNDji851IuLnfOVyTpjpAvy5I+8
         93n/CyzaD9mrnPQlr+0XwMHFyanGUYhbOtb3MNsfUaiK3k9zyLH5CTgbaLIHLITpyF4v
         SSpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=RCHAsYjE;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=C3Vr5O8w;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73dbfa04680si5879232b3a.179.2025.04.19.10.30.58
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 10:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=RCHAsYjE;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=C3Vr5O8w;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=iWI4sqpwPY8yOfzvRt0tJb5MxpBunRJ1vxvpxjHN7Lc=;
	b=RCHAsYjEdXAvV9fnS+ZZEWvhjhfZqN1/NOhzQSO09Qb0Iq/GzxtUXiJ3p6yFeRutqFC0
	1hdYmkxaX1Q6qhdxVuSH4XNuVTmHub2hc+U7LSMjPHRw/muSBJGD57WMDSJnbYLTWhH5f9
	OQKHjcUgYKxQ9Cznbz5iN9s00sMP8E/Q9Bt+tjYiGDXah9bWNs+qrt2tUgs2Mj7M6gOP7N
	7VmpF4s9HgG7g44UMWHiZY50apzNhPk1vLQurCEEPl09dsa3dfDwOXwVvUEAe52WFtzXaD
	HlLgH8sHtNqCa923cRav2TmQI+ni3rxaVoA9Xf28mw0JUHinLJEzLR/3v9At2rTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=iWI4sqpwPY8yOfzvRt0tJb5MxpBunRJ1vxvpxjHN7Lc=;
	b=C3Vr5O8wmTBLfGJAsvbEDNPXbxiTirs2BCVo1Furm0UfjIj1yaAEtM+Cls5w9JkfeNpA
	f3Ff/gER+SFO+NXmB/pWwRNPl9+ntz4urNj7PmhJP7RM4p4X1EHEbq8/oycahzHukl8KyB
	1JMENThBv1VdQm6vwUmQ3ykSBIPiN2qI8=
Received: by recvd-6884bf9dd7-llvkw with SMTP id recvd-6884bf9dd7-llvkw-1-6803DDD1-28
	2025-04-19 17:30:57.426964749 +0000 UTC m=+933742.960149710
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-39 (SG) with HTTP
	id jVbc6JgtTwWC65VGKh58oQ
	Sat, 19 Apr 2025 17:30:57.367 +0000 (UTC)
Content-Type: multipart/alternative; boundary=0121e0ab4891c62ce3c7c4c16a6e2f0696dcf807d954ea2e293ec18b7aa5
Date: Sat, 19 Apr 2025 17:30:57 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <jVbc6JgtTwWC65VGKh58oQ@geopod-ismtpd-39>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6QzX1c68Cr+u9w0?=
 =?us-ascii?Q?pgWfb5yXkj6JXDQkvPNP6W6oQ00C1ZJ5yVUjpGv?=
 =?us-ascii?Q?3fKkZokYKpPY8pS0WPa2=2FAcQhI4ZmijWnQQBoxx?=
 =?us-ascii?Q?sCPk7gjA9wtLW2Zwpjh4pGsnO+mVooZIcPtW+tW?=
 =?us-ascii?Q?+lmd3qrGFVfMKKDnsXoFvxrqynp6hut3WvP1+MR?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: hNw9+7orQXjC

--0121e0ab4891c62ce3c7c4c16a6e2f0696dcf807d954ea2e293ec18b7aa5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Packing Input Frame Context in Next-Frame Predict=
ion Models for Video Generation
This article discusses a new video generation model that operates efficient=
ly on consumer hardware, allowing for the generation of long videos without=
 significant drift issues. The model utilizes innovative techniques to opti=
mize GPU memory usage and improve frame prediction accuracy.Comments Summar=
y:
Comments reflect excitement about the model's capabilities, with users disc=
ussing its performance compared to existing models. There is a general sent=
iment of optimism regarding its potential applications.2. Librarians Are Da=
ngerous
This piece humorously argues that librarians are crucial in combating ignor=
ance and misinformation. It highlights their role in promoting access to di=
verse information and fostering a love for reading among children.Comments =
Summary:
Comments reveal a mix of admiration and critique of librarians. Many share =
personal stories of how librarians impacted their lives positively, while o=
thers express concerns about censorship and the evolving role of libraries =
in society.3. Inferring the Phylogeny of Large Language Models
This research introduces a method for analyzing the relationships between l=
arge language models (LLMs) using phylogenetic algorithms. It aims to predi=
ct performance characteristics based on output similarities.Comments Summar=
y:
Comments indicate a general agreement on the importance of understanding LL=
M relationships, with some questioning the effectiveness of current AI dete=
ctors. The sentiment is mostly positive, acknowledging the significance of =
the research.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--0121e0ab4891c62ce3c7c4c16a6e2f0696dcf807d954ea2e293ec18b7aa5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Packing Input Frame Cont=
ext in Next-Frame Prediction Models for Video Generation</h2><p>This articl=
e discusses a new video generation model that operates efficiently on consu=
mer hardware, allowing for the generation of long videos without significan=
t drift issues. The model utilizes innovative techniques to optimize GPU me=
mory usage and improve frame prediction accuracy.</p><h3>Comments Summary:<=
/h3><p>Comments reflect excitement about the model's capabilities, with use=
rs discussing its performance compared to existing models. There is a gener=
al sentiment of optimism regarding its potential applications.</p><h2>2. Li=
brarians Are Dangerous</h2><p>This piece humorously argues that librarians =
are crucial in combating ignorance and misinformation. It highlights their =
role in promoting access to diverse information and fostering a love for re=
ading among children.</p><h3>Comments Summary:</h3><p>Comments reveal a mix=
 of admiration and critique of librarians. Many share personal stories of h=
ow librarians impacted their lives positively, while others express concern=
s about censorship and the evolving role of libraries in society.</p><h2>3.=
 Inferring the Phylogeny of Large Language Models</h2><p>This research intr=
oduces a method for analyzing the relationships between large language mode=
ls (LLMs) using phylogenetic algorithms. It aims to predict performance cha=
racteristics based on output similarities.</p><h3>Comments Summary:</h3><p>=
Comments indicate a general agreement on the importance of understanding LL=
M relationships, with some questioning the effectiveness of current AI dete=
ctors. The sentiment is mostly positive, acknowledging the significance of =
the research.</p><footer><p>This email has been sent by Toolhouse. You can =
change your delivery preferences at <a href=3D'http://url1228.toolhouseai.c=
om/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm=
0-2FD2kMX-2BcmQdjMsw7TtJ_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBm1RAb=
D0degEYwTIY7lzBLC9oSQ-2FKGCSXgzc0-2FiMmhl4Mfrob0RKgrtFcRLX0QTJ6pwx2MBgtHXeD=
mdcFAbowicR6TVDPVABXOgBBtBSeuzz9Dj1CVkv4e-2BKaPUyseYw2llktRneDWUE6DeVveOxJq=
Ts4WnAqySO0h-2BAEYhfQMlg-3D-3D'>here</a>.</p></footer><img src=3D"http://ur=
l1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm=
62DliywF0GLhvwhe5S9DWQ70ntujK7vaU6PTfYZmXNC-2Bt9fVr0Asng3fPLiICVBOPpnhjz-2F=
bPogdyFxlp6Srwjevr-2B85AoCTvUqi3goevlrl1phmupxChd4eSOF76HbsvjcFiu5RGG2-2BTC=
tJNS7jzdprrojftXqQkMahEhI4r1YvKRAGbdwkaXtMgmy78IlA9K-2Fjms0Di0k-3D" alt=3D"=
" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;widt=
h:1px !important;border-width:0 !important;margin-top:0 !important;margin-b=
ottom:0 !important;margin-right:0 !important;margin-left:0 !important;paddi=
ng-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;=
padding-left:0 !important;"/></body></html>
--0121e0ab4891c62ce3c7c4c16a6e2f0696dcf807d954ea2e293ec18b7aa5--
