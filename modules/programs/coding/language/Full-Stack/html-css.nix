{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    vscode-langservers-extracted
  ];

  programs.helix.languages = {

    language = [
      {
        name = "html";
        scope = "source.html";
        language-servers = [ "vscode-html-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "css";
        scope = "source.css";
        language-servers = [ "vscode-css-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "json";
        scope = "source.json";
        language-servers = [ "vscode-json-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
}
