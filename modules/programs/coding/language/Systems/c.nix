{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    gdb
    cmake
    cmake-language-server
    gnumake
  ];

  programs.helix.languages = {

    language = [
      {
        name = "c";
        scope = "source.c";
        language-servers = [ "clangd" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
  
}
