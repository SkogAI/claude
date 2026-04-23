Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:57d4:b0:ab7:3ba4:7d71 with SMTP id u20csp961905ejr;
        Sat, 8 Feb 2025 09:31:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvpZXmgD1wA28ghS9SvFe8xG4IX/SoWxpgHhmb9PkkXFDZz2HxsrZAbNPU6RneRtLFiEyr
X-Received: by 2002:a05:690c:6f83:b0:6ef:9017:3cd8 with SMTP id 00721157ae682-6f9b2a1a007mr73230937b3.35.1739035894826;
        Sat, 08 Feb 2025 09:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739035894; cv=none;
        d=google.com; s=arc-20240605;
        b=Rj/cZd2DyonI2oEouYL/CIpsbvCxGzbkE2d1DCxmBbhefXOrfk1WCcOd8d92MYnLsZ
         M7fucmDuiAAwhxfG988ryUqDD9MiddxB7zB4zqYvfEeFQonLjdeibPokslydXLLocvlH
         Oo+caS5AZVNQjvesf5kYYsyc332syO04o2FfZeXkQ790cwS80qRUwn4ItPpnq7SyARpg
         DPaqnPqq3aDA6Ys816W6SXPJ0sruGYz5ypzdngwavdNS3f6TNMhGMTFgxmbuqwi9MEWH
         nDEN6kr34OiEihlpQOpvLxQgYg+kLWHlL053MXN1UbEm5Tf1HvjXv+dVhKd++WH0YA+5
         LQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=a9M9DG+rBwNxKCQVgk3y9kJ4wgIeW7VnWmxfS4/ky4A=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=QW7XxjcVon3si0zMtGNDocqQClz2QVYFUCLYOvGw7H56Sc8gCszwJkwn+SPHFSkCee
         J9UXqpCAWL9uqSFoxYGcCw57aS10AAbR8Be35CZYsaCeag24XZneJqeuv5/NzwSKSSk5
         Ih5KHmXh5ThNpTyMvJZphm441jFIQH4aPEqWKabsOPah6nfQ0GTw8pjoxg1IrccF5mnT
         ZCrdWwBHQSzoC512JOd2dYu/gKZ8IyMnwi5DaCKPIpbbu1SsEH0IrqWvrwL5PAH78FKv
         DACyBTilu08OZfAWO2AhrCX+KZK3OGxxLdqJ53NyXmLe/k6JzCrArZLgGJo4HgKEA3XY
         swiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=HIHNGhtE;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zdcqjj4d;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhst.outbound-mail.sendgrid.net (s.wfbtzhst.outbound-mail.sendgrid.net. [159.183.224.103])
        by mx.google.com with ESMTPS id 00721157ae682-6f99ffba7basi50952127b3.365.2025.02.08.09.31.33
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 09:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) client-ip=159.183.224.103;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=HIHNGhtE;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zdcqjj4d;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=a9M9DG+rBwNxKCQVgk3y9kJ4wgIeW7VnWmxfS4/ky4A=;
	b=HIHNGhtEn75WxZapqCNoE5gQ6rO9uuyBgZJLynCAGJWt9JX9UxUio/Pz+F1P7NMFxBqP
	9EecEbRwPds+fLKEO0NLJqLX+eg9kOrRjVmG+TkIYDQh6bmy7+l6Wns+ceTMGhXq+Z9/2k
	6g4B/YIeujYsiuELOyhQsVnpXoQTzylIBI2rf9MV+LzQnAFPyGGpda2Zhsa+sJ66zjD3Fa
	yluaX7DdFtfCLjaBTsGbL8SVCiAnLCFTQ/kWBzrbnYo6RUVaZkhYjbb0Bc1ReBIHhET6jJ
	bp5CJBWTsv3Q2yBwoBee29F3pLKPuEGmjGM3uTOKwHu7bfyXppOe0wSj9xSiW8ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=a9M9DG+rBwNxKCQVgk3y9kJ4wgIeW7VnWmxfS4/ky4A=;
	b=zdcqjj4dtdaCvJeaoj2wq3NIRW9GYHPEMSnx1fJYzEnYbIbuqs6etk80zMvtqV3gWGzZ
	lHQhqkk+c2eLISTSd0xph4mrR+avKsmXr+CYg5eCkiP+HtT/kWXYxMZlI+Z6H+7/qljlcC
	eaPodo2IMtmdumJxIUMwPzrULnyr4JLUM=
Received: by recvd-786d47b7ff-dnzf6 with SMTP id recvd-786d47b7ff-dnzf6-1-67A794F4-22
	2025-02-08 17:31:32.5686296 +0000 UTC m=+7416467.870365199
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id Dr0ymrQSRbiqklHEyH46RA
	Sat, 08 Feb 2025 17:31:32.509 +0000 (UTC)
Content-Type: multipart/alternative; boundary=eed01eb68a1f4051ca66335d4c15049e022e4056f6d705524dc51cdf7cc5
Date: Sat, 08 Feb 2025 17:31:32 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Dr0ymrQSRbiqklHEyH46RA@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7fO2BRqPsCE0go1?=
 =?us-ascii?Q?vSjMrCUwadfhrkKZtlzRwG2G43cO1vFsHvPkPPP?=
 =?us-ascii?Q?AlntW=2FVcqwD75HwuTAnHlJCV1kkV7aTKLQuoBGq?=
 =?us-ascii?Q?sn81Ct3aNq4H4Cz2qUIuDcQTCg94Q4Bd+fQbl8=2F?=
 =?us-ascii?Q?NtK7TVMTNRs=2F=2Fa2nxTfmQQcqpsDO=2FAbpHXj=2FSaT?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: Lgyn+vOWmtTD

--eed01eb68a1f4051ca66335d4c15049e022e4056f6d705524dc51cdf7cc5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The Strangest Hit Songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that influenced his music. Despite the song's success, Ahbez struggl=
ed with fame and remained an enigmatic figure in the music world.Top Commen=
ts:Many readers were surprised to learn about Ahbez's background and the so=
ng's history.Some compared his singing style to that of Nat King Cole, noti=
ng the differences in their interpretations.There were discussions about th=
e philosophical undertones of the song's lyrics.2. Making My Local LLM Voic=
e Assistant Faster and More Scalable with RAG
This article discusses the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares insights=
 on improving performance and scalability by leveraging embeddings and opti=
mizing context length.Top Comments:Readers appreciated the technical depth =
and practical solutions presented.There were suggestions for further improv=
ements and alternative methods.Some expressed interest in the implications =
of RAG for future voice assistant technologies.3. Face of Ancient Australia=
n 'Giga-Goose' Revealed After Fossil Skull Found
The article reports on the discovery of a skull belonging to the extinct bi=
rd *Genyornis newtoni*, providing insights into its appearance and lifestyl=
e. The findings suggest that this giant bird was well-adapted to its enviro=
nment but ultimately went extinct due to human activity and climate change.=
Top Comments:Many readers were fascinated by the implications of the discov=
ery for understanding prehistoric ecosystems.There were debates about the r=
ole of humans in the extinction of megafauna.Some expressed curiosity about=
 the taste of these ancient creatures.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--eed01eb68a1f4051ca66335d4c15049e022e4056f6d705524dc51cdf7cc5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The Stranges=
t Hit Songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that influenced his music. Despite the song'=
s success, Ahbez struggled with fame and remained an enigmatic figure in th=
e music world.</p><h3>Top Comments:</h3><ul><li>Many readers were surprised=
 to learn about Ahbez's background and the song's history.</li><li>Some com=
pared his singing style to that of Nat King Cole, noting the differences in=
 their interpretations.</li><li>There were discussions about the philosophi=
cal undertones of the song's lyrics.</li></ul><h2>2. Making My Local LLM Vo=
ice Assistant Faster and More Scalable with RAG</h2><p>This article discuss=
es the author's journey to optimize a local voice assistant using Retrieval=
 Augmented Generation (RAG). The author shares insights on improving perfor=
mance and scalability by leveraging embeddings and optimizing context lengt=
h.</p><h3>Top Comments:</h3><ul><li>Readers appreciated the technical depth=
 and practical solutions presented.</li><li>There were suggestions for furt=
her improvements and alternative methods.</li><li>Some expressed interest i=
n the implications of RAG for future voice assistant technologies.</li></ul=
><h2>3. Face of Ancient Australian 'Giga-Goose' Revealed After Fossil Skull=
 Found</h2><p>The article reports on the discovery of a skull belonging to =
the extinct bird *Genyornis newtoni*, providing insights into its appearanc=
e and lifestyle. The findings suggest that this giant bird was well-adapted=
 to its environment but ultimately went extinct due to human activity and c=
limate change.</p><h3>Top Comments:</h3><ul><li>Many readers were fascinate=
d by the implications of the discovery for understanding prehistoric ecosys=
tems.</li><li>There were debates about the role of humans in the extinction=
 of megafauna.</li><li>Some expressed curiosity about the taste of these an=
cient creatures.</li></ul><footer><p>This email has been sent by Toolhouse.=
 You can change your delivery preferences at <a href=3D'http://url1228.tool=
houseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAY=
jazfEAqUm0-2FD2kMX-2BcmQdjMswtj___zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD1=
2SmB5Ydvxou6FT-2B09B2z2g6B1CgLlX4PTp4z3zSNg-2F8Z-2FukkE-2FjLBBZ3ZPueCvD1FVD=
GCovkjYm1hmrzaKQ8f0YCuEbWCgI2EZAKHoOV9YwolCewjZ3bkJV-2FPbP-2F8rGuq8NchSYR0t=
I0nxxWMl9DrCusimH2iCZv9vDOPG9m2rI47Vg-3D-3D'>here</a>.</p></footer><img src=
=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2=
P513JhjX8oSKm62DliywF0GKVnwm0-2BEeSEfz8ZDlQnuRgCUqFG0mh3hso4nSC0hNBjh9gXALS=
xlPZEtGdbb6q6mlgkHE14uQKVqc0CZFyJwhzKh3n48VJsOCdjFRNNaApXBrG1PLB0HkQDvh-2FV=
KbcYgNirxxoBIY9VSP4Y7cdE3xSYHb0cdfL8NtmrT70-2BpnEXHfIAhZjEVs6ZgsfPaNhRVQ-3D=
" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !impor=
tant;width:1px !important;border-width:0 !important;margin-top:0 !important=
;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !import=
ant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !i=
mportant;padding-left:0 !important;"/></body></html>
--eed01eb68a1f4051ca66335d4c15049e022e4056f6d705524dc51cdf7cc5--
