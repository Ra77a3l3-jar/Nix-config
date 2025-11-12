# 🔥 NixOS Configuration

Modular, reproducible NixOS setup with flakes and Secure Boot.

## Tech Stack

<p align="left">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=nixos,linux,git" />
  </a>
</p>

## Features

- Flakes-based configuration
- Lanzaboote Secure Boot support
- Home Manager integration
- Modular architecture
- GNOME desktop environment
- Multi-language development environment

## Quick Start

```bash
git clone https://github.com/Ra77a3l3-jar/Nix-config /etc/nixos && cd /etc/nixos
sudo nixos-generate-config --root /mnt
sudo nixos-rebuild switch --flake .#nixos
```

## Secure Boot Setup

```bash
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl sign -s /boot/EFI/systemd/systemd-bootx64.efi
sudo sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI
sudo sbctl status
```

## Structure

```
nixos-config/
├── configuration.nix
├── flake.nix
├── home.nix
├── hardware-configuration.nix
└── modules/
    ├── core/          # System foundations
    ├── desktop/       # Desktop environment
    └── programs/      # Development tools
```

## Modules

**Core**
- Base system (localization, boot)
- Networking & drivers
- Security & services
- User management

**Desktop**
- GNOME with custom tweaks

**Programs**
- **Coding**: Helix, JetBrains IDEs
- **Languages**: 
  <p align="left">
    <img src="https://skillicons.dev/icons?i=rust,zig,c,cpp,java,python,docker,arduino" />
  </p>
- **Shell**: Fish, Zsh with modern tools
- **Terminals**: Ghostty, Kitty, Zellij
- **Networking**: Docker
- **Robotics**: Arduino, design tools

## Update

```bash
nix flake update
sudo nixos-rebuild switch --flake .#nixos
```
