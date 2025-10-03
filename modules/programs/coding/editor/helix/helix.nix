{ pkgs, pkgs-unstable, ... }:

{
  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;

    settings = {
      # theme = "github_dark_high_contrast";
      # theme = "ashen";
      # theme = "ayu_evolve";
       theme = "base16-black-metal";
      # theme = "base16-black-metal-vibrant";

      
      editor = {
        scrolloff = 999;
        line-number = "relative";
        bufferline = "multiple";
        mouse = false;
        auto-format = true;
        true-color = true;
        auto-completion = true;

        cursor-shape = {
          insert = "block";
          normal = "block";
          select = "block";
        };

        indent-guides = {
          render = true;
          character = "|";
          skip-levels = 1;
        };

        statusline = {
          left = [ "mode" "spinner" "file-name" ];
          center = [ "version-control" ];
          right = [ "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
          separator = "│";
          mode = {
            normal = "NOR";
            insert = "INS";
            select = "SEL";
          };
        };
      };
    };
  };
}
