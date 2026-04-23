Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:9c95:b0:ac2:b370:d0a6 with SMTP id fj21csp410553ejc;
        Wed, 12 Mar 2025 10:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpmtXubnep29Z6vpvT/rFYJQjwL31QfEKUDovd3Xt533FdQVcZZyzjba4z7sT+4cksFoT
X-Received: by 2002:a05:6102:f88:b0:4bb:cdc0:5dd9 with SMTP id ada2fe7eead31-4c30a604d89mr17178966137.12.1741800791950;
        Wed, 12 Mar 2025 10:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741800791; cv=none;
        d=google.com; s=arc-20240605;
        b=IdZmJTR95Vn/bbKmgjOUL2UyHWQNDXvLEN0nZGKnfqSDQnJ9Yw4D4+4DRvaVj2GZKv
         Xbe28BSh8Hcl830LBGkot2/b5CjQdfPMUe4CqteXXtKZBwFN9N3GUF23orNbU8qrXAlq
         DgoQ1RAqR++vI/bTTfzigJPu0njM1OY3vvXmvryespe+DCkRiqzVDHAPlN5yRM8gey8X
         TaEAhMMlXlZIvn4vJPJi5nm5CJpIT29U+N2io/RhSo6h2dMOqgbSQs5onAkqXhPKx+RM
         cWhH5Q6ygOMGJpj7o6vz9vdpfMOVeF29CTYyjZkVbDlHs1BxXZXzVgDCA+643xpRpmj2
         DqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=u2fhV68hMB/IVj+0CuEiGlUVyffoUp7hgOaJ724mPok=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=lOZEsx2SX3hVKjAdtfdRNQMryEPoT7b0VahJxPRt+uLU1Qle1kuNLknbWLMzhaIlUb
         6X2OxCsD1MbChXtS1yLAqKAGiZgervea1EX05/PlB/DkLa+g1N4CEbGF/PepU6EqB3U4
         E2U7zSeVkAz69VQS/tUShqpo2+S+wP6G6CLgOvCQXpc40AIgzSsgow+shzZB1tSrvQtR
         zAkgRyseOyd45X0Jdz/FNUoppMIFe3UQ+Lt940Tqhdsl95V+nNJFXP+Yanm+usR2a5CE
         zKgh9jM94EcKHRgvWPqt9aHxozBucad8+HUfEhqjs0c+gkbgtpPn65KwzT4IFouvKaJ1
         RhdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=AixSH02W;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=LymU89ZT;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc78d27si3704283137.262.2025.03.12.10.33.11
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 10:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=AixSH02W;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=LymU89ZT;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=u2fhV68hMB/IVj+0CuEiGlUVyffoUp7hgOaJ724mPok=;
	b=AixSH02WxHQ3jm4JIcJWJJCo3tFe9I1BUoiQWW6jPdrdnkGFbMABZKzAz1XUA5iLF4fM
	8xlluXwoqXDOTS+2xhQYTdVrVrYTAayVxvgYZQXgwJMBA+d2m0cNqxbZoG57oIZ42pw4ly
	0hjtlF978Of6xyXeBwYx5Seo6CpDFPkzx57IhduYeiDp+tsnssK82zWcu0xVwwnWOAveE5
	lLhqIfhDU0bOoz90/w+EkkepaxE+bjulNKf2hH1H/bBoMDrWjDEu2H6MIuZSKfK9OxHhsD
	7EcDYM9swz6dyDfmv5DHwLe4vdafTLntWIOD9aDveuJL19LRjgJASsVPNqvYCpiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=u2fhV68hMB/IVj+0CuEiGlUVyffoUp7hgOaJ724mPok=;
	b=LymU89ZTDClyEvG/DSQZm5WeHviEA9kSVGezVRqjXCbxuGqdBX4JqPKD4YThv1Xm/Bg1
	VEvawWpSXFhbhqp2k5CgpWMZf/K1U6yqm3ieYh7V9aK6xK65v5mT3XZyxRevI8aum8TY+M
	TQBfLm8IsfXykXYyr08shPd8pClhD20os=
Received: by recvd-65d974bbff-c7n8n with SMTP id recvd-65d974bbff-c7n8n-1-67D1C555-3D
	2025-03-12 17:33:09.699136875 +0000 UTC m=+1812556.461678897
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id FS0QrBCkQCeJc5Q8q3PwKQ
	Wed, 12 Mar 2025 17:33:09.604 +0000 (UTC)
Content-Type: multipart/alternative; boundary=af8389050187a84b9ad73b3664174c0218599481dc5b433c92506d79e59b
Date: Wed, 12 Mar 2025 17:33:09 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <FS0QrBCkQCeJc5Q8q3PwKQ@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7EhO9oEdEBH6XSJ?=
 =?us-ascii?Q?0BT=2FVx1=2FCVxNJoOBL6t0YcmFfWXyhGzTP2IFr0s?=
 =?us-ascii?Q?7CL9op+qBrFVAZdPCG+nOxi4grF+6afKjuDfOGZ?=
 =?us-ascii?Q?pEDWagGBgQ9zRhBMW966xfvKZVey120sAizDxVF?=
 =?us-ascii?Q?PJYV94ZljisHrXdYjYEru6I0hDXb0=2FH6fSmwW6m?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: sGbZ0rbIxlNU

--af8389050187a84b9ad73b3664174c0218599481dc5b433c92506d79e59b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Drones and the rise of the high tech assassins
This article discusses the use of drone strikes to eliminate local strongme=
n in unstable regions. The author argues that while drone strikes are imper=
fect and result in civilian casualties, they are a pragmatic solution to th=
e problem of powerful, lawless figures who destabilize entire regions. The =
post includes links to articles detailing civilian casualties from airstrik=
es in Iraq, highlighting the ethical complexities of this approach.Top Comm=
ents:Many commenters expressed concern about the ethical implications of dr=
one strikes, emphasizing the need for accountability and the potential for =
civilian casualties.Some argued that the use of drones is a necessary evil =
in the current geopolitical climate, while others called for a reevaluation=
 of military strategies.2. Netflix Continues to Crush Cable TV
This article highlights Netflix's continued dominance over traditional cabl=
e TV, discussing its impact on the entertainment industry and consumer view=
ing habits.Top Comments:Commenters noted the shift in consumer preferences =
towards streaming services and the challenges faced by cable providers.Many=
 expressed excitement about the future of content creation and distribution=
 in the streaming era.3. UK: The BBC are handing out one million computers =
to kids
This article reports on the BBC's initiative to distribute one million comp=
uters to children in the UK, aiming to bridge the digital divide.Top Commen=
ts:Commenters praised the initiative as a positive step towards improving d=
igital literacy among children.Some raised concerns about the sustainabilit=
y of such programs and the need for ongoing support and education.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--af8389050187a84b9ad73b3664174c0218599481dc5b433c92506d79e59b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Drones and the rise of t=
he high tech assassins</h2><p>This article discusses the use of drone strik=
es to eliminate local strongmen in unstable regions. The author argues that=
 while drone strikes are imperfect and result in civilian casualties, they =
are a pragmatic solution to the problem of powerful, lawless figures who de=
stabilize entire regions. The post includes links to articles detailing civ=
ilian casualties from airstrikes in Iraq, highlighting the ethical complexi=
ties of this approach.</p><h3>Top Comments:</h3><ul><li>Many commenters exp=
ressed concern about the ethical implications of drone strikes, emphasizing=
 the need for accountability and the potential for civilian casualties.</li=
><li>Some argued that the use of drones is a necessary evil in the current =
geopolitical climate, while others called for a reevaluation of military st=
rategies.</li></ul><h2>2. Netflix Continues to Crush Cable TV</h2><p>This a=
rticle highlights Netflix's continued dominance over traditional cable TV, =
discussing its impact on the entertainment industry and consumer viewing ha=
bits.</p><h3>Top Comments:</h3><ul><li>Commenters noted the shift in consum=
er preferences towards streaming services and the challenges faced by cable=
 providers.</li><li>Many expressed excitement about the future of content c=
reation and distribution in the streaming era.</li></ul><h2>3. UK: The BBC =
are handing out one million computers to kids</h2><p>This article reports o=
n the BBC's initiative to distribute one million computers to children in t=
he UK, aiming to bridge the digital divide.</p><h3>Top Comments:</h3><ul><l=
i>Commenters praised the initiative as a positive step towards improving di=
gital literacy among children.</li><li>Some raised concerns about the susta=
inability of such programs and the need for ongoing support and education.<=
/li></ul><footer><p>This email has been sent by Toolhouse. You can change y=
our delivery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/cl=
ick?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kM=
X-2BcmQdjMsw3l6j_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCgEooztLuz6Jlm=
JBakpj2m5g5gow0q754vw0pNiMeO3WGMh1Ewq3MEDqWrKiD3bn3xnRaOdxEcL4l9lRyzz3G9rQj=
Iw1lSoQrP9T-2Bd77tqJqRTbe7zNXLJdmirxmkbqsXR1NG4bbC0HGxaGEEyd4oh2dFlVE5s1qol=
Wl5djx3wQA-3D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhous=
eai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJZ-2=
Fwr4fpuOk7ktyHT9kVC6nUdrezEfKLVOjDxHgStoE9m6Zpx3xDRVN1G3sA8hLdhW1Xr-2BX58g1=
w7MJ962tjRBLjGhpCq7EeiiVV1f8PXD6WxaV99hstTsDrOeSul2RN5tvOB94Rl4659GTU2vf2-2=
FbgTNuaje215H1WztezncHbRpxaF18a0UFTwf9IArcZ1k-3D" alt=3D"" width=3D"1" heig=
ht=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;b=
order-width:0 !important;margin-top:0 !important;margin-bottom:0 !important=
;margin-right:0 !important;margin-left:0 !important;padding-top:0 !importan=
t;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !im=
portant;"/></body></html>
--af8389050187a84b9ad73b3664174c0218599481dc5b433c92506d79e59b--
