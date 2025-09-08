{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # Global keymaps configuration
    keymaps = [
      # Leader key setup
      {
        mode = "";
        key = "<Space>";
        action = "<Nop>";
        options = {
          silent = true;
        };
      }

      # Better escape sequences
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options = {
          desc = "Exit insert mode";
          silent = true;
        };
      }
      {
        mode = "i";
        key = "kj";
        action = "<Esc>";
        options = {
          desc = "Exit insert mode";
          silent = true;
        };
      }

      # Helix-style navigation and selection
      {
        mode = "n";
        key = "gh";
        action = "0";
        options = {
          desc = "Go to line start";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gl";
        action = "$";
        options = {
          desc = "Go to line end";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gs";
        action = "^";
        options = {
          desc = "Go to first non-blank";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "ge";
        action = "G";
        options = {
          desc = "Go to end of file";
          silent = true;
        };
      }

      # Helix-style selection
      {
        mode = "n";
        key = "v";
        action = "v";
        options = {
          desc = "Select mode";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "v";
        action = "<Esc>";
        options = {
          desc = "Exit select mode";
          silent = true;
        };
      }

      # Window navigation (Helix-style with Ctrl)
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Move to left window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Move to below window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Move to above window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Move to right window";
          silent = true;
        };
      }

      # Window resizing
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<CR>";
        options = {
          desc = "Increase window height";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<CR>";
        options = {
          desc = "Decrease window height";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<CR>";
        options = {
          desc = "Decrease window width";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<CR>";
        options = {
          desc = "Increase window width";
          silent = true;
        };
      }

      # Buffer navigation
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options = {
          desc = "Previous buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "Next buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[b";
        action = "<cmd>bprevious<CR>";
        options = {
          desc = "Previous buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]b";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "Next buffer";
          silent = true;
        };
      }

      # Tab navigation
      {
        mode = "n";
        key = "<leader><tab>l";
        action = "<cmd>tablast<CR>";
        options = {
          desc = "Last Tab";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader><tab>f";
        action = "<cmd>tabfirst<CR>";
        options = {
          desc = "First Tab";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader><tab><tab>";
        action = "<cmd>tabnew<CR>";
        options = {
          desc = "New Tab";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader><tab>]";
        action = "<cmd>tabnext<CR>";
        options = {
          desc = "Next Tab";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader><tab>d";
        action = "<cmd>tabclose<CR>";
        options = {
          desc = "Close Tab";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader><tab>[";
        action = "<cmd>tabprevious<CR>";
        options = {
          desc = "Previous Tab";
          silent = true;
        };
      }

      # File operations
      {
        mode = "n";
        key = "<leader>fn";
        action = "<cmd>enew<CR>";
        options = {
          desc = "New File";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>w<CR>";
        options = {
          desc = "Save File";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fS";
        action = "<cmd>wa<CR>";
        options = {
          desc = "Save All Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fq";
        action = "<cmd>q<CR>";
        options = {
          desc = "Quit";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fQ";
        action = "<cmd>qa!<CR>";
        options = {
          desc = "Quit All (Force)";
          silent = true;
        };
      }

      # Find/Search operations (using mini.pick primarily)
      {
        mode = "n";
        key = "<leader>ff";
        action = {
          __raw = "function() require('mini.pick').builtin.files() end";
        };
        options = {
          desc = "Find Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = {
          __raw = "function() require('mini.pick').builtin.grep_live() end";
        };
        options = {
          desc = "Live Grep";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = {
          __raw = "function() require('mini.pick').builtin.buffers() end";
        };
        options = {
          desc = "Find Buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = {
          __raw = "function() require('mini.pick').builtin.oldfiles() end";
        };
        options = {
          desc = "Recent Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = {
          __raw = "function() require('mini.pick').builtin.help() end";
        };
        options = {
          desc = "Find Help";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fc";
        action = {
          __raw = "function() require('mini.pick').builtin.commands() end";
        };
        options = {
          desc = "Find Commands";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fk";
        action = {
          __raw = "function() require('mini.pick').builtin.keymaps() end";
        };
        options = {
          desc = "Find Keymaps";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = {
          __raw = "function() require('fzf-lua').grep_cword() end";
        };
        options = {
          desc = "Find Word Under Cursor";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fW";
        action = {
          __raw = "function() require('fzf-lua').grep_cWORD() end";
        };
        options = {
          desc = "Find WORD Under Cursor";
          silent = true;
        };
      }

      # File explorer
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          desc = "Toggle File Explorer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>NvimTreeFocus<CR>";
        options = {
          desc = "Focus File Explorer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = {
          __raw = "function() require('mini.files').open() end";
        };
        options = {
          desc = "Open Mini Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>O";
        action = {
          __raw = "function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end";
        };
        options = {
          desc = "Open Mini Files (Current File)";
          silent = true;
        };
      }

      # Code operations
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = {
          desc = "Code Actions";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = {
          desc = "Code Actions";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options = {
          desc = "Rename Symbol";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = {
          __raw = ''
            function()
              require('conform').format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000
              })
            end
          '';
        };
        options = {
          desc = "Format File";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>cf";
        action = {
          __raw = ''
            function()
              require('conform').format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000
              })
            end
          '';
        };
        options = {
          desc = "Format Selection";
          silent = true;
        };
      }

      # LSP operations
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options = {
          desc = "Go to Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        options = {
          desc = "Go to Declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options = {
          desc = "Go to References";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        options = {
          desc = "Go to Implementation";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gt";
        action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
        options = {
          desc = "Go to Type Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options = {
          desc = "Hover Documentation";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
        options = {
          desc = "Signature Help";
          silent = true;
        };
      }

      # Diagnostic navigation
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options = {
          desc = "Previous Diagnostic";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options = {
          desc = "Next Diagnostic";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options = {
          desc = "Show Diagnostics";
          silent = true;
        };
      }

      # Enhanced movement
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          desc = "Scroll down (centered)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Scroll up (centered)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Next search result (centered)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Previous search result (centered)";
          silent = true;
        };
      }

      # Enhanced editing
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options = {
          desc = "Join lines (preserve cursor)";
          silent = true;
        };
      }

      # Visual mode enhancements
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          desc = "Indent left (stay in visual)";
          silent = true;
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          desc = "Indent right (stay in visual)";
          silent = true;
        };
      }

      # Move lines up and down
      {
        mode = "v";
        key = "<A-j>";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move selection down";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<A-k>";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move selection up";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>m .+1<CR>==";
        options = {
          desc = "Move line down";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>m .-2<CR>==";
        options = {
          desc = "Move line up";
          silent = true;
        };
      }

      # Enhanced clipboard operations
      {
        mode = "v";
        key = "<leader>p";
        action = "\"_dP";
        options = {
          desc = "Paste without yanking";
          silent = true;
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "\"+y";
        options = {
          desc = "Yank to system clipboard";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
        options = {
          desc = "Yank line to system clipboard";
          silent = true;
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>d";
        action = "\"_d";
        options = {
          desc = "Delete to black hole register";
          silent = true;
        };
      }

      # Quick operations
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
        options = {
          desc = "Save";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<CR>";
        options = {
          desc = "Quit";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>Q";
        action = "<cmd>qa!<CR>";
        options = {
          desc = "Quit All (Force)";
          silent = true;
        };
      }

      # Search enhancements
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {
          desc = "Clear Search Highlight";
          silent = true;
        };
      }

      # Better increment/decrement
      {
        mode = "n";
        key = "+";
        action = "<C-a>";
        options = {
          desc = "Increment";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "-";
        action = "<C-x>";
        options = {
          desc = "Decrement";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "+";
        action = "g<C-a>";
        options = {
          desc = "Increment sequence";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "-";
        action = "g<C-x>";
        options = {
          desc = "Decrement sequence";
          silent = true;
        };
      }

      # Enhanced marks
      {
        mode = "n";
        key = "'";
        action = "`";
        options = {
          desc = "Go to mark (exact position)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "`";
        action = "'";
        options = {
          desc = "Go to mark (line start)";
          silent = true;
        };
      }

      # Toggle operations
      {
        mode = "n";
        key = "<leader>tn";
        action = "<cmd>set number!<CR>";
        options = {
          desc = "Toggle Line Numbers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tr";
        action = "<cmd>set relativenumber!<CR>";
        options = {
          desc = "Toggle Relative Numbers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tw";
        action = "<cmd>set wrap!<CR>";
        options = {
          desc = "Toggle Line Wrap";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = "<cmd>set spell!<CR>";
        options = {
          desc = "Toggle Spell Check";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tc";
        action = "<cmd>set cursorline!<CR>";
        options = {
          desc = "Toggle Cursor Line";
          silent = true;
        };
      }

      # Quick macro execution
      {
        mode = "n";
        key = "Q";
        action = "@q";
        options = {
          desc = "Execute macro q";
          silent = true;
        };
      }

      # Better command line navigation
      {
        mode = "c";
        key = "<C-a>";
        action = "<Home>";
        options = {
          desc = "Go to beginning";
        };
      }
      {
        mode = "c";
        key = "<C-e>";
        action = "<End>";
        options = {
          desc = "Go to end";
        };
      }
      {
        mode = "c";
        key = "<C-p>";
        action = "<Up>";
        options = {
          desc = "Previous command";
        };
      }
      {
        mode = "c";
        key = "<C-n>";
        action = "<Down>";
        options = {
          desc = "Next command";
        };
      }

      # Enhanced visual selection
      {
        mode = "n";
        key = "gV";
        action = "`[v`]";
        options = {
          desc = "Select last inserted text";
          silent = true;
        };
      }

      # Quick line operations
      {
        mode = "n";
        key = "<leader>ld";
        action = "dd";
        options = {
          desc = "Delete Line";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ly";
        action = "yy";
        options = {
          desc = "Yank Line";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>lc";
        action = "cc";
        options = {
          desc = "Change Line";
          silent = true;
        };
      }

      # Enhanced folding
      {
        mode = "n";
        key = "<space>";
        action = "za";
        options = {
          desc = "Toggle Fold";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zR";
        action = "zR";
        options = {
          desc = "Open All Folds";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zM";
        action = "zM";
        options = {
          desc = "Close All Folds";
          silent = true;
        };
      }

      # Quickfix navigation
      {
        mode = "n";
        key = "]q";
        action = "<cmd>cnext<CR>zz";
        options = {
          desc = "Next Quickfix";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[q";
        action = "<cmd>cprev<CR>zz";
        options = {
          desc = "Previous Quickfix";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]Q";
        action = "<cmd>clast<CR>zz";
        options = {
          desc = "Last Quickfix";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[Q";
        action = "<cmd>cfirst<CR>zz";
        options = {
          desc = "First Quickfix";
          silent = true;
        };
      }

      # Location list navigation
      {
        mode = "n";
        key = "]l";
        action = "<cmd>lnext<CR>zz";
        options = {
          desc = "Next Location";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[l";
        action = "<cmd>lprev<CR>zz";
        options = {
          desc = "Previous Location";
          silent = true;
        };
      }

      # Window operations
      {
        mode = "n";
        key = "<leader>wh";
        action = "<cmd>split<CR>";
        options = {
          desc = "Split Horizontal";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>wv";
        action = "<cmd>vsplit<CR>";
        options = {
          desc = "Split Vertical";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>wo";
        action = "<cmd>only<CR>";
        options = {
          desc = "Close Other Windows";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ww";
        action = "<C-w>w";
        options = {
          desc = "Next Window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>wd";
        action = "<cmd>close<CR>";
        options = {
          desc = "Close Window";
          silent = true;
        };
      }

      # Buffer operations
      {
        mode = "n";
        key = "<leader>bd";
        action = {
          __raw = "function() require('mini.bufremove').delete() end";
        };
        options = {
          desc = "Delete Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bD";
        action = {
          __raw = "function() require('mini.bufremove').delete(0, true) end";
        };
        options = {
          desc = "Delete Buffer (Force)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ba";
        action = "<cmd>%bd|e#|bd#<CR>";
        options = {
          desc = "Close All But Current";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bw";
        action = "<cmd>%bd<CR>";
        options = {
          desc = "Close All Buffers";
          silent = true;
        };
      }

      # Utility operations
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          desc = "Toggle Undo Tree";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>registers<CR>";
        options = {
          desc = "Show Registers";
          silent = true;
        };
      }

      # Mini.pick specific
      {
        mode = "n";
        key = "<leader><leader>";
        action = {
          __raw = "function() require('mini.pick').builtin.resume() end";
        };
        options = {
          desc = "Resume Last Picker";
          silent = true;
        };
      }

      # Enhanced search and replace
      {
        mode = "n";
        key = "<leader>sr";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        options = {
          desc = "Search and Replace Word";
        };
      }
      {
        mode = "v";
        key = "<leader>sr";
        action = ":s/\\%V";
        options = {
          desc = "Search and Replace in Selection";
        };
      }

      # Terminal operations
      {
        mode = "n";
        key = "<C-\\>";
        action = "<cmd>ToggleTerm<CR>";
        options = {
          desc = "Toggle Terminal";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit Terminal Mode";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "jk";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit Terminal Mode";
          silent = true;
        };
      }

      # File operations
      {
        mode = "n";
        key = "<leader>yf";
        action = {
          __raw = ''
            function()
              local filepath = vim.fn.expand('%:p')
              vim.fn.setreg('+', filepath)
              vim.notify('Copied filepath: ' .. filepath, vim.log.levels.INFO)
            end
          '';
        };
        options = {
          desc = "Yank Filepath";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>yn";
        action = {
          __raw = ''
            function()
              local filename = vim.fn.expand('%:t')
              vim.fn.setreg('+', filename)
              vim.notify('Copied filename: ' .. filename, vim.log.levels.INFO)
            end
          '';
        };
        options = {
          desc = "Yank Filename";
          silent = true;
        };
      }

      # Session management
      {
        mode = "n";
        key = "<leader>qs";
        action = {
          __raw = "function() require('persistence').save() end";
        };
        options = {
          desc = "Save Session";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ql";
        action = {
          __raw = "function() require('persistence').load() end";
        };
        options = {
          desc = "Load Session";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>qd";
        action = {
          __raw = "function() require('persistence').stop() end";
        };
        options = {
          desc = "Stop Session";
          silent = true;
        };
      }

      # Git operations (basic, more in git.nix)
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit";
          silent = true;
        };
      }

      # Zen mode
      {
        mode = "n";
        key = "<leader>z";
        action = "<cmd>ZenMode<CR>";
        options = {
          desc = "Toggle Zen Mode";
          silent = true;
        };
      }

      # Run file
      {
        mode = "n";
        key = "<F5>";
        action = {
          __raw = ''
            function()
              local ft = vim.bo.filetype
              local filename = vim.fn.expand('%:p')
              local commands = {
                rust = 'cargo run',
                go = 'go run ' .. filename,
                python = 'python3 ' .. filename,
                javascript = 'node ' .. filename,
                typescript = 'npx ts-node ' .. filename,
                java = 'java ' .. vim.fn.expand('%:t:r'),
                c = 'gcc ' .. filename .. ' -o /tmp/a.out && /tmp/a.out',
                cpp = 'g++ ' .. filename .. ' -o /tmp/a.out && /tmp/a.out',
                zig = 'zig run ' .. filename,
                lua = 'lua ' .. filename,
                nix = 'nix-instantiate --eval ' .. filename,
              }
              local cmd = commands[ft]
              if cmd then
                require('toggleterm.terminal').Terminal:new({
                  cmd = cmd,
                  direction = 'float',
                  close_on_exit = false,
                }):toggle()
              else
                vim.notify('No run command for filetype: ' .. ft, vim.log.levels.WARN)
              end
            end
          '';
        };
        options = {
          desc = "Run Current File";
          silent = true;
        };
      }
    ];

    # Additional keymap configuration
    extraConfigLua = ''
      -- Enhanced which-key integration
      local wk = require("which-key")

      -- Custom keymap helpers
      local function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
        if opts then
          options = vim.tbl_extend('force', options, opts)
        end
        vim.keymap.set(mode, lhs, rhs, options)
      end

      -- Helix-style object selection enhancements
      map({'o', 'x'}, 'ae', ':<C-U>normal! ggVG<CR>', { desc = 'Entire buffer' })
      map({'o', 'x'}, 'ie', ':<C-U>normal! ggVG<CR>', { desc = 'Entire buffer' })

      -- Enhanced word motions
      map('n', 'w', 'v:lua.smart_word_motion("w")', { expr = true, desc = 'Next word' })
      map('n', 'b', 'v:lua.smart_word_motion("b")', { expr = true, desc = 'Previous word' })
      map('n', 'e', 'v:lua.smart_word_motion("e")', { expr = true, desc = 'End of word' })

      -- Smart word motion function
      function _G.smart_word_motion(motion)
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local char = line:sub(col + 1, col + 1)

        if char:match('[%w_]') then
          return motion:upper()  -- Use WORD motion
        else
          return motion  -- Use word motion
        end
      end

      -- Enhanced text objects with treesitter
      map({'o', 'x'}, 'af', ':<C-U>lua require("nvim-treesitter.textobjects.select").select_textobject("@function.outer")<CR>')
      map({'o', 'x'}, 'if', ':<C-U>lua require("nvim-treesitter.textobjects.select").select_textobject("@function.inner")<CR>')
      map({'o', 'x'}, 'ac', ':<C-U>lua require("nvim-treesitter.textobjects.select").select_textobject("@class.outer")<CR>')
      map({'o', 'x'}, 'ic', ':<C-U>lua require("nvim-treesitter.textobjects.select").select_textobject("@class.inner")<CR>')

      -- Smart selection based on treesitter
      map({'n', 'v'}, '<leader>v', function()
        local ts_utils = require 'nvim-treesitter.ts_utils'
        local node = ts_utils.get_node_at_cursor()
        if node then
          ts_utils.update_selection(0, node)
        end
      end, { desc = 'Smart Select' })

      -- Enhanced jump list navigation
      map('n', '<C-o>', '<C-o>zz', { desc = 'Jump back (centered)' })
      map('n', '<C-i>', '<C-i>zz', { desc = 'Jump forward (centered)' })

      -- Better diff navigation
      if vim.o.diff then
        map('n', ']c', ']czz', { desc = 'Next diff (centered)' })
        map('n', '[c', '[czz', { desc = 'Previous diff (centered)' })
      end

      -- Context-aware keymaps
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'help', 'man'},
        callback = function()
          map('n', 'q', '<cmd>close<CR>', { buffer = true, desc = 'Close help' })
          map('n', '<CR>', '<C-]>', { buffer = true, desc = 'Follow link' })
          map('n', '<BS>', '<C-T>', { buffer = true, desc = 'Go back' })
        end
      })

      -- Quick access to commonly used registers
      map('n', '<leader>"a', '"ap', { desc = 'Paste from register a' })
      map('n', '<leader>"b', '"bp', { desc = 'Paste from register b' })
      map('n', '<leader>"c', '"cp', { desc = 'Paste from register c' })

      -- Enhanced undo/redo with branch navigation
      map('n', 'U', '<cmd>redo<CR>', { desc = 'Redo' })
      map('n', '<C-r>', 'g+', { desc = 'Newer undo state' })
      map('n', 'g-', 'g-', { desc = 'Older undo state' })

      -- Smart joining with automatic spacing
      map('n', 'J', function()
        local line = vim.api.nvim_get_current_line()
        local next_line = vim.api.nvim_buf_get_lines(0, vim.fn.line('.'), vim.fn.line('.') + 1, false)[1] or ""

        -- Join with appropriate spacing
        if line:match('[.!?]%s*$') and next_line:match('^%s*%u') then
          vim.cmd('normal! J2x')  -- Remove extra space after sentence
        else
          vim.cmd('normal! J')
        end
      end, { desc = 'Smart join lines' })

      -- Enhanced paragraph navigation
      map('n', '{', function()
        vim.cmd('normal! {')
        vim.cmd('normal! zz')
      end, { desc = 'Previous paragraph (centered)' })

      map('n', '}', function()
        vim.cmd('normal! }')
        vim.cmd('normal! zz')
      end, { desc = 'Next paragraph (centered)' })

      -- Better substitute command
      map('n', 's', function()
        local char = vim.fn.getchar()
        return ':s/\\V' .. vim.fn.nr2char(char) .. '//g<Left><Left>'
      end, { expr = true, desc = 'Substitute character' })

      -- Enhanced visual block mode
      map('n', '<C-v>', '<C-v>', { desc = 'Visual block mode' })
      map('v', '<C-v>', '<Esc><C-v>', { desc = 'Switch to visual block' })

      -- Quick access to common operations
      map('n', '<leader>,', ':e $MYVIMRC<CR>', { desc = 'Edit config' })
      map('n', '<leader>.', ':so $MYVIMRC<CR>', { desc = 'Reload config' })

      -- Enhanced command completion
      map('c', '<C-k>', '<C-p>', { desc = 'Previous completion' })
      map('c', '<C-j>', '<C-n>', { desc = 'Next completion' })
    '';
  };
}
