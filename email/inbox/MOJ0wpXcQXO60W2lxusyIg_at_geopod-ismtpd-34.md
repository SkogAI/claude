Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:d50d:b0:abb:bb71:f9f7 with SMTP id wb13csp289587ejc;
        Thu, 20 Feb 2025 09:31:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+Kw8YYA6Nbb+jVxXJMQuyE9YetX7ggFcyyGyeUp3LV32qyl9Am2lt7PqgmLtk7weRJHiZ
X-Received: by 2002:a05:6214:c8b:b0:6e6:697c:1fa8 with SMTP id 6a1803df08f44-6e66cf2c928mr303868036d6.45.1740072692108;
        Thu, 20 Feb 2025 09:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740072692; cv=none;
        d=google.com; s=arc-20240605;
        b=A/gZ0VQfpApKuW97ekdQQ7ZFQfSQsMJ1tesdXkiGZfFzIXtBLjqYd+hpisCb16V9Dt
         o2aRBXZ/0OSMjiQR6/87YnlEUDgYdLgjz1Jfr156z7apRkbAc2OTD1snjhf05RlPJiFI
         mg0UXWcHC3olCZSgxDHB2zzfdsfS2j9qfrMXjcj5wOe3pIRoF+EnpvRdA2/4yrlUc0Gb
         Lky3k8vh7Y4Ep34uoLLqDeO4aOfrtVtz9EvcXOuSS/AMlckk5F70OGuCfAN9QlbQ09lg
         BdLMsCI3b7MS415qT48oZQ7xaIwNDS675ANRPugDbuAhaWjRn+xQ/P4uGLUCAuZfw+37
         rffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=mbrf4l0L1CjcdqxIdYPBHbOH8YcUXxUNzLLvaEX2GCU=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Xz3VAxylLh09GIzYWkHKwh73/CZBy0JJI8uxTkStazB4BIaA9cG9Vg+bkwBgxal622
         7XT12g0aXkQfrlbOwmy0NyZmg8iBI0s5vzEaR8n/pFGbiAQnsvmjztjr6GPafE29QfyD
         OFQEpInJyiLR/ZAbgEMdOdqxLob0Wfzifa1XNNI5QCln060+g9gpyjpSWAXFaqeN3rrE
         wnt8vMyMEDYSQa/mzD+c4C5dHwc7nqGaO7eYDw57xbCzurFp9CeWMoKxef9reEv0SS74
         9FTDgQMHzMgNtNc+Kcx9XO8su7OrHoigFm3fsEJ6bPseb1um0ybD7rKuv93BwpjqPPci
         TxZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=txqPjs+9;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=l15oN3wf;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bd4efe9f32si2729685137.670.2025.02.20.09.31.30
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=txqPjs+9;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=l15oN3wf;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=mbrf4l0L1CjcdqxIdYPBHbOH8YcUXxUNzLLvaEX2GCU=;
	b=txqPjs+9KuBPBXOTZIblQAjcHX0PujtGdaX/U+Ve2GuiyoR2lvki8BouqZ/tOYaj7lM+
	7GDo6ivpmZxfUVeTnf3OOJRD5+HXqIXQUJQ9rHHRdnae4j5zrJGLb1LWJZBb1PvK6yWepm
	3BX3ezZTWQJUXGr5YPvWJ72amWrZvmbbkl8UIDy7NHiIalY4ShFF3nCcab8fEco9P/RIBw
	UQScShrUYhfrDWNimdxbuaODs7MGNGT9q0Dl7YLQR+KaweXK4KEhnCgkNu2J0oe25x+2+i
	++JZ6xZKmvW5TRlzQ0tqdu0eOChDQS0cc6JC+BdsEFE9o8a5xOLI+S740BZJ9oHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=mbrf4l0L1CjcdqxIdYPBHbOH8YcUXxUNzLLvaEX2GCU=;
	b=l15oN3wfNHtSCSqOxw14phjIk9pVnlpOpTUzXxH9kL60GhgbhyaI25Jeru+mW3kW4LRh
	wDG7M5EKDDJar1ZueVn4hOEAKXZj0HBExopeK/dpzmMzT82feakJFpZr+zpCC1PnXR1UNw
	h369liMsedp6rzTRuoIgFfEpbh05r+fmE=
Received: by recvd-5f54b5d587-dwrhj with SMTP id recvd-5f54b5d587-dwrhj-1-67B766F0-46
	2025-02-20 17:31:28.37159782 +0000 UTC m=+8453393.300188505
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-34 (SG) with HTTP
	id MOJ0wpXcQXO60W2lxusyIg
	Thu, 20 Feb 2025 17:31:28.314 +0000 (UTC)
Content-Type: multipart/alternative; boundary=7f67252dda1066215a9dab93a18f354b66f0f74947939036290c774fecf5
Date: Thu, 20 Feb 2025 17:31:28 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <MOJ0wpXcQXO60W2lxusyIg@geopod-ismtpd-34>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6NfVSWEsXCSU5B5?=
 =?us-ascii?Q?9idyEVJ=2FQcMKeh5SchQhzmtAkZ=2FyDm+wLRsnROm?=
 =?us-ascii?Q?bNk=2Fqceg1ClkUyuPQ14whOjSfUjKIm5YdboTJEu?=
 =?us-ascii?Q?eA0ArKWWlE97gZT+DdgqUtW804REwiSPKRg4V4T?=
 =?us-ascii?Q?494N4pqeQZeSTO9DEDh+QK9btfFxcosS=2FtmXNWq?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 38BSIV0sVllY

--7f67252dda1066215a9dab93a18f354b66f0f74947939036290c774fecf5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The Strangest Hit Songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". Ahbez, often considered a one-hit wonder, lived a unique l=
ifestyle that mirrored the themes of his music. The article delves into how=
 his song became a hit for Nat King Cole and the philosophical undertones o=
f the lyrics.Comments Summary:Many readers were surprised to learn about Ah=
bez's influence and the song's history.Some comments discussed the musical =
structure of "Nature Boy" and its cultural impact.Overall sentiment was pos=
itive, with appreciation for the article's depth.2. Making My Local LLM Voi=
ce Assistant Faster and More Scalable with RAG
This blog post details the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares technica=
l insights on improving performance and scalability, including the use of d=
ual RTX 3090 GPUs and innovative caching techniques.Comments Summary:Reader=
s engaged with technical questions about the LLM model and its performance.=
There was a mix of curiosity and skepticism regarding the proposed optimiza=
tions.The overall sentiment was constructive, with many sharing their own e=
xperiences.3. Face of Ancient Australian 'Giga-Goose' Revealed After Fossil=
 Skull Found
This article discusses the discovery of a well-preserved skull of the extin=
ct bird *Genyornis newtoni*, providing insights into its appearance and lif=
estyle. The findings suggest that this giant bird was a significant part of=
 Australia's megafauna.Comments Summary:Many comments reflected on the impl=
ications of the discovery for understanding extinction events.Readers debat=
ed the role of climate change versus human impact on the species' extinctio=
n.The sentiment was mixed, with some expressing concern over environmental =
changes.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--7f67252dda1066215a9dab93a18f354b66f0f74947939036290c774fecf5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The Stranges=
t Hit Songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". Ahbez, often considered a one-hit =
wonder, lived a unique lifestyle that mirrored the themes of his music. The=
 article delves into how his song became a hit for Nat King Cole and the ph=
ilosophical undertones of the lyrics.</p><h3>Comments Summary:</h3><ul><li>=
Many readers were surprised to learn about Ahbez's influence and the song's=
 history.</li><li>Some comments discussed the musical structure of "Nature =
Boy" and its cultural impact.</li><li>Overall sentiment was positive, with =
appreciation for the article's depth.</li></ul><h2>2. Making My Local LLM V=
oice Assistant Faster and More Scalable with RAG</h2><p>This blog post deta=
ils the author's journey to optimize a local voice assistant using Retrieva=
l Augmented Generation (RAG). The author shares technical insights on impro=
ving performance and scalability, including the use of dual RTX 3090 GPUs a=
nd innovative caching techniques.</p><h3>Comments Summary:</h3><ul><li>Read=
ers engaged with technical questions about the LLM model and its performanc=
e.</li><li>There was a mix of curiosity and skepticism regarding the propos=
ed optimizations.</li><li>The overall sentiment was constructive, with many=
 sharing their own experiences.</li></ul><h2>3. Face of Ancient Australian =
'Giga-Goose' Revealed After Fossil Skull Found</h2><p>This article discusse=
s the discovery of a well-preserved skull of the extinct bird *Genyornis ne=
wtoni*, providing insights into its appearance and lifestyle. The findings =
suggest that this giant bird was a significant part of Australia's megafaun=
a.</p><h3>Comments Summary:</h3><ul><li>Many comments reflected on the impl=
ications of the discovery for understanding extinction events.</li><li>Read=
ers debated the role of climate change versus human impact on the species' =
extinction.</li><li>The sentiment was mixed, with some expressing concern o=
ver environmental changes.</li></ul><footer><p>This email has been sent by =
Toolhouse. You can change your delivery preferences at <a href=3D'http://ur=
l1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq1=
6oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswf9oz_zKD9qStml-2FkjU46ulTqeWVsrM3061=
nr98hteMD12SmAFpGECfQIhjYuu1pljULCWW3TLT-2FsyELHR1F6DKQVwynR2Z16Iv2MNuilgsE=
W5tEzLC-2BPlZ3Sm8ekKDo9WX-2Fwq5twF-2BVBg3Nnf1KMLx-2B-2Bv88aWiM9A4k7wYzvrqPh=
LkOZ5S7Afxw84ckORMajq01toUwRamdcsHKuUuJoFpN0HVQ-3D-3D'>here</a>.</p></foote=
r><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxx=
Dtaqhc9sx2P513JhjX8oSKm62DliywF0GJaQ077kTkynZGFENmVnLaqkUV5C5R730zOcg-2B9PQ=
-2BRQmFKnWuv1rDxvXREfbIs1awRF4rCKYhJMinDtJa62G-2FONzpclBurjF-2BDg75wT5OOunc=
3QAIBT3jHuJH1Y7MkM0WjwGQ9TsQdcrtDGsfM6a6Ac4aD9AJrhfp0ciclXlC1aq86fVV9GiSObO=
wwdUQ18wI-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body></html>
--7f67252dda1066215a9dab93a18f354b66f0f74947939036290c774fecf5--
