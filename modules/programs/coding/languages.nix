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
    jdt-language-server

    # Rust
    rustup
    cargo-edit
    cargo-watch
    cargo-expand

    # Zig
    zig
    zls
  ];

  home.sessionVariables = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
    PATH = "$HOME/.cargo/bin:$PATH";
  };
}

