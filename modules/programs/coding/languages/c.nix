{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    gcc
    gdb
    cmake
    gnumake
  ];
}
