Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:6194:b0:ab7:3ba4:7d71 with SMTP id mt20csp528561ejc;
        Thu, 6 Feb 2025 09:31:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAKTaTz4gkCOSp6DmXayfiZgrpyLziCVVtGrC54WD2cbBodQEiAVEc49CxO94MT5RAiOEC
X-Received: by 2002:a05:600c:1c05:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-439249c01aamr2226505e9.29.1738863115466;
        Thu, 06 Feb 2025 09:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738863115; cv=none;
        d=google.com; s=arc-20240605;
        b=XN3vzlXVINL17ldlOeIzfTRu4NjuswTNXLzW8jfESAvZdEwd8JMbQy64nGYxv/S2Qk
         aMBbtUA6pH2QhrANSsM+qs/VUpGmHZAYl+sQPkQqJwTkswdfwcmZWSYvrOOUdi7drx/l
         hmmAPP4xh2qwRHDRMPCCNB2ISy+UKi/OfhlN0Q7WyB0iJ88003b0LFWaGZUSOnZnfq43
         DAcK0Ar08+OTRk4IplPY2xZS9ObFwMmwjkOdCwskMM554CgIXKJ+t6tynTMbhfdRETlX
         74WGzJCXZEq+D8AABfrpD8ojoQ5aT2E5/0SjF+oZ2uF98YW/eHhx31rn0H/eTXTcxgZZ
         g5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=qf16rLA5oRpTcESp7Ly+l9+fTe7TZcSjlpVEXp3EfjU=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=L8X2mB42+WAZZTfHunATHSnfQP+SRzKUE0clqmwrQYyjYueMM2bWNgVxOFdYyAcoIH
         PUeznbUzvmxBHD4rjnGgyHuZXLedxGph3W/3++OA1AYuYQ/vGrDKX07RyOaLVZXzHf8M
         Rr5LNdM7rmg6hst+YM1XiZpsjI4o8JGoP29hHfkuxcYkgbFvi/liFp8wNQ1qLeAGIFLD
         5XW/1k0jE0qU0Y7YLC/Vulqx3us30+0XGgRg4D0FtTvs9RgofP3vZbf/LQTb6K5ZWtJ6
         VeatrzyzvBWZoF4qlaRa+d6Y7xk8SmRLP7dl0ovmkPMdRr7q9wkAdestvbRyytd5CoSv
         9b6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=OIQatmPf;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Ap5N3XwY;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhst.outbound-mail.sendgrid.net (s.wfbtzhst.outbound-mail.sendgrid.net. [159.183.224.103])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4391daab953si11029005e9.28.2025.02.06.09.31.54
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:31:55 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) client-ip=159.183.224.103;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=OIQatmPf;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Ap5N3XwY;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=qf16rLA5oRpTcESp7Ly+l9+fTe7TZcSjlpVEXp3EfjU=;
	b=OIQatmPfcyDFgnIAfHXV7zPf1Eb3EU4Tfzo9VCnYhnIjTYoFvzjpgwhLTrtPNbHgkzxi
	7CFYggsBLm+FMQ+GhAvLVjWnlFYN1mAdL6QwqLX3xS87Nh6j2E8BFcoxPsOxgi6/c7acEk
	fExsX0I11EzQgyMcHc98jYpqyMf5npmxeMGvH4elVFgLzfzmTiRrewGIkjYJaOuObGDcnP
	etHQ65kvNS8HkskbzX4v/dYrioedDJCmN4A9R2Kwzj7N97R1+S5B9u6+JqXxbBEvk6O35X
	inU4hOtSg8VutJGZib2kLH4dLtLe9b8uQYyVY3pft8OLcyc45FT42qQq56zX+d3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=qf16rLA5oRpTcESp7Ly+l9+fTe7TZcSjlpVEXp3EfjU=;
	b=Ap5N3XwYmoxlJQIb2EKt3X6zWEfqn2mho7dH309UMVtU0doEuqXr7MjYvOhhdKMIoCdq
	RkFbBJdKFeAQjoB7YruGVKu6wpbGqaSA1OzcONSI0odkvpzbWRNSAVtEzG5ZhH/mtLlM2C
	IbL+U1109IEYstChjnK4THyCF3V4zTCw4=
Received: by recvd-786d47b7ff-hqcvv with SMTP id recvd-786d47b7ff-hqcvv-1-67A4F208-13
	2025-02-06 17:31:52.786052169 +0000 UTC m=+7243729.993538689
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-2 (SG) with HTTP
	id yBRcgnPCSfWAfWklhu4xVg
	Thu, 06 Feb 2025 17:31:52.710 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2fd9e964a54f521175514a203334385d5252d14007faa4b9f57e85209bdb
Date: Thu, 06 Feb 2025 17:31:52 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <yBRcgnPCSfWAfWklhu4xVg@geopod-ismtpd-2>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6y2SzNFn7kMJAF=2F?=
 =?us-ascii?Q?QmvcUEF4B6vhvRWhzQAU860d9Nzb2eg4yL0Qn=2F8?=
 =?us-ascii?Q?t1iCoPolHFdzZZP83aPQb8MSfoNN2BaFv9nPNo+?=
 =?us-ascii?Q?RsBSYYhZ5K=2F36YbH33M7WRV1u6CB5XjisuFiTbw?=
 =?us-ascii?Q?trKVWxSdqW50cjULOp=2FVSCkbqBciMQ1uzusjfZc?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: slK10pAkysnV

--2fd9e964a54f521175514a203334385d5252d14007faa4b9f57e85209bdb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating article about Eden Ahbez, the composer of the hit song "Natur=
e Boy" (1948). Ahbez was an eccentric figure who lived an unconventional li=
festyle decades before the hippie movement. He wrote the song while living =
in a cave and was later found living under the Hollywood Sign. The article =
details how his song became a hit through Nat King Cole and explores Ahbez'=
s unique philosophy and approach to life.
Community Discussion: The HN community was particularly interested in the m=
usical aspects of the song, with discussions about its unique chord progres=
sion and comparisons to other jazz standards. Several users discovered the =
song through Baz Luhrmann's "Moulin Rouge!" There was also interesting disc=
ussion about the song's possible inspiration from a Yiddish theater song "S=
hvayg, mayn harts" and potential connections to Dvorak's work.
2. Making my local LLM voice assistant faster and more scalable with RAG
A technical article about optimizing a local large language model (LLM) voi=
ce assistant using Retrieval Augmented Generation (RAG). The author describ=
es their journey from using dual RTX 3090s to implementing a more efficient=
 solution using RAG to reduce context length and improve response times. Th=
e piece provides detailed insights into LLM inference optimization and prac=
tical implementation of RAG in a home automation context.
Community Discussion: The discussion focused on the technical aspects of LL=
M optimization and the implementation details. There was particular interes=
t in the model used (Llama 3 70B AWQ) and its relationship to previous vers=
ions. The community also discussed the assistant's response style and the b=
alance between performance and personality in AI assistants.
3. Face of ancient Australian 'giga-goose' revealed after fossil skull foun=
d
Scientists have discovered a well-preserved skull of Genyornis newtoni, nic=
knamed the 'giga-goose', an extinct bird that lived in Australia over 45,00=
0 years ago. Standing over two meters tall and weighing up to 240 kilograms=
, this massive bird was part of Australia's megafauna. The new skull discov=
ery has revealed that the species was more closely related to geese than pr=
eviously thought and has provided insights into its diet and behavior.
Community Discussion: The discussion centered around the causes of the spec=
ies' extinction, with debate about the relative roles of climate change ver=
sus human hunting. Many commenters pointed out that while climate change ma=
y have stressed the population, human arrival coincided with rapid extincti=
on of many megafauna species. There was also interesting discussion about a=
ncient human population sizes and their impact on wildlife, as well as spec=
ulation about what the bird might have tasted like.
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--2fd9e964a54f521175514a203334385d5252d14007faa4b9f57e85209bdb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<h2 style=3D"color: #333;">1. Eden Ahbez: The Strangest Hit Songwriter</h2>
<p>A fascinating article about Eden Ahbez, the composer of the hit song "Na=
ture Boy" (1948). Ahbez was an eccentric figure who lived an unconventional=
 lifestyle decades before the hippie movement. He wrote the song while livi=
ng in a cave and was later found living under the Hollywood Sign. The artic=
le details how his song became a hit through Nat King Cole and explores Ahb=
ez's unique philosophy and approach to life.</p>

<p><strong>Community Discussion:</strong> The HN community was particularly=
 interested in the musical aspects of the song, with discussions about its =
unique chord progression and comparisons to other jazz standards. Several u=
sers discovered the song through Baz Luhrmann's "Moulin Rouge!" There was a=
lso interesting discussion about the song's possible inspiration from a Yid=
dish theater song "Shvayg, mayn harts" and potential connections to Dvorak'=
s work.</p>

<h2 style=3D"color: #333;">2. Making my local LLM voice assistant faster an=
d more scalable with RAG</h2>
<p>A technical article about optimizing a local large language model (LLM) =
voice assistant using Retrieval Augmented Generation (RAG). The author desc=
ribes their journey from using dual RTX 3090s to implementing a more effici=
ent solution using RAG to reduce context length and improve response times.=
 The piece provides detailed insights into LLM inference optimization and p=
ractical implementation of RAG in a home automation context.</p>

<p><strong>Community Discussion:</strong> The discussion focused on the tec=
hnical aspects of LLM optimization and the implementation details. There wa=
s particular interest in the model used (Llama 3 70B AWQ) and its relations=
hip to previous versions. The community also discussed the assistant's resp=
onse style and the balance between performance and personality in AI assist=
ants.</p>

<h2 style=3D"color: #333;">3. Face of ancient Australian 'giga-goose' revea=
led after fossil skull found</h2>
<p>Scientists have discovered a well-preserved skull of Genyornis newtoni, =
nicknamed the 'giga-goose', an extinct bird that lived in Australia over 45=
,000 years ago. Standing over two meters tall and weighing up to 240 kilogr=
ams, this massive bird was part of Australia's megafauna. The new skull dis=
covery has revealed that the species was more closely related to geese than=
 previously thought and has provided insights into its diet and behavior.</=
p>

<p><strong>Community Discussion:</strong> The discussion centered around th=
e causes of the species' extinction, with debate about the relative roles o=
f climate change versus human hunting. Many commenters pointed out that whi=
le climate change may have stressed the population, human arrival coincided=
 with rapid extinction of many megafauna species. There was also interestin=
g discussion about ancient human population sizes and their impact on wildl=
ife, as well as speculation about what the bird might have tasted like.</p>

<hr style=3D"margin: 30px 0;">

<footer style=3D"font-size: 12px; color: #666;">
<p>This email has been sent by Toolhouse. To change your delivery preferenc=
es, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du=
001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMs=
wCcSy_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBVctLpPekCXf-2BJClZu0WeIt=
YN1wvoIGUVUpjXxtafSJ79BeSycByOJ3Tw1NChbq0eSf-2FaX7QDrLs-2Fnj-2Feo97-2B2eb5V=
OG0AU4pqUUchztHTQwtLlVYgp24cMIMkLe3QnyJpdFXWPE5LLhjOoUFomBtLQllFoPdWEXmaoVK=
ngKse5Q-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKxe3EQ0Mo9SCfVn2mN-2FQbORbc9uehh4YEP-2FQNTX8=
iW-2BTFffVz9nhCNffKBVFFwJ3jioFVvxrFQZ24T1uOWqy2DnRutJCVMafsaAPVr8DF7EsYan8K=
H8vj3caAipaEJDsYsW7H-2BI6DevWaYRlJ-2FrzBqWbk0vBJbk5ClMDCeKgbu2VlnKMAU9o8dBr=
eXPEcpPts-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body>
</html>
--2fd9e964a54f521175514a203334385d5252d14007faa4b9f57e85209bdb--
