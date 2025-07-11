{ pkgs, lib, config, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias  = true;
    vimAlias = true;

    # Core / UI plugins
    plugins = with pkgs.vimPlugins; [
      rose-pine               # Dark colourscheme
      lualine-nvim            # Status‑line
      which-key-nvim          # Helix‑like key‑hint popup
      noice-nvim              # Better ‑‑cmd‑line & LSP UI
      bufferline-nvim         # Tab‑bar for buffers
      gitsigns-nvim           # Git gutter

      mini-nvim               # mini.* collection → mini.pairs
      blink-cmp               # Cursor blink on completion entry

      fzf-vim                 # FZF inside Neovim
      telescope-nvim          # Grep / Fuzzy finder interface

      # Runtime deps
      plenary-nvim
      nvim-web-devicons
    ];

    extraPackages = with pkgs; [
      ripgrep   # `Rg` for live‑grep
      fd        # fast file finder used by Telescope/FZF
    ];

    # Lua configuration injected after plugins are loaded
    extraLuaConfig = ''
      ---------------------------------------------------------------------------
      -- General ----------------------------------------------------------------
      vim.o.termguicolors = true

      -- Rose‑Pine dark variant --------------------------------------------------
      require("rose-pine").setup({
        variant = "moon",       -- dark theme
        dark_variant = "moon",
      })
      vim.cmd.colorscheme("rose-pine")

      ---------------------------------------------------------------------------
      -- Lualine -----------------------------------------------------------------
      require("lualine").setup({
        options = {
          theme = "rose-pine",
          component_separators = "",
          section_separators   = "",
        },
      })

      ---------------------------------------------------------------------------
      -- Which‑Key (Helix style) -------------------------------------------------
      require("which-key").setup({
        window = {
          border = "rounded",
          margin = { 1, 2, 1, 2 },
        },
        icons = {
          group      = "▶",    -- similar to Helix
          separator  = "➜",
        },
      })

      ---------------------------------------------------------------------------
      -- Noice -------------------------------------------------------------------
      require("noice").setup({
        presets = {
          command_palette = true,  -- cmd‑line at top ‑> palette
          bottom_search   = true,  -- classic bottom search
        },
        lsp = {
          progress = { enabled = true },
          signature = { enabled = false },
        },
      })

      ---------------------------------------------------------------------------
      -- Blink‑cmp ---------------------------------------------------------------
      require("blink-cmp").setup({
        highlight = "CursorLine", -- subtle flash
      })

      ---------------------------------------------------------------------------
      -- mini.pairs --------------------------------------------------------------
      require("mini.pairs").setup()

      ---------------------------------------------------------------------------
      -- Bufferline --------------------------------------------------------------
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          show_close_icon = false,
        },
      })

      ---------------------------------------------------------------------------
      -- Gitsigns ----------------------------------------------------------------
      require("gitsigns").setup()

      ---------------------------------------------------------------------------
      -- Telescope / FZF key‑bindings -------------------------------------------
      vim.keymap.set("n", "<leader>ff", ":Files<CR>", { desc = "FZF: find file" })
      vim.keymap.set("n", "<leader>fg", ":Rg<CR>",    { desc = "FZF: live grep" })
      vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep,
        { desc = "Telescope: live grep" })
    '';
  };
}

