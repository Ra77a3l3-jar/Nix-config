# /etc/nixos/home.nix
{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/ghostty.nix
    ./modules/programs/flatpak.nix
    ./modules/programs/coding/languages.nix
    ./modules/programs/coding/git.nix
    ./modules/programs/coding/helix.nix
    ./modules/programs/coding/python.nix
    ./modules/programs/coding/jetBrains.nix
  ];
  
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  home.packages = with pkgs; [

    ghostty
    tmux
    code-cursor

    bat
    eza
    atuin
    dust
    btop
    fzf
    fd
    ripgrep
    yazi

    lazydocker

    obsidian
    libreoffice

    discord
    bottles

    nuclear
  
    ollama
    lmstudio

    webex
        
  ];

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
    TERM = "ghostty";
  };

  
}
