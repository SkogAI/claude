Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7fa3:b0:ac6:bce4:fa68 with SMTP id qk35csp3090063ejc;
        Tue, 1 Apr 2025 10:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7yt8tCneWoIHUqgJ8NW+eY9AKHlrSvqIe3LKy6MkI+73iKT22S6CZNR8M1DgOFTdCLetQ
X-Received: by 2002:a05:6e02:c:b0:3d1:a34b:4d01 with SMTP id e9e14a558f8ab-3d5e09090famr152986715ab.8.1743528662600;
        Tue, 01 Apr 2025 10:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743528662; cv=none;
        d=google.com; s=arc-20240605;
        b=a5PERZoQZZykYuVjqf/Ci72XCwuSdq8mex3DRdWhNGiUMBVWIOi7+bWAO5DSC6kWQt
         MNC9g2gMtMgYnXoy0pXCQ7YlcxQ8gGvrHGTjVIhG0jzoY90xFTQ0Fvucqf34C/ZzX+QL
         mh2dMEEvwNhVvABxIJ/USxopkIArHIhDywbiVrbRm00Ml5jFOwfxt6783nJ08UcGlhZQ
         A17O4rro1/YNU59uBwmlA1bzSL34ApX3M10O2otBbZTqv4Hd5vQHWsMpm/JouYLLSWbc
         e2EOID0MAv0oSG6EiAM2tY96+6E8GG6hOSgE/vWQl99czE5E3j+wRd6rnImf5tEXDkqS
         vwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=bGZ4GFqjV4UAILdYWensYcWxNzZ6uu0oj3Z/d6/U+g0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=AvsTlPgEoY4EIsbYlhloTIoLvVT8/gPriabYQEs0zCxOMzT45Qek1MU4xV9wAzilRt
         XjSJDy7vlLzgvXR0s0N2btME88bQzuAXphBygEY82wZdnucODZqMTmU0OitPlm1dsGhd
         nmI9KuREotQsR29kP9A5okO/ZNOPQUPWqg567cPhVfdQhc2QG7KCS8hvR9zB0KQbGoyy
         FHA3jc2i3+Hk2RcgpKNGzS0LU9qRs2mtFjiX9xlQxLSUc3ZpxDIiHOoa0wkb/ttO2uQW
         Cai3TDSWttMBshp1MuBXQMjm7PRVOEbaIMJak9O4Gms//pnnxiStevGs0HZede3XcZwM
         XWHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=QT3czfYo;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=jkwV9ed5;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4f464721f36si9624815173.1.2025.04.01.10.31.02
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=QT3czfYo;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=jkwV9ed5;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=bGZ4GFqjV4UAILdYWensYcWxNzZ6uu0oj3Z/d6/U+g0=;
	b=QT3czfYo0BvJkEreuPiIAOtQswmzzAZmwA/de7Fk5pWggK12Fn6VZuJKTfDfhlgAweT6
	z/OL38FGKbpgCT+fGoTbXPbsQoOSH6I+N3yMi44UxaPYyZlxKVHzbpjR+Z1BrVLNBZELgf
	298tF4/mQxHUKhgGIB1FKPmrQWOBE5j9VRd6Nf1gg+atxYeyKemTeoCG5OAGlsGbJKBoCi
	3RKb2hnfSfWAwmafoxSkDzQpBQXV1PL8uOBDtkPKIgKPOOeji8kOg88AJ5Sv+OWOZoAOFn
	ynSfAsR9V8U+PiJCjSwaSQXeYXHc1mrATXCmrjHvZrybWNLAkNJOib/bn7IhxhFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=bGZ4GFqjV4UAILdYWensYcWxNzZ6uu0oj3Z/d6/U+g0=;
	b=jkwV9ed5jcbpVwzcHUcHEVwgMBUH/AI4cyLZ2scbetP+uCpB9nNZcqFaAVBNArwk/OSs
	WnIuIM5pcyagn9h5plkUXcgRlwKgMRF9bHyzuXsQ97oyc1I9XiLiSdtbSAgWZLCuzgDlbs
	iE2HK9uY4NBFS+YJKKIqZ0J6SIBzFE+cc=
Received: by recvd-69cbc48b94-g9g4n with SMTP id recvd-69cbc48b94-g9g4n-1-67EC22D6-1
	2025-04-01 17:31:02.00132072 +0000 UTC m=+11909338.687504345
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-30 (SG) with HTTP
	id IJ2qabunQTCzVUGCerebBw
	Tue, 01 Apr 2025 17:31:01.982 +0000 (UTC)
Content-Type: multipart/alternative; boundary=51e34dd1dadb087e5996ff58fbfc8bf00cfb0d14116da85225a51dc001ad
Date: Tue, 01 Apr 2025 17:31:02 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <IJ2qabunQTCzVUGCerebBw@geopod-ismtpd-30>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7Lnnpk11fddOOkw?=
 =?us-ascii?Q?2=2F2C5YqCMneOQVAT4OMyHGO+4TCmOpeE0RZFcIP?=
 =?us-ascii?Q?xJ50VDiKxrgOChd9y050Mthc3RVP8vqLZ=2Fo+=2Fn3?=
 =?us-ascii?Q?gYAUjkYuabHDY6blMZu91OLqOOQjnDCmzmQEJgg?=
 =?us-ascii?Q?x=2F4OLwIwPXOZfx=2FnB0Y8J=2FNpw7knDnFa93hFBy6?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: z4AlZRGRwSUf

--51e34dd1dadb087e5996ff58fbfc8bf00cfb0d14116da85225a51dc001ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Electron band structure in germanium, my ass
Summary: The article humorously critiques the exponential dependence of res=
istivity on temperature in germanium, revealing the author's frustrations w=
ith experimental physics and the challenges faced in obtaining accurate res=
ults. The author expresses disillusionment with the scientific process and =
reflects on their experiences in academia.
Top Comments: Many commenters shared their own frustrating experiences in s=
cience education, discussing the challenges of lab work and the pressures o=
f achieving expected results. Overall sentiment was one of camaraderie and =
shared frustration.2. Bletchley code breaker Betty Webb dies aged 101
Summary: Betty Webb, a decorated World War II code breaker, passed away at =
the age of 101. She was recognized for her contributions at Bletchley Park =
and later at the Pentagon, where she helped decipher Japanese codes. Tribut=
es have poured in, highlighting her legacy and the importance of preserving=
 the history of code breaking.
Top Comments: Commenters reminisced about their visits to Bletchley Park an=
d the significance of preserving the stories of WWII veterans. Sentiment wa=
s largely respectful and nostalgic, with many expressing gratitude for Webb=
's contributions.3. A man powers home for eight years using a thousand old =
laptop batteries
Summary: An individual has successfully powered his home for eight years us=
ing a system built from over 1,000 recycled laptop batteries and solar pane=
ls. The project showcases innovative recycling and sustainable energy pract=
ices, demonstrating the potential of DIY renewable energy solutions.
Top Comments: Many commenters praised the ingenuity of the project while al=
so expressing concerns about safety and the feasibility of such systems. Th=
e overall sentiment was a mix of admiration for the creativity and caution =
regarding the risks involved.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--51e34dd1dadb087e5996ff58fbfc8bf00cfb0d14116da85225a51dc001ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Electron band structure =
in germanium, my ass</h2><p><strong>Summary:</strong> The article humorousl=
y critiques the exponential dependence of resistivity on temperature in ger=
manium, revealing the author's frustrations with experimental physics and t=
he challenges faced in obtaining accurate results. The author expresses dis=
illusionment with the scientific process and reflects on their experiences =
in academia.</p><p><strong>Top Comments:</strong> Many commenters shared th=
eir own frustrating experiences in science education, discussing the challe=
nges of lab work and the pressures of achieving expected results. Overall s=
entiment was one of camaraderie and shared frustration.</p><h2>2. Bletchley=
 code breaker Betty Webb dies aged 101</h2><p><strong>Summary:</strong> Bet=
ty Webb, a decorated World War II code breaker, passed away at the age of 1=
01. She was recognized for her contributions at Bletchley Park and later at=
 the Pentagon, where she helped decipher Japanese codes. Tributes have pour=
ed in, highlighting her legacy and the importance of preserving the history=
 of code breaking.</p><p><strong>Top Comments:</strong> Commenters reminisc=
ed about their visits to Bletchley Park and the significance of preserving =
the stories of WWII veterans. Sentiment was largely respectful and nostalgi=
c, with many expressing gratitude for Webb's contributions.</p><h2>3. A man=
 powers home for eight years using a thousand old laptop batteries</h2><p><=
strong>Summary:</strong> An individual has successfully powered his home fo=
r eight years using a system built from over 1,000 recycled laptop batterie=
s and solar panels. The project showcases innovative recycling and sustaina=
ble energy practices, demonstrating the potential of DIY renewable energy s=
olutions.</p><p><strong>Top Comments:</strong> Many commenters praised the =
ingenuity of the project while also expressing concerns about safety and th=
e feasibility of such systems. The overall sentiment was a mix of admiratio=
n for the creativity and caution regarding the risks involved.</p><footer><=
p>This email has been sent by Toolhouse. You can change your delivery prefe=
rences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duo=
kMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswbwTj_z=
KD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDWqmL0bMhvgyNrac3cSWFXkEMbsGVZF4=
xNeta8LPrvBVyk39trjWZ7-2BuTK2Hj-2Ba589yNMlGNcL43t1-2BGuNUBIYnKovPVrayjTZKWN=
znDBa90xb1PKCmgGuuR38UI4p9Uz5movhAYyQuXH8h1M7ERr-2BNoBt9NR3QrJfdoR2FjaTCw-3=
D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/o=
pen?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GKS4mtNsMZdGE5mKE=
QBmbsZmOKDmgOgOMlwu8mfju7NPtqMvxDj9kjgtv-2FoxFdLfUvUHRElTC3atGv6sJ-2FMvRpX5=
4IXBu1KOKmAVUS-2Fo-2F7IEwMzUKziF4lb9x8soy-2B8CzeJ74wfLu4TNKWBNdC4QSIxhiL-2B=
QzRAEGTMiJIstaMMB5HfTf-2FQyG0He6y0B8rbrto-3D" alt=3D"" width=3D"1" height=
=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bor=
der-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;m=
argin-right:0 !important;margin-left:0 !important;padding-top:0 !important;=
padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !impo=
rtant;"/></body></html>
--51e34dd1dadb087e5996ff58fbfc8bf00cfb0d14116da85225a51dc001ad--
