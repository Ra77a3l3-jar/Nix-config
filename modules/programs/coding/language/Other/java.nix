{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    jdk
    jdt-language-server
    gradle
    maven
  ];

  programs.helix.languages = {

    language = [
      {
        name = "java";
        scope = "source.java";
        language-servers = [ "jdtls" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
