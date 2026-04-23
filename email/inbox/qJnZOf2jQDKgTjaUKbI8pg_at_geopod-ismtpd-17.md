Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp1137268ejc;
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVESRWzidxdyiMKFliZHNCDAt3DZP4p370DUx+6dguxalqWVzxIn48U5FJTyvbsKX0mxQH
X-Received: by 2002:ac8:5983:0:b0:476:fdf9:9707 with SMTP id d75a77b69052e-4797756e926mr92011881cf.31.1744479083631;
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744479083; cv=none;
        d=google.com; s=arc-20240605;
        b=fbrmbeEqgiaTXbETjuIkHON6HpMb+2TPGL4IcBJjuc7AN8gmrbIE2oP3J43Ag/yxqy
         +DmZzQevsGztT/6AixU2QfA8YeATGtpKoTbBEFm0zxob6lmpZ0jjiig1nB7iZiPnSNy6
         iMDlEGS5jCWfo6D3J5G9l3pWbEpFf1BkIh4KN3PiTmga9pLzL/5r2237NOrC2lhqBgPQ
         L+zDMcZvNaYsdoLHe+KDQoefkueOFGD+Nj2oVM36Bxors7Yo4o4/SF6RWK4VxK9pRUt/
         QadbdByYaObmNx/cm0P/zu6mQh8xjOpSZw7XLmV1FMj/x5iAg1SpaHTiLIw0eyLhpvMo
         r8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=d35rioexqAWitxx5KI4Usw5DiS910pAuTm/DqScGQuw=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=ElS7O6hLmSqTo1OAnxtvdBQmky/5uSB4z5qer0qk4V/X6yt8SPnR3mZPL2EtYkDb50
         NKJswXGpS+xV4nl7rDXEeRhYNhdpAnCttTbAJ4I8IBZpDgShA2PL8yDQyhV96Po3cqgu
         dN62ZCG9YYUqKwhje+vGq3ytYr2wR9CzBFlGqGoZv7B2nDk7F4Y7wMn5YQrukc1WWxNi
         5wmWogsWgM0/Samxwj/byiJJULckLfUBBCq5TFlOufhzKxo2oj1RXS6kXSmgieOKvEqf
         2UqaOUkHMoAO4mbabm/yBCk9ODJOClW6VCF8rhXREsk5Fn2W/XReFZXbcttVu9YcpYdS
         oGGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=YfppL5Z0;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=d6i+HtgB;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edeba0asi54924651cf.530.2025.04.12.10.31.22
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=YfppL5Z0;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=d6i+HtgB;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=d35rioexqAWitxx5KI4Usw5DiS910pAuTm/DqScGQuw=;
	b=YfppL5Z0/J1K4XXb7YRHzJdGDhHHLmj2Z1l6IVWsScK0xzhOdVg1MQ8krzFZ7c0keCLB
	Lbh2I03eio046o77FdbGps9MPDI1adKwGnJ9h6k7A8d5bRP4wMWgTsNF1XEIxdjr7HNAdV
	Ii+CAAYehEGk/nyS9LnRVdfcpkhBjQGn3mXj/CvJ4dtjhUefYA/yzpo+zuGzGmw5Fc0/2/
	7ZV+4mHuO8x+F7piCpFPjlWA1LBSK4YV0mOGfj3zdS3Uo/b8TPCL9OzT2mPxxGhd8R4u1R
	GjgvPEeUhZ1EbNN1xG6w3OmpYQnWySyz87OVsREdPn1UZRL5+C9WQzyPrXE7cHPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=d35rioexqAWitxx5KI4Usw5DiS910pAuTm/DqScGQuw=;
	b=d6i+HtgB6prGqRe6TEvGD45sQTcwOBdz26scsDprHzinpUiwHMBSfqqCEh9y2EHdv4Xm
	EqATTrRrJVRSWQXyXCOvG0V6Ldog2fQFwY0EBCbTJxamR8KAW/TtPmbABPVlyamNoMcCfa
	MvRyirQ3VK5Kpa9/uUunqDAQp4ne0oXgc=
Received: by recvd-canary-64666fdbcf-2hvr7 with SMTP id recvd-canary-64666fdbcf-2hvr7-1-67FAA369-44
	2025-04-12 17:31:21.564952873 +0000 UTC m=+329009.120169551
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-17 (SG) with HTTP
	id qJnZOf2jQDKgTjaUKbI8pg
	Sat, 12 Apr 2025 17:31:21.541 +0000 (UTC)
Content-Type: multipart/alternative; boundary=180ed46719136637b33a84e764e1b94772acae04fd81444452c93278a54f
Date: Sat, 12 Apr 2025 17:31:21 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <qJnZOf2jQDKgTjaUKbI8pg@geopod-ismtpd-17>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5XVUyZlJxmBnPLv?=
 =?us-ascii?Q?G44f2hlWNBsZ1xubMcxpdmzon+Mh=2FTTkiZPeOEt?=
 =?us-ascii?Q?K27EVcETk4w5EAomGKBGKNPhJ2GIHLoRAe2pDSt?=
 =?us-ascii?Q?R7BoKRyXWQbWsm1DEevfFyrYl26BVD46dyD+wzn?=
 =?us-ascii?Q?YkDPEL5JGxRn+Jq=2FgkSNoXpHYi5jJeFN0riO6o3?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: P/kvPgUl1xdX

--180ed46719136637b33a84e764e1b94772acae04fd81444452c93278a54f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Open source and self hostable/private file conver=
ter
This article discusses a new open-source file converter that is self-hostab=
le. The source code is available on GitHub under the AGPL license, which re=
quires modifications to be shared with users accessing the software over a =
network.Top Comments:Users appreciate the open-source nature and the capabi=
lities of ffmpeg.Some express concerns about the practicality of web-hosted=
 solutions versus local applications.Others highlight the ease of use for n=
on-technical users.2. Tunarr: Create and configure live TV channels from me=
dia on your servers
Tunarr allows users to create live TV channels from media stored on their s=
ervers, providing a user-friendly web interface for configuration. It aims =
to modernize the experience of setting up TV channels.Top Comments:Users sh=
are their positive experiences with similar services and express excitement=
 about trying Tunarr.Some discuss the nostalgia of cycling through channels=
 without making conscious viewing decisions.3. Paris said au revoir to cars=
. Air pollution maps reveal a dramatic change
This article highlights the significant reduction in air pollution in Paris=
 due to policies that have limited car access and increased green spaces. A=
ir quality has improved dramatically over the past two decades.Top Comments=
:Some users debate the effectiveness of banning cars versus improving vehic=
le emissions.Others comment on the overall changes in the soundscape of the=
 city.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--180ed46719136637b33a84e764e1b94772acae04fd81444452c93278a54f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Open source and self hos=
table/private file converter</h2><p>This article discusses a new open-sourc=
e file converter that is self-hostable. The source code is available on Git=
Hub under the AGPL license, which requires modifications to be shared with =
users accessing the software over a network.</p><h3>Top Comments:</h3><ul><=
li>Users appreciate the open-source nature and the capabilities of ffmpeg.<=
/li><li>Some express concerns about the practicality of web-hosted solution=
s versus local applications.</li><li>Others highlight the ease of use for n=
on-technical users.</li></ul><h2>2. Tunarr: Create and configure live TV ch=
annels from media on your servers</h2><p>Tunarr allows users to create live=
 TV channels from media stored on their servers, providing a user-friendly =
web interface for configuration. It aims to modernize the experience of set=
ting up TV channels.</p><h3>Top Comments:</h3><ul><li>Users share their pos=
itive experiences with similar services and express excitement about trying=
 Tunarr.</li><li>Some discuss the nostalgia of cycling through channels wit=
hout making conscious viewing decisions.</li></ul><h2>3. Paris said au revo=
ir to cars. Air pollution maps reveal a dramatic change</h2><p>This article=
 highlights the significant reduction in air pollution in Paris due to poli=
cies that have limited car access and increased green spaces. Air quality h=
as improved dramatically over the past two decades.</p><h3>Top Comments:</h=
3><ul><li>Some users debate the effectiveness of banning cars versus improv=
ing vehicle emissions.</li><li>Others comment on the overall changes in the=
 soundscape of the city.</li></ul><footer><p>This email has been sent by To=
olhouse. You can change your delivery preferences at <a href=3D'http://url1=
228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16o=
ZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswpzjq_zKD9qStml-2FkjU46ulTqeWVsrM3061nr=
98hteMD12SmCBi2l5xVQexChdVQXni-2FYT4UmWa1E5tlbki8-2BWGW1DHiq6CcXan7Up1LDyWQ=
SByqucpKAnQnJxF4mXDjBG5hHDkaAz0Ul9tWgyl0NP3b7rGdPURsB2Bhw4AC6H0Nfqgmzb9ntuI=
9FD9FyU73iNOw55mR3KMc2Sl8AnaGLiMIfOeRIKH0TZPMltysQuM4K7jts-3D'>here</a>.</p=
></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2=
F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GLtNxVo5RnyGq6q1ISR4Rfh-2FHN32URPcG=
CY1lvXXqV0-2FCDhx1iWN-2BdcokPMP2siuiUQL6EYa-2Fr-2B8sX7URLTw9FiXh6q44OHmtLRY=
x4kd5grkib91AeaFPKr6FdtawQdLd7aaftwVhL2i7NuS2DFVRozvkZC-2BUZMiEq-2FZuyvE8s1=
rCFew2Nf-2B8Uh7b-2FT1O5Z3As-3D" alt=3D"" width=3D"1" height=3D"1" border=3D=
"0" style=3D"height:1px !important;width:1px !important;border-width:0 !imp=
ortant;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !i=
mportant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0=
 !important;padding-right:0 !important;padding-left:0 !important;"/></body>=
</html>
--180ed46719136637b33a84e764e1b94772acae04fd81444452c93278a54f--
