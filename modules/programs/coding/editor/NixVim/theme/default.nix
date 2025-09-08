{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # Rose Pine theme configuration
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        variant = "moon"; # Darker variant
        dark_variant = "moon";
        disable_background = false;
        disable_float_background = false;
        disable_italics = false;

        # Enhanced color palette
        palette = {
          # Base colors
          base = "#232136";
          surface = "#2a273f";
          overlay = "#393552";
          muted = "#6e6a86";
          subtle = "#908caa";
          text = "#e0def4";

          # Accent colors
          love = "#eb6f92";
          gold = "#f6c177";
          rose = "#ea9a97";
          pine = "#3e8fb0";
          foam = "#9ccfd8";
          iris = "#c4a7e7";

          # UI colors
          highlight_low = "#2a283e";
          highlight_med = "#44415a";
          highlight_high = "#56526e";
        };

        # Style configuration
        styles = {
          bold = true;
          italic = true;
          transparency = false;
        };

        # Group highlighting
        groups = {
          border = "muted";
          link = "iris";
          panel = "surface";

          error = "love";
          hint = "iris";
          info = "foam";
          warn = "gold";

          git_add = "foam";
          git_change = "rose";
          git_delete = "love";
          git_dirty = "rose";
          git_ignore = "muted";
          git_merge = "iris";
          git_rename = "pine";
          git_stage = "iris";
          git_text = "rose";
          git_untracked = "subtle";
        };
      };
    };

    # Additional theme-related configurations
    highlight = {
      # Rounded corners for various UI elements
      NormalFloat = {
        bg = "#2a273f";
        fg = "#e0def4";
      };
      FloatBorder = {
        bg = "#2a273f";
        fg = "#908caa";
      };

      # Enhanced cursor line
      CursorLine = {
        bg = "#2a283e";
      };
      CursorLineNr = {
        fg = "#c4a7e7";
        bold = true;
      };

      # Better visual selection
      Visual = {
        bg = "#44415a";
      };

      # Enhanced search highlighting
      Search = {
        bg = "#f6c177";
        fg = "#232136";
        bold = true;
      };
      IncSearch = {
        bg = "#eb6f92";
        fg = "#232136";
        bold = true;
      };

      # Better completion menu
      Pmenu = {
        bg = "#2a273f";
        fg = "#e0def4";
      };
      PmenuSel = {
        bg = "#44415a";
        fg = "#e0def4";
        bold = true;
      };
      PmenuSbar = {
        bg = "#393552";
      };
      PmenuThumb = {
        bg = "#908caa";
      };

      # Enhanced diagnostic highlights
      DiagnosticError = {
        fg = "#eb6f92";
      };
      DiagnosticWarn = {
        fg = "#f6c177";
      };
      DiagnosticInfo = {
        fg = "#9ccfd8";
      };
      DiagnosticHint = {
        fg = "#c4a7e7";
      };

      # Better diff colors
      DiffAdd = {
        bg = "#1f3a2e";
        fg = "#9ccfd8";
      };
      DiffChange = {
        bg = "#3d2a1f";
        fg = "#ea9a97";
      };
      DiffDelete = {
        bg = "#3d1f2e";
        fg = "#eb6f92";
      };
      DiffText = {
        bg = "#4a3324";
        fg = "#f6c177";
        bold = true;
      };

      # Enhanced fold styling
      Folded = {
        bg = "#2a283e";
        fg = "#908caa";
        italic = true;
      };
      FoldColumn = {
        bg = "#232136";
        fg = "#6e6a86";
      };

      # Better status line integration
      StatusLine = {
        bg = "#2a273f";
        fg = "#e0def4";
      };
      StatusLineNC = {
        bg = "#393552";
        fg = "#6e6a86";
      };

      # Enhanced tab line
      TabLine = {
        bg = "#393552";
        fg = "#908caa";
      };
      TabLineFill = {
        bg = "#232136";
      };
      TabLineSel = {
        bg = "#2a273f";
        fg = "#e0def4";
        bold = true;
      };

      # Better window separators
      WinSeparator = {
        fg = "#44415a";
        bg = "NONE";
      };
      VertSplit = {
        fg = "#44415a";
        bg = "NONE";
      };

      # Enhanced line numbers
      LineNr = {
        fg = "#6e6a86";
      };
      LineNrAbove = {
        fg = "#56526e";
      };
      LineNrBelow = {
        fg = "#56526e";
      };

      # Better matching parentheses
      MatchParen = {
        bg = "#44415a";
        fg = "#c4a7e7";
        bold = true;
      };

      # Enhanced special characters
      SpecialKey = {
        fg = "#6e6a86";
      };
      NonText = {
        fg = "#44415a";
      };
      Whitespace = {
        fg = "#393552";
      };
    };

    # Lua configuration for additional theming
    extraConfigLua = ''
      -- Set up rounded borders globally
      local border_style = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"},
      }

      -- Apply rounded borders to LSP handlers
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border_style
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      -- Enhanced cursor line for insert mode
      vim.api.nvim_create_autocmd({"InsertEnter"}, {
        pattern = "*",
        callback = function()
          vim.opt.cursorline = true
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3d2a1f" })
        end
      })

      vim.api.nvim_create_autocmd({"InsertLeave"}, {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a283e" })
        end
      })

      -- Glassmorphism effect for floating windows
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"NvimTree", "neo-tree", "Outline", "Trouble"},
        callback = function()
          vim.wo.winblend = 10
        end
      })

      -- Enhanced visual feedback for mode changes
      local mode_colors = {
        n = "#c4a7e7", -- Normal: Iris
        i = "#9ccfd8", -- Insert: Foam
        v = "#eb6f92", -- Visual: Love
        V = "#eb6f92", -- Visual Line: Love
        c = "#f6c177", -- Command: Gold
        r = "#ea9a97", -- Replace: Rose
      }

      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = function()
          local mode = vim.fn.mode()
          local color = mode_colors[mode] or "#e0def4"
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bold = true })
        end
      })
    '';
  };
}
