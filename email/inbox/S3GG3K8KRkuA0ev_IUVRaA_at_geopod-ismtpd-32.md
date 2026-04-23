Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:1594:b0:ab6:fa07:db4 with SMTP id cf20csp596948ejc;
        Fri, 31 Jan 2025 09:32:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv7WFwUPgzNFBjEQ1TvqL/IWniTNlhskB+SoDLqkgLJB4kcHEfGAZGxKPdBvSAt39pcd+5
X-Received: by 2002:a05:690c:39a:b0:6ee:bcdd:b1fb with SMTP id 00721157ae682-6f7a83744a6mr82030787b3.19.1738344738925;
        Fri, 31 Jan 2025 09:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738344738; cv=none;
        d=google.com; s=arc-20240605;
        b=T+oHo2N8lpgGFSymtHSDI/lHNxppS0cwJ8yn60zsevgPrrmI332Yn+v0Z8Np/Ip0C2
         DaAqULZNOeW9s0mzT/1QS9F1M7JaThHHxUIODap8AmlS5PwYekEyYmoXQrEoFKMmRw+a
         AdNPTqcC49Rr3xTEJ8OnHe3v8Q4HiMIdh82dO75kRxCMPb8hbqQmEiCCD4NyS5DZyFBP
         nM1i7fPbe9/w0lRQRmUTIf6t69o4yYIhewPOHwx9KoVp6zfT/vL6XiyxqTERuBCH9rgA
         +bKv8qu+GMMj4rMonkDyW7/YxXQC+jtNgWTP5rRtQzyYCBRNzFmD1Q9l+w5tbpyzRy71
         5rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=THU9GfgbUmZjJl7LAsyA0IaEaoWuehFIhRHT5yNJHK4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=LFFY0S9MuvjJhbMzGOfIFiq0V3Ep7qDil79IwxbQ3NziFUl9lj1CBh5hvlTWFRdQCG
         jFRN/O7uwGyVNE45duJiuf6M5yMG5cbMCTY5H2Yy7oT/HC7Ovjv6Cg1hBQOzskecsE6W
         MlewfVfi+ayBFilDmgUNVLPKcuzjiN8c//FFCUAng9ZI6w8aNUxR4bQzmhzuFmk+ridW
         2KttnD1IoK4qtWio027kTYRQNineVjSMBblLv/3eXle2L1XSbBkHn++aXbLhLbxxluab
         vdkXVHUx7GXgJ7twNHVrui7u4c4JnPN+jiLXuD/SWsYo1rF5lm9xO2JVtbyaevIRwtA6
         dtGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lNpZPR4w;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fyVEWOgk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wrqvtwtt.outbound-mail.sendgrid.net (s.wrqvtwtt.outbound-mail.sendgrid.net. [149.72.121.119])
        by mx.google.com with ESMTPS id 00721157ae682-6f8c4b8c02asi10386317b3.397.2025.01.31.09.32.18
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 09:32:18 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) client-ip=149.72.121.119;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lNpZPR4w;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fyVEWOgk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=THU9GfgbUmZjJl7LAsyA0IaEaoWuehFIhRHT5yNJHK4=;
	b=lNpZPR4wzv5L1KbSHXeqlIs+kE+MQNohpu/q2guXzHszCFTrXDx5mED5Zfqxcu1m79s2
	Fx4hCl91qRixs3wDUlZzJP+67l7PBRvYZvmqCDo3kdGMgOelQXy6SxiK3otM5ZTFCb8HP+
	vI6HK6gZrAAkH/nfMHqEq5HaxvEIM6l/QJirZT54SDonVTdIiAPAD5phhmQkUjHQbty2Ju
	KDG/8wO8KLDJqqGvc2QM2HQqwhHrvSH24lZ1XNeIxf7vfCzcm/F+2DE9Nvvd+1K/mD8h9Z
	3tZtXCPNW/iqSuAhj4WE6vxbDY5Yu36iZzEitUOlIT0sXZW5rtXGa2fw/buMPMLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=THU9GfgbUmZjJl7LAsyA0IaEaoWuehFIhRHT5yNJHK4=;
	b=fyVEWOgkunbFnUd6Ji8DNYiZ0D05L00OTHyB791Cc8U1Vksws2QhpXpLJnsHDkDg4BHU
	KYchURZaIxoGKDBakQmmnVJAVSHmjJUtGzkl6h9IiphkPMNlynt8v1go64oJONvD0iWibl
	rs1Wamf4gfPHGgfUVyjfjp3MXSQkAIA2Q=
Received: by recvd-69cbc48b94-pgsv7 with SMTP id recvd-69cbc48b94-pgsv7-1-679D0922-28
	2025-01-31 17:32:18.455415198 +0000 UTC m=+6725318.037116215
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id S3GG3K8KRkuA0ev_IUVRaA
	Fri, 31 Jan 2025 17:32:18.424 +0000 (UTC)
Content-Type: multipart/alternative; boundary=aec5849e4fa9c3f6cbc1d2f29f7744e86feb7a5024dd29ae3c2e98ce851b
Date: Fri, 31 Jan 2025 17:32:18 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <S3GG3K8KRkuA0ev_IUVRaA@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n79XXfda3F3eR7oF?=
 =?us-ascii?Q?8+uqq+0KIUteUepfSxxBS1GNQpUZw11dS4U49LN?=
 =?us-ascii?Q?bEXjgdw8GxYb7NEfaVwLsN5=2FIaY59zRJmvPgJbH?=
 =?us-ascii?Q?AtJAUv5tPImf0nOa18Tz96Zyh58BmAfcBgcloUN?=
 =?us-ascii?Q?HwHmunWWmiqqWYMnbMTxhsNnHA=2FYeXHu1ulFa5M?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: X1279UXzbeoZ

--aec5849e4fa9c3f6cbc1d2f29f7744e86feb7a5024dd29ae3c2e98ce851b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Abhez: The Strangest Hit Songwriter
A fascinating article about Eden Abhez, the composer of the 1948 hit "Natur=
e Boy" performed by Nat King Cole. Abhez was a unique character who lived a=
n unconventional lifestyle, sleeping outdoors and following a natural diet =
decades before the hippie movement. The article details how he wrote the ha=
unting song while living in a cave and was later found living under the Hol=
lywood Sign.
Key Discussion Points:
Many readers discovered that the song was featured prominently in Baz Luhrm=
ann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, including its =
unique untempered vs. tempered notes when comparing Abhez's and Cole's vers=
ions
Historical context about possible inspiration from a Yiddish theater song "=
Shvayg, mayn harts"
2. Making my local LLM voice assistant faster and more scalable with RAG
A technical article about optimizing a local large language model (LLM) voi=
ce assistant using Retrieval Augmented Generation (RAG). The author describ=
es their journey from using dual RTX 3090s to implementing a more efficient=
 solution using RAG to reduce context length and improve response times.
Key Discussion Points:
Discussion about the model mentioned (Llama-3-70b-instruct-awq) and its rel=
ationship to Llama 2
Suggestions for potential optimizations, including pre-computing responses =
for common services
Observations about the LLM's response style and personality
3. Face of ancient Australian 'giga-goose' revealed after fossil skull foun=
d
Scientists have discovered a well-preserved skull of Genyornis newtoni, nic=
knamed the 'giga-goose', providing new insights into this extinct Australia=
n bird. Standing over two meters tall and weighing up to 240 kilograms, thi=
s massive bird lived more than 45,000 years ago and was among the megafauna=
 that went extinct shortly after human arrival in Australia.
Key Discussion Points:
Extensive debate about the role of climate change versus human activity in =
the extinction of megafauna
Discussion about human population sizes and capabilities in prehistoric Aus=
tralia
Interesting observations about the term "giga-goose" and the evolution of s=
ize-related prefixes in scientific naming
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--aec5849e4fa9c3f6cbc1d2f29f7744e86feb7a5024dd29ae3c2e98ce851b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<h2>1. Eden Abhez: The Strangest Hit Songwriter</h2>
<p>A fascinating article about Eden Abhez, the composer of the 1948 hit "Na=
ture Boy" performed by Nat King Cole. Abhez was a unique character who live=
d an unconventional lifestyle, sleeping outdoors and following a natural di=
et decades before the hippie movement. The article details how he wrote the=
 haunting song while living in a cave and was later found living under the =
Hollywood Sign.</p>

<p><strong>Key Discussion Points:</strong></p>
<ul>
    <li>Many readers discovered that the song was featured prominently in B=
az Luhrmann's "Moulin Rouge!"</li>
    <li>Interesting discussion about the song's musical composition, includ=
ing its unique untempered vs. tempered notes when comparing Abhez's and Col=
e's versions</li>
    <li>Historical context about possible inspiration from a Yiddish theate=
r song "Shvayg, mayn harts"</li>
</ul>

<h2>2. Making my local LLM voice assistant faster and more scalable with RA=
G</h2>
<p>A technical article about optimizing a local large language model (LLM) =
voice assistant using Retrieval Augmented Generation (RAG). The author desc=
ribes their journey from using dual RTX 3090s to implementing a more effici=
ent solution using RAG to reduce context length and improve response times.=
</p>

<p><strong>Key Discussion Points:</strong></p>
<ul>
    <li>Discussion about the model mentioned (Llama-3-70b-instruct-awq) and=
 its relationship to Llama 2</li>
    <li>Suggestions for potential optimizations, including pre-computing re=
sponses for common services</li>
    <li>Observations about the LLM's response style and personality</li>
</ul>

<h2>3. Face of ancient Australian 'giga-goose' revealed after fossil skull =
found</h2>
<p>Scientists have discovered a well-preserved skull of Genyornis newtoni, =
nicknamed the 'giga-goose', providing new insights into this extinct Austra=
lian bird. Standing over two meters tall and weighing up to 240 kilograms, =
this massive bird lived more than 45,000 years ago and was among the megafa=
una that went extinct shortly after human arrival in Australia.</p>

<p><strong>Key Discussion Points:</strong></p>
<ul>
    <li>Extensive debate about the role of climate change versus human acti=
vity in the extinction of megafauna</li>
    <li>Discussion about human population sizes and capabilities in prehist=
oric Australia</li>
    <li>Interesting observations about the term "giga-goose" and the evolut=
ion of size-related prefixes in scientific naming</li>
</ul>

<hr style=3D"margin: 20px 0;">
<p style=3D"color: #666; font-size: 12px;">This email has been sent by Tool=
house. To change your delivery preferences, please visit <a href=3D"http://=
url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2F=
q16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswTy-G_zKD9qStml-2FkjU46ulTqeWVsrM30=
61nr98hteMD12SmDKpvFso-2BJ6tH6mrwzF4gqujz77lX-2BvQloQTxCb09HbifLG9zYRHprsbx=
V8tQ5em2e53yWPyFUjp9hGq3AQ0UhjRVLr8RDe8KfwHZvdFN0WNRtVLnAOmRnIkYLTfcvXIBZb1=
n6mJ8R9vh16C0ZOrUtQtdKSr-2FcmvjepnJq16hl3gw-3D-3D">https://app.toolhouse.ai=
/settings</a></p>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLitoPku-2F-2FhcFWBd430JYRp9nCyMFYVRw5AlStsc9=
CWY1p0rDgX91xvQt-2B9ruW5woHQOfTtW-2Bs8VcSrR5ZMbyAim3-2Frjz7ZADtfPLiVDxA4F-2=
FSLIEoEeKx3Wqn08kN4PPcFSmNgmV67Idn83Zyqor5yVFG-2FdwkNwYPRWaIfip6SeD1K9bqTbJ=
TumjyugM1jmOs-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"h=
eight:1px !important;width:1px !important;border-width:0 !important;margin-=
top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margi=
n-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pa=
dding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--aec5849e4fa9c3f6cbc1d2f29f7744e86feb7a5024dd29ae3c2e98ce851b--
