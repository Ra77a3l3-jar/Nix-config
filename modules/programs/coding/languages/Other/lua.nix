{ pkgs, ... }:

{

  programs.helix.languages.language = [
    {
      name = "lua";
      scope = "source.lua";
      language-servers = [ "lua-language-server" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
  ];

  home.packages = with pkgs; [
    lua
    lua-language-server
  ];
}

