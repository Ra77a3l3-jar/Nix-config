<div align="center">

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Nix_snowflake.svg/240px-Nix_snowflake.svg.png" alt="NixOS Logo" width="160" height="160">

# 🔥 NixOS Configuration

### *A bulletproof, modular NixOS setup that just works*

[![NixOS](https://img.shields.io/badge/NixOS-25.05-blue.svg?style=for-the-badge&logo=nixos)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home%20Manager-25.05-green.svg?style=for-the-badge)](https://github.com/nix-community/home-manager)
[![Flakes](https://img.shields.io/badge/Flakes-Enabled-purple.svg?style=for-the-badge)](https://nixos.wiki/wiki/Flakes)
[![License](https://img.shields.io/badge/License-MIT-orange.svg?style=for-the-badge)](./LICENSE)

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
- Modern security practices
- Immutable system configuration
- Reproducible builds

</td>
<td width="50%">

### 🧩 **Modular Architecture**
- Clean separation of concerns
- Easy to extend & maintain
- Plug-and-play modules

### 💻 **Developer Heaven**
- 20+ programming languages
- Modern CLI tools & terminals
- Optimized development workflow

</td>
</tr>
</table>

---

## 📦 **Core Features**

<div align="center">

| Component | Description | Status |
|-----------|-------------|---------|
| 🖥️ **Desktop** | GNOME with custom tweaks | ✅ Ready |
| 🛡️ **Security** | Secure system configuration | ✅ Ready |
| 🔧 **Development** | Multi-language support | ✅ Ready |
| 🐚 **Shell** | Fish/Zsh + Modern tools | ✅ Ready |
| 📱 **Terminal** | Ghostty + Kitty with themes | ✅ Ready |
| 🎮 **Gaming** | Steam + Gaming optimizations | ✅ Ready |
| 🤖 **AI Tools** | Ollama, Gemini CLI, Qwen | ✅ Ready |

</div>

---

## 🏗️ **Architecture**

<div align="center">

```
🌟 nixos-config/
├── 📄 configuration.nix          # System entry point
├── 🔒 flake.nix                 # Flake definition & inputs
├── 🏠 home.nix                  # User configuration
├── ⚙️ hardware-configuration.nix # Hardware specs
└── 📁 modules/
    ├── 🎯 core/                 # System foundations
    │   ├── 🌍 base.nix         # Base system settings
    │   ├── 🌐 networking.nix   # Network configuration
    │   ├── 🛡️ security.nix     # Security policies
    │   ├── 🔧 services.nix     # System services
    │   ├── 📦 system-packages.nix # System packages
    │   └── 👤 user.nix         # User management
    ├── 🖥️ desktop/
    │   └── 🎨 gnome.nix        # GNOME configuration
    └── 🚀 programs/
        ├── 📱 flatpak.nix      # Flatpak support
        ├── 🎮 gaming.nix       # Gaming setup
        └── 💻 coding/          # Development stack
            ├── 📝 editor/      # Helix configuration
            ├── 🌐 language/    # Programming languages
            ├── 🐚 shell/       # Shell configurations
            └── 📟 terminals/   # Terminal emulators
```

</div>

---

## ⚡ **Quick Start**

<div align="center">

### 🔥 **One-Command Installation**

</div>

```bash
# 1. Clone the magic
git clone https://github.com/your-username/Nix-config && cd Nix-config

# 2. Customize for your setup
vim configuration.nix home.nix

# 3. Deploy and enjoy!
sudo nixos-rebuild switch --flake .#nixos
```

---

## 💎 **Development Arsenal**

<div align="center">

### 🖥️ **Systems Programming**

| Language | Tools | Status |
|----------|-------|---------|
| 🦀 **Rust** | rustup, cargo, analyzer | ✅ |
| ⚡ **Zig** | zig, zls | ✅ |
| 🔧 **C/C++** | gcc, clang, tools | ✅ |

### 🌐 **Web & Scripting**

| Language | Tools | Status |
|----------|-------|---------|
| 🐍 **Python** | python3, pip, tools | ✅ |
| 🟨 **JavaScript/TS** | node, npm, deno | ✅ |
| 🐹 **Go** | go, tools, LSP | ✅ |
| ☕ **Java/Kotlin** | JDK, gradle, LSP | ✅ |
| 🌙 **Lua/Julia** | interpreters, tools | ✅ |

### 📝 **Editors & Terminals**

| Tool | Purpose | Configuration |
|------|---------|---------------|
| ⚡ **Helix** | Primary editor | GitHub Dark theme |
| 🦄 **Zed Editor** | Modern IDE | Latest from unstable |
| 👻 **Ghostty** | Main terminal | VibrantInk theme |
| 🐱 **Kitty** | GPU terminal | Custom config |
| 🔄 **Tmux** | Multiplexer | Enhanced setup |

### 🐚 **Shell Environment**

| Tool | Purpose | Why It's Awesome |
|------|---------|------------------|
| 🐠 **Fish** | Alternative shell | Smart completions |
| 🔤 **Zsh** | Primary shell | Oh My Zsh included |
| 🦇 **Bat** | cat replacement | Syntax highlighting |
| 🔍 **Fzf** | Fuzzy finder | Lightning fast search |
| 🌊 **Zellij** | Terminal multiplexer | Modern tmux alternative |
| 🗂️ **Eza** | ls replacement | Beautiful file listings |
| 💨 **Dust** | du replacement | Disk usage visualization |
| 🔍 **Ripgrep** | grep replacement | Blazingly fast search |
| 📁 **Yazi** | File manager | Terminal file explorer |

</div>

---

## 🎨 **Aesthetics & Themes**

<div align="center">

### 🖥️ **Desktop Environment**
**GNOME 47** with dark theme preference and Adwaita styling

### 🌈 **Color Schemes**
- **System**: Adwaita Dark (GNOME default)
- **Terminals**: VibrantInk theme
- **Helix**: GitHub Dark High Contrast
- **Shell**: Custom Fish/Zsh themes

### 🔤 **Typography**
- **Terminal Font**: Ubuntu Nerd Font (14pt)
- **System Font**: Ubuntu (GNOME)

</div>

---

## 🎮 **Applications & Tools**

<div align="center">

### 📱 **GUI Applications**

| Category | Applications |
|----------|-------------|
| 🌐 **Browsers** | Firefox, Zen Browser |
| 📝 **Productivity** | Obsidian, LibreOffice |
| 💬 **Communication** | Discord, Webex |
| 🔒 **Security** | KeePassXC |
| 🎮 **Gaming** | Bottles, GameMode |
| 🛠️ **Development** | Zed Editor |

### 🤖 **AI & Modern Tools**

| Tool | Purpose |
|------|---------|
| 🦙 **Ollama** | Local AI models |
| ⚡ **Gemini CLI** | Google AI integration |
| 🧠 **Qwen Code** | Code generation AI |

</div>

---

## 🔄 **Daily Usage**

<div align="center">

### 🛠️ **System Management**

</div>

<table>
<tr>
<td width="50%">

**🔄 Update System**
```bash
# Update flake inputs
nix flake update

# Apply system changes
sudo nixos-rebuild switch --flake .#nixos
```

**🏠 Home Manager Only**
```bash
home-manager switch --flake .#raffaele
```

</td>
<td width="50%">

**🗑️ Cleanup**
```bash
# Garbage collect old generations
nix-collect-garbage -d
sudo nix-collect-garbage -d

# Remove old boot entries
sudo /run/current-system/bin/switch-to-configuration boot
```

**📦 Add Packages**
```nix
home.packages = with pkgs; [
  # Add your tools here
  your-favorite-app
];
```

</td>
</tr>
</table>

---

## 🛠️ **Customization**

<div align="center">

### 🔧 **Make It Yours**

</div>

- **System packages**: Edit `configuration.nix` or core modules
- **User packages**: Modify `home.nix` or specific program modules  
- **Desktop settings**: Adjust `modules/desktop/gnome.nix`
- **Development tools**: Configure files in `modules/programs/coding/`
- **Shell environment**: Customize `modules/programs/coding/shell/`

---

## 🎯 **Special Features**

<div align="center">

| Feature | Description | Benefit |
|---------|-------------|---------|
| 🔄 **Flakes** | Reproducible builds | Version-locked dependencies |
| 🏠 **Home Manager** | User configuration | Dotfiles as code |
| 📦 **Flatpak** | Additional apps | Access to more software |
| 🎮 **Gaming Setup** | Steam + tools | Optimized gaming experience |
| 🐳 **Docker Ready** | Container support | Development flexibility |
| 🔧 **Modular Design** | Clean architecture | Easy maintenance |

</div>

---

## 📚 **Resources**

<div align="center">

[![NixOS Manual](https://img.shields.io/badge/📖_NixOS_Manual-Learn_More-blue?style=for-the-badge)](https://nixos.org/manual/nixos/stable/)
[![Home Manager](https://img.shields.io/badge/🏠_Home_Manager-Documentation-green?style=for-the-badge)](https://nix-community.github.io/home-manager/)
[![Flakes Wiki](https://img.shields.io/badge/❄️_Flakes_Wiki-Advanced_Usage-purple?style=for-the-badge)](https://nixos.wiki/wiki/Flakes)

</div>

---

## 🤝 **Contributing**

<div align="center">

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

</div>

---

<div align="center">

### 🎉 **Ready to Experience NixOS Nirvana?**

*This configuration is battle-tested, production-ready, and designed to make your life easier.*

**⚠️ Always backup your data before switching configurations!**

---

### 📜 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Made with ❤️ and lots of ☕ by a NixOS enthusiast*

[![Made with Love](https://img.shields.io/badge/Made_with-❤️-red?style=for-the-badge)](https://github.com/your-username/Nix-config)
[![Powered by NixOS](https://img.shields.io/badge/Powered_by-NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)

**⭐ Star this repo if you found it helpful!**

</div>