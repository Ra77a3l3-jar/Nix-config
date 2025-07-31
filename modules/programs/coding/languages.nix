{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    clang
    clang-tools
    gnumake
    gdb
    cmake

    # Java
    jdk
    gradle

    # Zig
    zig
    zls

    # Rust
    rustup

    # Go
    go
    gopls
  ];

  home.sessionVariables = {
    # You can add other environment variables here if needed
  };
}

