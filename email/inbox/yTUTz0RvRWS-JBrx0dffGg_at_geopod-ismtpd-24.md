Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:cf8d:b0:abc:2b0f:5fd9 with SMTP id ux13csp1042596ejc;
        Wed, 5 Mar 2025 09:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDRG1BTdLWbgMlVqE594YmADu3GCxs2dKlGsxm3jSQCOfPjYGLsP6Aal4KjJpMz+ZasF3i
X-Received: by 2002:a05:6122:4d19:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-523d4f005f9mr272406e0c.0.1741195887640;
        Wed, 05 Mar 2025 09:31:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741195887; cv=none;
        d=google.com; s=arc-20240605;
        b=VUvODBgNmQCJT+VravkmfqhCDArIFcCLvFd8IwqE8kO90TgnGuG02Vlm0V0MT/NYFJ
         ZbBJ150FV9DWuHcOAeICQjnSCyIZr36KCBMv5HYbeco7mcm/LWwSoxm9vftRJsJWYs1O
         hwFI062zpaByvelndxbzRcmYCkJmX7lLsD5TFoaDkaSzGeXZijoX/MVeG5TpIYDEoqir
         ts0vIESk5EpwbaSG0bizQ2cazzoKq+1suPaQ9rhQ/YP+QGSwHzzsgMEuMGQpMzReLpMW
         /KQ0FqSLzqn2hjJUfxcE6fwgoiylTeyc2W8L/3gHuDo6LB1arWYlrZHOBVYYGCRC8XW4
         FaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=sNMONS2KkOtKG/NnTZLFK/X6UHthfILp0LaOqVyBIAk=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=WJOGmYnuIrhFt6rIYYIZmIoJKEX2thyuMo7lQ6PIR+Ua3TbUVou1nYWD7eBKF2dcll
         1Z+SkSHHJbYGSu2cm2GADrDniDmgIq0ZJz3VzNaVLymFYW7G2hN/A8mfWplxJyPckTa8
         QURg58IYFcG4oZo6nGoG1zCMIKYt8bc1RV3jT+WCyPmZdEiajTlzbpNoarNeZoIhRrxT
         ipIUyyd58RBAAyntNUKku8pVC/hpQoX+274kcHvahKYsoRNq0vmf0uKzzZUEElgYhsE1
         Jf5hnKYtTjQlZbzfBaBWbgma2CeDnG6upm6ENCjqes4c1V5rzbnEqjGttjpVEnBnjHN4
         vvug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=R9yEoCYW;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=MMZSMg+N;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 71dfb90a1353d-523a8566d0fsi1060557e0c.3.2025.03.05.09.31.27
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:31:27 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=R9yEoCYW;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=MMZSMg+N;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=sNMONS2KkOtKG/NnTZLFK/X6UHthfILp0LaOqVyBIAk=;
	b=R9yEoCYWXx6LV+/QULQxu8F/++uciUQZWMWBCoMuxOlO9wZFWGSFDloCljKLWJuIHt5I
	xt9G/4ZcKlyj+NZkDjJ9Jnco7Wlx49yplVuOFvhF5Dwu4/KkxKgfw8PforepY4YZqoLgHT
	+LJ75I3zc7NGfqe0ITnSjBYyZZGy04mPCjWfNIYydaGFmXIv/CHKmX5OMXMxJ2aPRJsaAS
	Nuz1hwg2hsNK/P4jL1ot+mpik2dKgFu2ifAUQyGeayA39ToQCyrndH64uLeZF6Hyag59Cu
	fJlJH4WzXEH76+mF98lVxCevKS0sj47KbrZp4dzJxh2OmF/4KQ7720/DJgtXl12w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=sNMONS2KkOtKG/NnTZLFK/X6UHthfILp0LaOqVyBIAk=;
	b=MMZSMg+N8TqPMfyY1aJNP/HrQZzP/zE9ZW+HkEAdO7NVLpaUSW+E7luXIPqWUSLbbt2W
	6BW5KLBoEtYAyNXJ0RT16TCGTTlPLDOd1LkdI0xyAWTwHbx/TEekEBdMFwSF4ddAnWd41/
	C/JwffuM6bWQP1papURkGmKB03A6hb8D4=
Received: by recvd-69cbc48b94-q4tz7 with SMTP id recvd-69cbc48b94-q4tz7-1-67C88A6F-5
	2025-03-05 17:31:27.056515069 +0000 UTC m=+9576519.055231543
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-24 (SG) with HTTP
	id yTUTz0RvRWS-JBrx0dffGg
	Wed, 05 Mar 2025 17:31:27.039 +0000 (UTC)
Content-Type: multipart/alternative; boundary=d29f7dd732ec9a4774d3e554e127bb78b9bbd72a5de0a1fdb56bf0d3f0b9
Date: Wed, 05 Mar 2025 17:31:27 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <yTUTz0RvRWS-JBrx0dffGg@geopod-ismtpd-24>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4Y3GJCt3dt5gaDT?=
 =?us-ascii?Q?GdN8hPAok=2FF4QVntNPtlv8HD03UGsCQcIR1Jcoi?=
 =?us-ascii?Q?JE6iHn0zwwZP6sGRPUWyMpQMWKtajnxsYBcdumN?=
 =?us-ascii?Q?t3zmm+82oX8Uqew7EwN247ltRfIzmVuQwahBXQf?=
 =?us-ascii?Q?JNZiAgqmv4CcpB7TQF0N4dzrQcojJuiW31=2Fm3n=2F?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: suEMpS2WYf+V

--d29f7dd732ec9a4774d3e554e127bb78b9bbd72a5de0a1fdb56bf0d3f0b9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Frida 14.1 Released
This article discusses the release of Frida 14.1, which improves the Window=
s backend to support in-process injection, allowing it to dodge common AV h=
euristics and speed things up.Top Comments:
1. User haberman mentioned a recent move from V8 to QuickJS and back, indic=
ating ongoing changes in the backend.2. Why Discord is switching from Go to=
 Rust
This article explains Discord's decision to reimplement its backend in Rust=
, highlighting performance improvements.Top Comments:
1. Users discussed the benefits of Rust over Go, emphasizing safety and per=
formance.3. Cosmos+ OpenSSD 2017 Tutorial.pdf
This article provides a tutorial on the Cosmos OpenSSD project, detailing h=
ardware and software distribution.Top Comments:
1. User fulafel noted the evolution of the hardware and its applications in=
 research.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces here.
--d29f7dd732ec9a4774d3e554e127bb78b9bbd72a5de0a1fdb56bf0d3f0b9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Frida 14.1 Released</h2>=
<p>This article discusses the release of Frida 14.1, which improves the Win=
dows backend to support in-process injection, allowing it to dodge common A=
V heuristics and speed things up.</p><h3>Top Comments:</h3><p>1. User <a hr=
ef=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5t=
p-2BOy85ZAQig46O0Rb-2BEW4GD5nRrC2ugCYZT5AVGuWUuY7KSKSGTSPj8tbaKE7ZfIwnyw-3D=
-3D0b1K_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCcN-2BqBGxybpW1b-2F-2F6=
P6v4OKeN-2B2wv8lu9XkYOt4M4e-2B3oNa129yt6-2FwaAyOGRyfnycgD-2BN2ubVTs4c08AMP8=
ANmjOkql7pMozTHINmZtEWbVJHSFKNAUbKEnC7kSOtBqyg-2Fg0MKLmsxNFr92GAs23JqvVJsO0=
Eu34azF51ve-2FOdw-3D-3D'>haberman</a> mentioned a recent move from V8 to Qu=
ickJS and back, indicating ongoing changes in the backend.</p><h2>2. Why Di=
scord is switching from Go to Rust</h2><p>This article explains Discord's d=
ecision to reimplement its backend in Rust, highlighting performance improv=
ements.</p><h3>Top Comments:</h3><p>1. Users discussed the benefits of Rust=
 over Go, emphasizing safety and performance.</p><h2>3. Cosmos+ OpenSSD 201=
7 Tutorial.pdf</h2><p>This article provides a tutorial on the Cosmos OpenSS=
D project, detailing hardware and software distribution.</p><h3>Top Comment=
s:</h3><p>1. User <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3D=
u001.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb-2BEW4GD5n6tSbep0hRQpk1i86ga8LB0z=
lnGe15mjMwsqnZSPXC8Q-3D-3D0eLa_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12Sm=
CcN-2BqBGxybpW1b-2F-2F6P6v4OKeN-2B2wv8lu9XkYOt4M4e-2B1yks0GeGbHTS-2B6YrNk0I=
5MLy7sfLrLoOMgiC6AxryEETJcK8l1kvHsT-2FAtoLd6BLY-2B-2BiukDwUfROCo1Vp8IVGyw-2=
FW474hhELxtWkFARXXuD0NmGlC6LKHqKeW2i12De-2Fw-3D-3D'>fulafel</a> noted the e=
volution of the hardware and its applications in research.</p><footer><p>Th=
is email has been sent by Toolhouse. You can change your delivery preferenc=
es <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9C=
mwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswj6rq_zKD9qStm=
l-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCcN-2BqBGxybpW1b-2F-2F6P6v4OKeN-2B2wv8l=
u9XkYOt4M4e-2Bwsf1MTgZwJh-2F16V7cOsAbOyaXs4EYn02v8QqFFvId6p-2BbB-2B6tNBpq-2=
FMl0ctrtybApwWN6umyteSKoqL2Lu7cg8pccba8DLGQlhvYT0-2ByIb3wUArXtkU8J79ptH0SFd=
2pA-3D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com=
/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GIj5RW-2BTqy=
5j4AzVCq-2FYrdPq41BlWSiOtCy0fkVpR023IycGS9MZRzpuRfRBw0pzB1aFPy9qWLJ-2BQXpAZ=
lFHQFIcFIdpD0Gj7zHLJrjUJM4jgnMiu7lgIPYZMXxQ7S2XoNt2E6DogGzEANLJ-2FlR6OFbcMx=
QQfwM-2FRQm36jmw3XB5okJkwQ46lB8rpOIMufUWS4-3D" alt=3D"" width=3D"1" height=
=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bor=
der-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;m=
argin-right:0 !important;margin-left:0 !important;padding-top:0 !important;=
padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !impo=
rtant;"/></body></html>
--d29f7dd732ec9a4774d3e554e127bb78b9bbd72a5de0a1fdb56bf0d3f0b9--
