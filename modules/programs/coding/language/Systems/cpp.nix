{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    
  ];

  programs.helix.languages = {

    language = [
      {
        name = "cpp";
        scope = "source.cpp";
        language-servers = [ "clangd" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
