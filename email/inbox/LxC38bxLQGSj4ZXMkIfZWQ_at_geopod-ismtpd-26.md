Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp656551ejc;
        Sat, 5 Apr 2025 10:31:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGGfSPhTtWRgqebJ3xgmqNqNofYYlfsVE3DrokHNYAMRcpD7EBxGOSeF3QeBgQ3VFP09sT
X-Received: by 2002:a05:6602:36cd:b0:85d:badb:a42e with SMTP id ca18e2360f4ac-8611b5450a0mr961392739f.14.1743874267391;
        Sat, 05 Apr 2025 10:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743874267; cv=none;
        d=google.com; s=arc-20240605;
        b=WjX8aG8qeWdnAzoyc+UNHlVMXgAy3k4XvDpVN4XvnqQSfcdd8+cmA7pfcJrY48bosG
         vY10YliR2rlqIFDIGOFklRb0MTyJYsUJRxKbBXUbcmvXa9CWzfwYod1ZFR8P76Gmsj7r
         grIk5TDKaOcHYZxTUMyJuvbb94/N0nKnvA7bGklg+pMt+vPnaR7rFA9gYhuGpQJ25bAa
         FY8bZhE9Fdx08VehTHTw3jTUvpDGwOqxAypmD1F5JH+PTbKRxkl60BAIPoPX6pAxRYwl
         yv8M5K0jHwdnJ2SrkouYMNsikbvDtX+Nw5rFCSxDZhE22PAZHe5SFX8on21oKLD+XtuS
         qR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=Qxl+87kLJTBGAj1smULGMgJc63IfcxYrS2acsz7YIbQ=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=GQIxWX8mKz39V6AjGTFWQHm/Ta1V16ToagG9Z/+XrpfUnHs4/PbKAOYwbSaFN+p+DC
         kp2U7fcyMJMDSHiOJ7YZojllpGylbwtisqtUfUOQupO/11/FIy8FlKgQYedsvtUS33yX
         eKqnbN+DhAXIHL7y8Sdcpjz6uwPRqb1sjR3woury69y5b9fIQ84+LVrqchPqtJyVnutZ
         AmzWwPdEQHPj1yC0fn96ShRlToPc2m2Da6s1bcfh7ojnM60lnNYB4YC377pbL/FXle8g
         tEayWo/DlxqSbHXjmmBXSduM1RelqZ5d1vS1Dp6pd3kHFWwzMfEBzCyzbMAvNbe8TmWT
         b4Pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=MowJiXxN;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Qw3VBiR8;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id ca18e2360f4ac-8611127a12asi575961439f.8.2025.04.05.10.31.07
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=MowJiXxN;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Qw3VBiR8;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=Qxl+87kLJTBGAj1smULGMgJc63IfcxYrS2acsz7YIbQ=;
	b=MowJiXxNIv5TvAzutfYcTdYv4HtCBnV/Lg/LZB6bXwK59QNt7cZxrgUjl3EJKgjdFaa3
	krZ1p9WFF+N/GcJiycGHOLcArkZti/ZgrOUoQVypcRybqcApGKMZgAdWX9gy4mcoIlOsMn
	BmT3LJHPHuJZ6MoTO/MmEPX1k4U7D7dt8wmKgr8XmVZtfK+w2lXHhsg/vKkOBoP9htGqj0
	E9jnkPo0AQ+x7LUoehWLHKetRE+VCU++XZpbxpCd5ra7RI0Z1xOemEL7GrTrK4BPQ2GMx2
	F0CW1nkbn23mkab98cGt9p0TBOZ+P08qPAM7XlhmE26zVeV3sZOKhIB/h3JUmYdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=Qxl+87kLJTBGAj1smULGMgJc63IfcxYrS2acsz7YIbQ=;
	b=Qw3VBiR80rpECpHqVjghHQ+SdmnVCrsPrCSCSFNsv6jvwN6HHlSs8Di81SNVFmqVJbYo
	4g5oyAPNHjEpMlNj9aRv8OUhPg0hVl3EB8R6meN6WeBvSlxy4L7+EJRxYCKK9CSJHJ/WGY
	fzrRsId4eBJt2t82uLYe6WdEDjcVVP47A=
Received: by recvd-66b84f6d7b-m6747 with SMTP id recvd-66b84f6d7b-m6747-1-67F168DA-3C
	2025-04-05 17:31:06.77201627 +0000 UTC m=+444001.920980197
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-26 (SG) with HTTP
	id LxC38bxLQGSj4ZXMkIfZWQ
	Sat, 05 Apr 2025 17:31:06.758 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2c22f73487dd5ef924a819e08b30e3dc6a2adfe415d1c965ebaf0500aac8
Date: Sat, 05 Apr 2025 17:31:06 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <LxC38bxLQGSj4ZXMkIfZWQ@geopod-ismtpd-26>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6UfgBi50Xug3SKu?=
 =?us-ascii?Q?lc=2Fva0oIADZ9w0rnuZpYGctul1VuSRj+Fqi6znO?=
 =?us-ascii?Q?sx8J7f1hUwm4fGOIzOeBpmCmySPCr6ow5Sp1tXo?=
 =?us-ascii?Q?8QlxBkwyyOPI1YJgWlprwSRxuMh2Bw3=2F7G2GHIO?=
 =?us-ascii?Q?cInKbHiD7iG9CiZB9HwPbypaN6c1qJ7nCqbF3Gl?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: iCg/ne+NaPbz

--2c22f73487dd5ef924a819e08b30e3dc6a2adfe415d1c965ebaf0500aac8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. A Vision for WebAssembly Support in Swift
This article discusses a proposal for improving WebAssembly support in Swif=
t. While the idea is intriguing, many commenters express concerns about the=
 current state of Swift tools and the potential challenges of expanding int=
o WebAssembly without compromising existing functionalities.Top Comments:So=
me users feel that the current Swift tools are not robust enough for such a=
n expansion.Others are hopeful that first-class WebAssembly support could e=
nhance Swift's usability beyond Apple platforms.Concerns about Apple's cont=
rol over Swift's future were also raised.2. Show HN: I built a word game. M=
y mom thinks it's great. What do you think?
This article introduces a new word game that has received positive feedback=
 from the author's family. However, some commenters point out that the game=
's reliance on US-centric sports team names may limit its appeal to an inte=
rnational audience.Top Comments:Players appreciate the concept but suggest =
making it more globally friendly.Feedback includes suggestions for improvin=
g the user interface and gameplay mechanics.Some users have enjoyed similar=
 games and recommend exploring broader themes.3. Loader's Number
This article explains Loader's number, a concept from a C program that gene=
rates extremely large numbers. The discussion includes comparisons to other=
 large numbers and the challenges of representing such vast quantities.Top =
Comments:Commenters discuss the implications of defining a loop that output=
s a number larger than Graham's number.There is curiosity about how to writ=
e a halt condition for such a loop.Some find the challenge of execution ter=
mination particularly interesting.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--2c22f73487dd5ef924a819e08b30e3dc6a2adfe415d1c965ebaf0500aac8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. A Vision for WebAssembly=
 Support in Swift</h2><p>This article discusses a proposal for improving We=
bAssembly support in Swift. While the idea is intriguing, many commenters e=
xpress concerns about the current state of Swift tools and the potential ch=
allenges of expanding into WebAssembly without compromising existing functi=
onalities.</p><h3>Top Comments:</h3><ul><li>Some users feel that the curren=
t Swift tools are not robust enough for such an expansion.</li><li>Others a=
re hopeful that first-class WebAssembly support could enhance Swift's usabi=
lity beyond Apple platforms.</li><li>Concerns about Apple's control over Sw=
ift's future were also raised.</li></ul><h2>2. Show HN: I built a word game=
. My mom thinks it's great. What do you think?</h2><p>This article introduc=
es a new word game that has received positive feedback from the author's fa=
mily. However, some commenters point out that the game's reliance on US-cen=
tric sports team names may limit its appeal to an international audience.</=
p><h3>Top Comments:</h3><ul><li>Players appreciate the concept but suggest =
making it more globally friendly.</li><li>Feedback includes suggestions for=
 improving the user interface and gameplay mechanics.</li><li>Some users ha=
ve enjoyed similar games and recommend exploring broader themes.</li></ul><=
h2>3. Loader's Number</h2><p>This article explains Loader's number, a conce=
pt from a C program that generates extremely large numbers. The discussion =
includes comparisons to other large numbers and the challenges of represent=
ing such vast quantities.</p><h3>Top Comments:</h3><ul><li>Commenters discu=
ss the implications of defining a loop that outputs a number larger than Gr=
aham's number.</li><li>There is curiosity about how to write a halt conditi=
on for such a loop.</li><li>Some find the challenge of execution terminatio=
n particularly interesting.</li></ul><footer><p>This email has been sent by=
 Toolhouse. You can change your delivery preferences at <a href=3D'http://u=
rl1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq=
16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMsw5hmi_zKD9qStml-2FkjU46ulTqeWVsrM306=
1nr98hteMD12SmAl0HdGGZbboXuY3vFwIBGhVHnTKS25uD5Tucah3DgZ-2F08oMSzyGDS-2ForP=
PTjWyn4VbruHcLmnfrODWwgTzdxrZ8Zr6LjWG8AibsHbmV7Hl-2BhCYgW7fMfTYIoGXALgX0aJF=
DVgREvTTrJR48G0oamYgLVXwKJPPzlj-2FaAE-2FqUS-2Ftw-3D-3D'>here</a>.</p></foot=
er><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgx=
xDtaqhc9sx2P513JhjX8oSKm62DliywF0GJ7JlCywDmk4pe6n-2BkBf6lIvwZbxomLMO-2BJTD7=
MAIqypi-2FpHWbXt1wjC5-2FQlKwz2DFDwGFrzzpO5nDPQYCuETmuu9wKFEmZ0eWkTIn4tkwiew=
n1eZw7edpzp38b7O9jA9-2Fx76i2-2Bpiym2OBZMU9XgCd-2FN9btlGhS-2FwxTu09gLPS-2Fsp=
bHWFPFjhWXPQz1PAg-2BJM-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" s=
tyle=3D"height:1px !important;width:1px !important;border-width:0 !importan=
t;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !import=
ant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !imp=
ortant;padding-right:0 !important;padding-left:0 !important;"/></body></htm=
l>
--2c22f73487dd5ef924a819e08b30e3dc6a2adfe415d1c965ebaf0500aac8--
