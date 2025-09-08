{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # Core Vim options
    opts = {
      # Indentation - 4 spaces for tabs
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      autoindent = true;

      # Line numbers - relative line numbers
      number = true;
      relativenumber = true;
      signcolumn = "yes";

      # Clipboard integration
      clipboard = "unnamedplus";

      # Search settings
      hlsearch = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      # Visual enhancements
      termguicolors = true;
      cursorline = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;

      # Splits
      splitbelow = true;
      splitright = true;

      # Backup and undo
      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;

      # Performance
      updatetime = 250;
      timeoutlen = 300;

      # Command line
      cmdheight = 1;
      showmode = false;

      # Completion
      completeopt = ["menu" "menuone" "noselect"];

      # Folding
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldenable = false;
      foldlevel = 99;
      foldlevelstart = 99;

      # Mouse support
      mouse = "a";

      # Better display
      conceallevel = 0;
      laststatus = 3;

      # Smooth scrolling
      smoothscroll = true;
    };

    # Global variables
    globals = {
      mapleader = " ";
      maplocalleader = " ";

      # Disable some builtin plugins we don't need
      loaded_gzip = 1;
      loaded_zip = 1;
      loaded_zipPlugin = 1;
      loaded_tar = 1;
      loaded_tarPlugin = 1;
      loaded_getscript = 1;
      loaded_getscriptPlugin = 1;
      loaded_vimball = 1;
      loaded_vimballPlugin = 1;
      loaded_2html_plugin = 1;
      loaded_logiPat = 1;
      loaded_rrhelper = 1;
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      loaded_netrwSettings = 1;
      loaded_netrwFileHandlers = 1;
    };

    # Auto commands
    autoCmd = [
      # Auto-save
      {
        event = ["FocusLost" "BufLeave"];
        pattern = "*";
        command = "silent! wa";
      }

      # Highlight yanked text
      {
        event = "TextYankPost";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 150,
              })
            end
          '';
        };
      }

      # Auto-resize splits when vim is resized
      {
        event = "VimResized";
        pattern = "*";
        command = "tabdo wincmd =";
      }

      # Remove trailing whitespace on save
      {
        event = "BufWritePre";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              local save_cursor = vim.fn.getpos(".")
              vim.cmd([[%s/\s\+$//e]])
              vim.fn.setpos(".", save_cursor)
            end
          '';
        };
      }

      # Set filetype specific options
      {
        event = "FileType";
        pattern = ["markdown" "text"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.wrap = true
              vim.opt_local.linebreak = true
            end
          '';
        };
      }
    ];
  };
}
