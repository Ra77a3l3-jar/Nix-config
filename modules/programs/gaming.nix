<<<<<<< Updated upstream

=======
{ config, pkgs, lib, ... }:

{
  # Gamemode for performance tweaks
  programs.gamemode.enable = true;

  # Steam and Proton setup
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    extraPackages = with pkgs; [
      mangohud        # In-game overlay and performance metrics
      protonup-qt     # GUI to manage Proton-GE
    ];
  };

  # Lutris for Wine games
  programs.lutris.enable = true;

  # Modrinth Launcher (PrismLauncher recommended for Modrinth)
  environment.systemPackages = with pkgs; [
    prismlauncher
    gamemode
    mangohud
    lutris
    steam
    protonup-qt
    bottles              # Optional: GUI to manage Wine/Proton environments
  ];

}
>>>>>>> Stashed changes
