{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    kotlin
    kotlin-language-server
  ];

  programs.helix.languages = {

    language = [
      {
        name = "kotlin";
        scope = "source.kotlin";
        language-servers = [ "kotlin-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
