Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:4705:b0:abc:2b0f:5fd9 with SMTP id y5csp1127134ejq;
        Fri, 28 Feb 2025 09:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGClDmBnq5BJ5bxVhfOsf1aSeaWQswTzFIbjB0i9m9U2tqRwHgPFaoFWPHewnP1ykIrsw8o
X-Received: by 2002:a05:622a:20d:b0:472:1872:16b2 with SMTP id d75a77b69052e-474bc09875fmr56106231cf.31.1740763890769;
        Fri, 28 Feb 2025 09:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740763890; cv=none;
        d=google.com; s=arc-20240605;
        b=MWG08NJD5w3Hswk0al47EO+gwr03pxlnaBMbD5pgpiBH/9O8F5xIzijn1/Akqudv7b
         qNrY+CXtwkaB6zm7KBAcmAw4VpmWQOY69OAzq9PttYdVYPTu0/nSs8SgFiYkgArauNwr
         3Se39hwzX4O2m/0gxjQ5Obr45Xy0b8aDMyN0xPSTKwuCYxVqRA3/F7J8zw9ZB1Nz7hu5
         ZD/NIZ0lhODXYKUxVbii7YB41we0TftYo/Ai9cRKAy3Ih+vI/YRYPoFV9F8uN3Xpj5/u
         LBxWRlbJ1YiTyk0d1NWgwUxBO2DhAwDIit+11pqeFV17QCvclgc0QTSBswpGR5Dh4zFv
         oVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=1tWNrJWfl6xDA7p3KqtTNm0RD+3jB4cA19+cJQVHnao=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Cn/pawb8TPkC6z3SGpCXO9Xy/Uu8AdY3HoG80gkrvudXGvkH+Ki1mSB6FZQz4OjwRG
         erdM0kXZDUyz9HPE4y/K7eChbo0REsWof00gOuv59SNM9/QlDp1y3fo+1TbrkrHj/6rL
         TqMgqXje8mOPgO50UilgVI6a8DOo2mo5SoKCbK7soHplI37qQS8cTwPyWJYsKOguRa58
         HMHrMJCKRzMb7xJap5PHyOx3KLwdAoIKApR/pIGad0IB3vtYqwy+QxfWV3PMuMWNcOp0
         lhxUJBdrTRRFm7XkLH5p0ArLwolacGXxeFPqv0vAG6pNzG2cGpn+sm0Br3ftGi9SIjCJ
         vRNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=jM4vWLao;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=xDqhO1t9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240d78dsi35572081cf.376.2025.02.28.09.31.30
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 09:31:30 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=jM4vWLao;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=xDqhO1t9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=1tWNrJWfl6xDA7p3KqtTNm0RD+3jB4cA19+cJQVHnao=;
	b=jM4vWLao/STg81iV19zwMLFvAgN5OsHxeYT28avKmr3H48Um3vSmVO2AJ5TD9Wro/3PJ
	pl41cElBEAfNSHbnY2jt7KRJ2nTjM9YY4ZLLtBSKsrI96fj77TgH2cUJlb6jhywXA0Ukaf
	/tdgxdijpT9wHqsoRv2H1kxaJDi5USKVlWikndGDSuCpurZArXTNXfWYd+nwCR6GjvEHOq
	XDuytq0IHrZ8RtbAttVZAA4RsG1vtYNRQuv6JyIZZkVnHdxOkP5zFX+js2qwMKgIIgyJMr
	lMdlzw6lZT6fOfrqVra3fJNXzh52mL/CHJGciVLT8qt8FHoT45T++AnQV0FD0UTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=1tWNrJWfl6xDA7p3KqtTNm0RD+3jB4cA19+cJQVHnao=;
	b=xDqhO1t9he51QyKzWcyKMwTP9xczu82J8uOLYhFWKRy/pvw/yfRmiWxJDsPyFUo7R95o
	2QIqXZi+031oOO8iTLLEYbqJXNZZWLnso723uxLv6leNLnxGTaCQpRIZkYlc3MBkKE31qA
	C1N6HJC6sDdFtkklHSna1XfShr4H/xI2Y=
Received: by recvd-65d974bbff-srb6f with SMTP id recvd-65d974bbff-srb6f-1-67C1F2F2-17
	2025-02-28 17:31:30.136555794 +0000 UTC m=+775678.134453450
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-29 (SG) with HTTP
	id rT2ciZUjRdqvgXtIazYDNw
	Fri, 28 Feb 2025 17:31:30.116 +0000 (UTC)
Content-Type: multipart/alternative; boundary=ade9f6b16f19a25d7a107bdc5d84c0e44d602be677606d183ef9d5c45b53
Date: Fri, 28 Feb 2025 17:31:30 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <rT2ciZUjRdqvgXtIazYDNw@geopod-ismtpd-29>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4dfwTOE5Usu996f?=
 =?us-ascii?Q?LhYCLh8JrHGMB0qw0KccA+lYW3uKg5cgQNgvYex?=
 =?us-ascii?Q?rN+fNEim6XbqiSgdup0wy45B8rfK6UqsCdhyn8u?=
 =?us-ascii?Q?Xptk0JQ1XVZ+zj1oVhmdizDTS5JKWpB16JW3r+Z?=
 =?us-ascii?Q?w06mObBa21sSeYjU2U7PyNXyYM0JlFGI60N+h2s?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 1eEsJw36ep+r

--ade9f6b16f19a25d7a107bdc5d84c0e44d602be677606d183ef9d5c45b53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The Strangest Hit Songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". Ahbez, often considered the first hippie, lived a life of =
simplicity and naturalism, which influenced his music. The article discusse=
s how his song became a hit for Nat King Cole and the philosophical underto=
nes of the lyrics.Top Comments:Many readers were surprised to learn about A=
hbez's life and his connection to the song.Some noted the song's unique mus=
ical structure and its impact on modern music.There were discussions about =
the song's cultural significance and its revival in contemporary music.2. M=
aking My Local LLM Voice Assistant Faster and More Scalable with RAG
This blog post details the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author discusses the c=
hallenges faced with latency and how they implemented solutions to improve =
performance, including using dual GPUs and optimizing the prompt structure.=
Top Comments:Readers appreciated the technical insights and shared their ow=
n experiences with LLMs.There were suggestions for further optimizations an=
d tools that could be used.Some expressed interest in the author's setup an=
d asked for more details.3. Face of Ancient Australian 'Giga-Goose' Reveale=
d After Fossil Skull Found
This article reports on the discovery of a well-preserved skull of the exti=
nct bird *Genyornis newtoni*, providing insights into its appearance and li=
festyle. The findings suggest that this giant bird was well-adapted to its =
environment and faced extinction shortly after humans arrived in Australia.=
Top Comments:Many readers were fascinated by the implications of the discov=
ery on our understanding of megafauna extinction.There were debates about t=
he role of climate change versus human activity in the extinction of these =
species.Some expressed curiosity about the taste of these ancient creatures=
 and the potential for future studies.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--ade9f6b16f19a25d7a107bdc5d84c0e44d602be677606d183ef9d5c45b53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The Stranges=
t Hit Songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". Ahbez, often considered the first =
hippie, lived a life of simplicity and naturalism, which influenced his mus=
ic. The article discusses how his song became a hit for Nat King Cole and t=
he philosophical undertones of the lyrics.</p><h3>Top Comments:</h3><ul><li=
>Many readers were surprised to learn about Ahbez's life and his connection=
 to the song.</li><li>Some noted the song's unique musical structure and it=
s impact on modern music.</li><li>There were discussions about the song's c=
ultural significance and its revival in contemporary music.</li></ul><h2>2.=
 Making My Local LLM Voice Assistant Faster and More Scalable with RAG</h2>=
<p>This blog post details the author's journey to optimize a local voice as=
sistant using Retrieval Augmented Generation (RAG). The author discusses th=
e challenges faced with latency and how they implemented solutions to impro=
ve performance, including using dual GPUs and optimizing the prompt structu=
re.</p><h3>Top Comments:</h3><ul><li>Readers appreciated the technical insi=
ghts and shared their own experiences with LLMs.</li><li>There were suggest=
ions for further optimizations and tools that could be used.</li><li>Some e=
xpressed interest in the author's setup and asked for more details.</li></u=
l><h2>3. Face of Ancient Australian 'Giga-Goose' Revealed After Fossil Skul=
l Found</h2><p>This article reports on the discovery of a well-preserved sk=
ull of the extinct bird *Genyornis newtoni*, providing insights into its ap=
pearance and lifestyle. The findings suggest that this giant bird was well-=
adapted to its environment and faced extinction shortly after humans arrive=
d in Australia.</p><h3>Top Comments:</h3><ul><li>Many readers were fascinat=
ed by the implications of the discovery on our understanding of megafauna e=
xtinction.</li><li>There were debates about the role of climate change vers=
us human activity in the extinction of these species.</li><li>Some expresse=
d curiosity about the taste of these ancient creatures and the potential fo=
r future studies.</li></ul><footer><p>This email has been sent by Toolhouse=
. You can change your delivery preferences at <a href=3D'http://url1228.too=
lhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlA=
YjazfEAqUm0-2FD2kMX-2BcmQdjMswZF7q_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD=
12SmDEpjgjnBO0lh1buz0m5IR0EPze5QoYNGYxqdW-2BN59yKCoZEqrPd0DIoewNv8mvDzTnLE0=
jjtlAyxOR-2BvJ4kSarXzNCt6ZfHaeXFMlCg-2BEHEX7UtdDQAxE4EeVkNZFvGNIm9m2NwCZ189=
i4iXexNRgAkTepcwadX-2BF2-2Fi2wRcI9FA-3D-3D'>here</a>.</p></footer><img src=
=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2=
P513JhjX8oSKm62DliywF0GJIPwGqgiKlhT72cRPi0zFTAFJDulgfg4T2y0Lwe6LYjlExT8c-2F=
Z9iuYFqVyluacmNHosJvokvsNa7D1MqqcSadeYGUlfFU6fBy5hjOePSi5bP9BBkSZmEVLSb8-2F=
pX5hCvS4ATnu6wYJtNi-2BXX4EiSqmuE52aVQ30vcodj4Vljnc1xOhnuLVJJRJ5SepKTX-2BZM-=
3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !imp=
ortant;width:1px !important;border-width:0 !important;margin-top:0 !importa=
nt;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !impo=
rtant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 =
!important;padding-left:0 !important;"/></body></html>
--ade9f6b16f19a25d7a107bdc5d84c0e44d602be677606d183ef9d5c45b53--
