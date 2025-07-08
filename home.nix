# /etc/nixos/home.nix
{ config, pkgs, ... }:

{
  # Define your user. Don't forget to change "yourusername".
  home.username = "raffaele"; # Replace 'root' with your actual username
  home.homeDirectory = "/home/raffaele"; # Replace '/root' with your actual home directory (e.g., "/home/yourusername")

  # Set state version for Home Manager
  home.stateVersion = "25.05"; # Match this with your Home Manager release (or a compatible one)

  # List packages that you want to install for your user
  home.packages = with pkgs; [
    lazygit
    ghostty
    # Add any other user-specific packages here
  ];

  # Example: Configure your shell (e.g., Zsh)
  programs.zsh = {
    enable = true;
    shellAliases = {
    };
    # ... more zsh configuration
  };

  # Example: Git configuration
  programs.git = {
    enable = true;
    userName = "Ra77a3l3-jar";
    userEmail = "raffaelemeo77@gmail.com";
  };

  # Example: Environment variables
  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "firefox";
  };

  # You can also manage dotfiles
  # home.file.".config/my-app/config.conf".source = ./my-app-config.conf;

  # Other Home Manager options...
}
