{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Blink-cmp - Modern completion engine
      blink-cmp = {
        enable = true;
        settings = {
          # Keymap configuration
          keymap = {
            preset = "default";
            "<C-space>" = ["show" "show_documentation" "hide_documentation"];
            "<C-e>" = ["hide"];
            "<CR>" = ["accept" "fallback"];
            "<Tab>" = ["snippet_forward" "fallback"];
            "<S-Tab>" = ["snippet_backward" "fallback"];
            "<Up>" = ["select_prev" "fallback"];
            "<Down>" = ["select_next" "fallback"];
            "<C-p>" = ["select_prev" "fallback"];
            "<C-n>" = ["select_next" "fallback"];
            "<C-b>" = ["scroll_documentation_up" "fallback"];
            "<C-f>" = ["scroll_documentation_down" "fallback"];
          };

          # Highlight groups
          highlight = {
            ns = "blink_cmp";
            use_nvim_cmp_as_default = true;
          };

          # Completion trigger
          trigger = {
            completion = {
              keyword_range = "full";
              keyword_regex = "[%w_\\-]";
              blocked_trigger_characters = [" " "\n" "\t"];
              show_in_snippet = true;
              show_on_keyword = true;
              show_on_trigger_character = true;
              show_on_accept_on_trigger_character = true;
              show_on_insert_on_trigger_character = true;
            };
            signature_help = {
              enabled = true;
              blocked_trigger_characters = [];
              blocked_retrigger_characters = [];
              show_on_insert_on_trigger_character = true;
            };
          };

          # Fuzzy matching
          fuzzy = {
            use_typo_resistance = true;
            use_frecency = true;
            use_proximity = true;
            max_items = 200;
            sorts = ["label" "kind" "score"];
          };

          # Sources configuration
          sources = {
            completion = {
              enabled_providers = ["lsp" "path" "snippets" "buffer"];
            };
            providers = {
              lsp = {
                name = "LSP";
                module = "blink.cmp.sources.lsp";
                enabled = true;
                transform_items = null;
                should_show_items = true;
                max_items = null;
                min_keyword_length = 0;
                fallback_for = [];
                score_offset = 0;
                override = null;
              };
              path = {
                name = "Path";
                module = "blink.cmp.sources.path";
                enabled = true;
                score_offset = 3;
                opts = {
                  trailing_slash = false;
                  label_trailing_slash = true;
                  get_cwd = {
                    __raw = "function(ctx) return vim.fn.expand(('#%d:p:h'):format(ctx.bufnr)) end";
                  };
                  show_hidden_files_by_default = false;
                };
              };
              snippets = {
                name = "Snippets";
                module = "blink.cmp.sources.snippets";
                enabled = true;
                score_offset = -3;
                opts = {
                  friendly_snippets = true;
                  search_paths = [
                    vim.fn.stdpath("config") + "/snippets"
                  ];
                  global_snippets = ["all"];
                  extended_filetypes = {};
                  ignored_filetypes = [];
                };
              };
              buffer = {
                name = "Buffer";
                module = "blink.cmp.sources.buffer";
                enabled = true;
                transform_items = null;
                should_show_items = true;
                max_items = null;
                min_keyword_length = 0;
                fallback_for = [];
                score_offset = -3;
                override = null;
              };
            };
          };

          # Windows configuration
          windows = {
            autocomplete = {
              min_width = 30;
              max_width = 60;
              max_height = 10;
              border = "rounded";
              winblend = 0;
              winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None";
              scrolloff = 2;
              scrollbar = true;
              direction_priority = ["s" "n"];
              auto_show = true;
              selection = "preselect";
              draw = "reversed";
              cycle = {
                from_bottom = true;
                from_top = true;
              };
            };
            documentation = {
              min_width = 10;
              max_width = 60;
              max_height = 20;
              border = "rounded";
              winblend = 0;
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None";
              direction_priority = ["e" "w" "n" "s"];
              auto_show = true;
              auto_show_delay_ms = 500;
              update_delay_ms = 100;
            };
            signature_help = {
              min_width = 1;
              max_width = 100;
              max_height = 10;
              border = "rounded";
              winblend = 0;
              winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder";
              direction_priority = ["n" "s"];
              treesitter_highlighting = true;
            };
            ghost_text = {
              enabled = true;
            };
          };

          # Kind configuration
          kind = {
            icons = {
              Text = "󰉿";
              Method = "󰆧";
              Function = "󰊕";
              Constructor = "";
              Field = "󰜢";
              Variable = "󰀫";
              Class = "󰠱";
              Interface = "";
              Module = "";
              Property = "󰜢";
              Unit = "󰑭";
              Value = "󰎠";
              Enum = "";
              Keyword = "󰌋";
              Snippet = "";
              Color = "󰏘";
              File = "󰈙";
              Reference = "󰈇";
              Folder = "󰉋";
              EnumMember = "";
              Constant = "󰏿";
              Struct = "󰙅";
              Event = "";
              Operator = "󰆕";
              TypeParameter = "";
            };
            icon_hl_group = "BlinkCmpKind";
          };

          # Appearance configuration
          appearance = {
            highlight_ns = "blink_cmp";
            use_nvim_cmp_as_default = true;
            nerd_font_variant = "mono";
            kind_icons = {
              Text = "󰉿";
              Method = "󰆧";
              Function = "󰊕";
              Constructor = "";
              Field = "󰜢";
              Variable = "󰀫";
              Class = "󰠱";
              Interface = "";
              Module = "";
              Property = "󰜢";
              Unit = "󰑭";
              Value = "󰎠";
              Enum = "";
              Keyword = "󰌋";
              Snippet = "";
              Color = "󰏘";
              File = "󰈙";
              Reference = "󰈇";
              Folder = "󰉋";
              EnumMember = "";
              Constant = "󰏿";
              Struct = "󰙅";
              Event = "";
              Operator = "󰆕";
              TypeParameter = "";
            };
          };

          # Completion configuration
          completion = {
            accept = {
              create_undo_point = true;
              auto_brackets = {
                enabled = true;
                default_brackets = ["(" ")" "[" "]" "{" "}"];
                override_brackets_for_filetypes = {};
                force_allow_filetypes = [];
                blocked_filetypes = [];
                kind_resolution = {
                  enabled = true;
                  blocked_filetypes = ["typescript" "typescriptreact" "javascript" "javascriptreact"];
                };
                semantic_token_resolution = {
                  enabled = true;
                  blocked_filetypes = [];
                  timeout_ms = 400;
                };
              };
            };
            menu = {
              enabled = true;
              min_width = 15;
              max_height = 10;
              border = "none";
              winblend = 0;
              winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None";
              scrolloff = 2;
              scrollbar = true;
              direction_priority = ["s" "n"];
              auto_show = true;
              selection = "preselect";
              draw = {
                treesitter_highlighting = true;
                columns = [
                  { "kind_icon"; }
                  { "label"; "label_description"; gap = 1; }
                  { "source_name"; }
                ];
                components = {
                  kind_icon = {
                    ellipsis = false;
                    text = {
                      __raw = "function(ctx) return ctx.kind_icon .. ctx.icon_gap end";
                    };
                    highlight = "BlinkCmpKind";
                  };
                  kind = {
                    ellipsis = false;
                    width = { fill = true; };
                    text = {
                      __raw = "function(ctx) return ctx.kind end";
                    };
                    highlight = "BlinkCmpKind";
                  };
                  label = {
                    width = { fill = true; max = 60; };
                    text = {
                      __raw = "function(ctx) return ctx.label .. ctx.label_detail end";
                    };
                    highlight = "BlinkCmpLabel";
                  };
                  label_description = {
                    width = { max = 30; };
                    text = {
                      __raw = "function(ctx) return ctx.label_description end";
                    };
                    highlight = "BlinkCmpLabelDescription";
                  };
                  source_name = {
                    width = { max = 30; };
                    text = {
                      __raw = "function(ctx) return ctx.source_name end";
                    };
                    highlight = "BlinkCmpSource";
                  };
                };
              };
              cycle = {
                from_bottom = true;
                from_top = true;
              };
            };
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
              update_delay_ms = 50;
              treesitter_highlighting = true;
              window = {
                min_width = 10;
                max_width = 60;
                max_height = 20;
                border = "rounded";
                winblend = 0;
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None";
                direction_priority = ["e" "w" "n" "s"];
                scrollbar = true;
              };
            };
            ghost_text = {
              enabled = true;
            };
          };

          # Signature help configuration
          signature = {
            enabled = true;
            trigger = {
              blocked_trigger_characters = [];
              blocked_retrigger_characters = [];
              show_on_insert_on_trigger_character = true;
            };
            window = {
              min_width = 1;
              max_width = 100;
              max_height = 10;
              border = "rounded";
              winblend = 0;
              winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder";
              direction_priority = ["n" "s"];
              treesitter_highlighting = true;
            };
          };
        };
      };

      # Luasnip for snippets
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };

      # Friendly snippets
      friendly-snippets = {
        enable = true;
      };

      # Autopairs for automatic bracket pairing
      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
          ts_config = {
            lua = ["string"];
            javascript = ["template_string"];
            java = false;
          };
          disable_filetype = ["TelescopePrompt" "spectre_panel"];
          disable_in_macro = true;
          disable_in_visualblock = false;
          disable_in_replace_mode = true;
          ignored_next_char = "[%w%.]";
          enable_moveright = true;
          enable_afterquote = true;
          enable_check_bracket_line = false;
          enable_bracket_in_quote = true;
          enable_abbr = false;
          break_undo = true;
          check_comma = true;
          map_cr = true;
          map_bs = true;
          map_c_h = false;
          map_c_w = false;
        };
      };
    };

    # Additional completion configuration
    extraConfigLua = ''
      -- Enhanced completion experience
      vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
      vim.opt.shortmess:append "c"

      -- Custom highlight groups for blink-cmp
      local highlights = {
        BlinkCmpMenu = { bg = "#2a273f", fg = "#e0def4" },
        BlinkCmpMenuBorder = { bg = "#2a273f", fg = "#908caa" },
        BlinkCmpMenuSelection = { bg = "#44415a", fg = "#e0def4" },
        BlinkCmpDoc = { bg = "#2a273f", fg = "#e0def4" },
        BlinkCmpDocBorder = { bg = "#2a273f", fg = "#908caa" },
        BlinkCmpDocCursorLine = { bg = "#44415a" },
        BlinkCmpSignatureHelp = { bg = "#2a273f", fg = "#e0def4" },
        BlinkCmpSignatureHelpBorder = { bg = "#2a273f", fg = "#908caa" },
        BlinkCmpKind = { fg = "#c4a7e7" },
        BlinkCmpLabel = { fg = "#e0def4" },
        BlinkCmpLabelDescription = { fg = "#908caa" },
        BlinkCmpSource = { fg = "#6e6a86" },
      }

      for group, color in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, color)
      end

      -- Enhance autopairs integration with completion
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local blink = require('blink.cmp')

      -- Add parentheses after function completion
      blink.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      -- Custom snippet expansion with better UX
      vim.keymap.set({"i", "s"}, "<C-k>", function()
        local luasnip = require('luasnip')
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-j>", function()
        local luasnip = require('luasnip')
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, {silent = true})

      -- Enhanced completion for different file types
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"gitcommit", "markdown"},
        callback = function()
          require('blink.cmp').setup_buffer({
            sources = {
              completion = {
                enabled_providers = {"buffer", "path"}
              }
            }
          })
        end
      })

      -- Show completion automatically for certain patterns
      vim.api.nvim_create_autocmd("TextChangedI", {
        pattern = "*",
        callback = function()
          local line = vim.api.nvim_get_current_line()
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local char = line:sub(col, col)

          -- Auto-show completion for certain trigger characters
          if char:match("[%.:]") then
            require('blink.cmp').show()
          end
        end
      })

      -- Performance optimizations
      vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
      vim.g.completion_matching_ignore_case = 1
      vim.g.completion_trigger_keyword_length = 2

      -- Custom completion source priorities by filetype
      local filetype_sources = {
        nix = {"lsp", "path", "buffer"},
        rust = {"lsp", "snippets", "path", "buffer"},
        python = {"lsp", "snippets", "path", "buffer"},
        javascript = {"lsp", "snippets", "path", "buffer"},
        typescript = {"lsp", "snippets", "path", "buffer"},
        go = {"lsp", "snippets", "path", "buffer"},
        java = {"lsp", "snippets", "path", "buffer"},
        c = {"lsp", "snippets", "path", "buffer"},
        cpp = {"lsp", "snippets", "path", "buffer"},
        markdown = {"buffer", "path", "snippets"},
        text = {"buffer", "path"},
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          local ft = vim.bo.filetype
          if filetype_sources[ft] then
            require('blink.cmp').setup_buffer({
              sources = {
                completion = {
                  enabled_providers = filetype_sources[ft]
                }
              }
            })
          end
        end
      })
    '';
  };
}
