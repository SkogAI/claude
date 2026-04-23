Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7fa3:b0:ac6:bce4:fa68 with SMTP id qk35csp3726669ejc;
        Wed, 2 Apr 2025 10:31:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJch6ca/GgSRmgx8F6xNYPXf1YhCy47GsS32ZmYh6Np/2z6XGRxDVkLs6F19uXkivjVeAv
X-Received: by 2002:a92:ca45:0:b0:3d4:28c0:1692 with SMTP id e9e14a558f8ab-3d6d546977dmr35527215ab.5.1743615099404;
        Wed, 02 Apr 2025 10:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743615099; cv=none;
        d=google.com; s=arc-20240605;
        b=EDWjwhiw18TmZxPT5V1CGYJsFU0NeNScppN9JyBjN8qByS37XhEzzl321IPP9934V9
         XjL/OdAJ60qDViyZzzOhOJNQA0bSZma801hA1im2klZUQlSiCclPk3c4YID/o87yp/va
         Vjx1awBZ93/2D/f4K/en1veYckMQI5a74mlRdxmmIt9/sk5tnj7W3hQxzXm3yF7b9OOo
         ks+Vv20aUFwsAiEhTxPVVaAAvxqYbBmoDXkb5buB20DfevUgoIGVzu4yQfcPMYETLES6
         S7KDVWLm+gP41oK7GogaBvkqM2FEHd59+MK7iDhn8BrDnG1EWmu7hRaaf35K+k9iHCyX
         YMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=911KqRf8fg7xiZ2L3oTUUwTK49FSgtPrz8vLvgsB1os=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=k3e/GV4MQVsgis23Bc8wx2rFGV54DWwhrmZjlm6eZKgOeIPvk/kqy/MlevVjYBPZA9
         o2jJD75s+8tb940kklLJ+VPVtabBlJyBS0uZPHk3xIUDNqyO/lc/YMrmQp1PAGwauciv
         ZTElu9HNVE+rCELpOaY9xcF7n/laQzfyew9i72L/OmBarYvR+jbL2wMX+1GqOPR1+Eif
         UnYKU+wKOK3XUUyB6TqEU4RXDdNQZuDQ4We4R6z1GhsoqrYNivEiArb+tsm/GTh/iixZ
         bbXY3VctVIs3iSIlUGQVidoBx9QiV2P8hQOARMLTxAKIt0yL5yJL2QDe/w2iti/BtbjR
         1nfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=BSJk0l8g;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=figFloc6;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d5d5a73117si122976675ab.46.2025.04.02.10.31.39
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=BSJk0l8g;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=figFloc6;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=911KqRf8fg7xiZ2L3oTUUwTK49FSgtPrz8vLvgsB1os=;
	b=BSJk0l8gW7dZxNlHc6qJMTIDmHXetdhd5Zzsi94qQlUchzS138RcEvPCtKA7c7T/kwdn
	TCVnILaecR4RdFwsv40FhjgVWnkCxFsYNYRth5JuHn/pVNlYInxjhLn08RZdjaakEKP078
	2IEqYr9sv9LnkBd6rThgx8e8X0mc6nS/xGLOnUvLfQ4stlgCozKTErHv25F8WmD6BgBMLb
	8wz2rbKt0vm+aT6uSK5IwDw5uXM6lrh+5/Sp6eD0rJSJb7y4kyIJ6vfzP+edL/tth4IB+5
	eTnb8CntHczoyeYLio0Q6D2sXmwi5JJAZM1T6xAEachSPQY6BPablu4GRHPcUMiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=911KqRf8fg7xiZ2L3oTUUwTK49FSgtPrz8vLvgsB1os=;
	b=figFloc6ZUtnu5tV/ycF1/xUiZmGNmLGyNBF7IEZ4kThBpE/ItdbZ7LhFbBdFdgWRJ5s
	2Oy3mVgiWz1MOwMgCRXTAY2pGPv1KaJumiwoXf5jELltIqwkjSh1O4YzYZGiwcrhOgPFNh
	w2TXwx2UiWZcqnNOjiz9NrUULYlvslkeE=
Received: by recvd-786d47b7ff-jl2m7 with SMTP id recvd-786d47b7ff-jl2m7-1-67ED747A-42
	2025-04-02 17:31:38.953835976 +0000 UTC m=+10381720.173318286
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-20 (SG) with HTTP
	id eVJqOuIwSz6qShpZlhdPkw
	Wed, 02 Apr 2025 17:31:38.938 +0000 (UTC)
Content-Type: multipart/alternative; boundary=ccd5fd15ba4913d0104aa76d0b1c5168cee22697787b271a7296c269c7cd
Date: Wed, 02 Apr 2025 17:31:38 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <eVJqOuIwSz6qShpZlhdPkw@geopod-ismtpd-20>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5iJdXkj8zGWAEuX?=
 =?us-ascii?Q?p8lU=2FR5rdIQUbwstWHm30oxYHKoCQ7=2FIIGFC85G?=
 =?us-ascii?Q?PzxJIfsmJjKqAQV6FrmfvbxyIc+s1K4+VctkoZ3?=
 =?us-ascii?Q?D80zpO=2F2gGUamC=2FlTSPfjOZIldidbFd3u3PmCE0?=
 =?us-ascii?Q?qR=2FSGJsn28aUi2JXcWVHQilk=2FTcAHcVfexyfFmB?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: xGioF6OFlVOb

--ccd5fd15ba4913d0104aa76d0b1c5168cee22697787b271a7296c269c7cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Animals Made from 13 Circles
This article explores the artistic process of creating animals using only 1=
3 circles. It discusses the techniques involved and the challenges faced by=
 artists in achieving perfect curves and shapes.
Top Comments:
Many commenters shared their thoughts on the drawing techniques, with some =
reminiscing about their own experiences in art classes. Others discussed th=
e implications of using AI in art creation.
2. Why Is the World Losing Color?
This article examines the trend of diminishing color in various aspects of =
life, from cars to branding. It argues that modern aesthetics favor muted t=
ones over vibrant colors, reflecting a cultural shift.
Top Comments:
Commenters debated the merits of color in design, with some arguing that a =
more neutral palette is visually appealing, while others lamented the loss =
of vibrancy in everyday life.
3. Digital Archivists: Protecting Public Data from Erasure
This piece highlights the crucial role of digital archivists in preserving =
public data and the potential consequences of data loss on research and soc=
iety.
Top Comments:
Many users expressed concern over the accessibility of public data and the =
importance of maintaining archives for future generations.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--ccd5fd15ba4913d0104aa76d0b1c5168cee22697787b271a7296c269c7cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h2 { color: #333; }
        p { margin: 0.5em 0; }
        footer { margin-top: 2em; font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h2>Hacker News Digest</h2>
    <h3>1. Animals Made from 13 Circles</h3>
    <p>This article explores the artistic process of creating animals using=
 only 13 circles. It discusses the techniques involved and the challenges f=
aced by artists in achieving perfect curves and shapes.</p>
    <h4>Top Comments:</h4>
    <p>Many commenters shared their thoughts on the drawing techniques, wit=
h some reminiscing about their own experiences in art classes. Others discu=
ssed the implications of using AI in art creation.</p>

    <h3>2. Why Is the World Losing Color?</h3>
    <p>This article examines the trend of diminishing color in various aspe=
cts of life, from cars to branding. It argues that modern aesthetics favor =
muted tones over vibrant colors, reflecting a cultural shift.</p>
    <h4>Top Comments:</h4>
    <p>Commenters debated the merits of color in design, with some arguing =
that a more neutral palette is visually appealing, while others lamented th=
e loss of vibrancy in everyday life.</p>

    <h3>3. Digital Archivists: Protecting Public Data from Erasure</h3>
    <p>This piece highlights the crucial role of digital archivists in pres=
erving public data and the potential consequences of data loss on research =
and society.</p>
    <h4>Top Comments:</h4>
    <p>Many users expressed concern over the accessibility of public data a=
nd the importance of maintaining archives for future generations.</p>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMsw2Yki_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDLB83EDioL27ZyJdCUoEr=
MCYODu0p-2FElaNvd3HKuxiFRmN0JRTiInXkIMLSB2NJxxIicx6I2YoCS66v-2B1pht5KIFIonu=
N6PMmklHhDlDNzQ0ZJbXbEgCz4cHkQme-2F5jitfHJhDivyCVJUUW4mKwbDQ1S8CKXYlOjOw46F=
jvMjVLQ-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLazpLJccYZX9qOo4SSJlQsKd5a8HESHBC5EV0czlbbRD=
j-2FP6MArCszIBeVuNUIRL6mu9JI-2FFkovWs5ThndGL6SxnIo0Ym1fMLy9j3EKSq6ppRAizoJn=
jv5jo3nbTHAP7SKKCl785CVIalHKmMgH27JezGcw8BoLhWRxmtqMV4ENgfGWcpQhA-2BzLwNnNP=
ZG5cI-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1p=
x !important;width:1px !important;border-width:0 !important;margin-top:0 !i=
mportant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0=
 !important;padding-top:0 !important;padding-bottom:0 !important;padding-ri=
ght:0 !important;padding-left:0 !important;"/></body>
</html>
--ccd5fd15ba4913d0104aa76d0b1c5168cee22697787b271a7296c269c7cd--
