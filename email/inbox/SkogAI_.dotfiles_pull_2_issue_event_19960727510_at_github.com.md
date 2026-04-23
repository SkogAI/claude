Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:3f9d:b0:b04:c185:dacb with SMTP id hr29csp1479813ejc;
        Sat, 27 Sep 2025 14:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVdQ9Hz39+PBWew76NvTWEZSDlLD0ZjsEusaZ1uaUKEL9lGBFulNZFl6SShkMyFtCGC/Hb2NYU4jsEmk2Gj@gmail.com
X-Google-Smtp-Source: AGHT+IFdSz/Q4W7muEBHJVxo6LC53uoFpmVPeL731iuQORy8lSdNJN7wI2Zk5DaItkfyDf0mFzFR
X-Received: by 2002:a05:622a:5a19:b0:4b7:976e:8c48 with SMTP id d75a77b69052e-4da4735529cmr145593071cf.14.1759007365121;
        Sat, 27 Sep 2025 14:09:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1759007365; cv=pass;
        d=google.com; s=arc-20240605;
        b=Nj9IidUAbM8zZLMxhsKXwXskPRgOTuf4VlXcO12DJ9VPP5/TeX1ZbLCX1DyLi0+7N2
         +lvowB8+RcV3Q69s4OUI045fF0fKqNmx5IdOWGOUNVV540ECDhYXESgbXtxNfNJE/iie
         prvOkz9L5EeOAlxIaCGETtXgLlcR9qYaQduluuD4WLOzjP3EhKEfal45UZ/h6yOf5p9O
         8nS34ChQQepVC9hP2s2xSZsW8SFOQDBfNd5zsmMtVihbuuWn6BusSs+bJXPP5bQA+hDr
         5JG2+tpF/EXC68Ywal3hU4ELvmDvJVSD5wD8xoqRX47tZyRDcNUp4Gh94JCLXojlv0sg
         s9bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=destinations:list-unsubscribe-post:list-unsubscribe:list-post
         :list-archive:list-id:precedence:content-transfer-encoding
         :mime-version:subject:references:in-reply-to:message-id:cc:to
         :reply-to:from:date:dkim-signature:dkim-signature:dkim-signature;
        bh=kAjwcLlxCvKtyPWGS4rIntglYUPCC5rcQFRlC3odSgQ=;
        fh=KfzI6+sFB7waLkXCFFIRNwXxlXfTN5ri9kBrmu+BgEs=;
        b=VyPNsg5NXen0m3jrN+0zf74xPz0YDqA21ObB0QoBzHSfoJjIGy1gI+wkungaOIws7s
         92FyoxiUEt1UiF9WrD6q29Gae3RdVG9eocQ1X0Xn7SEi8ylQM9Ic2GRx6ivOMO4MfBRo
         Q8ovThqOxInh+gvJUIDmL5uAOMWK/6ewAiTA+V0z8hV23XLhJYmwY7L2VW2avdNJjnLL
         K9DmY/XeLdY69YAdstRixKwUzFJvwbYVsKrCgOU8j1QCa739VIuMdaySQv2YF83evEX0
         kEjEetCnW3/8bxEtu/ymD7xp4MFonvcury4SRi2A8uPaCvUDiC2zIcNeLu1JN03C292w
         1g3g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=BrTDVQQn;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=C75I30gw;
       dkim=pass header.i=@github.com header.s=pf2023 header.b=ldnqVvA1;
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=zp67=g4=github.com=noreply@skogsund.se designates 104.30.10.49 as permitted sender) smtp.mailfrom="SRS0=Zp67=g4=github.com=noreply@skogsund.se";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Return-Path: <SRS0=Zp67=g4=github.com=noreply@skogsund.se>
Received: from ba-ej.cloudflare-email.net (ba-ej.cloudflare-email.net. [104.30.10.49])
        by mx.google.com with ESMTPS id 6a1803df08f44-801465cef42si35279496d6.189.2025.09.27.14.09.24
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 14:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=zp67=g4=github.com=noreply@skogsund.se designates 104.30.10.49 as permitted sender) client-ip=104.30.10.49;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=BrTDVQQn;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=C75I30gw;
       dkim=pass header.i=@github.com header.s=pf2023 header.b=ldnqVvA1;
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=zp67=g4=github.com=noreply@skogsund.se designates 104.30.10.49 as permitted sender) smtp.mailfrom="SRS0=Zp67=g4=github.com=noreply@skogsund.se";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759007364; x=1759612164; bh=k
	AjwcLlxCvKtyPWGS4rIntglYUPCC5rcQFRlC3odSgQ=; b=BrTDVQQnGwFMblVUVrlGvDkz1Acu
	XFFlVLnA3qXAmY5+b4Z8xN3zY+6v50uhfTtmz3HZkbp4RlHlYr7BowFCsIDf9rjJ9Feack4P1ka
	zuppGGiCKNi3xZZu0tOnjj9e2rNZBQ+9IJwxL6mzsoK3y9alrmyClyrDe5pBzIDacMR0u21JrDI
	zoo68nbqrqCPbZpDVHoKrBUUVfnM4Q/BBzbE9fseMgAU6e32yAyc93WqkRtApUi9y1FA63TaHr0
	GfEqWywQ6VoPnSMTfPE8jV0EeD8tnxfbm5fJfwbwsjgeCiBp8MB/pRY7ae2WkmeRclsHz3Xmf8z
	Cey0OpsmaPsslA==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=skogsund.se; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759007364; x=1759612164; bh=k
	AjwcLlxCvKtyPWGS4rIntglYUPCC5rcQFRlC3odSgQ=; b=C75I30gwxwjCWacUuFOo+9XQxteF
	enAOqjPUjxls+FQuOqFNV5xRxcBoH1p9DjaLIEoNQcwSegxn6dw4WQMBzSwfT96iFomZyEGmx5w
	FJGyFDwEWJY+cgteyB602hv7nKsT3ufKtLtVcpmg/nP8qUCfRQfTR0W5yEPs2bDkUorb3u9edpg
	fiRNxbyVeJ3Pkk+7j0iEVMggjiPJD/HXQglWCXrXUE+vS4b8eSGE1epgJ0ROLeUTY9KfLHEoO9d
	YwyezgTJdg5jauAeM50AHS9ywFLpkoX4ub+5D8fL/zyV+4rSN9SK0tlBylfD4UIB0Bm7U62qjAm
	SQh+Y5BoYUkB3A==;
X-Forwarded-To: emil.skogsund@gmail.com
X-Forwarded-For: emil@skogsund.se emil.skogsund@gmail.com
Received: from out-17.smtp.github.com (192.30.252.200)
        by cloudflare-email.net (unknown) id gK97EwZafc31
        for <emil@skogsund.se>; Sat, 27 Sep 2025 21:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; cv=none;
	b=WtixN07/ZGwR6PEaTMWCXTI/5IWo1qh4XAZwkk10Qd7YhIYpvD6SrchdTPeJsKegj6yyxtpDg
	17mbyxCtJFr/ggAsHzd1ur3sqDDl1jWqRCw9kTAqtLFlq8CPrA5keaQQ12f6t7buHqdi25dgrRs
	SM4oqlzTnYc5hAM7YkUZUNEuqKDzWQvPKO0Q8OaZeU9YqgINtNcc661XJfwgcGX28VTmqs0pJUr
	QRMwTNqMVx84t4Vxt/vY5VTAd5rfaV/Swl26usFFUBZ5S4ZjGru06lwsdy/Ypv55GobZuRp18PY
	HmZJLBEKivZaFHMdEMeVW6ciNWSKFOCJZomamLzFoBUg==;
ARC-Message-Signature: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=List-Unsubscribe:List-Post:List-Archive:List-ID:Subject:References
	:In-Reply-To:Cc:To:Reply-To:From:Date:resent-date:resent-from:resent-to
	:resent-cc:list-help:list-subscribe:list-owner; t=1759007363; x=1759612163; bh=k
	AjwcLlxCvKtyPWGS4rIntglYUPCC5rcQFRlC3odSgQ=; b=ZuiRP1/Na45tuI2nUecJHQEt4WzH
	q9qJlwTflTBBec9EQmqsMdWg8FO0q4ee1batzo/GoqXWzDL+NCWQpOC5nv00HfbgrQX63zr3aSE
	Oehm/8rpQGbmQb1aFVuoPIpa+9z9lFxxIVb+mPuzCiQ5ZTP2NAvvjx9hq4T7jo/v9oHBSlU1zNH
	C5GNpXE0iNfL5hyL9SyQEW38iOhXud+FCRTVW7FFeW5ZCfQQu1kXMiVWrCcbZbRfmwO/2H9A12d
	RXG3k34CgD7nHnAjG4qGG6Ditp64hHU/guiafMccOG97WKiMOQFD4OebbHAhrGbM3MOo4b+QNw7
	RLfgi2Mo/m4Zbw==;
ARC-Authentication-Results: i=1; mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=ldnqVvA1;
	dmarc=pass header.from=github.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-17.smtp.github.com) smtp.helo=out-17.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
	arc=none smtp.remote-ip=192.30.252.200
Received-SPF: pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.200 as permitted sender)
	receiver=mx.cloudflare.net; client-ip=192.30.252.200; envelope-from="noreply@github.com"; helo=out-17.smtp.github.com;
Authentication-Results: mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=ldnqVvA1;
	dmarc=pass header.from=github.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-17.smtp.github.com) smtp.helo=out-17.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
	arc=none smtp.remote-ip=192.30.252.200
Received: from github.com (hubbernetes-node-6d804b7.va3-iad.github.net [10.48.175.37])
	by smtp.github.com (Postfix) with ESMTPA id D0CF54E010D
	for <emil@skogsund.se>; Sat, 27 Sep 2025 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1759007362;
	bh=kAjwcLlxCvKtyPWGS4rIntglYUPCC5rcQFRlC3odSgQ=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:List-ID:
	 List-Archive:List-Post:List-Unsubscribe:List-Unsubscribe-Post:
	 From;
	b=ldnqVvA1ftAAe7S3vfc3iPUINlYwZaQoA6eukcLKWFCK+V0J0wac2xwSqaXr5Ek2p
	 wTBlms4Tv6zPnRkVyjpRcJ1Uh8vRqAUlSxueUqEREujeaQGDoJATNL0SDEfo7xuFie
	 cjrhdYaU16LfGipVN4hNPxVVlHpwu8++Pgja49GM=
Date: Sat, 27 Sep 2025 14:09:22 -0700
From: Copilot <notifications@github.com>
Reply-To: "SkogAI/.dotfiles" <reply+AAFIQZ2MBX5PARPVM7RICP3JKBFQFEVBNHHM35UKGM@reply.github.com>
To: "SkogAI/.dotfiles" <.dotfiles@noreply.github.com>
Cc: Skogix <emil@skogsund.se>, 
 Review requested <review_requested@noreply.github.com>
Message-ID: <SkogAI/.dotfiles/pull/2/issue_event/19960727510@github.com>
In-Reply-To: <SkogAI/.dotfiles/pull/2@github.com>
References: <SkogAI/.dotfiles/pull/2@github.com>
Subject: Re: [SkogAI/.dotfiles] Complete repository security audit and cleanup
 - Remove exposed credentials and improve organization (PR #2)
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_68d85282cc978_5829d10c821291";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: list
X-GitHub-Sender: Copilot
X-GitHub-Recipient: Skogix
X-GitHub-Reason: review_requested
List-ID: SkogAI/.dotfiles <.dotfiles.SkogAI.github.com>
List-Archive: https://github.com/SkogAI/.dotfiles
List-Post: <mailto:reply+AAFIQZ2MBX5PARPVM7RICP3JKBFQFEVBNHHM35UKGM@reply.github.com>
List-Unsubscribe: <mailto:unsub+AAFIQZ2MBX5PARPVM7RICP3JKBFQFEVBNHHM35UKGM@reply.github.com>,
 <https://github.com/notifications/unsubscribe/one-click/AAFIQZZBDQGKWLVZ2QUSVEL3U34IFANCNFSM6AAAAACHRJMLEU>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-GitHub-Notify-Platform: newsies
X-GitHub-Labels: 
X-GitHub-Assignees: Skogix; Copilot
X-GitHub-PullRequestStatus: open
X-Auto-Response-Suppress: All
destinations: emil@skogsund.se
X-GitHub-Recipient-Address: emil@skogsund.se
X-TUID: BdBYRWyqygxc


----==_mimepart_68d85282cc978_5829d10c821291
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

@Copilot requested your review on: SkogAI/.dotfiles#2 Complete repository security audit and cleanup - Remove exposed credentials and improve organization.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.dotfiles/pull/2#event-19960727510
You are receiving this because your review was requested.

Message ID: <SkogAI/.dotfiles/pull/2/issue_event/19960727510@github.com>
----==_mimepart_68d85282cc978_5829d10c821291
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
ogAI/.dotfiles/pull/2#event-19960727510">view it on GitHub</a>, or <a hre=
f=3D"https://github.com/notifications/unsubscribe-auth/AAFIQZ7DKZ4HB77XW2=
YP2ZT3U34IFAVCNFSM6AAAAACHRJMLEWVHI2DSMVQWIX3LMV45UABCJFZXG5LFIV3GK3TUJZX=
XI2LGNFRWC5DJN5XDWMJZHE3DANZSG42TCMA">unsubscribe</a>.<br />You are recei=
ving this because your review was requested.<img src=3D"https://github.co=
m/notifications/beacon/AAFIQZ7ILG6BEFTLHWFUDN33U34IFA5CNFSM6AAAAACHRJMLEW=
WGG33NNVSW45C7OR4XAZNWJFZXG5LFIV3GK3TUJZXXI2LGNFRWC5DJN5XKUY3PNVWWK3TUL5U=
WJTYAAAAAJJOAQ7LA.gif" height=3D"1" width=3D"1" alt=3D"" /><span style=3D=
"color: transparent; font-size: 0; display: none; visibility: hidden; ove=
rflow: hidden; opacity: 0; width: 0; height: 0; max-width: 0; max-height:=
 0; mso-hide: all">Message ID: <span>&lt;SkogAI/</span><span>.</span><spa=
n>dotfiles/pull/2/issue_event/19960727510</span><span>@</span><span>githu=
b</span><span>.</span><span>com&gt;</span></span></p>
<script type=3D"application/ld+json">[
{
"@context": "http://schema.org",
"@type": "EmailMessage",
"potentialAction": {
"@type": "ViewAction",
"target": "https://github.com/SkogAI/.dotfiles/pull/2#event-19960727510",=

"url": "https://github.com/SkogAI/.dotfiles/pull/2#event-19960727510",
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

----==_mimepart_68d85282cc978_5829d10c821291--

