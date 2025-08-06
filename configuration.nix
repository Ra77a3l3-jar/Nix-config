# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/core/base.nix
      ./modules/desktop/gnome.nix
      
      ./modules/programs/coding/shell/default.nix
    ];

    home-manager.users.raffaele = {
      imports = [ ./home.nix ]; 
    };

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

  users.groups.raffaele = {};
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raffaele = {
    isNormalUser = true;
    group = "raffaele";
    description = "raffaele";
    extraGroups = [ "networkmanager" "wheel" ];
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
  ];

  services.flatpak.enable = true;

  documentation.dev.enable = true;
   
 }
