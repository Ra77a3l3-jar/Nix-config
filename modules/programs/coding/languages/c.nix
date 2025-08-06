{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    #gcc cant have clang and gcc at the same time
    gdb
    cmake
    gnumake
  ];
}
