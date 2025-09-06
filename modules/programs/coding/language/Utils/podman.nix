{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    podman
    podman-desktop
    podman-compose
  ];
}
