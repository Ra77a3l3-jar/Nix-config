{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    freecad
  ] ++ (with pkgs-unstable; [
    # kicad
  ]);
  
}
