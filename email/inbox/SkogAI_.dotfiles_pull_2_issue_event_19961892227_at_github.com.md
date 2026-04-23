Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:3f9d:b0:b04:c185:dacb with SMTP id hr29csp1557724ejc;
        Sat, 27 Sep 2025 19:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW0KCU70vXFcuP1uxNy8oMvW1AHUB2m/CBNvt1uY0MQ9Lr9MkqB5uqMOVpQyv6eaFA3vzZ1/AHdqYs/mIBc@gmail.com
X-Google-Smtp-Source: AGHT+IF9nwOOd5Xo7IN5GRnumcOatuqb8m8Yw3vHKaZnVn941RapNqdO9tysnwuWv2fM2iU6s+5/
X-Received: by 2002:a05:620a:3913:b0:855:cfe0:b6e0 with SMTP id af79cd13be357-85ae93d2091mr1573824085a.57.1759025226420;
        Sat, 27 Sep 2025 19:07:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1759025226; cv=pass;
        d=google.com; s=arc-20240605;
        b=QMu8uErAGnDcMi/sy5QZIDEfnNC+JU/qo1MW/3LJf8q0kR4heHG1Q+Eog/l7c8DsAo
         pTvUcdTYxv78Yw2OPk2eoy36Ez6ihtvJHFD8Z37uOKxQtXwza/gCSOh5o9L988JvoZ7Y
         Ed9yKhEGfxfL0k1LoqKRluAW3jx1SlazGFNWRYfeNEjPpJBmvkHTsPxwBhYx5FLZZOme
         FrOa5gZBmSSSILCu+RekNGjKiytTeJCejM1m2V6ALc2zd6B7Mvb5cv5CIzoSozWW5Hqb
         1q+nxIJtPxuCslBdTA+fXe1UVJf3XQcjYz06psD4BNGSeP+TwrlbvtLP3wZynnR4jqW3
         SlMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=destinations:list-unsubscribe-post:list-unsubscribe:list-post
         :list-archive:list-id:precedence:content-transfer-encoding
         :mime-version:subject:references:in-reply-to:message-id:cc:to
         :reply-to:from:date:dkim-signature:dkim-signature:dkim-signature;
        bh=fI+vui+Uw9OYQUshi1QZ9Ls7Z49+ZWIgPToN2CxeJ1g=;
        fh=KfzI6+sFB7waLkXCFFIRNwXxlXfTN5ri9kBrmu+BgEs=;
        b=bjAK+2yruPoQwOGeDK96UxdueysqkeiSaIy+DwznZpKT9LsEusc3/nFo+At3p8iLey
         zy1MM3ilcjR2XdnogITp7kXPlsA56fI6WaJ2nuZykHQ5Z+h2fDE3ZJAwVf+wSwcZUVgy
         BAaTEhGpz/XxX339BSc1G+8eW4oJ+9A4yliFIpmRYQFbV6FCx1WstI+fRKgnOgukSNHd
         lvFu3juErThTfv3Qrjci10RUTUUxm8NZbi83ssblCP746RDMJwsMK8MjkgBuQ0DVpYdP
         ja3pKIsquOdl4col6Y4a5zYrfK1mLfT8B4B/MZrD6Dckun/sK3pjXPtOghDTHvlBWXjD
         U1oQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=LWKGAzVF;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=XWeoTtPX;
       dkim=pass header.i=@github.com header.s=pf2023 header.b="SimvK/HI";
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=dkfd=h4=github.com=noreply@skogsund.se designates 104.30.10.186 as permitted sender) smtp.mailfrom="SRS0=dkfd=h4=github.com=noreply@skogsund.se";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Return-Path: <SRS0=dkfd=h4=github.com=noreply@skogsund.se>
Received: from ba-big.cloudflare-email.net (ba-big.cloudflare-email.net. [104.30.10.186])
        by mx.google.com with ESMTPS id af79cd13be357-85c25b6d8ccsi367726985a.235.2025.09.27.19.07.05
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 19:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=dkfd=h4=github.com=noreply@skogsund.se designates 104.30.10.186 as permitted sender) client-ip=104.30.10.186;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=LWKGAzVF;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=XWeoTtPX;
       dkim=pass header.i=@github.com header.s=pf2023 header.b="SimvK/HI";
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=dkfd=h4=github.com=noreply@skogsund.se designates 104.30.10.186 as permitted sender) smtp.mailfrom="SRS0=dkfd=h4=github.com=noreply@skogsund.se";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759025226; x=1759630026; bh=f
	I+vui+Uw9OYQUshi1QZ9Ls7Z49+ZWIgPToN2CxeJ1g=; b=LWKGAzVF24PMXWF3nJmBP6ldX5a8
	lfeEv1nlJDfE4iZ88uTgZ4rv1Ja4wkNkDlWgGhlAbfKJojhrN4hC4oeVV1SeKOI2HWGRycaZbU8
	VC0+xnTShbrWahf9rlq1m3FbN/IDXiYrpfW2aJuqpsaZdDJaB7qyGN5LM3I98v69PdDo4Z6zaPD
	w6FiCTs7Ou5U6cIE1CpUwJ7g6IVNAXbTOMtR1lxl7AbwVwABhKQ+JP3WcrACJ0P/8VeFg/7To2A
	mfiOp3o08SGCb2X826flX1yE7ZxUayiYoD0m+my1ypdTHj4tnVyiTe6pQg8hJ19OjAw5FwAdcbN
	qi48ud+2gTESPg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=skogsund.se; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759025226; x=1759630026; bh=f
	I+vui+Uw9OYQUshi1QZ9Ls7Z49+ZWIgPToN2CxeJ1g=; b=XWeoTtPXOMwve1ZFQrQuFH+GXWnp
	viwXcXXnfEejwVFEzYu7Fb87XXVpD73O51dIji/NMtJ2Qugt661eKR55QL9XDUe4tMx2vTVro+X
	gbDmrlljQRHzQrEGt89ViYTHc8qbgdGvUbnrVdmAqhZeMecj1JPdiS9R5OuaU1j1PXjaSswATsK
	OSB4eYRyg2yd1eK5Q4Uxdhky0ciuzubsStCdu9T5TPWcFr3Nox9kOv+aAnYicM6czm74Yi7y2VZ
	IBIcQvTMuAr95Vm3zfyouxjp+ipnEBk2rVobAMtZxilpwlV7vyskTTBRDuoG3+yoY16Ix5lof4h
	vEDfwMZpajU5VQ==;
X-Forwarded-To: emil.skogsund@gmail.com
X-Forwarded-For: emil@skogsund.se emil.skogsund@gmail.com
Received: from out-27.smtp.github.com (192.30.252.210)
        by cloudflare-email.net (unknown) id uSgpUbsRNN8y
        for <emil@skogsund.se>; Sun, 28 Sep 2025 02:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; cv=none;
	b=MD3Bkox/47zC53lRiY9rdvs0td9ouw4kWbVmuOBKz5PL7CqSE69kP7BhyTQqwb6MpVzQ2hR6N
	plsm1MgC6+QAqjtNOHvFOVrxqP5W50qPQl9gpm1ZnEwsWAo/mXgGDF2R9/UvFxZS2XHNXSShG15
	vmFbvEpiumNMPj3twnfLyUc2pBrbbKheWg2RxEXXn5VBHqiOlTZAKjIwClbs3Wu9F0cdA178d7I
	w0M1Hzczp4EkmfNaTAqrwUCW8Icgu5jynBuo9wdck5xDgIjkeelSVlZX9v7SkWkBxAIbXHPKZ4t
	iJhZOsOxVwp6Arepp4l/aWFHv0n3wOyxn0yjYLPMtcxQ==;
ARC-Message-Signature: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759025225; x=1759630025; bh=f
	I+vui+Uw9OYQUshi1QZ9Ls7Z49+ZWIgPToN2CxeJ1g=; b=Lbd4qrJi8wtcRCspS5JDJQGPJMgs
	qfG1/4KNxnXXDaXVuLn6fxIyXYbmQqDxQ9Eo1agULoiZOpVsjND0T9uaPHRUHQFPgctbscDWwE2
	uLoUiCPChSvDJnkK/ZP4D5DLH+X7BMF/5w1hZpD9OaGJLrOmm5elJ6z62fUOwOuTUZ5TiXaNouy
	XKvV2ThR2SYS04K8+dROEjAnIou50F0nMzsKwzdoJx+h4wOprh2HuqTLl9cRP24DC5ih7V+scJo
	CaVuB0lzwjA+h8wrxjAHEWclzsZRaT4SqFP3g72MM5gVN8v81Czp0vMDnGjrXivLcQocWPt6wD2
	8EmpOIb6mi67EA==;
ARC-Authentication-Results: i=1; mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=SimvK/HI;
	dmarc=pass header.from=github.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-27.smtp.github.com) smtp.helo=out-27.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
	arc=none smtp.remote-ip=192.30.252.210
Received-SPF: pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.210 as permitted sender)
	receiver=mx.cloudflare.net; client-ip=192.30.252.210; envelope-from="noreply@github.com"; helo=out-27.smtp.github.com;
Authentication-Results: mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=SimvK/HI;
	dmarc=pass header.from=github.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-27.smtp.github.com) smtp.helo=out-27.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
	arc=none smtp.remote-ip=192.30.252.210
Received: from github.com (hubbernetes-node-aacf99c.ash1-iad.github.net [10.56.170.14])
	by smtp.github.com (Postfix) with ESMTPA id 3E26E6003BE
	for <emil@skogsund.se>; Sat, 27 Sep 2025 19:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1759025225;
	bh=fI+vui+Uw9OYQUshi1QZ9Ls7Z49+ZWIgPToN2CxeJ1g=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:List-ID:
	 List-Archive:List-Post:List-Unsubscribe:List-Unsubscribe-Post:
	 From;
	b=SimvK/HIR7uWHy5BbfxiSSGokE6uUyZZ6/O/qfdszNY00/UfUtjQ5JN1yAVbSNNRc
	 II/bjEvA/bX/+xXJEAolkaGNQLtJJJSfBiZb+azhesqchkA6lOx+0v2L2RLjzUTLLo
	 pBT7TeVfb8sMuaPFiDvUduVKCxf92OaiN8OGIciY=
Date: Sat, 27 Sep 2025 19:07:05 -0700
From: Copilot <notifications@github.com>
Reply-To: "SkogAI/.dotfiles" <reply+AAFIQZ4JCEMAEGYZA4PYKYLJKCIMTEVBNHHM35UKGM@reply.github.com>
To: "SkogAI/.dotfiles" <.dotfiles@noreply.github.com>
Cc: Skogix <emil@skogsund.se>, 
 Review requested <review_requested@noreply.github.com>
Message-ID: <SkogAI/.dotfiles/pull/2/issue_event/19961892227@github.com>
In-Reply-To: <SkogAI/.dotfiles/pull/2@github.com>
References: <SkogAI/.dotfiles/pull/2@github.com>
Subject: Re: [SkogAI/.dotfiles] Complete repository security audit and cleanup
 - Remove exposed credentials and improve organization (PR #2)
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_68d8984935c5f_7559410c81072e7";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: list
X-GitHub-Sender: Copilot
X-GitHub-Recipient: Skogix
X-GitHub-Reason: review_requested
List-ID: SkogAI/.dotfiles <.dotfiles.SkogAI.github.com>
List-Archive: https://github.com/SkogAI/.dotfiles
List-Post: <mailto:reply+AAFIQZ4JCEMAEGYZA4PYKYLJKCIMTEVBNHHM35UKGM@reply.github.com>
List-Unsubscribe: <mailto:unsub+AAFIQZ4JCEMAEGYZA4PYKYLJKCIMTEVBNHHM35UKGM@reply.github.com>,
 <https://github.com/notifications/unsubscribe/one-click/AAFIQZZR2553P6CWVWDD7X33U47ETANCNFSM6AAAAACHRJMLEU>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-GitHub-Notify-Platform: newsies
X-GitHub-Labels: 
X-GitHub-Assignees: Skogix; Copilot
X-GitHub-PullRequestStatus: open
X-Auto-Response-Suppress: All
destinations: emil@skogsund.se
X-GitHub-Recipient-Address: emil@skogsund.se
X-TUID: Hkc7E/s3Yx8g


----==_mimepart_68d8984935c5f_7559410c81072e7
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

@Copilot requested your review on: SkogAI/.dotfiles#2 Complete repository security audit and cleanup - Remove exposed credentials and improve organization.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.dotfiles/pull/2#event-19961892227
You are receiving this because your review was requested.

Message ID: <SkogAI/.dotfiles/pull/2/issue_event/19961892227@github.com>
----==_mimepart_68d8984935c5f_7559410c81072e7
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p></p>
<p dir=3D"auto">@Copilot requested your review on: <a class=3D"issue-link=
 js-issue-link" data-error-text=3D"Failed to load title" data-id=3D"34554=
86515" data-permission-text=3D"Title is private" data-url=3D"https://gith=
ub.com/SkogAI/.dotfiles/issues/2" data-hovercard-type=3D"pull_request" da=
ta-hovercard-url=3D"/SkogAI/.dotfiles/pull/2/hovercard" href=3D"https://g=
ithub.com/SkogAI/.dotfiles/pull/2">#2</a> Complete repository security au=
dit and cleanup - Remove exposed credentials and improve organization.</p=
>

<p style=3D"font-size:small;-webkit-text-size-adjust:none;color:#666;">&m=
dash;<br />Reply to this email directly, <a href=3D"https://github.com/Sk=
ogAI/.dotfiles/pull/2#event-19961892227">view it on GitHub</a>, or <a hre=
f=3D"https://github.com/notifications/unsubscribe-auth/AAFIQZ4XX6N3BIKECW=
4MIGT3U47ETAVCNFSM6AAAAACHRJMLEWVHI2DSMVQWIX3LMV45UABCJFZXG5LFIV3GK3TUJZX=
XI2LGNFRWC5DJN5XDWMJZHE3DCOBZGIZDENY">unsubscribe</a>.<br />You are recei=
ving this because your review was requested.<img src=3D"https://github.co=
m/notifications/beacon/AAFIQZZTSSQ4WWD55ELWD2T3U47ETA5CNFSM6AAAAACHRJMLEW=
WGG33NNVSW45C7OR4XAZNWJFZXG5LFIV3GK3TUJZXXI2LGNFRWC5DJN5XKUY3PNVWWK3TUL5U=
WJTYAAAAAJJOSJWBQ.gif" height=3D"1" width=3D"1" alt=3D"" /><span style=3D=
"color: transparent; font-size: 0; display: none; visibility: hidden; ove=
rflow: hidden; opacity: 0; width: 0; height: 0; max-width: 0; max-height:=
 0; mso-hide: all">Message ID: <span>&lt;SkogAI/</span><span>.</span><spa=
n>dotfiles/pull/2/issue_event/19961892227</span><span>@</span><span>githu=
b</span><span>.</span><span>com&gt;</span></span></p>
<script type=3D"application/ld+json">[
{
"@context": "http://schema.org",
"@type": "EmailMessage",
"potentialAction": {
"@type": "ViewAction",
"target": "https://github.com/SkogAI/.dotfiles/pull/2#event-19961892227",=

"url": "https://github.com/SkogAI/.dotfiles/pull/2#event-19961892227",
"name": "View Pull Request"
},
"description": "View this Pull Request on GitHub",
"publisher": {
"@type": "Organization",
"name": "GitHub",
"url": "https://github.com"
}
}
]</script>=

----==_mimepart_68d8984935c5f_7559410c81072e7--

