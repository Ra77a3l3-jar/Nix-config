{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ./modules/core/base.nix

      ./modules/desktop/gnome.nix

      ./modules/programs/coding/shell/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
     enable = true;
     setSocketVariable = true;
  };

  users.groups.raffaele = {};
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raffaele = {
    isNormalUser = true;
    group = "raffaele";
    description = "raffaele";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     sbctl
     helix
     git
     keepassxc
     wget
     curl
     tree
     lazygit
     zoxide
     man-pages
     man-pages-posix
     eza
     glow
  ] ++ (with pkgs-unstable; [

  ]);

  services.flatpak.enable = true;

  documentation.dev.enable = true;
   
}
