{ config, lib, pkgs, nixvim, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # Import all configuration modules
    imports = [
      ./config
      ./theme
      ./plugins
      ./languages
      ./keymaps
    ];
  };

  # Ensure required packages are available
  home.packages = with pkgs; [
    # Core dependencies
    ripgrep
    fd
    fzf
    git
    lazygit

    # Language servers
    clang-tools        # clangd for C/C++
    jdt-language-server # Java
    rust-analyzer      # Rust
    gopls             # Go
    nil               # Nix
    marksman          # Markdown
    zls               # Zig
    nodePackages.typescript-language-server # TypeScript/JavaScript
    nodePackages.vscode-langservers-extracted # HTML, CSS, JSON
    taplo             # TOML
    yaml-language-server # YAML
    nodePackages.intelephense # PHP
    pyright           # Python

    # Formatters
    nodePackages.prettier
    stylua
    nixfmt-rfc-style
    rustfmt
    gofmt

    # Additional tools
    tree-sitter
    nodejs
    python3
    cargo
    go
  ];
}
