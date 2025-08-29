{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
     rustup

  ];

  programs.helix.languages = {

    language = [
      {
        name = "rust";
        scope = "source.rust";
        language-servers = [ "rust-analyzer" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
