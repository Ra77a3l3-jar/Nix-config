<div align="center">

  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-logo-only-hires.png" alt="NixOS Logo" width="150">

  # NixOS Configuration

  ### *A meticulously crafted, modular, and feature-rich NixOS setup.*

  [![NixOS](https://img.shields.io/badge/NixOS-25.05-blue.svg?style=for-the-badge&logo=nixos)](https://nixos.org)
  [![Home Manager](https://img.shields.io/badge/Home%20Manager-25.05-green.svg?style=for-the-badge)](https://github.com/nix-community/home-manager)
  [![Flakes](https://img.shields.io/badge/Flakes-Enabled-purple.svg?style=for-the-badge)](https://nixos.wiki/wiki/Flakes)
  [![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>

---

## 🌟 Introduction

Welcome to my personal NixOS configuration! This repository contains a complete, modular, and reproducible setup for a development and gaming machine. It's designed to be easily maintainable and extensible, with a strong focus on providing a seamless and efficient user experience.

This configuration is built upon the power of Nix Flakes, ensuring that the entire system can be replicated with a single command. Whether you're a developer, a gamer, or just a NixOS enthusiast, you'll find something to love in this setup.

---

## 🚀 Features

This configuration is packed with features, all organized into logical modules. Here's a glimpse of what's inside:

### 的核心 (Core)

| Feature | Description |
|---|---|
| 🐧 **Kernel** | The latest stable Linux kernel for optimal performance and hardware support. |
| 🕰️ **Timezone** | Pre-configured for Europe/Rome. |
| 🌍 **Localization** | Italian localization with UTF-8 encoding. |
| 📦 **Nix** | Flakes and the new Nix command are enabled by default. |
| 🔓 **Unfree Packages** | Access to a wider range of software. |

### 🖥️ Desktop

| Feature | Description |
|---|---|
| 🎨 **GNOME** | A clean and modern GNOME desktop environment. |
| 🚀 **Performance** | Excludes unnecessary GNOME apps for a leaner experience. |
| 🔊 **Audio** | PipeWire for professional-grade audio. |
| 🎨 **Theming** | Yaru theme for a polished look and feel. |
| 🔧 **Tweaks** | Includes GNOME Tweaks and Extension Manager for easy customization. |

### ծրագրեր (Programs)

| Category | Tools |
|---|---|
| 셸 **Shells** | Zsh, Fish, Bash |
| 💻 **Terminals** | Ghostty, Kitty, Tmux |
| 📝 **Editors** | Helix, Zed, Neovim (via NixVim) |
| 🌐 **Browsers** | Firefox, Google Chrome (via Flatpak) |
| 🎮 **Gaming** | Steam, Lutris, Bottles, Gamemode, MangoHud, PrismLauncher |
| 📦 **Flatpak** | A selection of useful Flatpak applications. |
| 🛠️ **Utilities** | A vast collection of CLI and GUI tools to enhance your workflow. |

### 💻 Development

| Language/Tool | Included |
|---|---|
| 🦀 **Systems** | C, C++, Rust, Zig |
| 🌐 **Full-Stack** | JavaScript, TypeScript, HTML, CSS, Database Tools |
| 📜 **Scripting** | Python, Lua, Julia |
|  अन्य **Other** | Go, Java, Kotlin |
| 🔧 **Utilities** | Git, Docker, Lazygit, Zoxide, and many more! |

---

## 💾 Installation

> **Warning:** This configuration is highly personalized. Please review the code and adapt it to your needs before using it.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/Nix-config /etc/nixos
    cd /etc/nixos
    ```

2.  **Generate hardware configuration:**
    ```bash
    sudo nixos-generate-config --root /mnt
    ```
    > **Note:** This will create a `hardware-configuration.nix` file. You may need to merge it with the existing one.

3.  **Customize the configuration:**
    *   Edit `flake.nix` to match your system's architecture if it's not `x86_64-linux`.
    *   Modify `configuration.nix` and `home.nix` to suit your preferences. Pay close attention to the user and home directory settings.

4.  **Build and switch to the new configuration:**
    ```bash
    sudo nixos-rebuild switch --flake .#nixos
    ```

---

## 🖼️ Screenshots

*(Coming soon!)*

---

## 🤝 Contributing

This is a personal configuration, but I'm always open to suggestions and improvements. If you have any ideas, feel free to open an issue or submit a pull request.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

  *Made with ❤️ and a whole lot of Nix!*

</div>