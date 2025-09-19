{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    jetbrains.idea-community
  ];  
  
}
