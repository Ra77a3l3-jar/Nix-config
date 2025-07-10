{ config, pkgs, lib, ... }:

let
  flatpakApps = [
    "io.github.flattool.Warehouse"
    "com.discordapp.Discord"
    "com.obsproject.Studio"
    "org.gnome.Boxes"
    "org.gnome.Papers"
    "io.github.alainm23.planify"
    "com.leinardi.gwe"
    "io.missioncenter.MissionCenter"
    "dev.zed.Zed"
    "com.google.Chrome"
  ];
in {
  home.packages = [ pkgs.flatpak ];

  home.activation.flatpakSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    for app in ${lib.concatStringsSep " " flatpakApps}; do
      if ! ${pkgs.flatpak}/bin/flatpak info "$app" >/dev/null 2>&1; then
        ${pkgs.flatpak}/bin/flatpak install -y flathub "$app"
      fi
    done
  '';
}
