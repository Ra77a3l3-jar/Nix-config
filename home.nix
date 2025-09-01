{ config, pkgs, pkgs-unstable, nixvim, nix-gaming, zen-browser, ... }:

{
  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/default.nix
    ./modules/programs/flatpak.nix
    #./modules/programs/gaming.nix
    
    ./modules/programs/coding/editor/helix/default.nix

    ./modules/programs/coding/language/default.nix
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
    
    obsidian
    libreoffice
    discord
    bottles
    
    webex
  ] ++ (with pkgs-unstable; [

    zed-editor
    opencode
    gemini-cli
    tmux
  
  ]);

  programs.home-manager.enable = true;
}
