# /etc/nixos/home.nix
{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/ghostty.nix
    ./modules/programs/flatpak.nix
    ./modules/programs/coding/languages.nix
    ./modules/programs/coding/git.nix
    ./modules/programs/coding/helix.nix
    ./modules/programs/coding/python.nix
  ];
  
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  home.packages = with pkgs; [

    ghostty
    warp-terminal
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

    obsidian
    libreoffice

    discord
    bottles
        
  ];

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
    TERM = "ghostty";
  };

}
