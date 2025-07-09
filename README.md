<div align="center">

# 🔥 NixOS Configuration

### *A bulletproof, modular NixOS setup that just works*

[![NixOS](https://img.shields.io/badge/NixOS-25.05-blue.svg?style=for-the-badge&logo=nixos)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home%20Manager-25.05-green.svg?style=for-the-badge)](https://github.com/nix-community/home-manager)
[![Secure Boot](https://img.shields.io/badge/Secure%20Boot-Lanzaboote-red.svg?style=for-the-badge&logo=linux)](https://github.com/nix-community/lanzaboote)
[![Flakes](https://img.shields.io/badge/Flakes-Enabled-purple.svg?style=for-the-badge)](https://nixos.wiki/wiki/Flakes)

</div>

---

## 🎯 **What Makes This Special**

<table>
<tr>
<td width="50%">

### 🚀 **Lightning Fast**
- Declarative configuration
- Atomic upgrades & rollbacks
- Instant environment reproduction

### 🔒 **Fort Knox Security**
- Full UEFI Secure Boot chain
- Immutable system configuration
- Reproducible builds

</td>
<td width="50%">

### 🧩 **Modular Architecture**
- Clean separation of concerns
- Easy to extend & maintain
- Plug-and-play modules

### 💻 **Developer Heaven**
- Multi-language support
- Modern CLI tools
- Optimized workflow

</td>
</tr>
</table>

---

## 📦 **Core Features**

<div align="center">

| Component | Description | Status |
|-----------|-------------|---------|
| 🖥️ **Desktop** | GNOME with custom tweaks | ✅ Ready |
| 🛡️ **Security** | Lanzaboote Secure Boot | ✅ Ready |
| 🔧 **Development** | Rust, C/C++, Java, Zig | ✅ Ready |
| 🐚 **Shell** | Zsh + Oh My Zsh + Modern tools | ✅ Ready |
| 📱 **Terminal** | Ghostty with blur effects | ✅ Ready |
| 🎮 **Gaming** | Steam + Gaming optimizations | ✅ Ready |

</div>

---

## 🏗️ **Architecture**

<div align="center">

```
🌟 nixos-config/
├── 📄 configuration.nix          # System entry point
├── 🔒 flake.nix                 # Flake definition
├── 🏠 home.nix                  # User configuration
├── ⚙️ hardware-configuration.nix # Hardware specs
└── 📁 modules/
    ├── 🎯 core/                 # System foundations
    │   ├── 🌍 base.nix         # Localization & basics
    │   ├── 🔌 drivers.nix      # Hardware drivers
    │   ├── 🌐 networking.nix   # Network setup
    │   ├── 🛡️ security.nix     # Security policies
    │   ├── 🔧 services.nix     # System services
    │   ├── 📦 system-packages.nix # Core packages
    │   └── 👤 user.nix         # User management
    ├── 🖥️ desktop/
    │   └── 🎨 gnome.nix        # Desktop environment
    └── 🚀 programs/
        ├── 💻 coding/          # Development stack
        │   ├── 🖥️ ghostty.nix  # Terminal config
        │   ├── 📝 git.nix      # Version control
        │   ├── 🔤 languages.nix # Programming languages
        │   ├── ⚡ nvim.nix     # Editor setup
        │   └── 🐚 zsh.nix      # Shell configuration
        └── 🎮 gaming.nix       # Gaming setup
```

</div>

---

## ⚡ **Quick Start**

<div align="center">

### 🔥 **One-Command Installation**

</div>

```bash
# 1. Clone the magic
git clone https://github.com/Ra77a3l3-jar/Nix-config /etc/nixos && cd /etc/nixos

# 2. Generate your hardware config
sudo nixos-generate-config --root /mnt

# 3. Customize for your setup
vim configuration.nix home.nix

# 4. Deploy and enjoy!
sudo nixos-rebuild switch --flake .#nixos
```

---

## 🛡️ **Secure Boot Setup**

<div align="center">

### 🔐 **Military-Grade Security**

</div>

```bash
# Create and enroll keys
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft

# Sign bootloader
sudo sbctl sign -s /boot/EFI/systemd/systemd-bootx64.efi
sudo sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI

# Verify everything is locked down
sudo sbctl status
```

---

## 🎨 **Customization**

<div align="center">

### 🔧 **Make It Yours**

</div>

<table>
<tr>
<td width="50%">

**📦 Add Packages**
```nix
home.packages = with pkgs; [
  # Your awesome tools here
  discord
  spotify
  vscode
];
```

</td>
<td width="50%">

**🔄 Update System**
```bash
# Update inputs
nix flake update

# Apply changes
sudo nixos-rebuild switch --flake .#nixos
```

</td>
</tr>
</table>

---

## 💎 **Included Goodies**

<div align="center">

### 🛠️ **Development Arsenal**

| Language | Tools | Status |
|----------|-------|---------|
| 🦀 **Rust** | rustup, cargo tools | ✅ |
| ⚡ **Zig** | zig, zls | ✅ |
| ☕ **Java** | JDK, Gradle, LSP | ✅ |
| 🔧 **C/C++** | Clang, tools, analyzer | ✅ |

### 🎯 **Modern CLI Tools**

| Tool | Purpose | Why It's Awesome |
|------|---------|------------------|
| 🦇 **bat** | cat replacement | Syntax highlighting |
| 🔍 **fzf** | Fuzzy finder | Lightning fast search |
| 🌊 **zellij** | Terminal multiplexer | Modern tmux alternative |
| 🗂️ **eza** | ls replacement | Beautiful file listings |
| 💨 **dust** | du replacement | Disk usage visualization |

</div>

---

## 📚 **Resources**

<div align="center">

[![NixOS Manual](https://img.shields.io/badge/📖_NixOS_Manual-Learn_More-blue?style=for-the-badge)](https://nixos.org/manual/nixos/stable/)
[![Home Manager](https://img.shields.io/badge/🏠_Home_Manager-Documentation-green?style=for-the-badge)](https://nix-community.github.io/home-manager/)
[![Flakes Wiki](https://img.shields.io/badge/❄️_Flakes_Wiki-Advanced_Usage-purple?style=for-the-badge)](https://nixos.wiki/wiki/Flakes)

</div>

---

<div align="center">

### 🎉 **Ready to Experience NixOS Nirvana?**

*This configuration is battle-tested, production-ready, and designed to make your life easier.*

**⚠️ Always backup your data before switching configurations!**

---

*Made with ❤️ and lots of ☕ by a NixOS enthusiast*

</div>
