{ pkgs-unstable, ... }:

{

  home.pacakges = with pkgs-unstable; [
    arduino-ide
    arduino-cli
  ];
  
}
