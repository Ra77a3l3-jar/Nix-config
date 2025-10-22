{ config, pkgs, pkgs-unstable, nixvim, nix-gaming, zen-browser, ... }:

{
  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/default.nix
    ./modules/programs/flatpak.nix
    
    ./modules/programs/coding/editor/default.nix

    ./modules/programs/coding/language/default.nix

    ./modules/programs/networking/default.nix

    ./modules/programs/robotics/default.nix
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
    mpv
    ffmpeg
    musikcube
    
    obsidian
    libreoffice
    discord
    bottles
    
    webex
  ] ++ (with pkgs-unstable; [

    zed-editor        
    opencode
    gapless
  
  ]) ++ [
    # External packages
    zen-browser.packages.${pkgs.system}.default
  ];

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  programs.home-manager.enable = true;
}
