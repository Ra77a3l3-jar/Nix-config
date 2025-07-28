{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    clang
    clang-tools
    gnumake
    gdb
    cmake

    # Graphics
    ncurses

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
  };
}

