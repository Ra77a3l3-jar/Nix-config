{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    gopls
    go
  ];

  programs.helix.languages = {

    language = [
      {
        name = "go";
        scope = "source.go";
        language-servers = [ "gopls" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
