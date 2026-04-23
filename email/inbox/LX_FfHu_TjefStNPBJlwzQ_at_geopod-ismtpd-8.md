Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:1594:b0:ab6:fa07:db4 with SMTP id cf20csp1617618ejc;
        Sun, 2 Feb 2025 09:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+Vg03SAUhnRv8BIF4XV1bZWL5R2ArbEcXD80O+39rWXdyF8EHTvEcxIkVQtXOMN/DD/1z
X-Received: by 2002:a17:903:234f:b0:216:6c77:7bbb with SMTP id d9443c01a7336-21dd7c66662mr301191745ad.17.1738517536768;
        Sun, 02 Feb 2025 09:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738517536; cv=none;
        d=google.com; s=arc-20240605;
        b=cQ6z9pShIRzuvirK3RGocoBnB1nN5N2UqliQNNIxYIQSWEWSKgl/8BEBVHCbZ4plMX
         OpwIOXugg9XH7OJm6WP2Rw2v1c4fpQFcARGqmnBMAcgVi7SBI09mcgkjYiM+bO2iK4Ko
         HH/OZWUIzSVHE1WhNtNgEcL3P0VvbLcM2Fy95LR7JPhdTdBg5hC9oWK6QA10PMCoaCLT
         uOggchJbxk5Q59sH1FqBG293sT5zHCSQAUy8J4URUqjJ2X7fpjfQkxklWcLLJJeNnU3n
         /EbgUOlDBeZU1AxrQyurILEbXYYrGAnz0BPqC/UTEHYDj+cN645up3SS9/YIamuLQjiF
         +XAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=clKYtPAuzFmpsDt8wVG5rQFtQWn+nB1cZJoj6kfRW3w=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=dRExMP4xhVFH2do3xFp5p2gFwWmV1K3nvpU1rRJVwVn2iu7pEI/mHqqhTkANL8xhwd
         yj912gvLmBqei/Ok0idPqgCok61jxSTfTZ+xYOTBOtjCPiafVkwVFZoCc1pYVSrxWD2J
         jjmq8ogtHvyJRqMKdCkGo5SZRHen726mO0xyMDN+KLdh6uC5kPZ9TK3FZbxwz/71SIaj
         OAgxCkSSEr1AngRfgKk7bx52dv5kY0xPQfjAl2jjT0zRkhPz7ZPh7TEhBsUBEnTJ6xwL
         5RaHq0aZutx/LygNV9cWYDJcB6uPSnvvleZeAj8bqBri8DtQfAtK/XeRLcAufmyTPR8A
         WMSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=J0CzZREU;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=BLRK3hmG;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wrqvtwtt.outbound-mail.sendgrid.net (s.wrqvtwtt.outbound-mail.sendgrid.net. [149.72.121.119])
        by mx.google.com with ESMTPS id d9443c01a7336-21de5e5076esi95267585ad.174.2025.02.02.09.32.16
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 09:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) client-ip=149.72.121.119;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=J0CzZREU;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=BLRK3hmG;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=clKYtPAuzFmpsDt8wVG5rQFtQWn+nB1cZJoj6kfRW3w=;
	b=J0CzZREU8Tye5VhIZaelJRBG4lOAdNFZh8yHxMmaTcwpzDtx4sY7X+I2NSddXgnfuj4t
	CXZ9lwd8w4TsgwscVrBOC2N1MlM6xw59W/elxTJrSC3Bo5VMBsRr210DjkE4w3CMGONsBa
	r8rJiQW5gtx1vVBcUqGG2FM4pnRBHpWwiKe4f3UQm3Cp807qcbqo0U6e/xPWdc74lBkS4I
	rezzVUoD/fE68bnPqfXewLSY1SF8Un8L+P6fAF5inD+xoDo4QXOVF8WcFghbcPV/JtGqNH
	vVXlbeRByJEhU8gw7nJ7HODzhVzb7HEoo7UEVDAs7HNRsqR0B/kuwbOl89MqQNrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=clKYtPAuzFmpsDt8wVG5rQFtQWn+nB1cZJoj6kfRW3w=;
	b=BLRK3hmGEfOy9o60F4nCZBYQRz4vPkQKDfuKU1mltuOdkxRnfQuwXdFcLPbX3YS2xmNJ
	9o2RcpKKb2XLPAP1Mm8DBG5poMF21bVmSBxWcYGWA1fb5Jy6yz7vhRbayvM81EVlPmCCEU
	UBLhy/+Z/3suT6u8wEfRC5eumVQu2fUj0=
Received: by recvd-5f54b5d587-fjhb9 with SMTP id recvd-5f54b5d587-fjhb9-1-679FAC1F-3
	2025-02-02 17:32:15.126393126 +0000 UTC m=+6898218.611558931
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-8 (SG) with HTTP
	id LX_FfHu_TjefStNPBJlwzQ
	Sun, 02 Feb 2025 17:32:15.080 +0000 (UTC)
Content-Type: multipart/alternative; boundary=79379e20bf13404900e84f0160900d31639745175c4cdd328dcd2f25cb4f
Date: Sun, 02 Feb 2025 17:32:15 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <LX_FfHu_TjefStNPBJlwzQ@geopod-ismtpd-8>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4aZQG0GRzVinJAe?=
 =?us-ascii?Q?eiVUQK5kQXKG7lDnJWAZ0IPk0yMCsubVwKcblUe?=
 =?us-ascii?Q?NHyCaLhJNOtD6Q3qLTCtsp=2FaxU+QaRqI8ZT+Ehe?=
 =?us-ascii?Q?GMawbda7KwitCNLVbSXcFHBjA5NytPPh8lhU0pU?=
 =?us-ascii?Q?5C9+nynyCYllnrEEIeKCw+QTQvd45f0H3WEKgD+?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 72yy7n26St38

--79379e20bf13404900e84f0160900d31639745175c4cdd328dcd2f25cb4f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating article about Eden Ahbez, the composer of the 1948 hit "Natur=
e Boy" performed by Nat King Cole. Ahbez was a unique figure who lived an u=
nconventional lifestyle, sleeping outdoors and following a natural diet dec=
ades before the hippie movement. The article details how he delivered his s=
ong to Cole, his brief success, and his lasting influence on music.
Key Discussion Points:
Many readers discovered that the song was featured prominently in Baz Luhrm=
ann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, particularly i=
ts unusual chord progression
Historical context about possible inspiration from a Yiddish theater song "=
Shvayg, mayn harts"
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about improving the performance of a local LLM-based vo=
ice assistant using RAG (Retrieval Augmented Generation). The author descri=
bes how they optimized their home assistant by reducing context length and =
implementing smart retrieval of relevant information.
Key Discussion Points:
Technical discussion about the implementation of RAG and its benefits
Debate about the model used (Llama 3 70B AWQ)
Comments about the assistant's response style and personality
3. Face of Ancient Australian 'Giga-Goose' Revealed
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia. Standing over two m=
eters tall and weighing up to 240 kg, this "giga-goose" went extinct shortl=
y after humans arrived in Australia.
Key Discussion Points:
Extensive debate about the cause of extinction - climate change vs. human i=
mpact
Discussion about the timing of human arrival in Australia and population si=
zes
Interest in the potential taste of ancient megafauna, given that humans may=
 have hunted them to extinction
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--79379e20bf13404900e84f0160900d31639745175c4cdd328dcd2f25cb4f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<div style=3D"margin-bottom: 40px;">
    <h2>1. Eden Ahbez: The Strangest Hit Songwriter</h2>
    <p>A fascinating article about Eden Ahbez, the composer of the 1948 hit=
 "Nature Boy" performed by Nat King Cole. Ahbez was a unique figure who liv=
ed an unconventional lifestyle, sleeping outdoors and following a natural d=
iet decades before the hippie movement. The article details how he delivere=
d his song to Cole, his brief success, and his lasting influence on music.<=
/p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Many readers discovered that the song was featured prominently =
in Baz Luhrmann's "Moulin Rouge!"</li>
        <li>Interesting discussion about the song's musical composition, pa=
rticularly its unusual chord progression</li>
        <li>Historical context about possible inspiration from a Yiddish th=
eater song "Shvayg, mayn harts"</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>2. Making Local LLM Voice Assistant Faster with RAG</h2>
    <p>A technical article about improving the performance of a local LLM-b=
ased voice assistant using RAG (Retrieval Augmented Generation). The author=
 describes how they optimized their home assistant by reducing context leng=
th and implementing smart retrieval of relevant information.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Technical discussion about the implementation of RAG and its be=
nefits</li>
        <li>Debate about the model used (Llama 3 70B AWQ)</li>
        <li>Comments about the assistant's response style and personality</=
li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>3. Face of Ancient Australian 'Giga-Goose' Revealed</h2>
    <p>Scientists have discovered a well-preserved skull of Genyornis newto=
ni, a massive flightless bird that lived in ancient Australia. Standing ove=
r two meters tall and weighing up to 240 kg, this "giga-goose" went extinct=
 shortly after humans arrived in Australia.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Extensive debate about the cause of extinction - climate change=
 vs. human impact</li>
        <li>Discussion about the timing of human arrival in Australia and p=
opulation sizes</li>
        <li>Interest in the potential taste of ancient megafauna, given tha=
t humans may have hunted them to extinction</li>
    </ul>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"font-size: 12px; color: #666;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswjB3X_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDprlvp8GoUQZnFvnB1gW3=
DpVjTSI4l8V4-2Bk6K6n496Nv6rd2wFE80hNONugQ8xWBdwnSexiJq5pLcFQCeUr1rumlDvf1Ja=
SbHT5VBsOD-2BWSiDkNHwlgHvWSlewyGVj6ZkEaEFlrd35Od1lvC3-2FaeK6AhTUNza862h0gMf=
1Er4e8g-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GIKI0pcnHNHv-2FW2wjZ46Y4sIBjJJHjjKghYYzh8IL3e=
-2F6hE90knH4ymp3yD23OcWRhaXbTSRj6eflh9-2FyHkKyA9e4HCP6-2FSH8pS3KSPaxi9DKh57=
LSGp1YV6CgL5YG6dwfJ-2FfTGaRJVK-2B-2BCesv9ZShv7nBXZEgjhNI2DRJItfaNo-2BqgL4NB=
XljvS5C5pHjaT5E-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D=
"height:1px !important;width:1px !important;border-width:0 !important;margi=
n-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;mar=
gin-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;=
padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--79379e20bf13404900e84f0160900d31639745175c4cdd328dcd2f25cb4f--
