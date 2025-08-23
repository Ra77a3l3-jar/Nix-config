
<div align="center">
  <a href="https://github.com/Ra77a3l3-jar/Nix-config">
    <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-logo-only-hires.png" alt="Logo" width="200" height="200">
  </a>

  <h3 align="center">Raffaele's NixOS Configuration</h3>

  <p align="center">
    An awesome NixOS configuration for a development and gaming machine!
    <br />
    <a href="https://github.com/Ra77a3l3-jar/Nix-config"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Ra77a3l3-jar/Nix-config/issues">Report Bug</a>
    ·
    <a href="https://github.com/Ra77a3l3-jar/Nix-config/issues">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

This repository contains my personal NixOS configuration. It's a complete, modular, and reproducible setup for a development and gaming machine. It's designed to be easily maintainable and extensible, with a strong focus on providing a seamless and efficient user experience.

Here's why this configuration is awesome:

*   **Reproducible:** Thanks to Nix Flakes, you can replicate this entire setup with a single command.
*   **Modular:** The configuration is broken down into logical modules, making it easy to understand and customize.
*   **Feature-Rich:** It comes packed with a wide range of tools and applications for development, gaming, and general use.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

This configuration is built with a lot of love and a few key technologies:

*   [![Nix][NixOS.org]][Nix-url]
*   [![Home Manager][Home-Manager.org]][Home-Manager-url]
*   [![Flakes][Flakes.org]][Flakes-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Before you begin, make sure you have a working NixOS installation with Flakes enabled.

*   **NixOS:** [https://nixos.org/download.html](https://nixos.org/download.html)
*   **Flakes:** [https://nixos.wiki/wiki/Flakes](https://nixos.wiki/wiki/Flakes)

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/Ra77a3l3-jar/Nix-config.git /etc/nixos
    cd /etc/nixos
    ```
2.  Generate your hardware configuration
    ```sh
    sudo nixos-generate-config --root /mnt
    ```
3.  Customize the configuration
    *   Edit `flake.nix` to match your system's architecture if it's not `x86_64-linux`.
    *   Modify `configuration.nix` and `home.nix` to suit your preferences. Pay close attention to the user and home directory settings.
4.  Build and switch to the new configuration
    ```sh
    sudo nixos-rebuild switch --flake .#nixos
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

This configuration is designed to be used as a daily driver. It includes a wide range of applications and tools for development, gaming, and general use. Here are a few highlights:

*   **Development:** The configuration includes a complete development environment for a variety of languages, including C, C++, Rust, Zig, Python, and more. It also includes popular editors like Helix and Zed.
*   **Gaming:** The configuration includes Steam, Lutris, and other tools to provide a great gaming experience on Linux.
*   **Customization:** The configuration is highly customizable. You can easily add or remove packages, change your desktop environment, and configure your system to your liking.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

*   [ ] Add more documentation
*   [ ] Add more tests
*   [ ] Add more features

See the [open issues](https://github.com/Ra77a3l3-jar/Nix-config/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Raffaele - [@your_twitter](https://twitter.com/your_twitter) - raffaele@example.com

Project Link: [https://github.com/Ra77a3l3-jar/Nix-config](https://github.com/Ra77a3l3-jar/Nix-config)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

I'd like to thank the following people and projects for their inspiration and support:

*   [NixOS](https://nixos.org/)
*   [Home Manager](https://github.com/nix-community/home-manager)
*   [Awesome Nix](https://github.com/nix-community/awesome-nix)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[product-screenshot]: images/screenshot.png
[NixOS.org]: https://img.shields.io/badge/NixOS-25.05-blue.svg?style=for-the-badge&logo=nixos
[Nix-url]: https://nixos.org/
[Home-Manager.org]: https://img.shields.io/badge/Home%20Manager-25.05-green.svg?style=for-the-badge
[Home-Manager-url]: https://github.com/nix-community/home-manager
[Flakes.org]: https://img.shields.io/badge/Flakes-Enabled-purple.svg?style=for-the-badge
[Flakes-url]: https://nixos.wiki/wiki/Flakes
