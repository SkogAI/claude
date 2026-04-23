MIME-Version: 1.0
From: Termius News <no-reply@news.termius.com>
To: emil.skogsund@gmail.com
Date: Tue, 31 Mar 2026 10:01:13 +0000
Subject: Termius March News: Post-quantum cryptography
Message-ID: <al3gPjtWTiW-nShKsazsTw@geopod-ismtpd-32>
Content-Type: multipart/alternative; boundary="e0a37ad9e76f665efdafafdb897942b290a8ca35e4d5fb5699437f143df6"

Post-quantum cryptography is a new generation of protection designed to resist future quantum computing attacks. While quantum computers are not there yet, Termius has already prepared you for what is coming.

Last year, we added *ML-KEM* support – a post-quantum key exchange algorithm that protects your SSH session. And recently we implemented *ML-DSA* keys, extending post-quantum protection to authentication.

*ML-KEM* and *ML-DSA* are defined by *NIST* (National Institute of Standards and Technology) in their standards *FIPS 203* and *FIPS 204* ; the same algorithms are recommended by *ENISA* (European Union Agency for Cybersecurity).

U.S. federal agencies are already expected to adopt them, and regulated industries such as finance are expected to follow. This makes post-quantum readiness a compliance question, not just a security one.

If your organization is migrating to post-quantum standards, contact us ( https://termius.typeform.com/to/z6fCKUC8 ) – we're happy to help.

----------------
Why this matters
----------------

Most modern encryption relies on mathematical problems that would take modern computers thousands or even millions of years to solve. However, quantum computers, once they become a reality, could break these algorithms in days or even hours. *It creates two major risks*.

"Harvest now, decrypt later"
----------------------------

Attackers can capture your encrypted data traffic today and decrypt it once quantum computers become available.

To mitigate the risk, Termius implemented *ML-KEM*. This post-quantum key exchange algorithm already protects SSH sessions where supported, making the harvested data unusable.

ML-KEM is available in *OpenSSH 9.9* and is the default key exchange in *OpenSSH 10.0*. Termius automatically uses the strongest available security when you connect – you only need to keep OpenSSH up to date.

Impersonation attacks
---------------------

Quantum computers would also be able to break traditional signature algorithms (e.g., RSA, ECDSA, Ed25519); an attacker could forge a server's identity and intercept your connection, or impersonate you to any server that trusts your public key.

To protect both host and user authentication, Termius now supports generating and connecting with post-quantum secure ML-DSA keys. They come at three levels – ML-DSA 44, ML-DSA 65, and ML-DSA 87. Each one targets a different NIST security level.

While ML-DSA is not yet available on SSH servers because the risk is less immediate, OpenSSH has committed to adding post-quantum signature support in the future. Termius is already there, so when your servers catch up, you won't have to wait.

Post-quantum cryptography is the next evolution of security. By implementing it now, Termius ensures your SSH sessions remain protected – not just against today's threats, but for years to come.

Get Termius for: iPhone ( https://apps.apple.com/us/app/termius-modern-ssh-client/id549039908?utm_source=email-footer ) | iPad ( https://apps.apple.com/us/app/termius-modern-ssh-client/id549039908?platform=ipad&utm_source=email-footer ) | Android ( https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client&utm_source=email-footer ) | Other ( https://termius.com/download?utm_source=email-footer ) Get termius for:

iPhone ( https://apps.apple.com/us/app/termius-modern-ssh-client/id549039908?utm_source=email-footer ) | iPad ( https://apps.apple.com/us/app/termius-modern-ssh-client/id549039908?platform=ipad&utm_source=email-footer ) | Android ( https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client&utm_source=email-footer ) | Other ( https://termius.com/download?utm_source=email-footer )

You received this email because you created an account in Termius. To opt out of receiving future emails, click unsubscribe ( http://url4578.news.termius.com/asm/unsubscribe/?user_id=27205612&data=sY5SbOAAeYzJ6PbOAP8Gg9S3S1t_o01Qlf3n3gpaFABoMDAwdTAwMHLLKAqfkHphbAwAq0jpXHt4K9X1bG-5hacUBEOU8SFIFWdSTqzeeXD8KP_MUjn54FSVXXaazgLSsbR5sUiBEFZb34dOQe885YBb_ttnQeT-NZukzT4MpjG0zseFUViMdWVHDNRaqY8tRfv7Pz9ZJqwlggNtJ5FpHR-MjYnsItHGMrqVOIvyquzTLzQ39nk4dfXuwAPFTzWfEOAUxReUy7kJhQW4vWTKh6EahtQUwbXT0rGYhqtYQkbXu0Ep4Juk5SD0J1iUB3AWex8JtiOGvTOSuxcJZ1nG7a8Hk9BCfPGTzSxIBhLwA6nIZoKq8FMK5Xnft9Qx-Y_bXEWJbMRRfJ5WFLMmdBRtCthZ3Zrd7DrgOt5Vll_yi-SJ31EOi7kjVAaY_hsM50fMxqYPeGal4fqQekscUmE6WCz_keTvZLbGzel9WtXKmBG2rD-GByk5LkQEph3KmUyDt9-Ogbugck93LbzjhA7u7_9J-D504qJNl6DxefUaTdqopJkBjISeEfKT5IMAc4Rtz2_JEKG10YJSYMXE1eWynMmlTXZSaqrVh_H3gWgh5lR5tdUS7HOTbzKkSeN-n5MNMfUySuwSBqJhiQC2vCxqPlf6rvMQ3dwoIfj5TR2HGNN5QjCFdbbCp3edq0tYNOjseAcsbM53C5iyxX9I7vW8N3AI34n8nmy9M7lxQn7-DoEgXcxclpIizSYG9x8Cz29nkRU4ZILGzVrpFHhVXQ_T-WKf0_6OmLg0IQmiLUNdzm4gCXzrN36jg5xh1jX81QzVoXkGEvigbcKeQdhuh9tWGBMu6huKCPSncSvDiyrNP99eDo1_8YlEqNU1RMNQLCumGBNdBQ97ij5BOgN7tpW-fJgL4L2trjHdifWCV5b5OXMU0IbSA--d_C26W4Lbpt0rZlJ6iAARH0DLwzjecGxpBlnZTSgHxD65MtsqNIO7tMpMiK04xs7Ytz0g4d81HDIwdLeS4QrTHsC5L4csY7Zf8LwaJ2T8KoezOx3HS0y81BnfEXO9kzh_GtjAQkBAvs0-hOhNIb_cgoBhdiEKgLn8EQCoD4LEx6ShVye8fl6CUiyxUzkVhDZWJWF_HDILsOfwTXYVWuGKd4sHFqvktSuuE9ICre74Qe9I8CxfWHeBAEYqrI7prxx6q650hOReQ2zHn3d56KCIP2JwkYXMLLuBJwz9ZqDWJQ2o2JscQ4iTMD--yk7t2bOqtw== ).

2261 Market Street #4981, San Francisco, CA 94114

© 2026 Termius Corporation. All rights reserved.