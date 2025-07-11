{ pkgs, lib, config, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias  = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      rose-pine
      which-key-nvim
      noice-nvim
      bufferline-nvim
      gitsigns-nvim

      mini-nvim           # mini.pairs only
      nvim-tree-lua       # file explorer

      fzf-vim
      telescope-nvim

      plenary-nvim
      nvim-web-devicons
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.o.termguicolors = true

      ----------------------------------------------------------------------------
      -- Theme: Rose Pine Dark --------------------------------------------------
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
        disable_background = false,
        dim_nc_background = true,
        disable_float_background = false,
      })
      vim.cmd.colorscheme("rose-pine")

      ----------------------------------------------------------------------------
      -- Which Key: Polished UI -------------------------------------------------
      require("which-key").setup({
        plugins = {
          marks = true,
          registers = true,
        },
        icons = {
          group      = "➤",
          separator  = "➜",
          breadcrumb = "»",
        },
        window = {
          border = "single",
          padding = { 1, 1, 1, 1 },
        },
        layout = {
          height = { min = 4, max = 25 },
          spacing = 4,
          align = "left"
        }
      })

      ----------------------------------------------------------------------------
      -- Noice UI Enhancements --------------------------------------------------
      require("noice").setup({
        presets = {
          command_palette = true,
          bottom_search = true,
          long_message_to_split = true,
        },
        lsp = { enabled = false }, -- no LSP integration
      })

      ----------------------------------------------------------------------------
      -- Mini Pairs -------------------------------------------------------------
      require("mini.pairs").setup()

      ----------------------------------------------------------------------------
      -- Bufferline -------------------------------------------------------------
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          show_close_icon = false,
          show_buffer_close_icons = false,
        },
      })

      ----------------------------------------------------------------------------
      -- GitSigns ---------------------------------------------------------------
      require("gitsigns").setup()

      ----------------------------------------------------------------------------
      -- Nvim Tree --------------------------------------------------------------
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_opened_files = "name",
        },
        filters = {
          dotfiles = false,
        },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

      ----------------------------------------------------------------------------
      -- Telescope / FZF --------------------------------------------------------
      vim.keymap.set("n", "<leader>ff", ":Files<CR>", { desc = "FZF: find file" })
      vim.keymap.set("n", "<leader>fg", ":Rg<CR>",    { desc = "FZF: grep" })
      vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Telescope: live grep" })
    '';
  };
}
