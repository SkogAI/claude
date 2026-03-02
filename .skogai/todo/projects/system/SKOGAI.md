# skogix-workstation inventory

Quick-reference inventory. Updated 2026-02-10.

## Host

| Key | Value |
|---|---|
| Hostname | `skogix-workstation` |
| OS | Arch Linux (installed 2026-02-10 via archinstall) |
| Kernel | linux (standard, not lts) |
| CPU | Intel i7-7700K @ 4.20GHz |
| RAM | 16GB |
| GPU | NVIDIA GeForce GTX 1070 (`nvidia-open-dkms`) |
| Boot | UEFI, systemd-boot |

## Disk

| Mount | Device | Filesystem |
|---|---|---|
| `/boot` | `/dev/nvme0n1p1` | FAT32 (EFI) |
| `/` | `ArchinstallVg/root` | ext4, ~30GB |
| `/home` | `ArchinstallVg/home` | ext4, ~190GB (nvme0n1p2 + p3) |
| swap | zram | no swap partition |
| `/mnt/sda1` | SATA drive | backups/projects from previous installs |

## Network

| Key | Value |
|---|---|
| Interface | `enp0s31f6` (Intel onboard ethernet) |
| MAC | `60:45:CB:A9:11:91` |
| Manager | NetworkManager |
| NM connection | `Wired connection 1` |
| IPv4 method | **static** (was DHCP, changed due to ACD conflict) |
| IPv4 address | `10.10.4.200/24` |
| IPv4 gateway | `10.10.4.9` |
| IPv4 DNS | `1.1.1.1`, `8.8.8.8` (manual) |
| IPv6 | auto (working), global addr `2a02:1406:11f:4088:...` |
| IPv6 gateway | `fe80::7ef1:7eff:feb1:e8b2` (MAC `7c:f1:7e:b1:e8:b2`) |
| IPv6 DNS | `2a02:1400:15:100::1`, `2a02:1400:15:101::1` (Telia, via DHCPv6) |
| Public IPv4 | `94.234.87.218` |
| ISP | Telia / Bredbandsbolaget |
| Firewall | **none** |

### Known network issues

| Issue | Status |
|---|---|
| DHCP offers `10.10.4.2` which conflicts with TP-Link device `A0:1D:48:97:0B:50` | **worked around** (static IP) |
| TP-Link device identity unknown | unresolved |
| No firewall | open, see TODO |
| Split DNS (IPv4 manual, IPv6 ISP) | open, see TODO |

## Desktop

| Key | Value |
|---|---|
| Display manager | LightDM (lightdm-gtk-greeter) |
| WM | i3 (`$mod = Mod4`) |
| Terminal | kitty |
| Launcher | dmenu |
| Lock | i3lock via xss-lock |
| Audio | PipeWire (pulse, jack, alsa, wireplumber) |
| Browser | Chromium |

## Locale / Input

| Key | Value |
|---|---|
| Layout | `se` variant `us_dvorak` (Swedish Dvorak) |
| Console keymap | `se-lat6` |
| Locale | `en_US.UTF-8` |
| Timezone | `Europe/Stockholm` |
| Remaps | CapsLock <-> Escape (`caps:swapescape`) |

## Installed Software (base via archinstall)

Core: base, linux, linux-headers, linux-firmware, intel-ucode, sudo, lvm2, efibootmgr, dkms
GPU: nvidia-open-dkms, libva-nvidia-driver
Desktop: i3-wm, i3blocks, i3lock, i3status, lightdm, lightdm-gtk-greeter, xorg-xinit, xss-lock, xdg-utils, dmenu
Audio: pipewire, pipewire-alsa, pipewire-jack, pipewire-pulse, libpulse, wireplumber, gst-plugin-pipewire
Network: networkmanager, network-manager-applet, iwd, wpa_supplicant, wireless_tools, wget

## Installed Software (user-installed)

Browser: chromium
Terminal/Editor: kitty, neovim
Tools: git, github-cli, bitwarden
Dev: claude code (`~/.local/bin`)

# TODO-NETWORKING

the handover and working state of the network problems and its current state is found at @TODO-NETWORKING.md
