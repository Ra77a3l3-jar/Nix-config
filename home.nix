# /etc/nixos/home.nix
{ config, pkgs, pkgs-unstable, nixvim, nix-gaming, zen-browser, ... }:

{
  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/default.nix
    ./modules/programs/flatpak.nix
    
    ./modules/programs/coding/editor/default.nix

    ./modules/programs/coding/language/default.nix

    ./modules/programs/networking/default.nix
  ];
  
  home.username = "raffaele";
  home.homeDirectory = "/home/raffaele";
  home.stateVersion = "25.05";

  _module.args = { inherit pkgs-unstable; };

  home.packages = with pkgs; [
  
    ghostty
    
    bat
    eza
    atuin
    dust
    btop
    fzf
    fd
    ripgrep
    yazi
    glow
    unzip
    
    obsidian
    libreoffice
    discord
    bottles
    
    webex
  ] ++ (with pkgs-unstable; [

    zed-editor
    opencode
  
  ]);

  programs.home-manager.enable = true;
}
