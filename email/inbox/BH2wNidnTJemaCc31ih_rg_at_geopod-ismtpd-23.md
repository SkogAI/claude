Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:6a12:b0:ac2:b370:d0a6 with SMTP id rf18csp828840ejc;
        Tue, 11 Mar 2025 10:30:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu6T5Z5Qn2bdrj/zimkVDF7lfV2zhRyI/6hfYK/r2+iyAmMsyBjPHDfjcyrgwqHhntoU7M
X-Received: by 2002:a05:620a:44c9:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c55ef07f42mr681084685a.15.1741714251218;
        Tue, 11 Mar 2025 10:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741714251; cv=none;
        d=google.com; s=arc-20240605;
        b=O9G62wQWgIOw9FvqRxOP2YM0ZaBJYQr9f0UyPYVWaDswYkYTU06YGRYufWLCKGNl9f
         cg/sopRiX0gqTlBzvXEIT1AbwxxTTNXwJBctKlTaoG5LKqt71mYgBknpENX/rd8yXSWb
         Z3V+aH0HnS2pJIjECEOncEGk6MrivBcqkjkAKthyGKb3bNqE2DuFXBxI372ngVsJzcCk
         EXC6p8xT2tWw1OHBTUmPLVuceVSUxjHiBt/NExXQysI1drOuhjQKWKax0jCozHFEU3bD
         ODbE6AQW1J8T+1/lPVKVAMobu/D+WG1tPLcoy0r01+qVgGaK6N3r7CBz0Ezzk1umPMWd
         gxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=CO3r1RQ6rOtSWhHVJ2bgj2Ado6LLLujieIINulGbPG8=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=BOZColP6fvFK322EvKColpMOxLY1VRRmeTX+RcbFV/lShIkRVth1ZsXk9WrpQf7GOx
         zQT/4RwaLnl2wjhx8J64ORsD2PM6jvHuTqGRYZPlWjYuJb9dZ0h7+QJ+mBIkTZP/QGA5
         +i+NRnqIDP9eP7jpA99R8GZNFZCXWSdKene2EOwAeDRUtIXs8hLeM0aI+t/zECsHq/c7
         4wp8HtB3qJhyD6Yw0zLEAMMEcVQtCsj+RX+QgUmpkEJYOWKmLuTD1lG6T4OSUpTJ9HGr
         W1dpaoAibPPlpf5w4jCSSyzzBe7/17hO0igk4sf2XEQPYu0yZuGpZZ1Ku2rPdLHdGxx9
         dPZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ozdCFdmI;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=K9Zts5xp;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id af79cd13be357-7c542dfd1c2si683348385a.526.2025.03.11.10.30.50
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ozdCFdmI;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=K9Zts5xp;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=CO3r1RQ6rOtSWhHVJ2bgj2Ado6LLLujieIINulGbPG8=;
	b=ozdCFdmIC+coUCgdzhE5EpndbmITPwpPp1dlaPxpUfPJbBX9T+lksEytlVCWye2pjzHX
	ewkm3gnGA5sXgKiNlQZAvFKqrVIOkf93pBJrXloqRxPjy0duw41tQFJ0pWaeDyb2pVw2uK
	GGRFb5tLi0BteeUzPcVeIJl2p4tyFkSEj4W2f8z4A3y3KROl4xIWS4YdHaI5w6lhLnmM4D
	00wmxeBXp9dj56BBRJXaAdW8fZNhQNrtOFix6tu5+PY1ZZ5Jr4qCzUYtrQoYVovi+yd/fw
	hb4utZWnSdus90hFuvPh7eqidLk5EM2IBLXn+7RUo1R2H1wd0qn4x+ulL232FxWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=CO3r1RQ6rOtSWhHVJ2bgj2Ado6LLLujieIINulGbPG8=;
	b=K9Zts5xp1Iki6yuWbSNtWmofXwA5OrbMrvuBW9gdJIyZRm7NVcoSuDPIjOJf3U8D9xwt
	EEihVhH47UxPiA5ASriRxldCd9yYDUVO59rtv3e21qAx6p30a1lkt0RRNozlk/orWL+PW9
	w8Vef2RXfC02YIMo94QrzDylXKN6n3qIg=
Received: by recvd-canary-66874876c5-ccld2 with SMTP id recvd-canary-66874876c5-ccld2-1-67D0734A-1B
	2025-03-11 17:30:50.692179245 +0000 UTC m=+10102977.258354020
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-23 (SG) with HTTP
	id BH2wNidnTJemaCc31ih_rg
	Tue, 11 Mar 2025 17:30:50.668 +0000 (UTC)
Content-Type: multipart/alternative; boundary=a1031be4598262507b67e74d486782a42fc8284ca08b1f5c67cc779ca4da
Date: Tue, 11 Mar 2025 17:30:50 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <BH2wNidnTJemaCc31ih_rg@geopod-ismtpd-23>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n68VdyWZ+wyrM9lK?=
 =?us-ascii?Q?32RwIg4chPMNkN8IjblqrxoJM6e3uh6KrNIjW7w?=
 =?us-ascii?Q?b9UoOZ5k6sS5BGnJ1VEdcZ9esFTjd4rwxU7u35u?=
 =?us-ascii?Q?CeTekPL5SZJ4fJLFcDMjyzHYvSyYeek3Iqn41l4?=
 =?us-ascii?Q?n3cllruWnuokv1oB9VQle7OTqtkPWIOhobczlb6?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: k0dBgGbAVsLy

--a1031be4598262507b67e74d486782a42fc8284ca08b1f5c67cc779ca4da
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Flow Hive raises $5M on Indiegogo
This article discusses how Flow Hive, a beekeeping product, successfully ra=
ised $5 million on Indiegogo. The comments reflect a mix of excitement abou=
t the innovation and skepticism regarding crowdfunding.Top Comments:Many us=
ers expressed enthusiasm for the product's potential.Some raised concerns a=
bout the sustainability of crowdfunding for niche products.2. Cutting-edge =
hack gives super user status by exploiting DRAM weakness
This article from Ars Technica details a new hacking technique that exploit=
s a weakness in DRAM to grant superuser privileges. The comments highlight =
the implications for security and the tech community's response.Top Comment=
s:Users debated the ethical implications of such hacks.There were discussio=
ns on how to mitigate these vulnerabilities.3. Silicon Valley Bank is the s=
econd-largest US bank failure in history
This article covers the failure of Silicon Valley Bank and its potential im=
pact on the economy. The comments reflect a divided sentiment on whether go=
vernment intervention is necessary.Top Comments:Some users argued against b=
ailouts, advocating for market accountability.Others expressed concern abou=
t the economic fallout for the middle and lower classes.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at this link.
--a1031be4598262507b67e74d486782a42fc8284ca08b1f5c67cc779ca4da
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. <a href=3D"http://url122=
8.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb=
-2BEW4GD5lkWA3-2FAGcoErqAlvL-2BBMiab9avoChLzoRTytyuuYjQsA-3D-3D9PBA_zKD9qSt=
ml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBbRMn33p4C-2FGTcsq8tY0400-2BtmZOAZP7eY=
eqEDtsmXK03W6d6WKgJN55nkoLrGUB-2FMHgEvz8rhDLZwCnjuYBXrocJlOpPgbgNIKsjsByKJE=
Ll31M-2BFGGwkvoz32B2S8QQp9LsZxk3HPrkLuLWSX9oLJsoAGpyMYIdr2wYy0qfSlM4OBGxADG=
v6eL4HvQUdF00-3D">Flow Hive raises $5M on Indiegogo</a></h2><p>This article=
 discusses how Flow Hive, a beekeeping product, successfully raised $5 mill=
ion on Indiegogo. The comments reflect a mix of excitement about the innova=
tion and skepticism regarding crowdfunding.</p><h3>Top Comments:</h3><ul><l=
i>Many users expressed enthusiasm for the product's potential.</li><li>Some=
 raised concerns about the sustainability of crowdfunding for niche product=
s.</li></ul><h2>2. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb-2BEW4GD5lkWA3-2FAGcoErqAlvL-2=
BBMiaTSyRQ5EeTfMSQ4QLpTnbIQ-3D-3D01-q_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98ht=
eMD12SmBbRMn33p4C-2FGTcsq8tY0400-2BtmZOAZP7eYeqEDtsmXKy-2BvoxspwvaKbUaZt33u=
RwKpLxnDjQtmdGq6BSSmop45CSBmbidz0-2By8s9J3pK6TEBJh8EAI9FvyUis-2FokN7fGUmdKd=
gVfOc1gKLRTbVmEnB7WFMsr8rfnVXstGckCNiw4xAZ0Z1vZcezHSC7e-2FfPuc-3D">Cutting-=
edge hack gives super user status by exploiting DRAM weakness</a></h2><p>Th=
is article from Ars Technica details a new hacking technique that exploits =
a weakness in DRAM to grant superuser privileges. The comments highlight th=
e implications for security and the tech community's response.</p><h3>Top C=
omments:</h3><ul><li>Users debated the ethical implications of such hacks.<=
/li><li>There were discussions on how to mitigate these vulnerabilities.</l=
i></ul><h2>3. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001=
.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb-2BEW4GD5muE7-2FNUQ9zPGX7n9bn66LmDm5x=
bsW9spzhYDMxox807w-3D-3D68CX_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBb=
RMn33p4C-2FGTcsq8tY0400-2BtmZOAZP7eYeqEDtsmXK8HVHKqSu1538dvvnK-2BAT15k-2Fef=
kkc2Pz8o0324OhUF-2B5no86MnFYG05eveKX6vXOyVwxUgZBNMJpXuzKD7kpDrqjj8GVgn2IDu3=
W5rUJJfBhaOCpmDBODaNxP8fcuslQ9HHN7KJx-2FLDOMPHxoMDIkE-3D">Silicon Valley Ba=
nk is the second-largest US bank failure in history</a></h2><p>This article=
 covers the failure of Silicon Valley Bank and its potential impact on the =
economy. The comments reflect a divided sentiment on whether government int=
ervention is necessary.</p><h3>Top Comments:</h3><ul><li>Some users argued =
against bailouts, advocating for market accountability.</li><li>Others expr=
essed concern about the economic fallout for the middle and lower classes.<=
/li></ul><footer><p>This email has been sent by Toolhouse. You can change y=
our delivery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/cl=
ick?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kM=
X-2BcmQdjMswQlHl_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBbRMn33p4C-2FG=
Tcsq8tY0400-2BtmZOAZP7eYeqEDtsmXK6WoGIxxUzz6Oo2ywoEHAazBMYdfBhiLB9OOGYgtxnb=
GgZNMuKtzj-2F0KYwsbV4cNx71Y1lcyuYdCh-2Bz-2FDB94Urk3ixTDH-2FYDVxbt18X6ALDxnr=
5X9qDZSsirAnIMMB7nc9lGUXcxyhpbvvPc0GLgWa8-3D">this link</a>.</p></footer><i=
mg src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaq=
hc9sx2P513JhjX8oSKm62DliywF0GLTP3zODtlv3kUW7KysC0WS55ySNnrFUw8uPeLI0GrcFmgp=
Zn0BByDeJMmEqQsxuRH7EI2i28DnF3-2BQ5Y5szZcinlW2ZOdy17LK8RGtENAK1uxxhC55AXoTe=
RSqLKLdWmTfglPMTxL6fI7J1oBwlnaOH6yijagMHZGkI7p21Pap3HF-2B267Lk2rws5VszJvKl7=
0-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !i=
mportant;width:1px !important;border-width:0 !important;margin-top:0 !impor=
tant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !im=
portant;padding-top:0 !important;padding-bottom:0 !important;padding-right:=
0 !important;padding-left:0 !important;"/></body></html>
--a1031be4598262507b67e74d486782a42fc8284ca08b1f5c67cc779ca4da--
