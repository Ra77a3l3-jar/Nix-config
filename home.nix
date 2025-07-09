# /etc/nixos/home.nix
{ config, pkgs, ... }:

{
  
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  home.packages = with pkgs; [
    lazygit
    ghostty
    
  ];

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
  };

}
