{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    clang
    clang-tools
    gnumake
    gdb
    cmake

    # Utils
    ncurses.dev
    ncurses
    pkg-config

    # Java
    jdk
    gradle

    # Zig
    zig
    zls

    # Rust
    rustup
  ];

  home.sessionVariables = {
    # You can add other environment variables here if needed
    PKG_CONFIG_PATH = "${pkgs.ncurses.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
    C_INCLUDE_PATH = "${pkgs.ncurses.dev}/include:$C_INCLUDE_PATH";
    LIBRARY_PATH = "${pkgs.ncurses}/lib:$LIBRARY_PATH";
  };
}

