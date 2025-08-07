{ pkgs, ... }:

{

  home.packages = with pkgs; [
    nil                               # LSP for Nix
    marksman                          # LSP for Markdown
    nodePackages.yaml-language-server
    taplo                             # LSP for TOML
  ];

  programs.helix.languages.language = [
    {
      name = "nix";
      scope = "source.nix";
      language-servers = [ "nil" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "markdown";
      scope = "source.md";
      language-servers = [ "marksman" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "yaml";
      scope = "source.yaml";
      language-servers = [ "yaml-language-server" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "toml";
      scope = "source.toml";
      language-servers = [ "taplo" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
  ];
}

