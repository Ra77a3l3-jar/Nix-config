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
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>h";
              group = "Hunks";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>l";
              group = "LSP";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "Session";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "Toggle";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffer";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>d";
              group = "Debug";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "Window";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>x";
              group = "Diagnostics";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>z";
              group = "Zen";
              icon = "";
            }
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
            stylua = {
              prepend_args = ["--indent-type" "Spaces" "--indent-width" "2"];
            };
            nixfmt = {
              prepend_args = ["--width=100"];
            };
            rustfmt = {
              prepend_args = ["--edition=2021"];
            };
            black = {
              prepend_args = ["--line-length=88"];
            };
            prettier = {
              prepend_args = ["--tab-width=2" "--single-quote"];
            };
            prettierd = {
              prepend_args = ["--tab-width=2" "--single-quote"];
            };
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
          split = {
            bufnew = false;
            tmux = false;
          };
          ui = {
            number = false;
            relativenumber = false;
            hybridnumber = false;
            absolutenumber_unfocussed = false;
            cursorline = true;
            cursorcolumn = false;
            colorcolumn = {
              enable = false;
              list = "+1";
            };
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
            "css"
            "scss"
            "html"
            "javascript"
            "typescript"
            "vue"
            "svelte"
            "lua"
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
            Cursor = {
              text = "•";
              priority = 0;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "Normal";
            };
            Search = {
              text = ["-" "="];
              priority = 1;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "Search";
            };
            Error = {
              text = ["-" "="];
              priority = 2;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "DiagnosticVirtualTextError";
            };
            Warn = {
              text = ["-" "="];
              priority = 3;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "DiagnosticVirtualTextWarn";
            };
            Info = {
              text = ["-" "="];
              priority = 4;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "DiagnosticVirtualTextInfo";
            };
            Hint = {
              text = ["-" "="];
              priority = 5;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "DiagnosticVirtualTextHint";
            };
            Misc = {
              text = ["-" "="];
              priority = 6;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "Normal";
            };
            GitAdd = {
              text = "┆";
              priority = 7;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "GitSignsAdd";
            };
            GitChange = {
              text = "┆";
              priority = 7;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "GitSignsChange";
            };
            GitDelete = {
              text = "▁";
              priority = 7;
              gui = null;
              color = null;
              cterm = null;
              color_nr = null;
              highlight = "GitSignsDelete";
            };
          };
          excluded_buftypes = [
            "terminal"
          ];
          excluded_filetypes = [
            "cmp_docs"
            "cmp_menu"
            "noice"
            "prompt"
            "TelescopePrompt"
            "alpha"
          ];
          autocmd = {
            render = [
              "BufWinEnter"
              "TabEnter"
              "TermEnter"
              "WinEnter"
              "CmdwinLeave"
              "TextChanged"
              "VimResized"
              "WinScrolled"
            ];
            clear = [
              "BufWinLeave"
              "TabLeave"
              "TermLeave"
              "WinLeave"
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
            "prompt"
            "TelescopePrompt"
            "noice"
            "notify"
            "neo-tree"
          ];
          width = 2;
          handlers = {
            cursor = {
              enable = true;
              overlap = true;
              priority = 1000;
              symbols = ["⎺" "⎻" "⎼" "⎽"];
            };
            search = {
              enable = true;
              overlap = true;
              priority = 1000;
              symbols = ["⎺" "⎻" "⎼" "⎽"];
            };
            diagnostic = {
              enable = true;
              overlap = true;
              priority = 1000;
              signs = {"-" "=" "≡"};
            };
            gitsigns = {
              enable = true;
              overlap = false;
              priority = 1000;
              signs = {
                add = "│";
                change = "│";
                delete = "│";
              };
            };
            marks = {
              enable = true;
              overlap = true;
              priority = 1010;
              signs = {"⎺" "⎻" "⎼" "⎽"};
            };
            quickfix = {
              signs = {"⎺" "⎻" "⎼" "⎽"};
            };
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
          datapath = {
            __raw = "vim.fn.stdpath('data')";
          };
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
          safe_labels = [
            "s" "f" "n" "u" "t" "/."
            "S" "F" "N" "L" "H" "M" "U" "G" "T" "?" "Z"
          ];
          labels = [
            "s" "f" "n"
            "j" "k" "l" "h" "o" "d" "w" "e" "m" "b"
            "u" "y" "v" "r" "g" "t" "a" "i" "p" "q" "c"
            "x" "z" "S" "F" "N"
            "J" "K" "L" "H" "O" "D" "W" "E" "M" "B"
            "U" "Y" "V" "R" "G" "T" "A" "I" "P" "Q" "C"
            "X" "Z"
          ];
          special_keys = {
            repeat_search = "<enter>";
            next_phase_one_target = "<enter>";
            next_target = {"<enter>" ";"};
            prev_target = {"<tab>" ","};
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
            ["a"] = ">"; # >a< angle brackets
            ["b"] = ")"; # >b< brackets
            ["B"] = "}"; # >B< Braces
            ["r"] = "]"; # >r< square brackets
            ["q"] = {'"' "'" "`"};
          };
          highlight = {
            duration = 500;
          };
          move_cursor = "begin";
          indent_lines = {
            __raw = "function(char) return char:match('%s') end";
          };
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
          excluded_filetypes = {
            "qf";
            "NvimTree";
            "toggleterm";
            "TelescopePrompt";
            "alpha";
            "netrw";
          };
          excluded_buftypes = {
            "nofile";
            "terminal";
          };
          bookmark_0 = {
            sign = "⚑";
            virt_text = "hello world";
            annotate = false;
          };
          mappings = {};
        };
      };
    };

    # Additional editor configuration
    extraConfigLua = ''
      -- Enhanced which-key configuration
      local wk = require("which-key")

      -- Add more key groups
      wk.add({
        { "<leader>", group = "Leader" },
        { "<leader>f", group = "Find", icon = "" },
        { "<leader>g", group = "Git", icon = "" },
        { "<leader>h", group = "Hunks", icon = "" },
        { "<leader>l", group = "LSP", icon = "" },
        { "<leader>s", group = "Session", icon = "" },
        { "<leader>t", group = "Toggle", icon = "" },
        { "<leader>b", group = "Buffer", icon = "" },
        { "<leader>c", group = "Code", icon = "" },
        { "<leader>d", group = "Debug", icon = "" },
        { "<leader>w", group = "Window", icon = "" },
        { "<leader>x", group = "Diagnostics", icon = "" },
        { "<leader>z", group = "Zen", icon = "" },
        { "g", group = "Goto" },
        { "z", group = "Fold" },
        { "]", group = "Next" },
        { "[", group = "Previous" },
      })

      -- Zen mode keymaps
      vim.keymap.set("n", "<leader>zz", function()
        require("zen-mode").setup({
          window = {
            width = 90,
            options = {}
          },
        })
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
        vim.opt.colorcolumn = "80"
      end, { desc = "Zen Mode" })

      vim.keymap.set("n", "<leader>zZ", function()
        require("zen-mode").setup({
          window = {
            width = 120,
            options = {}
          },
        })
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = ""
      end, { desc = "Zen Mode (no line numbers)" })

      -- Focus mode keymaps
      vim.keymap.set('n', '<leader>tf', '<cmd>FocusToggle<CR>', { desc = 'Toggle Focus Mode' })
      vim.keymap.set('n', '<leader>tm', '<cmd>FocusMaximise<CR>', { desc = 'Maximise Current Window' })
      vim.keymap.set('n', '<leader>te', '<cmd>FocusEqualise<CR>', { desc = 'Equalise All Windows' })

      -- Enhanced leap configuration
      require('leap').add_default_mappings()

      -- Custom leap highlights
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      vim.api.nvim_set_hl(0, 'LeapMatch', {
        fg = '#eb6f92',
        bold = true,
        nocombine = true,
      })

      -- Smart colorizer toggle
      vim.keymap.set('n', '<leader>tc', '<cmd>ColorizerToggle<CR>', { desc = 'Toggle Colorizer' })

      -- Project switching with telescope
      vim.keymap.set('n', '<leader>fp', function()
        require('telescope').extensions.projects.projects{}
      end, { desc = 'Find Projects' })

      -- Enhanced marks
      vim.keymap.set('n', 'ma', '<cmd>BookmarkAnnotate<CR>', { desc = 'Annotate Bookmark' })
      vim.keymap.set('n', 'mt', '<cmd>BookmarkToggle<CR>', { desc = 'Toggle Bookmark' })
      vim.keymap.set('n', 'mc', '<cmd>BookmarkClear<CR>', { desc = 'Clear Bookmarks' })
      vim.keymap.set('n', 'ml', '<cmd>BookmarkList<CR>', { desc = 'List Bookmarks' })

      -- Smart window navigation
      vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window' })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window' })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

      -- Smart window resizing
      vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
      vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
      vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
      vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

      -- Buffer management
      vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
      vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })
      vim.keymap.set('n', '<leader>bf', '<cmd>bfirst<CR>', { desc = 'First Buffer' })
      vim.keymap.set('n', '<leader>bl', '<cmd>blast<CR>', { desc = 'Last Buffer' })

      -- Enhanced text objects
      vim.keymap.set({'o', 'x'}, 'ir', '<cmd>lua require("various-textobjs").restOfIndent()<CR>', { desc = 'Rest of Indent' })
      vim.keymap.set({'o', 'x'}, 'ar', '<cmd>lua require("various-textobjs").entireIndent()<CR>', { desc = 'Entire Indent' })
      vim.keymap.set({'o', 'x'}, 'ie', '<cmd>lua require("various-textobjs").nearEoL()<CR>', { desc = 'Near End of Line' })
      vim.keymap.set({'o', 'x'}, 'ae', '<cmd>lua require("various-textobjs").toEoL()<CR>', { desc = 'To End of Line' })

      -- Smart formatting
      vim.keymap.set({'n', 'v'}, '<leader>cf', function()
        require('conform').format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000
        })
      end, { desc = 'Format' })

      -- Toggle format on save
      local format_on_save_enabled = true
      vim.keymap.set('n', '<leader>tf', function()
        format_on_save_enabled = not format_on_save_enabled
        if format_on_save_enabled then
          vim.notify('Format on save enabled', vim.log.levels.INFO)
        else
          vim.notify('Format on save disabled', vim.log.levels.WARN)
        end
      end, { desc = 'Toggle Format on Save' })

      -- Custom auto-format on save that respects toggle
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
          if format_on_save_enabled then
            require('conform').format({
              bufnr = args.buf,
              lsp_fallback = true
            })
          end
        end
      })

      -- Enhanced scrolling
      vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
      vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
      vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
      vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

      -- Smart line joining
      vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines (keep cursor position)' })

      -- Better indenting in visual mode
      vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
      vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

      -- Move lines up and down
      vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
      vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
      vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
      vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })

      -- Enhanced clipboard operations
      vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking' })
      vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
      vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })
      vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]], { desc = 'Delete to black hole register' })

      -- Quick escape
      vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape insert mode' })
      vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Escape insert mode' })

      -- Command mode enhancements
      vim.keymap.set('c', '<C-a>', '<Home>', { desc = 'Go to beginning of line' })
      vim.keymap.set('c', '<C-e>', '<End>', { desc = 'Go to end of line' })
      vim.keymap.set('c', '<C-p>', '<Up>', { desc = 'Previous command' })
      vim.keymap.set('c', '<C-n>', '<Down>', { desc = 'Next command' })

      -- Enhanced search and replace
      vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace word' })
      vim.keymap.set('v', '<leader>sr', [[:s/\%V]],
