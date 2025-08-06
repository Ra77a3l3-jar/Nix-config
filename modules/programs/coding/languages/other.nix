{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix & LSP
    nixpkgs-fmt
    nil           # LSP per Nix
    statix        # Linter Nix

    # Markdown
    marksman      # LSP per Markdown

    # YAML / TOML / JSON
    nodePackages.yaml-language-server
    taplo         # TOML LSP

    # XML
    libxml2
    xmlformat

    # Grammar / Spellcheck
    ltex-ls
  ];
}

