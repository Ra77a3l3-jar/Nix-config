# /etc/nixos/home.nix
{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
    
  imports = [
    ./modules/programs/coding/ghostty.nix
    ./modules/programs/flatpak.nix    
  ];
  
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  home.packages = with pkgs; [

    ghostty
    zellij

    bat
    eza
    atuin
    dust
    btop
    fzf
    ripgrep

    obsidian
    libreoffice

    neovim
    discord
        
  ];

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
    TERMINAL = "ghostty";
  };

}
