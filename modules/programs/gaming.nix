{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
    lutris
    gamemode
    mangohud
    protonup-qt
    prismlauncher
    bottles
  ];

  # For gamemode service if you want to enable it system-wide
  services.gamemode.enable = true;

  # If you want to add some extra config for steam or proton,
  # usually you configure inside the apps, not here.

}

