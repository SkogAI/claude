# TODO — System / Networking

## Follow-up from IPv4 fix (2026-02-10)

- [ ] **DNS verification**
  Confirm name resolution works over both IPv4 and IPv6. Right now IPv4 DNS points at Cloudflare/Google (`1.1.1.1`, `8.8.8.8`) and IPv6 DNS comes from the ISP (Telia). We want to make sure both can actually resolve domain names, and that there's no mismatch where one stack resolves and the other silently fails.
  ```bash
  dig A example.com        # IPv4 DNS lookup
  dig AAAA example.com     # IPv6 DNS lookup
  dig @1.1.1.1 example.com # explicitly test Cloudflare
  ```

- [ ] **CA certificates**
  HTTPS relies on your system trusting the right certificate authorities. On a fresh Arch install this should be fine, but worth a quick sanity check — an outdated CA bundle means TLS connections can fail with weird errors that look like network problems but aren't.
  ```bash
  pacman -Q ca-certificates
  curl -4 https://example.com -o /dev/null -w "%{http_code}\n"
  curl -6 https://example.com -o /dev/null -w "%{http_code}\n"
  ```

- [ ] **Firewall**
  There is currently no firewall running — no iptables, nftables, ufw, or firewalld. This means every port on the machine is open to the local network. On a home LAN behind a router with NAT this is usually fine, but if anyone else is on the same LAN (flatmates, IoT devices like that rogue TP-Link) they can reach any service running on your machine. A minimal firewall would: deny all inbound, allow all outbound, allow established/related (i.e. responses to things you initiated). `ufw` is the simplest option, `nftables` if you want more control.

- [ ] **DNS provider choice**
  Currently running a split setup: IPv4 uses `1.1.1.1` / `8.8.8.8` (Cloudflare/Google, set manually), IPv6 uses Telia ISP DNS (from DHCPv6). This works but is inconsistent — if one provider has an outage or filters differently, you'll get different behavior depending on which IP version a lookup happens over. Options:
  - **Stick with split** — it works, leave it alone
  - **Override both to Cloudflare/Google** — consistent, generally fast, no ISP filtering
  - **Override both to ISP** — slightly lower latency (closer servers), but ISP can log/filter
  - **Run a local resolver** (e.g. `systemd-resolved` with DoT) — privacy + caching, more setup
