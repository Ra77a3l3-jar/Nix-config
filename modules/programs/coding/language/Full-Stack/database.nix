{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    sqlite
    postgresql
    mysql-client

    php
    intelephense
    
  ];

  programs.helix.languages = {

    language = [
      {
        name = "php";
        scope = "source.php";
        language-servers = [ "intelephense" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "sql";
        scope = "source.sql";
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
