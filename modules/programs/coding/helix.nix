{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "ayu_evolve";

      editor = {
        scrolloff = 999;
        line-number = "relative";
        bufferline = "multiple";
        mouse = false;
        auto-format = true;
        true-color = true;
        auto-completion = true;
        completion-replace = true;

        cursor-shape = {
          insert = "bar";
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
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };

      language-server = {
        zls = {
          command = "zls";
        };
      };
    };

    languages = {
      language = [
        {
          name = "java";
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "zig";
          language-servers = [ "zls" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "c";
          language-servers = [ "clangd" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "cpp";
          language-servers = [ "clangd" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };
  };
}
