Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:2b5a:b0:ab7:dd91:3acb with SMTP id b26csp464409ejg;
        Tue, 11 Feb 2025 09:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhwaGkEbg503n0F5sU65VvrfTcxtc/gVXowbcFFxs/wm+doIlYZ/EbZ/qT7DMn1On5mnFy
X-Received: by 2002:a05:6808:4483:b0:3f3:ccaf:d0ec with SMTP id 5614622812f47-3f3cd5dc3a2mr320017b6e.16.1739295053299;
        Tue, 11 Feb 2025 09:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739295053; cv=none;
        d=google.com; s=arc-20240605;
        b=EMty5KW9FEmBB+XpFxo4W7kIlTWx/Q4VvU5vWWr/Lo7QgSuyABuMc9S9VDkjzuwI20
         GF3vfjwwZusePKs5d9CawkrApQiAL+iyJjmw6R0Xc9JggrNJZaroXHGs5igHoNcweTta
         beXWGZyrUex26ypPnBmQbixh6bKEd1RkgSEJHICWVNc107fYm3g/GPPuOj7EawKWTMJe
         mbVMAeIlLq9/Q8SxU8DXj6/2kLCaTY0vGb07Nw3e2rUBDQxxgfFEsiSRJW8CgDKG8uCt
         oJIrl/NUMjeBNHvHWaIrcCjRD15/ABCJWUWC1KmiFVqfHp85fwe8m3juQTLriKIXRV0f
         tgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=Qn3wsLic63j455tdi9IeEz2UEnOWg03tXiSDHW9zl/Q=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=V6QT6Xqyr/iqllDpfOhmSKvYRNUh13eI1G68uSsVmXHmm5FCYCtI3e+/z4LZnxtrFk
         wJYFSj3eOoOf93pXAAnRtnhmTPEVgV7oC3x4JtqMRNWoESD9q9Ylj6LQjmGEF4X8e46H
         h3A2FMkJiTmGx2+YQqyWnD2lG+yLE0ZKlJFaGNRzOBjcp8jX6EAMYaYReI3jjr0BwSBx
         Jn9KbLP4X/L11kzQOGfTqOv7r9j1qKBI9oQo0uYIMB7Ofz56ghO6BHSk76LBcMlbZ+Aw
         tU1xxSzNJztAg7zbedYjyqkw4xvBal5kqty4s/Jz9dn5Ru+neIroMuhIx5G8wIqhw5K3
         lJ+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=VIMKXvEY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Hgs0Oiv+;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id 46e09a7af769-726ed3aff67si1118413a34.21.2025.02.11.09.30.52
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:30:53 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=VIMKXvEY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Hgs0Oiv+;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=Qn3wsLic63j455tdi9IeEz2UEnOWg03tXiSDHW9zl/Q=;
	b=VIMKXvEYGC26rO1ChCjDGhMWEBvNbgRHD36y6u+7mqURQh/43AQD+1DT5mfxDkZRs4fh
	JZ/PkVSjZOoFxsZ7e5B6hCgFrSpyzVNuS9s2GaiHqbDxnV3wE3ftvaSQ9t8afVWy+FgiBo
	wQfZTKRn5iJ1UX4pWklowzs5fcYAwXm5Uw6RdJ/SFq79KF8PRwuAggCDEac1P+aWBbSgGd
	gnwN/DRJMVfG4CkhOADXiYvGhFs7oN1YuoFrXbBu+9wCMgCynMGVPGIVue/ToIaXBdATXp
	KtnO6CYbK9zY7PX4gkbu5gz7EhnN0J3GjzkWxRywJxJJHUfkZ22X0hSvHJ/a3Hlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=Qn3wsLic63j455tdi9IeEz2UEnOWg03tXiSDHW9zl/Q=;
	b=Hgs0Oiv+2mU+KqJmnO5bmBB59nkMGzKBZj+HAEcY4Lu0SGJmh3tZOzIdADPuAE2kwaYd
	WrMpZx4IJID+GzF67L74rgy+vQTTo5tVPfHD9ESDLNwE01Vl8UleskJdX9M0ym2RRMeceu
	wRN7JmQbW8hKFmVcG09KosKhZQtWYH/vw=
Received: by recvd-84b546689d-dxs8d with SMTP id recvd-84b546689d-dxs8d-1-67AB894B-35
	2025-02-11 17:30:51.567519179 +0000 UTC m=+7675720.965165134
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-8 (SG) with HTTP
	id 8ECi-vl0QaKtpEa5XobIRg
	Tue, 11 Feb 2025 17:30:51.509 +0000 (UTC)
Content-Type: multipart/alternative; boundary=e5a501fa25afe2933f87c8e6ad56d0688ed6e8977311cd28d7a72662dd2a
Date: Tue, 11 Feb 2025 17:30:51 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <8ECi-vl0QaKtpEa5XobIRg@geopod-ismtpd-8>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5lyHvy49whZGxzS?=
 =?us-ascii?Q?Ifrpkmwjqa9yFxvKDbLe96nioRkYsBshFzMBxMN?=
 =?us-ascii?Q?449Pstv3Dvkr+Cx4OaxTcjmfpDnSrXijrja2BaC?=
 =?us-ascii?Q?SPI4asP67n8pxZzui3ZDST7Wv4TrqnTXJQNrelq?=
 =?us-ascii?Q?qQ57cpzz3q+e+Z82u05Pzhc9ogG+hoh3hY4XkYM?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 7I9Gvg8hZaMN

--e5a501fa25afe2933f87c8e6ad56d0688ed6e8977311cd28d7a72662dd2a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The Strangest Hit Songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". Ahbez, often considered the first hippie, lived a life of =
eccentricity and naturalism, composing music that was ahead of its time. Hi=
s song, recorded by Nat King Cole, became a massive hit, yet Ahbez himself =
faded into obscurity, living a life that rejected mainstream fame.Top Comme=
nts:Many readers were surprised to learn about Ahbez's influence on the mus=
ic industry and his unique lifestyle.Some noted the song's connection to th=
e film *Moulin Rouge!*, highlighting its lasting impact.Discussions also to=
uched on the philosophical themes present in Ahbez's lyrics.2. Making My Lo=
cal LLM Voice Assistant Faster and More Scalable with RAG
This article discusses the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares insights=
 on improving response times and scalability by leveraging embeddings and o=
ptimizing the language model's performance.Top Comments:Readers appreciated=
 the technical depth and practical solutions presented in the article.Many =
expressed interest in the author's approach to using dual RTX 3090s for pro=
cessing.There was a lively discussion about the challenges of maintaining a=
 local voice assistant.3. Face of Ancient Australian 'Giga-Goose' Revealed =
After Fossil Skull Found
This article reveals the discovery of the skull of *Genyornis newtoni*, a g=
iant flightless bird that lived in Australia over 45,000 years ago. The fin=
dings provide insights into the bird's diet and extinction, which is believ=
ed to have been influenced by human activity and climate change.Top Comment=
s:Readers were fascinated by the implications of the discovery for understa=
nding prehistoric ecosystems.Many discussed the role of early humans in the=
 extinction of megafauna.There were debates about the environmental changes=
 that contributed to the bird's demise.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--e5a501fa25afe2933f87c8e6ad56d0688ed6e8977311cd28d7a72662dd2a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The Stranges=
t Hit Songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". Ahbez, often considered the first =
hippie, lived a life of eccentricity and naturalism, composing music that w=
as ahead of its time. His song, recorded by Nat King Cole, became a massive=
 hit, yet Ahbez himself faded into obscurity, living a life that rejected m=
ainstream fame.</p><h3>Top Comments:</h3><ul><li>Many readers were surprise=
d to learn about Ahbez's influence on the music industry and his unique lif=
estyle.</li><li>Some noted the song's connection to the film *Moulin Rouge!=
*, highlighting its lasting impact.</li><li>Discussions also touched on the=
 philosophical themes present in Ahbez's lyrics.</li></ul><h2>2. Making My =
Local LLM Voice Assistant Faster and More Scalable with RAG</h2><p>This art=
icle discusses the author's journey to optimize a local voice assistant usi=
ng Retrieval Augmented Generation (RAG). The author shares insights on impr=
oving response times and scalability by leveraging embeddings and optimizin=
g the language model's performance.</p><h3>Top Comments:</h3><ul><li>Reader=
s appreciated the technical depth and practical solutions presented in the =
article.</li><li>Many expressed interest in the author's approach to using =
dual RTX 3090s for processing.</li><li>There was a lively discussion about =
the challenges of maintaining a local voice assistant.</li></ul><h2>3. Face=
 of Ancient Australian 'Giga-Goose' Revealed After Fossil Skull Found</h2><=
p>This article reveals the discovery of the skull of *Genyornis newtoni*, a=
 giant flightless bird that lived in Australia over 45,000 years ago. The f=
indings provide insights into the bird's diet and extinction, which is beli=
eved to have been influenced by human activity and climate change.</p><h3>T=
op Comments:</h3><ul><li>Readers were fascinated by the implications of the=
 discovery for understanding prehistoric ecosystems.</li><li>Many discussed=
 the role of early humans in the extinction of megafauna.</li><li>There wer=
e debates about the environmental changes that contributed to the bird's de=
mise.</li></ul><footer><p>This email has been sent by Toolhouse. You can ch=
ange your delivery preferences at <a href=3D'http://url1228.toolhouseai.com=
/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-=
2FD2kMX-2BcmQdjMswFwLy_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAsPBMEUY=
zOSj1v8V6e48b3-2BzLiB6dTActKfFu8sGAjN-2BbeWuY6c0wJuRMXHqtdbMnIj1JEcLotdMip2=
q924B5TcL8uyNFmF-2BwCmlqPhX27lwQx8DZ2jEltVVcY8ZTUG9EIr7AkIX5d-2FuCLf2qD7Kz9=
pZLCBjCGmEVocJld5t5oFA-3D-3D'>here</a>.</p></footer><img src=3D"http://url1=
228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62=
DliywF0GKp5PRZjyUudIHjFfSc-2BPspE3JoVsciroybdNGFcoQZzew3nA6FEmn6pY1TcPMa2q-=
2F10N-2FiKLp9z2xwfh6U1VA8jo2ztEOxPyz1EVRZjZaK24YGpzOIlyR9ZOZbZipZv-2Bm8Hd-2=
FK23tLELvC6rRd2YOPrvJwBeI6HZlajA-2Bwr0dAiwUp2gNlK2E3UANIjL9hyHM-3D" alt=3D"=
" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;widt=
h:1px !important;border-width:0 !important;margin-top:0 !important;margin-b=
ottom:0 !important;margin-right:0 !important;margin-left:0 !important;paddi=
ng-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;=
padding-left:0 !important;"/></body></html>
--e5a501fa25afe2933f87c8e6ad56d0688ed6e8977311cd28d7a72662dd2a--
