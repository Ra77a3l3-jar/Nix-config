{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil           # LSP per Nix

    marksman      # LSP per Markdown

    nodePackages.yaml-language-server
    taplo         # TOML LSP
    # xml has no lsp for helix
  ];
}
