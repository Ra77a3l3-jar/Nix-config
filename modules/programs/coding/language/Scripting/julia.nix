{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
     julia
  ];

  programs.helix.languages = {

    language = [
      {
        name = "julia";
        scope = "source.julia";
        language-servers = [ "julia" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
