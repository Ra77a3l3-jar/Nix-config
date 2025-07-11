{ config, pkgs, lib, ... }:

let
  flatpakApps = [
    "io.github.flattool.Warehouse"
    "com.obsproject.Studio"
    "org.gnome.Boxes"
    "org.gnome.Papers"
    "io.github.alainm23.planify"
    "com.leinardi.gwe"
    "com.google.Chrome"
  ];
in {
  home.packages = [ pkgs.flatpak ];

  home.activation.flatpakSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Add Flathub remote for user if not exists
    ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

    # Install all flatpak apps for user if not installed
    for app in ${lib.concatStringsSep " " flatpakApps}; do
      if ! ${pkgs.flatpak}/bin/flatpak info --user "$app" >/dev/null 2>&1; then
        ${pkgs.flatpak}/bin/flatpak install -y --user flathub "$app"
      fi
    done
  '';
}

