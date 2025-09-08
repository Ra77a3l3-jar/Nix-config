{ config, lib, pkgs, ... }:

{
  imports = [
    ./ui.nix
    ./editor.nix
    ./lsp.nix
    ./completion.nix
    ./git.nix
    ./navigation.nix
    ./mini.nix
    ./treesitter.nix
    ./terminal.nix
    ./utils.nix
  ];
}
