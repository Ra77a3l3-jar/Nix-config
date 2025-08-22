# /etc/nixos/home.nix
{ config, pkgs, pkgs-unstable, nixvim, nix-gaming, zen-browser, ... }:

{
  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/default.nix
    ./modules/programs/flatpak.nix
    
    ./modules/programs/coding/editor/helix/default.nix
    ./modules/programs/coding/editor/jetBrains.nix
    ./modules/programs/coding/languages/default.nix
  ];
  
  home.username = "raffaele";
  home.homeDirectory = "/home/raffaele";
  home.stateVersion = "25.05";

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
    
    obsidian
    libreoffice
    discord
    bottles
    
    webex
  ] ++ (with pkgs-unstable; [

    zed-editor
  
  ]) ++ [
  
    zen-browser.packages.${pkgs.system}.default
    
  ];

  programs.home-manager.enable = true;
}
