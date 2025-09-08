{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Snacks.nvim utilities (additional features)
      web-devicons = {
        enable = true;
        settings = {
          override = {
            zsh = {
              icon = "";
              color = "#428850";
              cterm_color = "65";
              name = "Zsh";
            };
          };
          color_icons = true;
          default = true;
          strict = true;
          override_by_filename = {
            ".gitignore" = {
              icon = "";
              color = "#f1502f";
              name = "Gitignore";
            };
          };
          override_by_extension = {
            "log" = {
              icon = "";
              color = "#81e043";
              name = "Log";
            };
          };
        };
      };

      # Todo-comments - Highlight TODO, FIXME, etc.
      todo-comments = {
        enable = true;
        settings = {
          signs = true;
          sign_priority = 8;
          keywords = {
            FIX = {
              icon = " ";
              color = "error";
              alt = ["FIXME" "BUG" "FIXIT" "ISSUE"];
            };
            TODO = {
              icon = " ";
              color = "info";
            };
            HACK = {
              icon = " ";
              color = "warning";
            };
            WARN = {
              icon = " ";
              color = "warning";
              alt = ["WARNING" "XXX"];
            };
            PERF = {
              icon = " ";
              alt = ["OPTIM" "PERFORMANCE" "OPTIMIZE"];
            };
            NOTE = {
              icon = " ";
              color = "hint";
              alt = ["INFO"];
            };
            TEST = {
              icon = "⏲ ";
              color = "test";
              alt = ["TESTING" "PASSED" "FAILED"];
            };
          };
          gui_style = {
            fg = "NONE";
            bg = "BOLD";
          };
          merge_keywords = true;
          highlight = {
            multiline = true;
            multiline_pattern = "^.";
            multiline_context = 10;
            before = "";
            keyword = "wide";
            after = "fg";
            pattern = "[[.*<(KEYWORDS)\s*:]]";
            comments_only = true;
            max_line_len = 400;
            exclude = {};
          };
          colors = {
            error = ["DiagnosticError" "ErrorMsg" "#eb6f92"];
            warning = ["DiagnosticWarn" "WarningMsg" "#f6c177"];
            info = ["DiagnosticInfo" "#9ccfd8"];
            hint = ["DiagnosticHint" "#c4a7e7"];
            default = ["Identifier" "#e0def4"];
            test = ["Identifier" "#3e8fb0"];
          };
          search = {
            command = "rg";
            args = [
              "--color=never"
              "--no-heading"
              "--with-filename"
              "--line-number"
              "--column"
            ];
            pattern = "\\b(KEYWORDS):";
          };
        };
      };

      # Persistence - Session management
      persistence = {
        enable = true;
        settings = {
          dir = {
            __raw = "vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/')";
          };
          options = ["buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp"];
          pre_save = null;
          save_empty = false;
        };
      };

      # Undotree - Visualize undo history
      undotree = {
        enable = true;
        settings = {
          FocusOnToggle = true;
          HighlightChangedText = true;
          HighlightChangedWithSign = true;
          HighlightSyntaxAdd = "DiffAdd";
          HighlightSyntaxChange = "DiffChange";
          HighlightSyntaxDel = "DiffDelete";
          HelpLine = true;
          RelativeTimestamp = true;
          SetFocusWhenToggle = true;
          ShortIndicators = false;
          SplitWidth = 40;
          TreeNodeShape = "*";
          TreeReturnShape = "\\";
          TreeSplitShape = "/";
          TreeVertShape = "|";
          WindowLayout = 3;
        };
      };

      # Wilder.nvim - Enhanced command line completion
      wilder = {
        enable = true;
        modes = [":" "/" "?"];
      };

      # Specs.nvim - Show cursor jumps
      specs = {
        enable = true;
        settings = {
          show_jumps = true;
          min_jump = 30;
          popup = {
            delay_ms = 0;
            inc_ms = 10;
            blend = 10;
            width = 10;
            winhl = "PMenu";
            fader = {
              __raw = "require('specs').pulse_fader";
            };
            resizer = {
              __raw = "require('specs').shrink_resizer";
            };
          };
          ignore_filetypes = {};
          ignore_buftypes = {
            nofile = true;
          };
        };
      };

      # Vim-repeat - Enhanced repeat functionality
      vim-repeat = {
        enable = true;
      };

      # Stabilize.nvim - Stable window layout
      stabilize = {
        enable = true;
        settings = {
          force = true;
          forcemark = null;
          ignore = {
            filetype = { "help" "list" "Trouble" };
            buftype = { "terminal" "quickfix" "loclist" };
          };
          nested = null;
        };
      };

      # Better-escape - Enhanced escape sequences
      better-escape = {
        enable = true;
        settings = {
          timeout = 200;
          default_mappings = true;
          mappings = {
            i = {
              j = {
                k = "<Esc>";
                j = "<Esc>";
              };
            };
            c = {
              j = {
                k = "<Esc>";
                j = "<Esc>";
              };
            };
            t = {
              j = {
                k = "<C-\\><C-n>";
              };
            };
            v = {
              j = {
                k = "<Esc>";
              };
            };
            s = {
              j = {
                k = "<Esc>";
              };
            };
          };
        };
      };

      # Lastplace - Remember cursor position
      lastplace = {
        enable = true;
        settings = {
          ignore_buftype = ["quickfix" "nofile" "help"];
          ignore_filetype = ["gitcommit" "gitrebase" "svn" "hgcommit"];
          open_folds = true;
        };
      };

      # Nvim-window-picker - Enhanced window selection
      nvim-window-picker = {
        enable = true;
        settings = {
          hint = "floating-big-letter";
          selection_chars = "FJDKSLA;CMRUEIWOQP";
          picker_config = {
            statusline_winbar_picker = {
              selection_display = {
                __raw = ''
                  function(char, windowid)
                    return "%=" .. char .. "%="
                  end
                '';
              };
              use_winbar = "never";
            };
            floating_big_letter = {
              font = "ansi-shadow";
            };
          };
          show_prompt = true;
          prompt_message = "Pick a window: ";
          filter_rules = {
            include_current_win = false;
            autoselect_one = true;
            bo = {
              filetype = { "neo-tree" "neo-tree-popup" "notify" };
              buftype = { "terminal" "quickfix" };
            };
          };
        };
      };

      # Vim-be-good - Practice vim motions
      vim-be-good = {
        enable = true;
      };

      # Numb.nvim - Peek line numbers
      numb = {
        enable = true;
        settings = {
          show_numbers = true;
          show_cursorline = true;
          hide_relativenumbers = true;
          number_only = false;
          centered_peeking = true;
        };
      };

      # Hlargs.nvim - Highlight function arguments
      hlargs = {
        enable = true;
        settings = {
          color = "#f6c177";
          highlight = {};
          excluded_filetypes = {};
          disable = {
            __raw = ''
              function(lang, bufnr)
                return vim.tbl_contains({ "help" }, lang)
              end
            '';
          };
          paint_arg_declarations = true;
          paint_arg_usages = true;
          paint_catch_blocks = {
            declarations = false;
            usages = false;
          };
          extras = {
            named_parameters = false;
          };
          hl_priority = 10000;
          excluded_argnames = {
            declarations = {};
            usages = {
              python = { "self" "cls" };
              lua = { "self" };
            };
          };
          performance = {
            parse_delay = 1;
            slow_parse_delay = 50;
            max_iterations = 400;
            max_concurrent_partial_parses = 30;
            debounce = {
              partial_parse = 3;
              partial_insert_mode = 100;
              total_parse = 700;
            };
          };
        };
      };
    };

    # Additional utilities configuration
    extraConfigLua = ''
      -- Enhanced todo-comments integration
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" })

      -- Todo comments in telescope/pick
      vim.keymap.set("n", "<leader>ft", function()
        require("todo-comments.fzf").todo()
      end, { desc = "Find Todo Comments" })

      vim.keymap.set("n", "<leader>fT", function()
        require("todo-comments.fzf").keywords()
      end, { desc = "Find Todo Keywords" })

      -- Session management keymaps
      vim.keymap.set("n", "<leader>qs", function()
        require("persistence").save()
      end, { desc = "Save Session" })

      vim.keymap.set("n", "<leader>ql", function()
        require("persistence").load()
      end, { desc = "Load Session" })

      vim.keymap.set("n", "<leader>qd", function()
        require("persistence").stop()
      end, { desc = "Stop Session" })

      -- Undotree keymaps
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

      -- Window picker integration
      vim.keymap.set("n", "<leader>wp", function()
        local window_number = require('nvim-window-picker').pick_window()
        if window_number then
          vim.api.nvim_set_current_win(window_number)
        end
      end, { desc = "Pick Window" })

      -- Enhanced cursor jump visualization
      vim.api.nvim_set_hl(0, 'SpecsPopup', { bg = '#c4a7e7', fg = '#232136' })

      -- Better wilder configuration
      local wilder = require('wilder')
      wilder.setup({
        modes = {':', '/', '?'},
        next_key = '<Tab>',
        previous_key = '<S-Tab>',
        accept_key = '<Down>',
        reject_key = '<Up>'
      })

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            sorter = wilder.difflib_sorter(),
          }),
          wilder.vim_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = 're',
          })
        ),
      })

      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = {
            border = 'Normal',
            accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#c4a7e7'}}),
          },
          border = 'rounded',
          max_height = '75%',
          min_height = 0,
          prompt_position = 'top',
          reverse = 0,
        })
      ))

      -- Performance monitoring
      local function check_performance()
        local start_time = vim.fn.reltime()
        return function()
          local elapsed = vim.fn.reltimestr(vim.fn.reltime(start_time))
          vim.notify('Operation took: ' .. elapsed .. 's', vim.log.levels.INFO)
        end
      end

      -- Startup time optimization
      vim.api.nvim_create_user_command('StartupTime', function()
        vim.cmd('!hyperfine "nvim --headless +qa"')
      end, {})

      -- Memory usage monitoring
      vim.api.nvim_create_user_command('MemoryUsage', function()
        local mem_usage = vim.fn.system('ps -o pid,vsz,rss,pcpu,comm -p ' .. vim.fn.getpid())
        vim.notify(mem_usage, vim.log.levels.INFO)
      end, {})

      -- Buffer information
      vim.keymap.set('n', '<leader>bi', function()
        local bufnr = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local buftype = vim.bo[bufnr].buftype
        local filetype = vim.bo[bufnr].filetype
        local modified = vim.bo[bufnr].modified
        local readonly = vim.bo[bufnr].readonly
        local lines = vim.api.nvim_buf_line_count(bufnr)

        local info = string.format([[
Buffer Info:
  Number: %d
  Name: %s
  Type: %s
  Filetype: %s
  Lines: %d
  Modified: %s
  Readonly: %s]],
          bufnr,
          bufname,
          buftype,
          filetype,
          lines,
          modified and "Yes" or "No",
          readonly and "Yes" or "No"
        )
        vim.notify(info, vim.log.levels.INFO)
      end, { desc = 'Buffer Info' })

      -- Enhanced spell checking
      vim.keymap.set('n', '<leader>ts', function()
        vim.wo.spell = not vim.wo.spell
        if vim.wo.spell then
          vim.notify('Spell checking enabled', vim.log.levels.INFO)
        else
          vim.notify('Spell checking disabled', vim.log.levels.INFO)
        end
      end, { desc = 'Toggle Spell Check' })

      -- Word count for writers
      vim.api.nvim_create_user_command('WordCount', function()
        local words = vim.fn.wordcount()
        local message = string.format('Words: %d, Characters: %d, Lines: %d',
          words.words or 0,
          words.chars or 0,
          vim.api.nvim_buf_line_count(0)
        )
        vim.notify(message, vim.log.levels.INFO)
      end, {})

      vim.keymap.set('n', '<leader>wc', '<cmd>WordCount<CR>', { desc = 'Word Count' })

      -- Quick file operations
      vim.keymap.set('n', '<leader>fn', function()
        vim.ui.input({prompt = 'New file name: '}, function(name)
          if name then
            vim.cmd('edit ' .. name)
          end
        end)
      end, { desc = 'New File' })

      vim.keymap.set('n', '<leader>fd', function()
        vim.ui.input({prompt = 'Directory name: '}, function(name)
          if name then
            vim.fn.mkdir(name, 'p')
            vim.notify('Directory created: ' .. name, vim.log.levels.INFO)
          end
        end)
      end, { desc = 'New Directory' })

      -- File permissions viewer
      vim.api.nvim_create_user_command('FilePermissions', function()
        local file = vim.fn.expand('%:p')
        if file ~= '' then
          local perms = vim.fn.system('ls -la ' .. vim.fn.shellescape(file))
          vim.notify(perms, vim.log.levels.INFO)
        end
      end, {})

      -- Quick config editing
      vim.keymap.set('n', '<leader>ce', function()
        local config_files = {
          'NixVim Config' = '~/.config/nixos/modules/programs/coding/editor/nixvim/',
          'Home Config' = '~/.config/nixos/home.nix',
          'System Config' = '~/.config/nixos/configuration.nix',
          'Flake' = '~/.config/nixos/flake.nix',
        }

        vim.ui.select(vim.tbl_keys(config_files), {
          prompt = 'Edit config: ',
        }, function(choice)
          if choice then
            vim.cmd('edit ' .. config_files[choice])
          end
        end)
      end, { desc = 'Edit Config' })

      -- Plugin management helpers
      vim.api.nvim_create_user_command('PluginInfo', function()
        vim.cmd('Lazy')
      end, {})

      vim.keymap.set('n', '<leader>pi', '<cmd>PluginInfo<CR>', { desc = 'Plugin Info' })

      -- Health check
      vim.keymap.set('n', '<leader>ch', '<cmd>checkhealth<CR>', { desc = 'Check Health' })

      -- Enhanced yank/paste operations
      vim.keymap.set('n', '<leader>ya', 'ggVGy', { desc = 'Yank All' })
      vim.keymap.set('n', '<leader>yf', function()
        local filepath = vim.fn.expand('%:p')
        vim.fn.setreg('+', filepath)
        vim.notify('Copied filepath: ' .. filepath, vim.log.levels.INFO)
      end, { desc = 'Yank Filepath' })

      vim.keymap.set('n', '<leader>yn', function()
        local filename = vim.fn.expand('%:t')
        vim.fn.setreg('+', filename)
        vim.notify('Copied filename: ' .. filename, vim.log.levels.INFO)
      end, { desc = 'Yank Filename' })

      -- Quick line operations
      vim.keymap.set('n', '<leader>ld', 'dd', { desc = 'Delete Line' })
      vim.keymap.set('n', '<leader>ly', 'yy', { desc = 'Yank Line' })
      vim.keymap.set('n', '<leader>lc', 'cc', { desc = 'Change Line' })

      -- Enhanced search and replace
      vim.keymap.set('n', '<leader>/', function()
        vim.ui.input({prompt = 'Search: '}, function(pattern)
          if pattern then
            vim.fn.setreg('/', pattern)
            vim.cmd('normal! n')
          end
        end)
      end, { desc = 'Search' })

      -- Centered search navigation
      vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
      vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

      -- Enhanced visual mode operations
      vim.keymap.set('v', '<leader>s', ':sort<CR>', { desc = 'Sort Selection' })
      vim.keymap.set('v', '<leader>u', ':sort u<CR>', { desc = 'Sort Unique' })

      -- Quick macro operations
      vim.keymap.set('n', 'Q', '@q', { desc = 'Execute macro q' })

      -- Better command history
      vim.keymap.set('c', '<C-p>', '<Up>', { desc = 'Previous command' })
      vim.keymap.set('c', '<C-n>', '<Down>', { desc = 'Next command' })

      -- Enhanced visual selection
      vim.keymap.set('n', 'gV', '`[v`]', { desc = 'Select last inserted text' })

      -- Better increment/decrement
      vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment' })
      vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement' })
      vim.keymap.set('v', '+', 'g<C-a>', { desc = 'Increment sequence' })
      vim.keymap.set('v', '-', 'g<C-x>', { desc = 'Decrement sequence' })
    '';
  };
}
