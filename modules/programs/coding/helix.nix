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

    themes = {
      rose-pine-primeagean = {
        inherits = "rose-pine";

        # Make the background pitch black
        "ui.background" = "black";

        # Cursor and selection tweaks
        "ui.cursor" = "#ebbcba";
        "ui.cursor.primary" = "#ebbcba";
        "ui.selection" = "#2a273f";
        "ui.statusline" = "#191724";
        "ui.statusline.inactive" = "#1f1d2e";

        # Syntax tweaks (Prime-like)
        "comment" = "#6e6a86";
        "constant" = "#9ccfd8";
        "string" = "#f6c177";
        "keyword" = "#f07178";        # more saturated pink
        "function" = "#c792ea";
        "type" = "#82aaff";
        "constructor" = "#ea9a97";
        "label" = "#f6c177";
        "operator" = "#c4a7e7";
        "variable" = "#e0def4";
        "attribute" = "#f6c177";
        "namespace" = "#c4a7e7";
        "special" = "#eb6f92";
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
        {
          name = "python";
          language-servers = [ "pylsp" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };
  };
}
