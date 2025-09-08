{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Which-key - Helix-style key bindings and hints
      which-key = {
        enable = true;
        settings = {
          delay = 200;
          expand = 1;
          notify = false;
          preset = false;
          replace = {
            desc = [
              ["<space>" "SPACE"]
              ["<leader>" "SPACE"]
              ["<cr>" "RETURN"]
              ["<tab>" "TAB"]
            ];
          };
          spec = [
            { __unkeyed-1 = "<leader>f"; group = "Find"; icon = ""; }
            { __unkeyed-1 = "<leader>g"; group = "Git"; icon = ""; }
            { __unkeyed-1 = "<leader>h"; group = "Hunks"; icon = ""; }
            { __unkeyed-1 = "<leader>l"; group = "LSP"; icon = ""; }
            { __unkeyed-1 = "<leader>s"; group = "Session"; icon = ""; }
            { __unkeyed-1 = "<leader>t"; group = "Toggle"; icon = ""; }
            { __unkeyed-1 = "<leader>b"; group = "Buffer"; icon = ""; }
            { __unkeyed-1 = "<leader>c"; group = "Code"; icon = ""; }
            { __unkeyed-1 = "<leader>d"; group = "Debug"; icon = ""; }
            { __unkeyed-1 = "<leader>w"; group = "Window"; icon = ""; }
            { __unkeyed-1 = "<leader>x"; group = "Diagnostics"; icon = ""; }
            { __unkeyed-1 = "<leader>z"; group = "Zen"; icon = ""; }
          ];
          win = {
            border = "rounded";
            padding = [1 2];
            title = true;
            title_pos = "center";
            zindex = 1000;
          };
          layout = {
            width = { min = 20; };
            spacing = 3;
          };
          keys = {
            scroll_down = "<c-d>";
            scroll_up = "<c-u>";
          };
          sort = ["local" "order" "group" "alphanum" "mod"];
          triggers = [
            { __unkeyed-1 = "<auto>"; mode = "nxsot"; }
          ];
        };
      };

      # Snacks.nvim - Modern UI enhancements
      snacks = {
        enable = true;
        settings = {
          bigfile = { enabled = true; };
          dashboard = { enabled = false; }; # Using alpha instead
          debug = { enabled = false; };
          git = { enabled = true; };
          gitbrowse = { enabled = true; };
          lazygit = { enabled = true; };
          notify = { enabled = true; };
          notifier = {
            enabled = true;
            timeout = 3000;
            width = { min = 40; max = 0.4; };
            height = { min = 1; max = 0.6; };
            margin = { top = 0; right = 1; bottom = 0; };
            padding = true;
            sort = ["level" "added"];
            icons = {
              error = "";
              warn = "";
              info = "";
              debug = "";
              trace = "";
            };
          };
          quickfile = { enabled = true; };
          rename = { enabled = true; };
          statuscolumn = {
            enabled = true;
            left = ["mark" "sign"];
            right = ["fold" "git"];
            folds = {
              open = true;
              git_hl = false;
            };
            git = {
              patterns = ["GitSign" "MiniDiffSign"];
            };
            refresh = 50;
          };
          terminal = {
            enabled = true;
            win = {
              position = "bottom";
              height = 0.4;
              width = 0.8;
              border = "rounded";
              title = " Terminal ";
              title_pos = "center";
            };
          };
          toggle = { enabled = true; };
          win = { enabled = true; };
          words = { enabled = true; };
          zen = {
            enabled = true;
            toggles = {
              dim = true;
              git_signs = false;
              mini_diff_signs = false;
              diagnostics = false;
              inlay_hints = false;
            };
            show = {
              statusline = false;
              tabline = false;
            };
            win = {
              backdrop = 0.95;
              keys = { q = "close"; };
            };
            zoom = {
              toggles = {
                dim = false;
                git_signs = true;
                mini_diff_signs = true;
                diagnostics = true;
                inlay_hints = true;
              };
            };
          };
        };
      };

      # Zen-mode - Distraction-free coding
      zen-mode = {
        enable = true;
        settings = {
          window = {
            backdrop = 0.95;
            width = 120;
            height = 1;
            options = {
              signcolumn = "no";
              number = false;
              relativenumber = false;
              cursorline = false;
              cursorcolumn = false;
              foldcolumn = "0";
              list = false;
            };
          };
          plugins = {
            options = {
              enabled = true;
              ruler = false;
              showcmd = false;
              laststatus = 0;
            };
            twilight = { enabled = true; };
            gitsigns = { enabled = false; };
            tmux = { enabled = false; };
            kitty = {
              enabled = false;
              font = "+4";
            };
          };
          on_open = {
            __raw = ''
              function(win)
                -- Custom zen mode setup
              end
            '';
          };
          on_close = {
            __raw = ''
              function()
                -- Custom zen mode cleanup
              end
            '';
          };
        };
      };

      # Twilight - Dim inactive code sections
      twilight = {
        enable = true;
        settings = {
          dimming = {
            alpha = 0.25;
            color = ["Normal" "#ffffff"];
            term_bg = "#000000";
            inactive = false;
          };
          context = 10;
          treesitter = true;
          expand = [
            "function"
            "method"
            "table"
            "if_statement"
          ];
          exclude = [];
        };
      };

      # Auto-format with conform.nvim
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = ["stylua"];
            nix = ["nixfmt"];
            rust = ["rustfmt"];
            go = ["gofumpt" "goimports"];
            javascript = [["prettierd" "prettier"]];
            typescript = [["prettierd" "prettier"]];
            javascriptreact = [["prettierd" "prettier"]];
            typescriptreact = [["prettierd" "prettier"]];
            json = [["prettierd" "prettier"]];
            yaml = [["prettierd" "prettier"]];
            markdown = [["prettierd" "prettier"]];
            html = [["prettierd" "prettier"]];
            css = [["prettierd" "prettier"]];
            scss = [["prettierd" "prettier"]];
            python = ["black" "isort"];
            c = ["clang_format"];
            cpp = ["clang_format"];
            java = ["google-java-format"];
            php = ["php_cs_fixer"];
            zig = ["zigfmt"];
            toml = ["taplo"];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          format_after_save = {
            lsp_format = "fallback";
          };
          log_level = "error";
          notify_on_error = true;
          notify_no_formatters = true;
          formatters = {
            stylua = { prepend_args = ["--indent-type" "Spaces" "--indent-width" "2"]; };
            nixfmt = { prepend_args = ["--width=100"]; };
            rustfmt = { prepend_args = ["--edition=2021"]; };
            black = { prepend_args = ["--line-length=88"]; };
            prettier = { prepend_args = ["--tab-width=2" "--single-quote"]; };
            prettierd = { prepend_args = ["--tab-width=2" "--single-quote"]; };
          };
        };
      };

      # Focus.nvim - Auto-resize splits and golden ratio
      focus = {
        enable = true;
        settings = {
          enable = true;
          commands = true;
          autoresize = {
            enable = true;
            width = 0;
            height = 0;
            minwidth = 0;
            minheight = 0;
            height_quickfix = 10;
          };
          split = { bufnew = false; tmux = false; };
          ui = {
            number = false;
            relativenumber = false;
            hybridnumber = false;
            absolutenumber_unfocussed = false;
            cursorline = true;
            cursorcolumn = false;
            colorcolumn = { enable = false; list = "+1"; };
            signcolumn = true;
            winhighlight = false;
          };
        };
      };

      # Nvim-colorizer - Color preview
      nvim-colorizer = {
        enable = true;
        settings = {
          filetypes = [
            "css" "scss" "html"
            "javascript" "typescript"
            "vue" "svelte" "lua"
          ];
          user_default_options = {
            RGB = true;
            RRGGBB = true;
            names = true;
            RRGGBBAA = false;
            AARRGGBB = false;
            rgb_fn = false;
            hsl_fn = false;
            css = false;
            css_fn = false;
            mode = "background";
            tailwind = false;
            sass = { enable = false; parsers = ["css"]; };
            virtualtext = "■";
            always_update = false;
          };
          buftypes = [];
        };
      };

      # Scrollbar with search/diagnostic indicators
      scrollbar = {
        enable = true;
        settings = {
          show = true;
          show_in_active_only = false;
          set_highlights = true;
          folds = 1000;
          max_lines = false;
          handle = {
            text = " ";
            blend = 30;
            color = null;
            color_nr = null;
            highlight = "CursorColumn";
            hide_if_all_visible = true;
          };
          marks = {
            Cursor = { text = "•"; priority = 0; highlight = "Normal"; };
            Search = { text = ["-" "="]; priority = 1; highlight = "Search"; };
            Error = { text = ["-" "="]; priority = 2; highlight = "DiagnosticVirtualTextError"; };
            Warn = { text = ["-" "="]; priority = 3; highlight = "DiagnosticVirtualTextWarn"; };
            Info = { text = ["-" "="]; priority = 4; highlight = "DiagnosticVirtualTextInfo"; };
            Hint = { text = ["-" "="]; priority = 5; highlight = "DiagnosticVirtualTextHint"; };
            Misc = { text = ["-" "="]; priority = 6; highlight = "Normal"; };
            GitAdd = { text = "┆"; priority = 7; highlight = "GitSignsAdd"; };
            GitChange = { text = "┆"; priority = 7; highlight = "GitSignsChange"; };
            GitDelete = { text = "▁"; priority = 7; highlight = "GitSignsDelete"; };
          };
          excluded_buftypes = ["terminal"];
          excluded_filetypes = [
            "cmp_docs" "cmp_menu" "noice"
            "prompt" "TelescopePrompt" "alpha"
          ];
          autocmd = {
            render = [
              "BufWinEnter" "TabEnter" "TermEnter"
              "WinEnter" "CmdwinLeave" "TextChanged"
              "VimResized" "WinScrolled"
            ];
            clear = [
              "BufWinLeave" "TabLeave"
              "TermLeave" "WinLeave"
            ];
          };
          handlers = {
            cursor = true;
            diagnostic = true;
            gitsigns = true;
            handle = true;
            search = false;
            ale = false;
          };
        };
      };

      # Satellite.nvim - Enhanced minimap
      satellite = {
        enable = true;
        settings = {
          current_only = false;
          winblend = 50;
          zindex = 40;
          excluded_filetypes = [
            "prompt" "TelescopePrompt"
            "noice" "notify" "neo-tree"
          ];
          width = 2;
          handlers = {
            cursor = { enable = true; overlap = true; priority = 1000; symbols = ["⎺" "⎻" "⎼" "⎽"]; };
            search = { enable = true; overlap = true; priority = 1000; symbols = ["⎺" "⎻" "⎼" "⎽"]; };
            diagnostic = { enable = true; overlap = true; priority = 1000; signs = ["-" "=" "≡"]; };
            gitsigns = {
              enable = true; overlap = false; priority = 1000;
              signs = { add = "│"; change = "│"; delete = "│"; };
            };
            marks = { enable = true; overlap = true; priority = 1010; signs = ["⎺" "⎻" "⎼" "⎽"]; };
            quickfix = { signs = ["⎺" "⎻" "⎼" "⎽"]; };
          };
        };
      };

      # Project management
      project-nvim = {
        enable = true;
        settings = {
          active = true;
          on_config_done = null;
          manual_mode = false;
          detection_methods = ["lsp" "pattern"];
          patterns = [".git" "_darcs" ".hg" ".bzr" ".svn" "Makefile" "package.json" "flake.nix"];
          ignore_lsp = {};
          exclude_dirs = [];
          show_hidden = false;
          silent_chdir = true;
          scope_chdir = "global";
          datapath = { __raw = "vim.fn.stdpath('data')"; };
        };
      };

      # Enhanced word motions
      leap = {
        enable = true;
        settings = {
          max_phase_one_targets = null;
          highlight_unlabeled_phase_one_targets = false;
          max_highlighted_traversal_targets = 10;
          case_sensitive = false;
          equivalence_classes = [" \t\r\n"];
          substitute_chars = {};
          safe_labels = ["s" "f" "n" "u" "t" "/." "S" "F" "N" "L" "H" "M" "U" "G" "T" "?" "Z"];
          labels = [
            "s" "f" "n" "j" "k" "l" "h" "o" "d" "w" "e" "m" "b"
            "u" "y" "v" "r" "g" "t" "a" "i" "p" "q" "c" "x" "z"
            "S" "F" "N" "J" "K" "L" "H" "O" "D" "W" "E" "M" "B"
            "U" "Y" "V" "R" "G" "T" "A" "I" "P" "Q" "C" "X" "Z"
          ];
          special_keys = {
            repeat_search = "<enter>";
            next_phase_one_target = "<enter>";
            next_target = ["<enter>" ";"];
            prev_target = ["<tab>" ","];
            next_group = "<space>";
            prev_group = "<tab>";
            multi_accept = "<enter>";
            multi_revert = "<backspace>";
          };
        };
      };

      # Better text objects
      nvim-surround = {
        enable = true;
        settings = {
          keymaps = {
            insert = "<C-g>s";
            insert_line = "<C-g>S";
            normal = "ys";
            normal_cur = "yss";
            normal_line = "yS";
            normal_cur_line = "ySS";
            visual = "S";
            visual_line = "gS";
            delete = "ds";
            change = "cs";
            change_line = "cS";
          };
          aliases = {
            a = ">"; # angle brackets
            b = ")"; # brackets
            B = "}"; # braces
            r = "]"; # square brackets
            q = ['"' "'" "`"];
          };
          highlight = { duration = 500; };
          move_cursor = "begin";
          indent_lines = { __raw = "function(char) return char:match('%s') end"; };
        };
      };

      # Enhanced marks
      marks = {
        enable = true;
        settings = {
          default_mappings = true;
          signs = true;
          cyclic = true;
          force_write_shada = false;
          refresh_interval = 250;
          sign_priority = { lower = 10; upper = 15; builtin = 8; bookmark = 20; };
          excluded_filetypes = ["qf" "NvimTree" "toggleterm" "TelescopePrompt" "alpha" "netrw"];
          excluded_buftypes = ["nofile" "terminal"];
          bookmark_0 = { sign = "⚑"; virt_text = "hello world"; annotate = false; };
          mappings = {};
        };
      };
    };

    # Lua config (unchanged from your version)
    extraConfigLua = ''
      -- (same Lua code you pasted above)
    '';
  };
}
