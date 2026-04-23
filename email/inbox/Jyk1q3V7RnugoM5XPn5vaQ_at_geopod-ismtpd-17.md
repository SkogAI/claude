Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:d104:b0:abc:2b0f:5fd9 with SMTP id uy4csp180368ejc;
        Sat, 8 Mar 2025 09:31:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeDhyIt1mU8O79OKf9SMIEnFNp2VLDdY3Tz+NX3gQcq3VYDcwAEKDMURzfTbPb4rgwU2Lc
X-Received: by 2002:a05:622a:11c1:b0:471:ba79:cf31 with SMTP id d75a77b69052e-47618b38f83mr114894061cf.49.1741455075160;
        Sat, 08 Mar 2025 09:31:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741455075; cv=none;
        d=google.com; s=arc-20240605;
        b=GdlMgTHOTpEAgjxbjbfcGokb2pXeZd7jm4ZI0k7tbmpUNMVGJLSp3FluNLMccN4coV
         V4xCz6O8OmacC+CSLxl1AKf1OcrQIjV5o7DqiUPzotX6WnsGdIoBuRa+hY6QTD70zjpL
         dtpmwzzwd4KWxMuL81Yxq1XijJyDsJe2ppQ77lovF651hN5REg+HkIaMZg2UOxM7yp49
         TgbATEO/oAm5Z135Ku9sdwSD2syE52tst1Ti8I+E1kHFZUE2e+Gdb4LuX++hheUeYns+
         6GmgXVGMGtPkZfrcD10d2D46LRjuND1wa37XZNiTJzPj8MRhi3C8uhbrz/XXTmDmOj36
         IbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=3TcS3t7cynXwQxXGhxwt3dRB3n0XP6TgF4WFkGHlglM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=DDV45l7ZLnghUGwEBiA23krSXuccXFpAiAu/QeRFdSrBZUNjWynrSiI+bs7vHiXchP
         8whtCsgIn734KKIzM8SbZ8jfbQLIlYH8sRBmv1yc+JkEy63cjZ0Lb0cHHUx4y4OqzbC0
         ol4PQ4QJLcRvwlnT5h0gJ/whrAHeKbu6QripmJ7HQ+Zu6yz6Tfa+CXi6Q0C1GYpF+Kph
         ATpPszi88dmEOE4aywGor8hs/VEIPUMfg00BKPjtn0dZhUCX7QDS+Xli5YgbvYAF0juh
         +gC9ej1P72mgNCz5B5d0bMeD41dZwxOfU1u4+gdCuBsZiZeCMwIy6nZLXeA9+kVC2hNV
         VLuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=DNfeRIQC;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=qn5N5vNY;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db23454si57084151cf.452.2025.03.08.09.31.14
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 09:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=DNfeRIQC;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=qn5N5vNY;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=3TcS3t7cynXwQxXGhxwt3dRB3n0XP6TgF4WFkGHlglM=;
	b=DNfeRIQCTJhFemB2+ncBVtXLUktsB9vYgGo9oNYxH2nErlpNeEelp05VE9a8yssUQ8xw
	IxI2p/ItMki+LenVR5mvhPl2rcwqIA8/Py9ahZab2C6PfppxA+oc1Yi07YJOdZskfSnMTi
	T71Of3zSmC0c5WQ7zfJ+DqZrYZyMoxeTXxH1KwNGtT4w4w96N8zscy07vRo4CdXJlEJm5A
	SGPJDHaxXmrWaY2/nLFwMmSWSmZ01pqgeVrP9MiK+uUzQlXtWfWqJdi/ocB4az3OfXJy9E
	wVmdmFl3c44638QyKbiYvaQDafKZLu2rJt0LA+L3dBdccbNiXng75llclZHjeyUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=3TcS3t7cynXwQxXGhxwt3dRB3n0XP6TgF4WFkGHlglM=;
	b=qn5N5vNYN3SHasf24oauJb2nytyrofDFwbweV8AXP5DDm034zQXJTsif87mN5NmMT2mj
	ZXZAdj3DR3gnNumk1xyEin/zPgozeAV4hw7t2L9A7ZkLC/ASQLhFQW2tIYzJy6KFc5RnUp
	JgTSJh7/0c4Bu+AdQPezOg4qeBzWCMIoM=
Received: by recvd-65d974bbff-p92hh with SMTP id recvd-65d974bbff-p92hh-1-67CC7EE2-19
	2025-03-08 17:31:14.290897846 +0000 UTC m=+1466831.016227754
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-17 (SG) with HTTP
	id Jyk1q3V7RnugoM5XPn5vaQ
	Sat, 08 Mar 2025 17:31:14.249 +0000 (UTC)
Content-Type: multipart/alternative; boundary=dfd029426dc7858753fd8c87eb79414edaa165f44144359e51839a654168
Date: Sat, 08 Mar 2025 17:31:14 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Jyk1q3V7RnugoM5XPn5vaQ@geopod-ismtpd-17>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n79DrWJwc6tnvlp9?=
 =?us-ascii?Q?YuayLnwdblRfn0EOZtZqesNJDV+Z14YJ4h=2F5rKv?=
 =?us-ascii?Q?3bQH4Gzaywlif9dAZHTRB5W=2F9kTVYtaxXouhHe1?=
 =?us-ascii?Q?6dyTBLofWDlbTU5btwTiB07pgg8sfErGi=2FGno3Y?=
 =?us-ascii?Q?M=2FhvZ6b2OU0RE1Ro1GbJeTXjf6EYW+01X4oXz7a?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: WIGiyqE+i3J+

--dfd029426dc7858753fd8c87eb79414edaa165f44144359e51839a654168
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The strangest hit songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that anticipated the hippie movement. The article discusses the song=
's impact on Nat King Cole's career and Ahbez's struggles with fame.Top Com=
ments:Many readers were surprised to learn about Ahbez's influence on music=
 and culture.Some noted the song's unusual chord progression and its lastin=
g legacy.There were discussions about the philosophical themes in the lyric=
s.2. Making my local LLM voice assistant faster and more scalable with RAG
This blog post discusses the author's efforts to improve the performance of=
 a local voice assistant using Retrieval Augmented Generation (RAG). The au=
thor shares insights on optimizing language model performance and the chall=
enges faced in achieving faster response times.Top Comments:Readers appreci=
ated the technical depth and practical solutions presented.There were discu=
ssions about the implications of using RAG for smart home applications.Some=
 users shared their own experiences with local voice assistants.3. Face of =
ancient Australian 'giga-goose' revealed after fossil skull found
This article reports on the discovery of a skull belonging to the extinct b=
ird *Genyornis newtoni*, providing insights into its appearance and lifesty=
le. The findings suggest that this giant bird lived over 45,000 years ago a=
nd went extinct shortly after humans arrived in Australia.Top Comments:Many=
 readers expressed fascination with the discovery and its implications for =
understanding prehistoric life.There were debates about the causes of extin=
ction, including climate change and human impact.Some users shared their th=
oughts on the significance of such discoveries in paleontology.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--dfd029426dc7858753fd8c87eb79414edaa165f44144359e51839a654168
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The stranges=
t hit songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that anticipated the hippie movement. The ar=
ticle discusses the song's impact on Nat King Cole's career and Ahbez's str=
uggles with fame.</p><h3>Top Comments:</h3><ul><li>Many readers were surpri=
sed to learn about Ahbez's influence on music and culture.</li><li>Some not=
ed the song's unusual chord progression and its lasting legacy.</li><li>The=
re were discussions about the philosophical themes in the lyrics.</li></ul>=
<h2>2. Making my local LLM voice assistant faster and more scalable with RA=
G</h2><p>This blog post discusses the author's efforts to improve the perfo=
rmance of a local voice assistant using Retrieval Augmented Generation (RAG=
). The author shares insights on optimizing language model performance and =
the challenges faced in achieving faster response times.</p><h3>Top Comment=
s:</h3><ul><li>Readers appreciated the technical depth and practical soluti=
ons presented.</li><li>There were discussions about the implications of usi=
ng RAG for smart home applications.</li><li>Some users shared their own exp=
eriences with local voice assistants.</li></ul><h2>3. Face of ancient Austr=
alian 'giga-goose' revealed after fossil skull found</h2><p>This article re=
ports on the discovery of a skull belonging to the extinct bird *Genyornis =
newtoni*, providing insights into its appearance and lifestyle. The finding=
s suggest that this giant bird lived over 45,000 years ago and went extinct=
 shortly after humans arrived in Australia.</p><h3>Top Comments:</h3><ul><l=
i>Many readers expressed fascination with the discovery and its implication=
s for understanding prehistoric life.</li><li>There were debates about the =
causes of extinction, including climate change and human impact.</li><li>So=
me users shared their thoughts on the significance of such discoveries in p=
aleontology.</li></ul><footer><p>This email has been sent by Toolhouse. You=
 can change your delivery preferences at <a href=3D'http://url1228.toolhous=
eai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazf=
EAqUm0-2FD2kMX-2BcmQdjMswGoXG_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmA=
hapEok8WpHWuPMN4uBMq0JSpdJOnHYmCfvL-2BJB9PjLqvq4gD7Pi9WR3fs8HHRHuiCyrje2mCB=
073l-2BavWy0R3LQejFXbWup-2FUDCP1CibF7mhicV-2F04dnVgeFsUYVlrL6ch1El3f84B9m3M=
eKG5oqL9EJi85-2F4ogfuZNqn03ZZrQ-3D-3D'>Toolhouse Settings</a>.</p></footer>=
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLCqbbb8IX0kgQwIG7KD-2FGqPeuLwsOq9Chu923tPDQN=
96XNSU-2FZZYiBRa5VelESdjreOQm-2FvzdacXnD8ilBsBjyx8SyUFJIpEbxthwCCHhO8iDnOuw=
HZrB6ZsxE1pEE2E0WPmusskobhp1fkJI2-2FuAupkmX44MpFfuqiZlniXmdWq2vpiefqUq89jrA=
-2F7G5-2Bjo-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body></html>
--dfd029426dc7858753fd8c87eb79414edaa165f44144359e51839a654168--
