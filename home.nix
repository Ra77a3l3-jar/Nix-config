# /etc/nixos/home.nix
{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/terminals/ghostty.nix
    ./modules/programs/coding/terminals/tmux.nix

    ./modules/programs/flatpak.nix
    ./modules/programs/coding/git.nix
    
    ./modules/programs/coding/editor/helix/default.nix
    ./modules/programs/coding/editor/jetBrains.nix

    ./modules/programs/coding/languages.nix
    ./modules/programs/coding/languages/python.nix
  ];
  
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  home.packages = with pkgs; [

    ghostty
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

    webex
        
  ];

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
    TERM = "ghostty";
  };

  
}
