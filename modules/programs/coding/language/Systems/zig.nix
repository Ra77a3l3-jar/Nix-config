{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    zig
    zls
  ];

  programs.helix.languages = {

    language = [
      {
        name = "zig";
        scope = "source.zig";
        language-servers = [ "zls" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
