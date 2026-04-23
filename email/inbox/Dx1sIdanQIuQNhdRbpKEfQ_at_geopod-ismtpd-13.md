Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:6a12:b0:ac2:b370:d0a6 with SMTP id rf18csp109660ejc;
        Mon, 10 Mar 2025 10:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqXmiehCYFzkPsGRoKta4lisy9C077tvprp50mrF1xjvhiiWm27zFlwwn7LSd6PLX2B2ZA
X-Received: by 2002:a05:6102:304e:b0:4bb:e8c5:b162 with SMTP id ada2fe7eead31-4c30a5ea48amr9189320137.10.1741627900806;
        Mon, 10 Mar 2025 10:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741627900; cv=none;
        d=google.com; s=arc-20240605;
        b=MeyTPHbkrDZ/gy3xQjGFhVnN3X+GXy2Ynirz6QQMmCeI30EflNyt7kJw28WRq3aoS9
         6kgRT7IBuZAckQKBXXDKu8xb2P7dGYwIcObg/tCRotmmycA4y31hmOHntjMTu2dN7qoA
         biuaf+FcjVvSv88h2Wg/tv17iFGsg+r+7Q+bpWrrIXsCBe3pVNfAR19xAE1OqVNqzaJ/
         PCr/O+pl+PEByPp63vZ95IuzLZUaoe13+fsgPoc5bt0QXCZ0dMdgXIfeV6i3oJwHEA6G
         zNf0X2nwy8C8fB1HYfGZirJA6krzkpB/iKQmZV72wopQpsb1LMqrnzZAV46sar/4SnRf
         OQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=ZnFYIX2QulSbkoRVYdyI3LDhXSBPSuU4VlF9oDCDFpI=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=NjS/o/JJXm09UdyIwfTWGE9eDN8rjujXJvcjZAgPCELLVO1lATW41OlWgtf4AAAJAe
         5DXGcOP3VKquoQ/yAJcm4YN5qjwprfozR6W2go7ryvfI1lah3NsBiN+mASdnwxg77cIW
         Z79zWl3YQ6kzqrwZJ8g8Bby9fVy1UjErW/rwq8P+UEm82q/xGWiBXZU2DzicdVpMRCLw
         8wTbA7iS+08NsMH3KylisBnAxtNscNDQdR2k0iIEsEZuemFsvmu/+rN8ThBXN1NFZjWL
         Kisp07R0kJE5yxhI83RYd68iWbyrLs5zCmFoYb87OWyQw6AgGtUeuYl2cW7pySz5zeQf
         BqYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bkxyBFoj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=q8NzZhpL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbcfe30fsi2299940137.500.2025.03.10.10.31.40
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 10:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bkxyBFoj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=q8NzZhpL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=ZnFYIX2QulSbkoRVYdyI3LDhXSBPSuU4VlF9oDCDFpI=;
	b=bkxyBFojCaimEZ3obcdks43PCMo6DGA9TOArfTY5NCNdLtXa7WWkgzzYO6yd8ax2fg+K
	lit0G6EH3d5NydQGE88mCTRVv4nbyF7uGlsMzSPri7EMssgvisMpXN5z3zIx1lmZk7yd9F
	SI2yjgznWYZuLPgzj+YSQBPZqHbEq4fWdjVVTACkTLZ3eeiwWdodciEUGvoQvYqeas4NY3
	YK8qH0OdZrEXli7czDQJgu6Tvo6yM3rpmaMccWDUVMPQWa4oefYheROXAqj7XO2uei9zmF
	jQBLHceKYnG/HOAx2vw4ZGZQmjxPBNgy70T9z5OqKCSZkXZshDYJPFaKDza6xpYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=ZnFYIX2QulSbkoRVYdyI3LDhXSBPSuU4VlF9oDCDFpI=;
	b=q8NzZhpLZLH2a4eKINNs94UDENgg5r/5WPCiQBpdY+dJN8c/jDdH2a4Ic0qWLLZRCKMc
	52GR+wddAvEac9SLwwbfD58JUJCwRUAByAlrW3C3dIzU2/9mjEBbavp7gdCymNwuetMjl+
	QOrIV0b8jJ7WxZaGLqBsSMSGftqJN1x4s=
Received: by recvd-65d974bbff-c7n8n with SMTP id recvd-65d974bbff-c7n8n-1-67CF21FB-98
	2025-03-10 17:31:39.948895009 +0000 UTC m=+1639666.711437053
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-13 (SG) with HTTP
	id Dx1sIdanQIuQNhdRbpKEfQ
	Mon, 10 Mar 2025 17:31:39.862 +0000 (UTC)
Content-Type: multipart/alternative; boundary=d47b711a8c3fe0b9e8fde037bbdf484a30ab97fc07537532031e250f191f
Date: Mon, 10 Mar 2025 17:31:39 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Dx1sIdanQIuQNhdRbpKEfQ@geopod-ismtpd-13>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7fMymL85OmmDE6n?=
 =?us-ascii?Q?j4ZFBgNkOvVCJ3INuVWvrZF+L4pVitUBVuCdLz2?=
 =?us-ascii?Q?RgC46uxD0sMq+dwUxm3c7gbIEQ+=2FUQYT4vl05Mk?=
 =?us-ascii?Q?wzi1NNyPC7zscc44wmgWqipfexRIaPIh7r36Ek=2F?=
 =?us-ascii?Q?aoVPYLpfZmRxt6uouLT3X5Ffmc15dZJ2R5CLA=2F0?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 6hUAOycCQv72

--d47b711a8c3fe0b9e8fde037bbdf484a30ab97fc07537532031e250f191f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest1. Ask HN: What happens to older developers?
This article discusses the career trajectories of older software developers=
, emphasizing the importance of continuous learning and the challenges face=
d by those who resist moving into management roles. Many contributors share=
 their experiences, highlighting the value of being a generalist and the ne=
cessity of adapting to new technologies.Top Comments:Many older developers =
continue coding and find that changing jobs is the best way to increase pay=
.There is a push towards management that some resist, preferring to remain =
individual contributors.Continuous learning is essential to stay relevant i=
n the field.2. How Remote Working Makes Startups Better
This article links to a Medium post discussing the benefits of remote work =
for startups, although the Hacker News post itself contains minimal content=
. The general sentiment is that remote work can enhance productivity and fl=
exibility.Top Comments:Remote work allows for a better work-life balance.St=
artups can tap into a global talent pool.Challenges include maintaining tea=
m cohesion and communication.3. Putin=E2=80=99s Strategic Error
This article argues that Yanukovych's fleeing Ukraine in 2014 undermines hi=
s legitimacy as a leader. The author contrasts his actions with those of ot=
her leaders who faced protests, suggesting that true leaders do not abandon=
 their people.Top Comments:Many commenters agree that Yanukovych's flight w=
as a sign of weakness.There is a discussion about the implications of leade=
rship during crises.Some draw parallels with other historical events and le=
aders.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--d47b711a8c3fe0b9e8fde037bbdf484a30ab97fc07537532031e250f191f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Ask HN: What happens to =
older developers?</h2><p>This article discusses the career trajectories of =
older software developers, emphasizing the importance of continuous learnin=
g and the challenges faced by those who resist moving into management roles=
. Many contributors share their experiences, highlighting the value of bein=
g a generalist and the necessity of adapting to new technologies.</p><h3>To=
p Comments:</h3><ul><li>Many older developers continue coding and find that=
 changing jobs is the best way to increase pay.</li><li>There is a push tow=
ards management that some resist, preferring to remain individual contribut=
ors.</li><li>Continuous learning is essential to stay relevant in the field=
.</li></ul><h2>2. How Remote Working Makes Startups Better</h2><p>This arti=
cle links to a Medium post discussing the benefits of remote work for start=
ups, although the Hacker News post itself contains minimal content. The gen=
eral sentiment is that remote work can enhance productivity and flexibility=
.</p><h3>Top Comments:</h3><ul><li>Remote work allows for a better work-lif=
e balance.</li><li>Startups can tap into a global talent pool.</li><li>Chal=
lenges include maintaining team cohesion and communication.</li></ul><h2>3.=
 Putin=E2=80=99s Strategic Error</h2><p>This article argues that Yanukovych=
's fleeing Ukraine in 2014 undermines his legitimacy as a leader. The autho=
r contrasts his actions with those of other leaders who faced protests, sug=
gesting that true leaders do not abandon their people.</p><h3>Top Comments:=
</h3><ul><li>Many commenters agree that Yanukovych's flight was a sign of w=
eakness.</li><li>There is a discussion about the implications of leadership=
 during crises.</li><li>Some draw parallels with other historical events an=
d leaders.</li></ul><footer><p>This email has been sent by Toolhouse. You c=
an change your delivery preferences at <a href=3D'http://url1228.toolhousea=
i.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEA=
qUm0-2FD2kMX-2BcmQdjMswNbaV_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBpw=
HPRpA6jqPiCVSCriMd222rfPXs88IGynxz7JdwmU5T9nIWrEwzjxOvwFuUsgIkixJSPLI2vHusP=
AI2YbJ0qPJeIzsBJLBLwed6C98Yrg-2BV56uNbhAw-2BAZEkDrdvvMbC1oBDplV5ZLsTswXnGPP=
w4B6KjCqoFsErU3s0fBxnWg-3D-3D'>Toolhouse Settings</a>.</p></footer><img src=
=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2=
P513JhjX8oSKm62DliywF0GJQ8rB-2BA-2F2vkeKh4xllJ69slEr-2FTf9J-2BtMF5w0EF-2FOf=
KOpaM5iPbF7eL5gm5oQnI6NaLZgjxdqm2zjSTVuYP5YpFZKa40j2EuD8J85ztCk3-2B3gnevhzc=
FHy34DR8BFsk9Ojyy3bGkB3jJwO-2B-2B7hW3WVCIyen5FNM-2FTHI6MjEt0IMl9rQi0INQZt1r=
KaCF0ezzs-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body></html>
--d47b711a8c3fe0b9e8fde037bbdf484a30ab97fc07537532031e250f191f--
