{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    typescript
    typescript-language-server
  ];

  programs.helix.languages = {

    language = [
      {
        name = "javascript";
        scope = "source.js";
        language-servers = [ "typescript-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "typescript";
        scope = "source.ts";
        language-servers = [ "typescript-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "tsx";
        scope = "source.tsx";
        language-servers = [ "typescript-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
