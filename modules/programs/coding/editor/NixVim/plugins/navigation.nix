{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # FZF integration (where not replaced by mini.pick)
      fzf-lua = {
        enable = true;
        settings = {
          "default" = {
            prompt = "❯ ";
            input_prompt = "❯ ";
            multiprocess = true;
            git = {
              git_icons = true;
              file_icons = true;
              color_icons = true;
            };
            files = {
              prompt = "Files❯ ";
              multiprocess = true;
              git_icons = true;
              file_icons = true;
              color_icons = true;
              find_opts = ["-type" "f" "-not" "-path" "'*/\\.git/*'" "-printf" "'%P\\n'"];
              rg_opts = "--color=never --files --hidden --follow -g '!.git'";
              fd_opts = "--color=never --type f --hidden --follow --exclude .git";
            };
            grep = {
              prompt = "Rg❯ ";
              input_prompt = "Grep For❯ ";
              multiprocess = true;
              git_icons = true;
              file_icons = true;
              color_icons = true;
              grep_opts = "--binary-files=without-match --line-number --recursive --color=always --perl-regexp -e";
              rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e";
              rg_glob = false;
              glob_flag = "--iglob";
              glob_separator = "%s%-%-";
            };
            args = {
              prompt = "Args❯ ";
              files_only = true;
              actions = {
                "ctrl-x" = {
                  __raw = "require('fzf-lua.actions').arg_del";
                };
              };
            };
            oldfiles = {
              prompt = "History❯ ";
              cwd_only = false;
              stat_file = true;
              include_current_session = false;
            };
            buffers = {
              prompt = "Buffers❯ ";
              file_icons = true;
              color_icons = true;
              sort_lastused = true;
              show_unloaded = true;
              cwd_only = false;
              cwd = null;
              actions = {
                "ctrl-x" = {
                  __raw = "require('fzf-lua.actions').buf_del";
                };
              };
            };
            tabs = {
              prompt = "Tabs❯ ";
              tab_title = "Tab";
              tab_marker = "<<";
              file_icons = true;
              color_icons = true;
            };
            lines = {
              previewer = "builtin";
              prompt = "Lines❯ ";
              show_unloaded = true;
              show_unlisted = false;
              no_term_buffers = true;
              fzf_opts = {
                __unkeyed-1 = "--delimiter";
                __unkeyed-2 = ":";
                __unkeyed-3 = "--nth";
                __unkeyed-4 = "3..";
                __unkeyed-5 = "--tiebreak";
                __unkeyed-6 = "index";
              };
              actions = {
                "alt-l" = {
                  __raw = "require('fzf-lua.actions').set_qflist";
                };
              };
            };
            blines = {
              previewer = "builtin";
              prompt = "BLines❯ ";
              show_unlisted = true;
              no_term_buffers = false;
              fzf_opts = {
                __unkeyed-1 = "--delimiter";
                __unkeyed-2 = ":";
                __unkeyed-3 = "--with-nth";
                __unkeyed-4 = "2..";
                __unkeyed-5 = "--tiebreak";
                __unkeyed-6 = "index";
              };
              actions = {
                "alt-l" = {
                  __raw = "require('fzf-lua.actions').set_qflist";
                };
              };
            };
          };
          winopts = {
            height = 0.85;
            width = 0.80;
            row = 0.35;
            col = 0.50;
            border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
            backdrop = 60;
            preview = {
              default = "bat";
              border = "border";
              wrap = "nowrap";
              hidden = "nohidden";
              vertical = "down:45%";
              horizontal = "right:60%";
              layout = "flex";
              flip_columns = 120;
              title = true;
              title_pos = "center";
              scrollbar = "border";
              scrolloff = "-2";
              scrollchars = ["█" "░"];
              delay = 100;
              winopts = {
                number = true;
                relativenumber = false;
                cursorline = true;
                cursorlineopt = "both";
                cursorcolumn = false;
                signcolumn = "no";
                list = false;
                foldenable = false;
                wrap = false;
              };
            };
            fullscreen = false;
            vertical = false;
            split = "belowright new";
            sign = ">";
            treesitter = {
              enabled = true;
              disable = [];
            };
          };
          keymap = {
            builtin = {
              ["<F1>"] = "toggle-help";
              ["<F2>"] = "toggle-fullscreen";
              ["<F3>"] = "toggle-preview-wrap";
              ["<F4>"] = "toggle-preview";
              ["<F5>"] = "toggle-preview-ccw";
              ["<F6>"] = "toggle-preview-cw";
              ["<S-down>"] = "preview-page-down";
              ["<S-up>"] = "preview-page-up";
              ["<S-left>"] = "preview-page-reset";
            };
            fzf = {
              ["ctrl-z"] = "abort";
              ["ctrl-u"] = "unix-line-discard";
              ["ctrl-f"] = "half-page-down";
              ["ctrl-b"] = "half-page-up";
              ["ctrl-a"] = "beginning-of-line";
              ["ctrl-e"] = "end-of-line";
              ["alt-a"] = "toggle-all";
              ["f3"] = "toggle-preview-wrap";
              ["f4"] = "toggle-preview";
              ["shift-down"] = "preview-page-down";
              ["shift-up"] = "preview-page-up";
            };
          };
          actions = {
            files = {
              ["default"] = {
                __raw = "require('fzf-lua.actions').file_edit_or_qf";
              };
              ["ctrl-s"] = {
                __raw = "require('fzf-lua.actions').file_split";
              };
              ["ctrl-v"] = {
                __raw = "require('fzf-lua.actions').file_vsplit";
              };
              ["ctrl-t"] = {
                __raw = "require('fzf-lua.actions').file_tabedit";
              };
              ["alt-q"] = {
                __raw = "require('fzf-lua.actions').file_sel_to_qf";
              };
              ["alt-l"] = {
                __raw = "require('fzf-lua.actions').file_sel_to_ll";
              };
            };
            buffers = {
              ["default"] = {
                __raw = "require('fzf-lua.actions').buf_edit";
              };
              ["ctrl-s"] = {
                __raw = "require('fzf-lua.actions').buf_split";
              };
              ["ctrl-v"] = {
                __raw = "require('fzf-lua.actions').buf_vsplit";
              };
              ["ctrl-t"] = {
                __raw = "require('fzf-lua.actions').buf_tabedit";
              };
            };
          };
          fzf_opts = {
            __unkeyed-1 = "--ansi";
            __unkeyed-2 = "--info=inline";
            __unkeyed-3 = "--height=100%";
            __unkeyed-4 = "--layout=reverse";
            __unkeyed-5 = "--border=none";
          };
          fzf_colors = {
            __unkeyed-1 = "--color=bg+:#2a273f";
            __unkeyed-2 = "--color=bg:#232136";
            __unkeyed-3 = "--color=spinner:#f6c177";
            __unkeyed-4 = "--color=hl:#eb6f92";
            __unkeyed-5 = "--color=fg:#908caa";
            __unkeyed-6 = "--color=header:#eb6f92";
            __unkeyed-7 = "--color=info:#9ccfd8";
            __unkeyed-8 = "--color=pointer:#f6c177";
            __unkeyed-9 = "--color=marker:#f6c177";
            __unkeyed-10 = "--color=fg+:#e0def4";
            __unkeyed-11 = "--color=prompt:#9ccfd8";
            __unkeyed-12 = "--color=hl+:#eb6f92";
          };
        };
      };

      # Flash.nvim - Enhanced navigation
      flash = {
        enable = true;
        settings = {
          labels = "asdfghjklqwertyuiopzxcvbnm";
          search = {
            multi_window = true;
            forward = true;
            wrap = true;
            mode = "exact";
            incremental = false;
            exclude = [
              "notify"
              "cmp_menu"
              "noice"
              "flash_prompt"
              {
                __raw = ''
                  function(win)
                    return not vim.api.nvim_win_get_config(win).focusable
                  end
                '';
              }
            ];
            trigger = "";
            max_length = false;
          };
          jump = {
            jumplist = true;
            pos = "start";
            history = false;
            register = false;
            nohlsearch = false;
            autojump = false;
            inclusive = null;
            offset = null;
          };
          label = {
            uppercase = true;
            exclude = "";
            current = true;
            after = true;
            before = false;
            style = "overlay";
            reuse = "lowercase";
            distance = true;
            min_pattern_length = 0;
            rainbow = {
              enabled = false;
              shade = 5;
            };
            format = {
              __raw = ''
                function(opts)
                  return { { opts.match.label, opts.hl_group } }
                end
              '';
            };
          };
          highlight = {
            backdrop = true;
            matches = true;
            priority = 5000;
            groups = {
              match = "FlashMatch";
              current = "FlashCurrent";
              backdrop = "FlashBackdrop";
              label = "FlashLabel";
            };
          };
          action = null;
          pattern = "";
          continue = false;
          config = null;
          prompt = {
            enabled = true;
            prefix = [["⚡" "FlashPromptIcon"]];
            win_config = {
              relative = "editor";
              width = 1;
              height = 1;
              row = -1;
              col = 0;
              zindex = 1000;
            };
          };
          remote_op = {
            restore = false;
            motion = false;
          };
        };
      };

      # Harpoon - Fast file navigation
      harpoon = {
        enable = true;
        enableTelescope = true;
        settings = {
          save_on_toggle = false;
          sync_on_ui_close = true;
          key = {
            __raw = ''
              function()
                return vim.loop.cwd()
              end
            '';
          };
        };
      };

      # Telescope - Fuzzy finder (fallback for some features)
      telescope = {
        enable = true;
        settings = {
          defaults = {
            prompt_prefix = "   ";
            selection_caret = "  ";
            entry_prefix = "  ";
            initial_mode = "insert";
            selection_strategy = "reset";
            sorting_strategy = "ascending";
            layout_strategy = "horizontal";
            layout_config = {
              horizontal = {
                prompt_position = "top";
                preview_width = 0.55;
                results_width = 0.8;
              };
              vertical = {
                mirror = false;
              };
              width = 0.87;
              height = 0.80;
              preview_cutoff = 120;
            };
            file_sorter = {
              __raw = "require('telescope.sorters').get_fuzzy_file";
            };
            file_ignore_patterns = { "node_modules" };
            generic_sorter = {
              __raw = "require('telescope.sorters').get_generic_fuzzy_sorter";
            };
            path_display = ["truncate"];
            winblend = 0;
            border = {};
            borderchars = ["─" "│" "─" "│" "╭" "╮" "╯" "╰"];
            color_devicons = true;
            set_env = { "COLORTERM" = "truecolor"; };
            file_previewer = {
              __raw = "require('telescope.previewers').vim_buffer_cat.new";
            };
            grep_previewer = {
              __raw = "require('telescope.previewers').vim_buffer_vimgrep.new";
            };
            qflist_previewer = {
              __raw = "require('telescope.previewers').vim_buffer_qflist.new";
            };
            buffer_previewer_maker = {
              __raw = "require('telescope.previewers').buffer_previewer_maker";
            };
            mappings = {
              i = {
                ["<C-n>"] = "move_selection_next";
                ["<C-p>"] = "move_selection_previous";
                ["<C-c>"] = "close";
                ["<Down>"] = "move_selection_next";
                ["<Up>"] = "move_selection_previous";
                ["<CR>"] = "select_default";
                ["<C-x>"] = "select_horizontal";
                ["<C-v>"] = "select_vertical";
                ["<C-t>"] = "select_tab";
                ["<C-u>"] = "preview_scrolling_up";
                ["<C-d>"] = "preview_scrolling_down";
                ["<PageUp>"] = "results_scrolling_up";
                ["<PageDown>"] = "results_scrolling_down";
                ["<Tab>"] = "toggle_selection + move_selection_worse";
                ["<S-Tab>"] = "toggle_selection + move_selection_better";
                ["<C-q>"] = "send_to_qflist + open_qflist";
                ["<M-q>"] = "send_selected_to_qflist + open_qflist";
                ["<C-l>"] = "complete_tag";
                ["<C-/>"] = "which_key";
              };
              n = {
                ["<esc>"] = "close";
                ["<CR>"] = "select_default";
                ["<C-x>"] = "select_horizontal";
                ["<C-v>"] = "select_vertical";
                ["<C-t>"] = "select_tab";
                ["<Tab>"] = "toggle_selection + move_selection_worse";
                ["<S-Tab>"] = "toggle_selection + move_selection_better";
                ["<C-q>"] = "send_to_qflist + open_qflist";
                ["<M-q>"] = "send_selected_to_qflist + open_qflist";
                ["j"] = "move_selection_next";
                ["k"] = "move_selection_previous";
                ["H"] = "move_to_top";
                ["M"] = "move_to_middle";
                ["L"] = "move_to_bottom";
                ["<Down>"] = "move_selection_next";
                ["<Up>"] = "move_selection_previous";
                ["gg"] = "move_to_top";
                ["G"] = "move_to_bottom";
                ["<C-u>"] = "preview_scrolling_up";
                ["<C-d>"] = "preview_scrolling_down";
                ["<PageUp>"] = "results_scrolling_up";
                ["<PageDown>"] = "results_scrolling_down";
                ["?"] = "which_key";
              };
            };
          };
          pickers = {
            find_files = {
              theme = "dropdown";
              hidden = false;
              previewer = false;
              find_command = ["rg" "--files" "--hidden" "--glob" "!**/.git/*"];
            };
            live_grep = {
              theme = "ivy";
              additional_args = {
                __raw = ''
                  function(opts)
                    return {"--hidden"}
                  end
                '';
              };
            };
            grep_string = {
              theme = "ivy";
            };
            buffers = {
              theme = "dropdown";
              previewer = false;
              initial_mode = "normal";
              mappings = {
                i = {
                  ["<C-d>"] = "delete_buffer";
                };
                n = {
                  ["dd"] = "delete_buffer";
                };
              };
            };
            planets = {
              show_pluto = true;
              show_moon = true;
            };
            colorscheme = {
              enable_preview = true;
            };
            lsp_references = { theme = "ivy"; initial_mode = "normal"; };
            lsp_definitions = { theme = "ivy"; initial_mode = "normal"; };
            lsp_declarations = { theme = "ivy"; initial_mode = "normal"; };
            lsp_implementations = { theme = "ivy"; initial_mode = "normal"; };
          };
          extensions = {
            media_files = {
              filetypes = ["png" "webp" "jpg" "jpeg"];
              find_cmd = "rg";
            };
            fzf = {
              fuzzy = true;
              override_generic_sorter = true;
              override_file_sorter = true;
              case_mode = "smart_case";
            };
          };
        };
        extensions = {
          fzf-native = {
            enable = true;
          };
          media-files = {
            enable = true;
          };
          ui-select = {
            enable = true;
            settings = {
              specific_opts = {
                codeactions = false;
              };
            };
          };
        };
      };

      # Outline - Symbol outline sidebar
      outline = {
        enable = true;
        settings = {
          outline_window = {
            position = "right";
            width = 25;
            relative_width = true;
            auto_close = false;
            auto_jump = false;
            jump_highlight_duration = 300;
            center_on_jump = true;
            show_numbers = false;
            show_relative_numbers = false;
            wrap = false;
            show_cursorline = true;
            hide_cursor = false;
            focus_on_open = false;
            winhl = "";
          };
          outline_items = {
            highlight_hovered_item = true;
            show_symbol_details = true;
            show_symbol_lineno = false;
            auto_set_cursor = true;
            auto_unfold_hover = true;
            fold_markers = { ""; "" };
            auto_unfold = true;
          };
          guides = {
            enabled = true;
            markers = {
              bottom = "└";
              middle = "├";
              vertical = "│";
            };
          };
          symbol_folding = {
            autofold_depth = 1;
            auto_unfold = {
              hovered = true;
              only = true;
            };
            markers = { ""; "" };
          };
          preview_window = {
            auto_preview = false;
            open_hover_on_preview = false;
            width = 50;
            min_width = 50;
            relative_width = true;
            border = "single";
            winhl = "NormalFloat:";
            winblend = 0;
            live = false;
          };
          keymaps = {
            show_help = "?";
            close = { "<Esc>"; "q" };
            goto_location = "<Cr>";
            peek_location = "o";
            goto_and_close = "<S-Cr>";
            restore_location = "<C-g>";
            hover_symbol = "<C-space>";
            toggle_preview = "K";
            rename_symbol = "r";
            code_actions = "a";
            fold = "h";
            unfold = "l";
            fold_toggle = "<Tab>";
            fold_toggle_all = "<S-Tab>";
            fold_all = "W";
            unfold_all = "E";
            fold_reset = "R";
            down_and_jump = "<C-j>";
            up_and_jump = "<C-k>";
          };
          providers = {
            priority = ["lsp" "coc" "markdown" "norg"];
            lsp = {
              blacklist_clients = {};
            };
          };
          symbols = {
            icons = {
              File = { icon = "󰈙"; hl = "Identifier" };
              Module = { icon = "󰆧"; hl = "Include" };
              Namespace = { icon = "󰅪"; hl = "Include" };
              Package = { icon = "󰏗"; hl = "Include" };
              Class = { icon = "𝓒"; hl = "Type" };
              Method = { icon = "ƒ"; hl = "Function" };
              Property = { icon = ""; hl = "Identifier" };
              Field = { icon = "󰆨"; hl = "Identifier" };
              Constructor = { icon = ""; hl = "Special" };
              Enum = { icon = "ℰ"; hl = "Type" };
              Interface = { icon = "󰜰"; hl = "Type" };
              Function = { icon = ""; hl = "Function" };
              Variable = { icon = "󰀫"; hl = "Constant" };
              Constant = { icon = "󰏿"; hl = "Constant" };
              String = { icon = "𝓐"; hl = "String" };
              Number = { icon = "#"; hl = "Number" };
              Boolean = { icon = "⊨"; hl = "Boolean" };
              Array = { icon = "󰅪"; hl = "Constant" };
              Object = { icon = "⦿"; hl = "Type" };
              Key = { icon = "🔐"; hl = "Type" };
              Null = { icon = "NULL"; hl = "Type" };
              EnumMember = { icon = ""; hl = "Identifier" };
              Struct = { icon = "𝓢"; hl = "Structure" };
              Event = { icon = "🗲"; hl = "Type" };
              Operator = { icon = "+"; hl = "Identifier" };
              TypeParameter = { icon = "𝙏"; hl = "Identifier" };
              Component = { icon = "󰅴"; hl = "Function" };
              Fragment = { icon = "󰅴"; hl = "Constant" };
            };
            filter = [
              "Class"
              "Constructor"
              "Enum"
              "Field"
              "Function"
              "Interface"
              "Method"
              "Module"
              "Namespace"
              "Package"
              "Property"
              "Struct"
              "Trait"
            ];
          };
        };
      };

      # Oil.nvim - File management as a buffer
      oil = {
        enable = true;
        settings = {
          default_file_explorer = false; # Use alongside nvim-tree
          columns = [
            "icon"
            "permissions"
            "size"
            "mtime"
          ];
          buf_options = {
            buflisted = false;
            bufhidden = "hide";
          };
          win_options = {
            wrap = false;
            signcolumn = "no";
            cursorcolumn = false;
            foldcolumn = "0";
            spell = false;
            list = false;
            conceallevel = 3;
            concealcursor = "nvic";
          };
          delete_to_trash = false;
          skip_confirm_for_simple_edits = false;
          prompt_save_on_select_new_entry = true;
          cleanup_delay_ms = 2000;
          lsp_file_methods = {
            timeout_ms = 1000;
            autosave_changes = false;
          };
          constrain_cursor = "editable";
          experimental_watch_for_changes = false;
          keymaps = {
            "g?" = "actions.show_help";
            "<CR>" = "actions.select";
            "<C-s>" = "actions.select_vsplit";
            "<C-h>" = "actions.select_split";
            "<C-t>" = "actions.select_tab";
            "<C-p>" = "actions.preview";
            "<C-c>" = "actions.close";
            "<C-l>" = "actions.refresh";
            "-" = "actions.parent";
            "_" = "actions.open_cwd";
            "`" = "actions.cd";
            "~" = "actions.tcd";
            "gs" = "actions.change_sort";
            "gx" = "actions.open_external";
            "g." = "actions.toggle_hidden";
            "g\\" = "actions.toggle_trash";
          };
          keymaps_help = {
            border = "rounded";
          };
          use_default_keymaps = true;
          view_options = {
            show_hidden = false;
            is_hidden_file = {
              __raw = ''
                function(name, bufnr)
                  return vim.startswith(name, ".")
                end
              '';
            };
            is_always_hidden = {
              __raw = ''
                function(name, bufnr)
                  return false
                end
              '';
            };
            natural_order = true;
            sort = [
              ["type" "asc"]
              ["name" "asc"]
            ];
          };
          extra_scp_args = {};
          git = {
            add = {
              __raw = ''
                function(path)
                  return false
                end
              '';
            };
            mv = {
              __raw = ''
                function(src_path, dest_path)
                  return false
                end
              '';
            };
            rm = {
              __raw = ''
                function(path)
                  return false
                end
              '';
            };
          };
          float = {
            padding = 2;
            max_width = 0;
            max_height = 0;
            border = "rounded";
            win_options = {
              winblend = 0;
            };
            get_win_title = null;
            preview_split = "auto";
            override = {
              __raw = ''
                function(conf)
                  return conf
                end
              '';
            };
          };
          preview = {
            max_width = 0.9;
            min_width = { 40; 0.4 };
            width = null;
            max_height = 0.9;
            min_height = { 5; 0.1 };
            height = null;
            border = "rounded";
            win_options = {
              winblend = 0;
            };
            update_on_cursor_moved = true;
          };
          progress = {
            max_width = 0.9;
            min_width = { 40; 0.4 };
            width = null;
            max_height = { 10; 0.9 };
            min_height = { 5; 0.1 };
            height = null;
            border = "rounded";
            minimized_border = "none";
            win_options = {
              winblend = 0;
            };
          };
          ssh = {
            border = "rounded";
          };
        };
      };

      # Winbar for breadcrumbs
      barbecue = {
        enable = true;
        settings = {
          attach_navic = true;
          create_autocmd = true;
          include_buftypes = [""];
          exclude_filetypes = ["netrw" "toggleterm"];
          modifiers = {
            dirname = ":~:.";
            basename = "";
          };
          show_dirname = true;
          show_basename = true;
          show_modified = false;
          modified = {
            __raw = "function(bufnr) return vim.bo[bufnr].modified end";
          };
          show_navic = true;
          lead_custom_section = {
            __raw = "function() return ' ' end";
          };
          custom_section = {
            __raw = "function() return ' ' end";
          };
          theme = "auto";
          context_follow_icon_color = false;
          symbols = {
            modified = "●";
            ellipsis = "…";
            separator = "";
          };
          kinds = {
            File = "";
            Module = "";
            Namespace = "󰅪";
            Package = "";
            Class = "𝓒";
            Method = "ƒ";
            Property = "";
            Field = "";
            Constructor = "";
            Enum = "ℰ";
            Interface = "";
            Function = "";
            Variable = "";
            Constant = "";
            String = "𝓐";
            Number = "#";
            Boolean = "⊨";
            Array = "";
            Object = "⦿";
            Key = "🔐";
            Null = "NULL";
            EnumMember = "";
            Struct = "𝓢";
            Event = "🗲";
            Operator = "+";
            TypeParameter = "𝙏";
          };
        };
      };
    };

    # Additional navigation configuration
    extraConfigLua = ''
      -- Enhanced FZF-lua setup
      local fzf_lua = require('fzf-lua')

      -- Custom pickers
      vim.keymap.set('n', '<leader><leader>', fzf_lua.resume, { desc = 'Resume last picker' })

      -- Smart file finding
      vim.keymap.set('n', '<C-p>', function()
        if vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null'):find('true') then
          fzf_lua.git_files()
        else
          fzf_lua.files()
        end
      end, { desc = 'Smart file find' })

      -- Enhanced grep with word boundaries
      vim.keymap.set('n', '<leader>fw', function()
        fzf_lua.grep_cword()
      end, { desc = 'Find Word' })

      vim.keymap.set('n', '<leader>fW', function()
        fzf_lua.grep_cWORD()
      end, { desc = 'Find WORD' })

      -- LSP integration with fzf-lua
      vim.keymap.set('n', '<leader>ls', fzf_lua.lsp_document_symbols, { desc = 'Document Symbols' })
      vim.keymap
