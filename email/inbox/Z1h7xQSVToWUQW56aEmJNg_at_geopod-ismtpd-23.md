Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:728c:b0:ab7:3ba4:7d71 with SMTP id dt12csp1018592ejc;
        Wed, 5 Feb 2025 09:31:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoNlOrhW7mQIZwfurS3Mo+XKhz8eik3HnUwlZSu9G0+cqejWNGN4eFKoYJOeakuuYMYsXK
X-Received: by 2002:a05:690c:7082:b0:6f9:3dd2:793f with SMTP id 00721157ae682-6f989f65932mr31197277b3.28.1738776694208;
        Wed, 05 Feb 2025 09:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738776694; cv=none;
        d=google.com; s=arc-20240605;
        b=M6m6FvcjGmR8YKbl7MOGhJgf1q2Tonmi3HxtEtY61Bkq5o5u5VFoka+3Con5CDuZG0
         Y2C+PL/KQGN5PTPQN5uUnh0zJg+ZR8vnsx+R1hC+7NQh0o6Pa5IC4+65SQ+hrKJtcWSI
         /UOVyG8woV0V7Si+pxC2Q7qgqmuPygh/OaynbbhJptX83FYk8Gd7UaUKnesOZhOO4PBr
         OlyAO4+6hTP4t2dOQ7UXyYQR/Zc0n7fYLSZEDIlRcvvWeaU39opwbof/3DZHdgYx8fAu
         lrEDc+loOLNRIZlgkkFq9NHWZN7Omk2AQUbDMn6iqAGrNbhy7AjWhnWqWlea00kux/UP
         Koug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=/rsMatNtS7MWUoa5o6OxogPlASt0epZ2LVvr4hEd/k0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=W1TU4xYEDqsw0Ih/lJXp+2fDgynyYJ0hYO71F3Cz8TSbs25bEKDTcvYvnH7Pc5xR4C
         gqGj2Jbc4dZvbJP9JsVkxB5MOxynLe2gsYTkoy2dQY2ROZuhVe1Su62iEJTKa1zzuUV8
         wN3V2X9BuxYW54DIhDucDwE/gL9EKnPgYAPV0amqKmEtOQ1XeWmFsMAm0V1RXVLrnWN1
         UkuZAS1C+z5mcSCR6MEHbVD1gueSx7aG2m30zOZSX1dub3XmKLBGZUFqZwmOJHYXdTHB
         2a45M8cbn85X2QlLge0GVQ31Ru8rV3Xvq/bGNTIUNwKSOPDbpslU7eGI5fue//6d8O3t
         NO8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=MNejY1CQ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=rfGVoXuA;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhst.outbound-mail.sendgrid.net (s.wfbtzhst.outbound-mail.sendgrid.net. [159.183.224.103])
        by mx.google.com with ESMTPS id 00721157ae682-6f9757fd705si55074727b3.124.2025.02.05.09.31.32
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 09:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) client-ip=159.183.224.103;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=MNejY1CQ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=rfGVoXuA;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=/rsMatNtS7MWUoa5o6OxogPlASt0epZ2LVvr4hEd/k0=;
	b=MNejY1CQjIdiuo1/+EU7XAGEVuLzzzqSxmzQ1CoQxlqdexcYQqFGio4/lSMVUZ7/uf7c
	MoBh5J8t/DjX9HqTtW2DyAfqSmuWXIigfe4SWZmxoD4dQTEjq2tE4Q48UqEpaFBnqcQ2vf
	myaIN3AIRztyAn+c7uSzAIDzgIE/limUhKXVu9OpzN+2NaERLYCNhSFGrl3mI51qgj9Hof
	dV0bhCArWuj9/aKY9VHhVdEUFL41BDh53+M0UAG4QRUl21wq+1XTcRk0+Ypnf+CkmKC8h9
	3JmF+I4LAKK7SWeo3WqtQFs4MNHznANgPj5NOHMwiVXpFr+Yioj5B9wGpc4+oybQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=/rsMatNtS7MWUoa5o6OxogPlASt0epZ2LVvr4hEd/k0=;
	b=rfGVoXuAlhdDnkLK0A1qdEhIxubA8Q2Nmrqm7YPgq6uRbo6rJf3NmiZPL9GWfUiLd0NH
	URYJkGnq5OPBP/QBPpM9MTTuOOG5KZ3HXg3kYfIutuHb/N8DKpqVUc58Fa3/I15qUUnaCQ
	knVAT3TSPICm5xy9R94Y7S5UrsT1SPStA=
Received: by recvd-84b546689d-d8rgz with SMTP id recvd-84b546689d-d8rgz-1-67A3A070-3F
	2025-02-05 17:31:28.825776837 +0000 UTC m=+7157287.630728920
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-23 (SG) with HTTP
	id Z1h7xQSVToWUQW56aEmJNg
	Wed, 05 Feb 2025 17:31:28.740 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c9f0798f747b4a5f0780a4f1c123f11f9fcf85d8487c4fb476186a60828a
Date: Wed, 05 Feb 2025 17:31:30 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Z1h7xQSVToWUQW56aEmJNg@geopod-ismtpd-23>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5gsH93dG7RniQGT?=
 =?us-ascii?Q?lXqF+ux+W0RGO6=2FQINNz4EcnYxrxvFrmHUjKFF7?=
 =?us-ascii?Q?t7DeJX3HX7xOUDu9sSmxPWv4AUxzM=2Fr8IR809YS?=
 =?us-ascii?Q?zXgwLk4CFgWnhd7d0=2FQ9YnZOxisqzIIl5ktjldx?=
 =?us-ascii?Q?atR1Gzw8LVBH228lcz9Y+olzUWOT8l4aoqaDIpl?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: vVIMcXP/T7hb

--c9f0798f747b4a5f0780a4f1c123f11f9fcf85d8487c4fb476186a60828a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating article about Eden Ahbez, the composer of the 1948 hit "Natur=
e Boy" recorded by Nat King Cole. Ahbez was a unique figure who lived an un=
conventional lifestyle, including sleeping outdoors and living on $3 per we=
ek. He was found living under the Hollywood Sign when Capitol Records neede=
d his permission to release the song.
Key Points:
The song "Nature Boy" became a million-seller despite initial skepticism fr=
om Capitol Records
Ahbez is considered by some to be the first hippie, predating the movement =
by decades
He wrote around 300 songs but most were too eccentric for mainstream succes=
s
Community Discussion:
Many readers knew the song from Baz Luhrmann's "Moulin Rouge!" but weren't =
familiar with its origin
Interesting discussion about the song's musical composition and its unusual=
 chord progression
Some debate about the song's possible inspiration from a Yiddish theater so=
ng "Shvayg, mayn harts"
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about improving the performance of a local language mod=
el voice assistant using Retrieval Augmented Generation (RAG). The author d=
escribes how they optimized their home automation system by reducing contex=
t length and implementing smart retrieval of relevant information.
Key Points:
Initial solution using dual RTX 3090s wasn't fast enough
RAG implementation significantly reduced response times
System now intelligently selects relevant context instead of processing ent=
ire home state
Community Discussion:
Discussion about the model identification (Llama 3 vs Llama 2)
Suggestions for potential optimizations including pre-computing responses f=
or common queries
Comments about the LLM's response style and personality
3. Ancient Australian 'Giga-Goose' Skull Found
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia. This discovery prov=
ides new insights into the species' appearance and behavior.
Key Points:
The bird stood over 2 meters tall and weighed up to 240 kg
New skull reveals it was more closely related to geese than previously thou=
ght
Went extinct shortly after human arrival in Australia, around 45,000 years =
ago
Community Discussion:
Significant debate about the role of climate change versus human activity i=
n the species' extinction
Discussion about the survival of megafauna through previous climate changes
Interest in the potential taste of ancient megafauna, given their apparent =
appeal to early humans
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--c9f0798f747b4a5f0780a4f1c123f11f9fcf85d8487c4fb476186a60828a
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
 "Nature Boy" recorded by Nat King Cole. Ahbez was a unique figure who live=
d an unconventional lifestyle, including sleeping outdoors and living on $3=
 per week. He was found living under the Hollywood Sign when Capitol Record=
s needed his permission to release the song.</p>
   =20
    <p><strong>Key Points:</strong></p>
    <ul>
        <li>The song "Nature Boy" became a million-seller despite initial s=
kepticism from Capitol Records</li>
        <li>Ahbez is considered by some to be the first hippie, predating t=
he movement by decades</li>
        <li>He wrote around 300 songs but most were too eccentric for mains=
tream success</li>
    </ul>
   =20
    <p><strong>Community Discussion:</strong></p>
    <ul>
        <li>Many readers knew the song from Baz Luhrmann's "Moulin Rouge!" =
but weren't familiar with its origin</li>
        <li>Interesting discussion about the song's musical composition and=
 its unusual chord progression</li>
        <li>Some debate about the song's possible inspiration from a Yiddis=
h theater song "Shvayg, mayn harts"</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>2. Making Local LLM Voice Assistant Faster with RAG</h2>
    <p>A technical article about improving the performance of a local langu=
age model voice assistant using Retrieval Augmented Generation (RAG). The a=
uthor describes how they optimized their home automation system by reducing=
 context length and implementing smart retrieval of relevant information.</=
p>
   =20
    <p><strong>Key Points:</strong></p>
    <ul>
        <li>Initial solution using dual RTX 3090s wasn't fast enough</li>
        <li>RAG implementation significantly reduced response times</li>
        <li>System now intelligently selects relevant context instead of pr=
ocessing entire home state</li>
    </ul>
   =20
    <p><strong>Community Discussion:</strong></p>
    <ul>
        <li>Discussion about the model identification (Llama 3 vs Llama 2)<=
/li>
        <li>Suggestions for potential optimizations including pre-computing=
 responses for common queries</li>
        <li>Comments about the LLM's response style and personality</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>3. Ancient Australian 'Giga-Goose' Skull Found</h2>
    <p>Scientists have discovered a well-preserved skull of Genyornis newto=
ni, a massive flightless bird that lived in ancient Australia. This discove=
ry provides new insights into the species' appearance and behavior.</p>
   =20
    <p><strong>Key Points:</strong></p>
    <ul>
        <li>The bird stood over 2 meters tall and weighed up to 240 kg</li>
        <li>New skull reveals it was more closely related to geese than pre=
viously thought</li>
        <li>Went extinct shortly after human arrival in Australia, around 4=
5,000 years ago</li>
    </ul>
   =20
    <p><strong>Community Discussion:</strong></p>
    <ul>
        <li>Significant debate about the role of climate change versus huma=
n activity in the species' extinction</li>
        <li>Discussion about the survival of megafauna through previous cli=
mate changes</li>
        <li>Interest in the potential taste of ancient megafauna, given the=
ir apparent appeal to early humans</li>
    </ul>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"font-size: 12px; color: #666;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswce6__zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBIORy6EgNo5HMQXY-2Fo4=
Rw3du5ntpVd1fjG-2FUCW6qrWNNNwzUAdv-2F09eI9x0CsiUYM8g-2BnKFrSK-2FjlZBlkSTuOz=
iOiQELEGhQ0VOOvYjwkossrrjvS7drx21oyLMzWUtRzsI80h5sg9X2U-2FyaErmzV10vP6ldGj1=
AW-2Bu2jUVKH7Jg-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLCKa9C9iA4JJwz8XSy-2FleRDyop2-2Bf6GwQF-2FvoD=
ryBjBp0wKpQ4TJNLRxncLzAbNZd3-2BOGicYlJIAY6xW1FAFLtgFVrcP6JBCGR8HxvsyYJvo9p-=
2B8uFhv8VNO6bj6aETE2rFSpV5uMvKQgN0OF3S4Yh19veomUSDv199-2Fj2buwE8DnF9rM24RzN=
Wgvc3pKMzO0-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body>
</html>
--c9f0798f747b4a5f0780a4f1c123f11f9fcf85d8487c4fb476186a60828a--
