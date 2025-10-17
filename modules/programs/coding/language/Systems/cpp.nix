{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    # C++ specific tools (inherits clang from C)
    pkg-config
    valgrind
    
    # Performance analysis tools
    # perf-tools
    # strace
    # ltrace
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
