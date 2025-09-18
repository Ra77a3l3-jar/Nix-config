{ pkgs-unstable, ... }:

{

  home.packages = with pkgs-unstable; [
    arduino-ide
    arduino-cli
  ];
  
}
