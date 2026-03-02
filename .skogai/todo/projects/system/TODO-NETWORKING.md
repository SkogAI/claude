# Networking — IPv4 / HTTPS / General

Handover document for the networking TODO item. Created 2026-02-10.

## Current State (updated 2026-02-10)

- **Interface:** `enp0s31f6` (Intel onboard ethernet), link UP, managed by NetworkManager
- **IPv6:** Working. Global address `2a02:1406:11f:4088:...`, gateway via router at `fe80::7ef1:7eff:feb1:e8b2`
- **IPv4:** Working — static `10.10.4.200/24`, gateway `10.10.4.9`, public IP `94.234.87.218`
- **DNS:** IPv4: `1.1.1.1`, `8.8.8.8` (manual). IPv6: `2a02:1400:15:100::1`, `2a02:1400:15:101::1` (DHCPv6, Telia)
- **HTTP/HTTPS:** Dual-stack working
- **Firewall:** None configured (no iptables, nftables, ufw, or firewalld active)
- **NM connection:** `"Wired connection 1"` — ipv4.method=manual, ipv4.may-fail=yes

## Root Cause: IPv4 Address Conflict (ACD)

DHCP is working — the server offers lease `10.10.4.2`. But NetworkManager's **Address Conflict Detection (ACD)** finds that IP is already claimed on the network by MAC `A0:1D:48:97:0B:50` (TP-Link device OUI). NM refuses to configure the address and logs:

```
IP address 10.10.4.2 cannot be configured because it is already in use in the network by host A0:1D:48:97:0B:50
dhcp4 (enp0s31f6): state changed new lease, address=10.10.4.2, acd conflict
```

This repeats every ~5 minutes as the DHCP lease renews with the same conflicting address. Because `ipv4.may-fail=yes`, NM proceeds without IPv4 and relies on IPv6.

## Applied Fix: Static IPv4 (Option C)

DHCP only offered `10.10.4.2` which conflicted with a TP-Link device. Changing the DHCP client-id (Option B) didn't help — server gave the same address. Applied static config:

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.method manual \
  ipv4.addresses "10.10.4.200/24" \
  ipv4.gateway "10.10.4.9" \
  ipv4.dns "1.1.1.1,8.8.8.8"
```

**Notes:**
- Gateway is `10.10.4.9` (not `.1` as originally guessed)
- DHCP client-id is still set to `skogix-workstation` (harmless, ignored in manual mode)
- The TP-Link device conflict at `A0:1D:48:97:0B:50` / `10.10.4.2` remains unresolved but no longer affects us

### To revert to DHCP later

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.method auto \
  ipv4.addresses "" \
  ipv4.gateway "" \
  ipv4.dns ""
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up "Wired connection 1"
```

## Follow-up Tasks

After IPv4 is working:

- [x] **Verify dual-stack:** IPv4 `94.234.87.218` confirmed working, IPv6 was already working
- [ ] **DNS for both stacks:** `dig A example.com` and `dig AAAA example.com` should resolve
- [ ] **HTTPS/TLS:** Verify system CA certificates are current (`pacman -Q ca-certificates`)
- [ ] **Firewall:** No firewall is running. Consider setting up `nftables` or `ufw` for basic ingress filtering (especially if on a shared LAN). Minimal config: deny inbound, allow outbound, allow established/related.
- [ ] **Persistent DNS:** Currently DNS comes from DHCPv6 (Telia). Consider whether to keep ISP DNS or override with `1.1.1.1` / `8.8.8.8` for reliability.

## Diagnostic Commands Reference

```bash
# Check current IP addresses
ip -4 addr show enp0s31f6
ip -6 addr show enp0s31f6

# Check NM connection details
nmcli device show enp0s31f6

# Watch for DHCP/ACD issues in real-time
journalctl -u NetworkManager -f

# Test connectivity on specific IP version
curl -4 https://ifconfig.me
curl -6 https://ifconfig.me

# Check routing
ip route show
ip -6 route show

# Check ARP table for conflicting device
ip neigh show

# Check firewall state
nft list ruleset
```
