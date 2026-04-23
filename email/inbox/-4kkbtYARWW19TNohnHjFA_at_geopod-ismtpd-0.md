Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp1589521ejc;
        Sun, 13 Apr 2025 10:31:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPpVPN6QcF+hn4q/5OvSSOp8BE3z2ZwqYfPbaHBf9lGco/28oOHIk2VxVf8tGUNRm97ct
X-Received: by 2002:a05:6a21:1512:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-2017996f700mr12425719637.28.1744565508449;
        Sun, 13 Apr 2025 10:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744565508; cv=none;
        d=google.com; s=arc-20240605;
        b=O0lv2sDajzLgLXNtqQTs+/NPjzfFG8IIF2U2aDnfar7M2eU+dJisd30dZg+axgXdPe
         R9vN0V/pdruFfFgBdgXOkk6nk5jlTTCXYwn4hib8msYMaunf6is0EMlJjlwd+bfaSn2X
         x+L5FF/rxzibipK81k/ALvqvuzq7+nJMfZEwWAL6o3ZBYna9A3mf5ba6gky9OqyAVsv0
         hYatjIqQhAb4gOn6C3Gg0XcpRZ3gDMuYhKZxrdG7x5J6dnZP+KnDmiucWv/657ox6lcd
         CGLYfEoxS0Dmg9AdcZIuc2HSxfXLUkBiEFizr+BoDV9V5reUsEM5Fkj+jC3MwuKj1jHt
         8plA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=Vxv1y0DOsnERx4b4RhD8YoMPENaMOS+YyjA7JyNGOe4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=TnD4WENCtmLnatppfe+Fnx95qvN64oBYQ2ShkPmd9sGlxJB8Ba4KqEJSxnHMncoMjt
         cBfzZgV1iyiAahrhvDDS5b+zv/ROBflCCOR9fESHu9oMgjY4CkFDiWNji9b6gEczWL2t
         3qy3DzuClEjkSpChYRdW0uWhUrbILCr7yninMw86toFd7vC/FfYt/WH/z2OxQOulGrzc
         1SZOi/zDxaNw9VGFftY4PzxbA7r8taeP0AC8L+zzCbMYFClaUXuyPxVUVNob3J7MZ/sk
         hDROaGlp0mlOnxlzOsxJ5tQgwEOfFyL7k+/GIm5vpVJhDQloQ0djGy35rTBCoENME4pO
         xOcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bxZUe7PA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uLdurUFF;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73bd21c63a3si7560658b3a.107.2025.04.13.10.31.47
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 10:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bxZUe7PA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uLdurUFF;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=Vxv1y0DOsnERx4b4RhD8YoMPENaMOS+YyjA7JyNGOe4=;
	b=bxZUe7PABaGqUs0f48xmiYXOw3gjYWfUTvBvM9qWAJlyvFxF8hgmchdHXErkReJ8HTAB
	Moah54WdBDP5tJWlnQ8Rtx805lYn7NXX8p2LGdnrkMNoaMgBHs0i0scCJFUMsZP3ynJudz
	UQ9IzykuivQN1iAZXKiLwqal5hh9yUa5V4e+IIrq9pqKVH3tw6X9B2lHe4/eE8MHPxvkia
	HE485IORs7LUxhPIq0GrLJYKUvhlsxQO0Ej6bNFT/PC7z4c+71sUgyPUvBUgWaihnUUX/F
	GGq7rr6lfO4lJF4lSlmMw066BBeztWL3PVlZqaE965ZHI6Ddsu4e0y2EvA8D8F0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=Vxv1y0DOsnERx4b4RhD8YoMPENaMOS+YyjA7JyNGOe4=;
	b=uLdurUFFybhBtfj/AqZKKpDj7ILdHRe9d6foiyV6J5xrywKzS4NYF5jgGSxwzuXM+XCi
	aHRlTU4d3xZNoo8YqfnAZ8OKEeXux3OcnCmXlKDGt7J//S2feKmUsvQY1NoGIdLmWPuByf
	uSqFKVQyWrJUSIQutM4/TVkrla1awAtCE=
Received: by recvd-6884bf9dd7-pzmnr with SMTP id recvd-6884bf9dd7-pzmnr-1-67FBF501-2E
	2025-04-13 17:31:45.456196685 +0000 UTC m=+415422.252286453
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-0 (SG) with HTTP
	id -4kkbtYARWW19TNohnHjFA
	Sun, 13 Apr 2025 17:31:45.384 +0000 (UTC)
Content-Type: multipart/alternative; boundary=f846d7d6ab6834a113de6e81c800402b0aa1ee24d63c8d20fe17571d4240
Date: Sun, 13 Apr 2025 17:31:45 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <-4kkbtYARWW19TNohnHjFA@geopod-ismtpd-0>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n51IfdER91VXR6GK?=
 =?us-ascii?Q?4pqvcp79wEyv5Bxw6ppw0uK7ERjFncLEVvBwEfk?=
 =?us-ascii?Q?sGnJlN6=2FCTekGxdLPtojS2wirN7AQBdV=2FUi447Q?=
 =?us-ascii?Q?d1wZt0DSlCHYFJXSstpZ702vIOWm6l3eYath4BU?=
 =?us-ascii?Q?8VU7MzSstCTWce8xt2VISWYSfQ2soqmEzkBrBZQ?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: RVw3HArKd5+u

--f846d7d6ab6834a113de6e81c800402b0aa1ee24d63c8d20fe17571d4240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Your Hacker News Digest
1. The Dark Side of the Moomins
This article explores the complex themes within Tove Jansson's Moomin stori=
es, highlighting how they are often misinterpreted as simple tales of domes=
tic life. The author discusses the darker undertones and the existential th=
emes present in the narratives, which reflect Jansson's own experiences and=
 the socio-political context of her time.
Top Comments:
Many readers feel the article overanalyzes the Moomins, arguing that the st=
ories are ultimately about adventure and family.
Some commenters appreciate the depth of the characters and the darker theme=
s, while others emphasize the whimsical nature of the tales.
2. Skywork-OR1: new SOTA 32B thinking model with open weight
This post introduces the Skywork-OR1 model series, which includes powerful =
reasoning models trained using large-scale rule-based reinforcement learnin=
g. The article emphasizes the open-weight nature of the models and their pe=
rformance on various tasks.
Top Comments:
Commenters discuss the significance of the new model's performance compared=
 to previous versions.
There is a debate about the training methods used and the implications for =
future developments in AI.
3. Why Fennel?
This article presents Fennel, a programming language that runs on the Lua r=
untime. It highlights the advantages of Fennel's syntax and its focus on av=
oiding common pitfalls found in Lua.
Top Comments:
Users share their experiences with Fennel, praising its simplicity and effe=
ctiveness.
Some discuss the transition from Lua to Fennel and the benefits of using Fe=
nnel for specific projects.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--f846d7d6ab6834a113de6e81c800402b0aa1ee24d63c8d20fe17571d4240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <title>Your Hacker News Digest</title>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BOwvEQBMXE-2BBhwkYMiNXXjuBcS8nMtZoM1MewMhH6c76gFJUdX-2FA=
sH7up0ZPS9fycsMdS0mrH719PwUD96ky7SBFpyRr0vYHubqIGKvUTqDAFNJcX2oEudhlWWRirkX=
XIXA-3D-3Dm_XO_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDS8jiwZSaZlgW0zd=
ATM3k8fiGjoZZIKzeJbxcovbcX-2BA7x7LcuL7iKtRK70q0XlB-2F9aFtjZOKMdBj-2BbBeQ8v5=
C71qh7SZkRqZ028VPnp-2F8s6xEFNMYsiPhBXASVe6Iceej8UDMmoT8G8z9TvvDUJPQR6pwmcHf=
mZYBwd6JG14A0g-3D-3D">The Dark Side of the Moomins</a></h2>
    <p>This article explores the complex themes within Tove Jansson's Moomi=
n stories, highlighting how they are often misinterpreted as simple tales o=
f domestic life. The author discusses the darker undertones and the existen=
tial themes present in the narratives, which reflect Jansson's own experien=
ces and the socio-political context of her time.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Many readers feel the article overanalyzes the Moomins, arguing=
 that the stories are ultimately about adventure and family.</li>
        <li>Some commenters appreciate the depth of the characters and the =
darker themes, while others emphasize the whimsical nature of the tales.</l=
i>
    </ul>
    <h2>2. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BOysvgYOYCW2FROBqdnGzq6kr7WKclMP9RIzmnRV09okDxWpwXUmhk3r=
cnHXSJmGOkA-3D-3D5Rta_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDS8jiwZSa=
ZlgW0zdATM3k8fiGjoZZIKzeJbxcovbcX-2BKAlHEyfpMS-2B1NZlUbkVNBnYbgX8D9F-2BRmIJ=
1nw-2Be2B7wJnNYKkNjWZN8gwvGjgt5EDeCHPergoOjuJ2bQwNyxKdnobiSN1PvG2XRw1xsddfD=
cjxu5ffZEsx3nVEsS4yFQ-3D-3D">Skywork-OR1: new SOTA 32B thinking model with =
open weight</a></h2>
    <p>This post introduces the Skywork-OR1 model series, which includes po=
werful reasoning models trained using large-scale rule-based reinforcement =
learning. The article emphasizes the open-weight nature of the models and t=
heir performance on various tasks.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Commenters discuss the significance of the new model's performa=
nce compared to previous versions.</li>
        <li>There is a debate about the training methods used and the impli=
cations for future developments in AI.</li>
    </ul>
    <h2>3. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO7HSjkRl6ls4tn1nw3AvHd9nAHRB-2B-2By-2FNSxSlYXQ0DL76NSV_=
zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDS8jiwZSaZlgW0zdATM3k8fiGjoZZIK=
zeJbxcovbcX-2BPrpjerhFhR5r9-2FUd0ihTKGD5ARc6v4ouBdYrkIEBkXGmgLq0l2YzpG2iW4G=
EUE9NE22MQHNLWkzN6ZCCxclHWiqmcCHwa-2BguTN7S-2BDQiitRivcRXsbJ6AmqVOU6waZbzg-=
3D-3D">Why Fennel?</a></h2>
    <p>This article presents Fennel, a programming language that runs on th=
e Lua runtime. It highlights the advantages of Fennel's syntax and its focu=
s on avoiding common pitfalls found in Lua.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Users share their experiences with Fennel, praising its simplic=
ity and effectiveness.</li>
        <li>Some discuss the transition from Lua to Fennel and the benefits=
 of using Fennel for specific projects.</li>
    </ul>
    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswbKMS_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDS8jiwZSaZlgW0zdATM3k=
8fiGjoZZIKzeJbxcovbcX-2BAqIaEhAfVkaZtnl1dU3j62RXolbP1dWh5kwyL7ATmEOJ59HzpaU=
Q4i11ZpnPmIXR8i5E6CT8dQh4QOgKHulCJS760-2BxFOPF-2BkCtRtJlAvZoM4Ev6T0VKscnajT=
A9MF5Lg-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLPYTFLBsb0H4-2B5MB0wIT0tE3Gwl89MYe0fVnNT009P=
IEBzc4JaalJVkY1WnNJNfmr7kvfoecbIp5gCCJsVU9PIAnn65IgFOQ6iDY5DaE76BKAVC5ZQ7Jv=
1CTVop4Aqq-2B7Uex2hJw2J5hM9J2y-2BjKHcjdqs2xarz1sEdMNJvE5j-2FMRI7eDqW08YSpb3=
QIkdQCs-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:=
1px !important;width:1px !important;border-width:0 !important;margin-top:0 =
!important;margin-bottom:0 !important;margin-right:0 !important;margin-left=
:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-=
right:0 !important;padding-left:0 !important;"/></body>
</html>
--f846d7d6ab6834a113de6e81c800402b0aa1ee24d63c8d20fe17571d4240--
