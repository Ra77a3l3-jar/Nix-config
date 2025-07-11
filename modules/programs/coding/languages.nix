{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    clang
    clang-tools
    clang-analyzer
    gnumake

    # Java
    jdk
    gradle

    # Zig
    zig
    zls
  ];

}

