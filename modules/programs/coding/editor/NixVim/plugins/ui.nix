{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Lualine - Beautiful status line
      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = true;
            theme = "rose-pine";
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
            disabled_filetypes = {
              statusline = ["dashboard" "alpha" "starter"];
            };
            ignore_focus = ["NvimTree" "neo-tree"];
            always_divide_middle = true;
            globalstatus = true;
            refresh = {
              statusline = 1000;
              tabline = 1000;
              winbar = 1000;
            };
          };
          sections = {
            lualine_a = [
              {
                __unkeyed-1 = "mode";
                separator = {
                  left = "";
                };
                right_padding = 2;
              }
            ];
            lualine_b = [
              "filename"
              "branch"
            ];
            lualine_c = [
              {
                __unkeyed-1 = "diagnostics";
                sources = ["nvim_diagnostic"];
                symbols = {
                  error = " ";
                  warn = " ";
                  info = " ";
                };
                diagnostics_color = {
                  color_error = { fg = "#eb6f92"; };
                  color_warn = { fg = "#f6c177"; };
                  color_info = { fg = "#9ccfd8"; };
                };
              }
            ];
            lualine_x = [
              {
                __unkeyed-1 = "encoding";
                cond = {
                  __raw = ''
                    function()
                      return vim.bo.encoding ~= 'utf-8'
                    end
                  '';
                };
              }
              {
                __unkeyed-1 = "fileformat";
                symbols = {
                  unix = "";
                  dos = "";
                  mac = "";
                };
              }
              "filetype"
            ];
            lualine_y = [
              "progress"
            ];
            lualine_z = [
              {
                __unkeyed-1 = "location";
                separator = {
                  right = "";
                };
                left_padding = 2;
              }
            ];
          };
          inactive_sections = {
            lualine_a = ["filename"];
            lualine_b = [];
            lualine_c = [];
            lualine_x = [];
            lualine_y = [];
            lualine_z = ["location"];
          };
        };
      };

      # Bufferline - Tab-like buffer navigation
      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "buffers";
            themable = true;
            numbers = "none";
            close_command = "bdelete! %d";
            right_mouse_command = "bdelete! %d";
            left_mouse_command = "buffer %d";
            middle_mouse_command = null;
            indicator = {
              icon = "▎";
              style = "icon";
            };
            buffer_close_icon = "󰅖";
            modified_icon = "●";
            close_icon = "";
            left_trunc_marker = "";
            right_trunc_marker = "";
            max_name_length = 30;
            max_prefix_length = 30;
            tab_size = 21;
            diagnostics = "nvim_lsp";
            diagnostics_update_in_insert = false;
            diagnostics_indicator = {
              __raw = ''
                function(count, level, diagnostics_dict, context)
                  local icon = level:match("error") and " " or " "
                  return " " .. icon .. count
                end
              '';
            };
            color_icons = true;
            show_buffer_icons = true;
            show_buffer_close_icons = true;
            show_close_icon = true;
            show_tab_indicators = true;
            persist_buffer_sort = true;
            separator_style = "slant";
            enforce_regular_tabs = true;
            always_show_bufferline = true;
            hover = {
              enabled = true;
              delay = 200;
              reveal = ["close"];
            };
            sort_by = "insert_after_current";
            offsets = [
              {
                filetype = "NvimTree";
                text = "File Explorer";
                text_align = "left";
                separator = true;
              }
            ];
          };
        };
      };

      # Nvim-tree - File explorer
      nvim-tree = {
        enable = true;
        settings = {
          disable_netrw = true;
          hijack_netrw = true;
          hijack_cursor = false;
          hijack_unnamed_buffer_when_opening = false;
          sync_root_with_cwd = true;
          respect_buf_cwd = true;
          on_attach = "default";
          select_prompts = false;
          view = {
            centralize_selection = false;
            width = 30;
            side = "left";
            preserve_window_proportions = false;
            number = false;
            relativenumber = false;
            signcolumn = "yes";
            float = {
              enable = false;
              quit_on_focus_loss = true;
              open_win_config = {
                relative = "editor";
                border = "rounded";
                width = 30;
                height = 30;
                row = 1;
                col = 1;
              };
            };
          };
          renderer = {
            add_trailing = false;
            group_empty = false;
            highlight_git = true;
            full_name = false;
            highlight_opened_files = "none";
            highlight_modified = "none";
            root_folder_label = ":~:s?$?/..?";
            indent_width = 2;
            indent_markers = {
              enable = false;
              inline_arrows = true;
              icons = {
                corner = "└";
                edge = "│";
                item = "│";
                bottom = "─";
                none = " ";
              };
            };
            icons = {
              webdev_colors = true;
              git_placement = "before";
              modified_placement = "after";
              padding = " ";
              symlink_arrow = " ➛ ";
              show = {
                file = true;
                folder = true;
                folder_arrow = true;
                git = true;
                modified = true;
              };
              glyphs = {
                default = "";
                symlink = "";
                bookmark = "󰆤";
                modified = "●";
                folder = {
                  arrow_closed = "";
                  arrow_open = "";
                  default = "";
                  open = "";
                  empty = "";
                  empty_open = "";
                  symlink = "";
                  symlink_open = "";
                };
                git = {
                  unstaged = "✗";
                  staged = "✓";
                  unmerged = "";
                  renamed = "➜";
                  untracked = "★";
                  deleted = "";
                  ignored = "◌";
                };
              };
            };
            special_files = ["Cargo.toml" "Makefile" "README.md" "readme.md"];
            symlink_destination = true;
          };
          hijack_directories = {
            enable = true;
            auto_open = true;
          };
          update_focused_file = {
            enable = false;
            update_root = false;
            ignore_list = [];
          };
          filters = {
            dotfiles = false;
            git_clean = false;
            no_buffer = false;
            custom = [];
            exclude = [];
          };
          filesystem_watchers = {
            enable = true;
            debounce_delay = 50;
            ignore_dirs = [];
          };
          git = {
            enable = true;
            ignore = true;
            show_on_dirs = true;
            show_on_open_dirs = true;
            timeout = 400;
          };
          actions = {
            use_system_clipboard = true;
            change_dir = {
              enable = true;
              global = false;
              restrict_above_cwd = false;
            };
            expand_all = {
              max_folder_discovery = 300;
              exclude = [];
            };
            file_popup = {
              open_win_config = {
                col = 1;
                row = 1;
                relative = "cursor";
                border = "shadow";
                style = "minimal";
              };
            };
            open_file = {
              quit_on_open = false;
              resize_window = true;
              window_picker = {
                enable = true;
                picker = "default";
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                exclude = {
                  filetype = ["notify" "packer" "qf" "diff" "fugitive" "fugitiveblame"];
                  buftype = ["nofile" "terminal" "help"];
                };
              };
            };
            remove_file = {
              close_window = true;
            };
          };
          trash = {
            cmd = "gio trash";
          };
          live_filter = {
            prefix = "[FILTER]: ";
            always_show_folders = true;
          };
          tab = {
            sync = {
              open = false;
              close = false;
              ignore = [];
            };
          };
          notify = {
            threshold = "INFO";
            absolute_path = true;
          };
          log = {
            enable = false;
            truncate = false;
            types = {
              all = false;
              config = false;
              copy_paste = false;
              dev = false;
              diagnostics = false;
              git = false;
              profile = false;
              watcher = false;
            };
          };
        };
      };

      # Noice.nvim - Enhanced UI for messages, cmdline, and popups
      noice = {
        enable = true;
        settings = {
          lsp = {
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true;
            };
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
            lsp_doc_border = false;
          };
          cmdline = {
            enabled = true;
            view = "cmdline_popup";
            opts = {};
            format = {
              cmdline = { pattern = "^:"; icon = ""; lang = "vim"; };
              search_down = { kind = "search"; pattern = "^/"; icon = " "; lang = "regex"; };
              search_up = { kind = "search"; pattern = "^%?"; icon = " "; lang = "regex"; };
              filter = { pattern = "^:%s*!"; icon = "$"; lang = "bash"; };
              lua = { pattern = { "^:%s*lua%s+"; "^:%s*lua%s*=%s*"; "^:%s*=%s*"; }; icon = ""; lang = "lua"; };
              help = { pattern = "^:%s*he?l?p?%s+"; icon = ""; };
              input = {};
            };
          };
          messages = {
            enabled = true;
            view = "notify";
            view_error = "notify";
            view_warn = "notify";
            view_history = "messages";
            view_search = "virtualtext";
          };
          popupmenu = {
            enabled = true;
            backend = "nui";
            kind_icons = {};
          };
          redirect = {
            view = "popup";
            filter = { event = "msg_show"; };
          };
          commands = {
            history = {
              view = "split";
              opts = { enter = true; format = "details"; };
              filter = {
                any = [
                  { event = "notify"; }
                  { error = true; }
                  { warning = true; }
                  { event = "msg_show"; kind = { ""; }; }
                  { event = "lsp"; kind = "message"; }
                ];
              };
            };
            last = {
              view = "popup";
              opts = { enter = true; format = "details"; };
              filter = {
                any = [
                  { event = "notify"; }
                  { error = true; }
                  { warning = true; }
                  { event = "msg_show"; kind = { ""; }; }
                  { event = "lsp"; kind = "message"; }
                ];
              };
              filter_opts = { count = 1; };
            };
            errors = {
              view = "popup";
              opts = { enter = true; format = "details"; };
              filter = { error = true; };
              filter_opts = { reverse = true; };
            };
          };
          notify = {
            enabled = true;
            view = "notify";
          };
          health = {
            checker = false;
          };
          smart_move = {
            enabled = true;
            excluded_filetypes = { "cmp_menu"; "cmp_docs"; "notify"; };
          };
          throttle = 1000 / 30;
          views = {
            cmdline_popup = {
              position = {
                row = 5;
                col = "50%";
              };
              size = {
                width = 60;
                height = "auto";
              };
            };
            popupmenu = {
              relative = "editor";
              position = {
                row = 8;
                col = "50%";
              };
              size = {
                width = 60;
                height = 10;
              };
              border = {
                style = "rounded";
                padding = { 0; 1; };
              };
              win_options = {
                winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo";
              };
            };
          };
          routes = [
            {
              filter = {
                event = "msg_show";
                any = [
                  { find = "%d+L, %d+B"; }
                  { find = "; after #%d+"; }
                  { find = "; before #%d+"; }
                ];
              };
              view = "mini";
            }
          ];
        };
      };

      # Nvim-notify - Beautiful notifications
      notify = {
        enable = true;
        settings = {
          background_colour = "#232136";
          fps = 30;
          icons = {
            DEBUG = "";
            ERROR = "";
            INFO = "";
            TRACE = "✎";
            WARN = "";
          };
          level = 2;
          minimum_width = 50;
          render = "default";
          stages = "fade_in_slide_out";
          time_formats = {
            notification = "%T";
            notification_history = "%FT%T";
          };
          timeout = 5000;
          top_down = true;
        };
      };

      # Alpha-nvim - Beautiful dashboard
      alpha = {
        enable = true;
        layout = [
          {
            type = "padding";
            val = 2;
          }
          {
            type = "text";
            val = [
              "                                                     "
              "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ "
              "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ "
              "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ "
              "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ "
              "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ "
              "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ "
              "                                                     "
            ];
            opts = {
              position = "center";
              hl = "Type";
            };
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "group";
            val = [
              {
                type = "button";
                val = "  Find file";
                on_press = {
                  __raw = "function() require('mini.pick').builtin.files() end";
                };
                opts = {
                  shortcut = "f";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
              {
                type = "button";
                val = "  New file";
                on_press = {
                  __raw = "function() vim.cmd[[ene]] end";
                };
                opts = {
                  shortcut = "n";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
              {
                type = "button";
                val = "  Recent files";
                on_press = {
                  __raw = "function() require('mini.pick').builtin.oldfiles() end";
                };
                opts = {
                  shortcut = "r";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
              {
                type = "button";
                val = "  Find text";
                on_press = {
                  __raw = "function() require('mini.pick').builtin.grep_live() end";
                };
                opts = {
                  shortcut = "t";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
              {
                type = "button";
                val = "  Configuration";
                on_press = {
                  __raw = "function() vim.cmd[[edit ~/.config/nixos/modules/programs/coding/editor/nixvim/]] end";
                };
                opts = {
                  shortcut = "c";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
              {
                type = "button";
                val = "  Quit";
                on_press = {
                  __raw = "function() vim.cmd[[qa]] end";
                };
                opts = {
                  shortcut = "q";
                  position = "center";
                  cursor = 3;
                  width = 50;
                  align_shortcut = "right";
                  hl_shortcut = "Keyword";
                };
              }
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "text";
            val = "⚡ Neovim loaded with style";
            opts = {
              position = "center";
              hl = "Comment";
            };
          }
        ];
      };

      # Dressing.nvim - Enhanced vim.ui interfaces
      dressing = {
        enable = true;
        settings = {
          input = {
            enabled = true;
            default_prompt = "Input:";
            title_pos = "left";
            insert_only = true;
            start_in_insert = true;
            anchor = "SW";
            border = "rounded";
            relative = "cursor";
            prefer_width = 40;
            width = null;
            max_width = { 140; 0.9; };
            min_width = { 20; 0.2; };
            buf_options = {};
            win_options = {
              wrap = false;
              list = true;
              listchars = "precedes:…,extends:…";
              sidescrolloff = 0;
            };
            mappings = {
              n = {
                "<Esc>" = "Close";
                "<CR>" = "Confirm";
              };
              i = {
                "<C-c>" = "Close";
                "<CR>" = "Confirm";
                "<Up>" = "HistoryPrev";
                "<Down>" = "HistoryNext";
              };
            };
            override = {
              __raw = "function(conf) return conf end";
            };
            get_config = null;
          };
          select = {
            enabled = true;
            backend = ["telescope" "fzf_lua" "fzf" "builtin" "nui"];
            trim_prompt = true;
            telescope = null;
            fzf = {
              window = {
                width = 0.5;
                height = 0.4;
              };
            };
            fzf_lua = {
              winopts = {
                height = 0.5;
                width = 0.5;
              };
            };
            nui = {
              position = "50%";
              size = null;
              relative = "editor";
              border = {
                style = "rounded";
              };
              buf_options = {
                swapfile = false;
                filetype = "DressingSelect";
              };
              win_options = {
                winblend = 0;
              };
              max_width = 80;
              max_height = 40;
              min_width = 40;
              min_height = 10;
            };
            builtin = {
              show_numbers = true;
              border = "rounded";
              relative = "editor";
              buf_options = {};
              win_options = {
                cursorline = true;
                winblend = 0;
              };
              width = null;
              max_width = 0.8;
              min_width = { 40; 0.2; };
              height = null;
              max_height = 0.9;
              min_height = { 10; 0.2; };
              override = {
                __raw = "function(conf) return conf end";
              };
            };
            format_item_override = {};
            get_config = null;
          };
        };
      };

      # Indent-blankline - Elegant indent guides
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "│";
            tab_char = "│";
          };
          scope = {
            enabled = true;
            show_start = true;
            show_end = false;
            injected_languages = false;
            highlight = ["Function" "Label"];
            priority = 500;
          };
          exclude = {
            filetypes = [
              "help"
              "alpha"
              "dashboard"
              "neo-tree"
              "Trouble"
              "trouble"
              "lazy"
              "mason"
              "notify"
              "toggleterm"
              "lazyterm"
            ];
          };
        };
      };

      # Rainbow delimiters - Color-coded bracket pairs
      rainbow-delimiters = {
        enable = true;
        settings = {
          strategy = {
            "" = "rainbow-delimiters.strategy.global";
            vim = "rainbow-delimiters.strategy.local";
          };
          query = {
            "" = "rainbow-delimiters";
            lua = "rainbow-blocks";
          };
          priority = {
            "" = 110;
            lua = 210;
          };
          highlight = [
            "RainbowDelimiterRed"
            "RainbowDelimiterYellow"
            "RainbowDelimiterBlue"
            "RainbowDelimiterOrange"
            "RainbowDelimiterGreen"
            "RainbowDelimiterViolet"
            "RainbowDelimiterCyan"
          ];
        };
      };

      # Smooth scrolling
      neoscroll = {
        enable = true;
        settings = {
          mappings = ["<C-u>" "<C-d>" "<C-b>" "<C-f>" "<C-y>" "<C-e>" "zt" "zz" "zb"];
          hide_cursor = true;
          stop_eof = true;
          respect_scrolloff = false;
          cursor_scrolls_alone = true;
          easing_function = null;
          pre_hook = null;
          post_hook = null;
          performance_mode = false;
        };
      };
    };

    # Additional UI configuration
    extraConfigLua = ''
      -- Set up rainbow delimiter colors
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#eb6f92" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f6c177" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#3e8fb0" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ea9a97" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#9ccfd8" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#c4a7e7" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#9ccfd8" })

      -- Enhanced fold text
      _G.custom_fold_text = function()
        local line = vim.fn.getline(vim.v.foldstart)
        local line_count = vim.v.foldend - vim.v.foldstart + 1
        return "  " .. line .. "  " .. line_count .. " lines"
      end

      vim.opt.foldtext = "v:lua.custom_fold_text()"

      -- Auto-close Alpha when opening a file
      vim.api.nvim_create_autocmd({"User"}, {
        pattern = "AlphaReady",
        callback = function()
          if vim.o.filetype == "alpha" then
            local esc_key = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
            vim.api.nvim_feedkeys(esc_key, "n", false)
          end
        end
      })
    '';
  };
}
