{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    gdb
    cmake
    cmake-language-server
    gnumake
    lldb
  ];
}
