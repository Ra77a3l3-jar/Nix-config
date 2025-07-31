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
        {
          name = "go";
          language-servers = [ "gopls" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };
  };
}
