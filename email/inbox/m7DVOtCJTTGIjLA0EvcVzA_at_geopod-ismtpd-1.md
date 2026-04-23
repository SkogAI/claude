Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp596368ejc;
        Fri, 11 Apr 2025 10:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuNLvmDpxAy+3oFTo6ukkSfTIr7WLIY3XEL/R+xHpvDsoLCy8hocwdMjzPnr+njdVz807A
X-Received: by 2002:a05:6808:19a5:b0:3fa:7909:2719 with SMTP id 5614622812f47-40085078292mr2217806b6e.19.1744392726716;
        Fri, 11 Apr 2025 10:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744392726; cv=none;
        d=google.com; s=arc-20240605;
        b=RF5xpXBWH8k5MEyZzM+7zcYZ6yfEXSRf7XhdO4EolXKKiby9nofygP3LBQ6PECXPtG
         oKc0PxVKZuZFZTMOTD6AZLDSYVagDM5encqgkm2IGa2DzmB4tUyWgC79v/WNnayyE7wr
         WTs/5kcK8DBZzXv36RE9mG6/O/iqJAAsUUmpHzZJgcm8l6gQMCVLMElJ0T9Ec5/szsAW
         TFvBBh6LIeTcf5Fax4Cjg2RxhJYn71gwFh5X4Ukb8GfghXgWsIgTXQSGAi6J3WTBwLs0
         C6ZQ43tFMWHgWYmyPQZKmHpdf+03pD8IL7b1WCFmP87hlLyG0hA3bjBHDp4oIP6iUEC3
         UhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=xCmNndSu+NskyR7vi6eOKnda3Xn3Sy8+cg7Sz9/MlKo=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=SlK1mqAehAOhpZlUQGDMZimFgjxF1DFTGk6OjYCGevU2QBixZ8J5n/ysgA8dewWSUU
         loywwtBOPZRXZzRBV+dmITwAj2NcIwl8HOjG0J1zxvd58z6N12ZZysr0UbOg0cqLWlok
         NC2gR0hBks0JfGv2HjWrEcM0cFiIkx1WI88CueBpqH6D1pweG0pZUKYvFrx1fSlow4VU
         NE0Sbd1kXoOR/92SfQsmnMC0ZYN4EJDQxa7rvuNDVNFPf+EtrX4PgcYBGwhCdaz/SrI/
         8gC9+tL8MRPldFsQkDxssqmTIQx7thyHvpYi90hzJggytF7pJ7XxrJg4UgWqe1qQwFGU
         DY6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UOezqyyY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WuJEvpeU;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id 5614622812f47-4007627ef98si3611682b6e.21.2025.04.11.10.32.05
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UOezqyyY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WuJEvpeU;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=xCmNndSu+NskyR7vi6eOKnda3Xn3Sy8+cg7Sz9/MlKo=;
	b=UOezqyyY4af2sg+JRfvcvhp1wC78G8zsnEX8IF5vvTRomEKjA50DqO6xrScfU2bi8ocP
	C2ZDWWe2iDBzgN5BmngrBg7SaAiwTp2W03OCZzu4Ea35V/f/JyilD0grzjUKCDkVfcNu2F
	vZrKX5+h8bGFI3S7tDLZgd22sHD4+66uw7JelHwfXNN5D7eS/d/n5d5Ol046Yde7RTWEHw
	HUZnxRkrAqr8I8LZJyAx3/lxdjnbCIZ5M/BoPjzs2gewkL0L71GAUj6uX7gZGS5Vn7eEXk
	rQeM/JtcjRtLhU0YPfu5nlAfgqzgEj/Tn0cs5I1wiCBCB9AoScGCx6PvABd+b8Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=xCmNndSu+NskyR7vi6eOKnda3Xn3Sy8+cg7Sz9/MlKo=;
	b=WuJEvpeUV8fSDHifeLo8KO/M3aWG7TSxUmYO+PHEaS6xcyNamivkz5q5A48tHJa24kny
	AZyQl7Xv4U37T6JVcVvQYUtgHDIOZevHcRyrpG0SrNljFLt7RDIb5MWQzhPb+77X1+7NSK
	YJQqRjLubPTulTarQ5kB9ZwXP/1Sb0yTY=
Received: by recvd-545d4d4647-bjnsl with SMTP id recvd-545d4d4647-bjnsl-1-67F95214-14
	2025-04-11 17:32:04.10401358 +0000 UTC m=+242643.274592359
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-1 (SG) with HTTP
	id m7DVOtCJTTGIjLA0EvcVzA
	Fri, 11 Apr 2025 17:32:04.069 +0000 (UTC)
Content-Type: multipart/alternative; boundary=bbf8c280d64fa0058c835cb79e2ada84feda01938cf88b8655888e3f020a
Date: Fri, 11 Apr 2025 17:32:04 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <m7DVOtCJTTGIjLA0EvcVzA@geopod-ismtpd-1>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n55g90UGSDA8noNG?=
 =?us-ascii?Q?4SX0Eq8hLQPbXetJDU99q0jwVKo5O65IN6=2FrGCz?=
 =?us-ascii?Q?VpRByNNX0goxnpXEh987tJFNkWNYGytKYKwpD15?=
 =?us-ascii?Q?ooa19tSV6Kqx2PUBt++9DwDVnLE=2FfmDyvsN1+WZ?=
 =?us-ascii?Q?m8Y9eInitoCe++bgqg0nKqAqqRINPatPo1tpm2R?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: q52BATIOAHCQ

--bbf8c280d64fa0058c835cb79e2ada84feda01938cf88b8655888e3f020a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. But what if I want a faster horse?
This article discusses the evolution of tech products like Netflix and Spot=
ify, arguing that they have shifted from user-centric experiences to algori=
thms that prioritize engagement over quality. The author laments the loss o=
f user control and the rise of content that caters to the average user rath=
er than enthusiasts.Top Comments:Many users feel that the platforms are pri=
oritizing ad revenue over user satisfaction.There's a consensus that the al=
gorithms are designed to keep users engaged, often at the cost of quality c=
ontent.Some users express nostalgia for earlier versions of these platforms=
 that offered better experiences.2. Fedora change aims for 99% package repr=
oducibility
This article highlights Fedora's initiative to achieve 99% reproducibility =
in package builds, a significant step towards enhancing security and trust =
in open-source software. The proposal has received positive feedback, focus=
ing on how to implement this change with minimal disruption to developers.T=
op Comments:Many users support the initiative, emphasizing the importance o=
f reproducibility in software security.Some express concerns about the pote=
ntial challenges for package maintainers.Overall sentiment is positive, wit=
h a focus on collaboration to achieve the goal.3. Bilinear interpolation on=
 a quadrilateral using Barycentric coordinates
This technical article presents a new method for bilinear interpolation tha=
t maintains continuity across quadrilaterals in computer graphics. The auth=
or discusses the mathematical foundations and potential applications in 3D =
modeling.Top Comments:Readers appreciate the clarity of the explanation and=
 the practical implications of the method.Some express interest in implemen=
ting the technique in their own projects.There is a general consensus on th=
e importance of such innovations in graphics programming.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--bbf8c280d64fa0058c835cb79e2ada84feda01938cf88b8655888e3f020a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. But what if I want a fas=
ter horse?</h2><p>This article discusses the evolution of tech products lik=
e Netflix and Spotify, arguing that they have shifted from user-centric exp=
eriences to algorithms that prioritize engagement over quality. The author =
laments the loss of user control and the rise of content that caters to the=
 average user rather than enthusiasts.</p><h3>Top Comments:</h3><ul><li>Man=
y users feel that the platforms are prioritizing ad revenue over user satis=
faction.</li><li>There's a consensus that the algorithms are designed to ke=
ep users engaged, often at the cost of quality content.</li><li>Some users =
express nostalgia for earlier versions of these platforms that offered bett=
er experiences.</li></ul><h2>2. Fedora change aims for 99% package reproduc=
ibility</h2><p>This article highlights Fedora's initiative to achieve 99% r=
eproducibility in package builds, a significant step towards enhancing secu=
rity and trust in open-source software. The proposal has received positive =
feedback, focusing on how to implement this change with minimal disruption =
to developers.</p><h3>Top Comments:</h3><ul><li>Many users support the init=
iative, emphasizing the importance of reproducibility in software security.=
</li><li>Some express concerns about the potential challenges for package m=
aintainers.</li><li>Overall sentiment is positive, with a focus on collabor=
ation to achieve the goal.</li></ul><h2>3. Bilinear interpolation on a quad=
rilateral using Barycentric coordinates</h2><p>This technical article prese=
nts a new method for bilinear interpolation that maintains continuity acros=
s quadrilaterals in computer graphics. The author discusses the mathematica=
l foundations and potential applications in 3D modeling.</p><h3>Top Comment=
s:</h3><ul><li>Readers appreciate the clarity of the explanation and the pr=
actical implications of the method.</li><li>Some express interest in implem=
enting the technique in their own projects.</li><li>There is a general cons=
ensus on the importance of such innovations in graphics programming.</li></=
ul><footer><p>This email has been sent by Toolhouse. You can change your de=
livery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?up=
n=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2Bcm=
QdjMswHm-N_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBnY15gDd3wsEcjngOVnD=
FmREh7kQra9KozjS8k2pFUy9ZAQP5oKZlVQxx9gJTcRj8NuR7Zm8TZw6dajWT1HybZdDTeGe-2B=
fli1Aspjl1YDHKbLIjoo2GMHZikS6ToLLjBXF-2B4NEM9XkuZDUyfLnz49xay8zRptGsr6Jj-2B=
JQIMlMBA-3D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhousea=
i.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GLbv2qK=
TzXS2U7r-2F3mI7OR4zIxBj4H7AzEQ-2FY4np14L4SaNBSEO6OwhvwItqEqJtVUWS-2FM1K-2Bx=
ardTwQX8Ba9TfmvKNCKvJGiICr-2B8ehML4Xpl-2BUAEjWC03VCN68qmENON009YThcxFMLgK-2=
Fo7n-2FUVfTX1e-2F5LtMUUSa7PLnlRjExG-2F9pznWaf0UcG4V5dBxxc-3D" alt=3D"" widt=
h=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px =
!important;border-width:0 !important;margin-top:0 !important;margin-bottom:=
0 !important;margin-right:0 !important;margin-left:0 !important;padding-top=
:0 !important;padding-bottom:0 !important;padding-right:0 !important;paddin=
g-left:0 !important;"/></body></html>
--bbf8c280d64fa0058c835cb79e2ada84feda01938cf88b8655888e3f020a--
