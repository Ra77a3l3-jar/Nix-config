{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    clang
    clang-tools
    gnumake
    gdb

    # Java
    jdk
    gradle

    # Zig
    zig
    zls
  ];

  home.sessionVariables = {
    # You can add other environment variables here if needed
  };
}

