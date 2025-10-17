{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # C toolchain
    clang
    clang-tools
    lldb
    gdb
    
    # Build tools specific to C
    cmake
    cmake-language-server
    gnumake
    # autoconf
    # automake
    # libtool
    
    # Graphics Libraries
    libGL
    libGLU
    mesa
    glfw
    glew.dev
    glm
    SDL2
    freeglut
    
    # X11 libraries
    # xorg.libX11
    # xorg.libXi
    # xorg.libXrandr
    # xorg.libXcursor
    # xorg.libXinerama
    # xorg.libXxf86vm
    # xorg.libXxf86dga
    # xorg.libXmu
    # xorg.libXpm
    # xorg.libXaw
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = pkgs.lib.makeSearchPath "lib/pkgconfig" [
      pkgs.libGL
      pkgs.libGLU
      pkgs.mesa
      pkgs.glfw
      pkgs.glew
    ];
  };

  programs.helix.languages = {
    language = [
      {
        name = "c";
        scope = "source.c";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
