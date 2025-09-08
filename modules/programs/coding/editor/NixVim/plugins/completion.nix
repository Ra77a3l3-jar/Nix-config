{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Blink-cmp - Modern completion engine
      blink-cmp = {
        enable = true;
        settings = {
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

          highlight = {
            ns = "blink_cmp";
            use_nvim_cmp_as_default = true;
          };

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

          fuzzy = {
            use_typo_resistance = true;
            use_frecency = true;
            use_proximity = true;
            max_items = 200;
            sorts = ["label" "kind" "score"];
          };

          sources = {
            completion = {
              enabled_providers = ["lsp" "path" "snippets" "buffer"];
            };
            providers = {
              lsp = {
                name = "LSP";
                module = "blink.cmp.sources.lsp";
                enabled = true;
              };
              path = {
                name = "Path";
                module = "blink.cmp.sources.path";
                enabled = true;
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
                opts = {
                  friendly_snippets = true;
                  search_paths = [
                    # Correct string concatenation in Nix
                    "${vim.fn.stdpath "config"}/snippets"
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
              };
            };
          };

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
            ghost_text = { enabled = true; };
          };

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

          appearance = {
            highlight_ns = "blink_cmp";
            use_nvim_cmp_as_default = true;
            nerd_font_variant = "mono";
          };
        };
      };

      # Luasnip
      luasnip = {
        enable = true;
        settings = { enable_autosnippets = true; store_selection_keys = "<Tab>"; };
        fromVscode = [
          { lazyLoad = true; paths = "${pkgs.vimPlugins.friendly-snippets}"; }
        ];
      };

      # Friendly snippets
      friendly-snippets = { enable = true; };

      # Autopairs
      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
          ts_config = { lua = ["string"]; javascript = ["template_string"]; java = false; };
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

    # Additional Lua configuration
    extraConfigLua = ''
      vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
      vim.opt.shortmess:append "c"
    '';
  };
}

