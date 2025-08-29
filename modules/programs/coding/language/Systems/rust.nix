{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
     rustup

     # For the GitStream project
     openssl
     openssl.dev
     libgit2
     libgit2.dev
  ];

  programs.helix.languages = {

    language = [
      {
        name = "rust";
        scope = "source.rust";
        language-servers = [ "rust-analyzer" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
