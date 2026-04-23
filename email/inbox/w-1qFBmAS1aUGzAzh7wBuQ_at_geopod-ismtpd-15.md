Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp2536797ejc;
        Tue, 22 Apr 2025 10:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnDR+nmqsy+GdYsBhZo7f+UtX8ZQTQcdyFehbFMCDTAgy+3Hz5W1AFkU8mXAY3FE/uI39v
X-Received: by 2002:a05:620a:bc4:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7c927f6b78cmr2816773985a.9.1745343052157;
        Tue, 22 Apr 2025 10:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745343052; cv=none;
        d=google.com; s=arc-20240605;
        b=dUnElJREylqBivrAZf8UapN6QBY5HBu/JzIn23LViZCodWM6FtviLTrtK2LcDz+AC1
         68Cx9x1IDB7S1DSEccj35f87Tt3KvSdrftE/SdxytccMkrjCajlq2cUWo9nn0NdzGXBW
         GRkB0f4mikOgu04mzScUlv0ioztZwcxG7g4X8RLqITl2NraWpM2jdfN2ifRkQ6/t9iIN
         FHv8ByJZMt6jYvdewvfLT51vRRG4B/F5OoY9/mBq98XCzI7UbXsww1aoWmBbj22rr3io
         KUFX0386b+J/1BlretMvGAjTw/LGdVpGl7sKSrB7sbOREBECbkOTBKNXImOWw6fUXa0I
         toCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=Gxo+azioEyTaIZgBGjdQqPU+hX3um96ryZatWO5Jdz0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Y/Am2R0PFBhalFShNN9yadE+94hHIAD6hP42qsmT5S3eVsF1frWLCBT2d65x4k5h0G
         lj8MkFGsshc1DukhrMUSIy5wlhj5YBcVPPp0p2VZZXUnvjq4FjVA9f/HFYZy5/jHql5l
         E7sPXliSHTizqCR3MQPR4CQ5j/0eyXMeLg6+Rv6buVkcyUeafBq6ppXjMS9BkUgHu2mM
         Naq3QNWl8LWFR2/GUjYBRl3dWwQFOCCXWLBvQoyoUSTfiTLuTzRGxUyp9dKVCVwMI8iz
         5GM/bTLQBv9ly+KWAxBVBHVBuAZlNpUJPinwKW0h600EtX3w6RxxB/tuPxUeV6vcSgX2
         u5+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="w6/6ezzg";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="rHoYMzW/";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id af79cd13be357-7c925bf87b4si1159006785a.589.2025.04.22.10.30.51
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 10:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="w6/6ezzg";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="rHoYMzW/";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=Gxo+azioEyTaIZgBGjdQqPU+hX3um96ryZatWO5Jdz0=;
	b=w6/6ezzgXcnVLDJedEFvITmG8Y4glXcoZ1ugq5k9biaQ1/Vkl62WroTM2drDs2b2WR1D
	2va3e7rl+qtIQkNAZRit03Dl4iPUvHEG7rUsdj4ZhPIqn5U/yDGWngG7XOa8CmJO9k/uf6
	jbPE3JvGFdlFJmIHOk6zCEAWGEIbdTiAmf8WH0INU9FMCSjgTI5wODRL1XJGd4QD2vhC5/
	5xjejPyXHgrymzGqcMRm4g4tuDAzWasnf538Slb5QDVc8cdsjrJMtkUvXJ7NAlDCblBuLY
	DPJcJDghNeVkjkd5mFyYnfiSrO0Ip3ggNSu4MeWwJO7CyJZWnPM7Mfn0tc8tDfkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=Gxo+azioEyTaIZgBGjdQqPU+hX3um96ryZatWO5Jdz0=;
	b=rHoYMzW/5+eKLkusgi5gbqTFyuC95to0/wiDSWwc13J8q5b6tF23vSm8bA6nGvZTpRoy
	JxZ2t8Q+O+gCqGwYlDAp/oy2QFmvVMIRKqrXMt8CqM3MEXzoQ2UfS9k3mpGbp+17QTUZca
	ZfeSWhj/0f30ZIYywo7ACSfZscuaeGvwo=
Received: by recvd-b7858b88-4pwhw with SMTP id recvd-b7858b88-4pwhw-1-6807D24A-8
	2025-04-22 17:30:50.078896564 +0000 UTC m=+1192977.287896335
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-15 (SG) with HTTP
	id w-1qFBmAS1aUGzAzh7wBuQ
	Tue, 22 Apr 2025 17:30:50.040 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c835cb43388e1c2e3c8e5383d55660fa5a7da32101c1065a29e3fcf088ee
Date: Tue, 22 Apr 2025 17:30:50 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <w-1qFBmAS1aUGzAzh7wBuQ@geopod-ismtpd-15>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4OF4NGR+Nd5mxD7?=
 =?us-ascii?Q?7ej=2F7DksQSb4WiR4cxoKeQweTbzSn9FbwbJI+4k?=
 =?us-ascii?Q?W2=2F68kkMQ4Zggnl+mzR5jPx5+RqkNpQoUPClmlU?=
 =?us-ascii?Q?NKfvRXwbaY0KSg89gcQpN8+Jp0qOCWmJXZu5PDm?=
 =?us-ascii?Q?9oKhYzdRJuL+aeRkdottVLDwckqGtrBtPoZ+f+E?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: znxo95JGQG0l

--c835cb43388e1c2e3c8e5383d55660fa5a7da32101c1065a29e3fcf088ee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Algebraic Semantics for Machine Knitting
This article discusses the need for rigorous semantics in machine knitting,=
 comparing it to traditional programming languages. It explores how semanti=
cs can help in error checking, compiling, and code transformation, and intr=
oduces the concept of commuting statements in programming.
Top Comment: A user reflects on the connection between programming and knit=
ting, suggesting that knitting can be seen as a form of code.2. ClickHouse =
gets lazier (and faster): Introducing lazy materialization
This article introduces a new optimization in ClickHouse that delays readin=
g column data until it's needed, significantly speeding up queries, especia=
lly for large datasets. It provides a real-world example demonstrating a dr=
amatic speedup in query performance.
Top Comment: A user expresses surprise at the speed of sorting large datase=
ts and discusses the implications of the new optimization.3. I should have =
loved biology too
The author reflects on their journey from disinterest in biology to a newfo=
und passion, inspired by engaging writing and personal experiences. They di=
scuss how great storytelling in science can ignite curiosity and change per=
ceptions.
Top Comment: A user shares their experience as a teacher, highlighting the =
challenges of teaching an uninspiring curriculum.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--c835cb43388e1c2e3c8e5383d55660fa5a7da32101c1065a29e3fcf088ee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Algebraic Semantics for =
Machine Knitting</h2><p>This article discusses the need for rigorous semant=
ics in machine knitting, comparing it to traditional programming languages.=
 It explores how semantics can help in error checking, compiling, and code =
transformation, and introduces the concept of commuting statements in progr=
amming.</p><p><strong>Top Comment:</strong> A user reflects on the connecti=
on between programming and knitting, suggesting that knitting can be seen a=
s a form of code.</p><h2>2. ClickHouse gets lazier (and faster): Introducin=
g lazy materialization</h2><p>This article introduces a new optimization in=
 ClickHouse that delays reading column data until it's needed, significantl=
y speeding up queries, especially for large datasets. It provides a real-wo=
rld example demonstrating a dramatic speedup in query performance.</p><p><s=
trong>Top Comment:</strong> A user expresses surprise at the speed of sorti=
ng large datasets and discusses the implications of the new optimization.</=
p><h2>3. I should have loved biology too</h2><p>The author reflects on thei=
r journey from disinterest in biology to a newfound passion, inspired by en=
gaging writing and personal experiences. They discuss how great storytellin=
g in science can ignite curiosity and change perceptions.</p><p><strong>Top=
 Comment:</strong> A user shares their experience as a teacher, highlightin=
g the challenges of teaching an uninspiring curriculum.</p><footer><p>This =
email has been sent by Toolhouse. You can change your delivery preferences =
at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9C=
mwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswipx8_zKD9qStm=
l-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAJx322chJK-2FOnhnGmADcKlbDiNS1nJXAuwkyK=
jyqdF2TeEkJW6J2jgc66w8xwhBcaWYKtpn9dm3b5nkesEpt71RUkg4DD3SfE6HoKfcNzfzM4qO6=
CV7kXQTlW3URTndRK4p9oXTSQgAhugEbKrVhd5cw2Qm4ZPm2CzmbdCo-2FoRJw-3D-3D'>here<=
/a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du=
001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GKZzuQgni7FKa5qhLSlEgZ3ojBnB=
b-2B8CQxLbSeK44B8NJ0-2B1aC-2FKaiJJ0aLVB3n0c-2Bk4IBW2R23C1jKxT13XHLHRqW5-2Bc=
75qjUp3LnHwJEme88TSQSm2l7pF-2FBABHmdbgBPG0vNFtEyEh-2FtdCNl0zAXjm7An9lcDu-2B=
9pLdVHyBMTA-3D-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"=
height:1px !important;width:1px !important;border-width:0 !important;margin=
-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;marg=
in-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;p=
adding-right:0 !important;padding-left:0 !important;"/></body></html>
--c835cb43388e1c2e3c8e5383d55660fa5a7da32101c1065a29e3fcf088ee--
