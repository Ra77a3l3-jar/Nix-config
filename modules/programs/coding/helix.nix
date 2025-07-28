{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "ayu_custom";

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
      aye_custom = {
        inherits = "aye_evolve";

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
