{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Gitsigns - Git decorations and hunks
      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
            untracked = {
              text = "▎";
            };
          };
          signs_staged = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
          };
          signcolumn = true;
          numhl = false;
          linehl = false;
          word_diff = false;
          watch_gitdir = {
            follow_files = true;
          };
          auto_attach = true;
          attach_to_untracked = false;
          current_line_blame = false;
          current_line_blame_opts = {
            virt_text = true;
            virt_text_pos = "eol";
            delay = 1000;
            ignore_whitespace = false;
            virt_text_priority = 100;
          };
          current_line_blame_formatter = "<author>, <author_time:%R> - <summary>";
          sign_priority = 6;
          update_debounce = 100;
          status_formatter = null;
          max_file_length = 40000;
          preview_config = {
            border = "rounded";
            style = "minimal";
            relative = "cursor";
            row = 0;
            col = 1;
          };
          on_attach = {
            __raw = ''
              function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                  opts = opts or {}
                  opts.buffer = bufnr
                  vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                  if vim.wo.diff then
                    vim.cmd.normal({']c', bang = true})
                  else
                    gitsigns.nav_hunk('next')
                  end
                end, {desc = 'Next Hunk'})

                map('n', '[c', function()
                  if vim.wo.diff then
                    vim.cmd.normal({'[c', bang = true})
                  else
                    gitsigns.nav_hunk('prev')
                  end
                end, {desc = 'Previous Hunk'})

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk, {desc = 'Stage Hunk'})
                map('n', '<leader>hr', gitsigns.reset_hunk, {desc = 'Reset Hunk'})
                map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Stage Hunk'})
                map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Reset Hunk'})
                map('n', '<leader>hS', gitsigns.stage_buffer, {desc = 'Stage Buffer'})
                map('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = 'Undo Stage Hunk'})
                map('n', '<leader>hR', gitsigns.reset_buffer, {desc = 'Reset Buffer'})
                map('n', '<leader>hp', gitsigns.preview_hunk, {desc = 'Preview Hunk'})
                map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = 'Blame Line'})
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = 'Toggle Line Blame'})
                map('n', '<leader>hd', gitsigns.diffthis, {desc = 'Diff This'})
                map('n', '<leader>hD', function() gitsigns.diffthis('~') end, {desc = 'Diff This ~'})
                map('n', '<leader>td', gitsigns.toggle_deleted, {desc = 'Toggle Deleted'})

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = 'GitSigns Select Hunk'})
              end
            '';
          };
        };
      };

      # Lazygit integration
      lazygit = {
        enable = true;
        settings = {
          floating_window_winblend = 0;
          floating_window_scaling_factor = 0.9;
          floating_window_border_chars = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
          floating_window_use_plenary = false;
          use_neovim_remote = true;
          use_custom_config_file_path = false;
          config_file_path = [];
        };
      };

      # Fugitive - Git wrapper
      fugitive = {
        enable = true;
      };

      # Git-blame
      git-blame = {
        enable = true;
        settings = {
          enabled = false; # Start disabled, toggle with command
          message_template = " <summary> • <date> • <author> ";
          date_format = "%m-%d-%Y %H:%M:%S";
          virtual_text_column = null;
          display_virtual_text = true;
          ignored_filetypes = ["lua"];
          delay = 1000;
          virtual_text_options = {
            virt_text = true;
            virt_text_pos = "eol";
            virt_text_priority = 100;
            virt_text_repeat_linebreak = false;
          };
          schedule_event = "CursorMoved";
          clear_event = "CursorMovedI";
        };
      };

      # Diffview - Enhanced diff viewing
      diffview = {
        enable = true;
        settings = {
          diff_binaries = false;
          enhanced_diff_hl = false;
          git_cmd = ["git"];
          hg_cmd = ["hg"];
          use_icons = true;
          show_help_hints = true;
          watch_index = true;
          icons = {
            folder_closed = "";
            folder_open = "";
          };
          signs = {
            fold_closed = "";
            fold_open = "";
            done = "✓";
          };
          view = {
            default = {
              layout = "diff2_horizontal";
              disable_diagnostics = false;
              winbar_info = false;
            };
            merge_tool = {
              layout = "diff3_horizontal";
              disable_diagnostics = true;
              winbar_info = true;
            };
            file_history = {
              layout = "diff2_horizontal";
              disable_diagnostics = false;
              winbar_info = false;
            };
          };
          file_panel = {
            listing_style = "tree";
            tree_options = {
              flatten_dirs = true;
              folder_statuses = "only_folded";
            };
            win_config = {
              position = "left";
              width = 35;
              win_opts = {};
            };
          };
          file_history_panel = {
            log_options = {
              git = {
                single_file = {
                  diff_merges = "combined";
                };
                multi_file = {
                  diff_merges = "first-parent";
                };
              };
              hg = {
                single_file = {};
                multi_file = {};
              };
            };
            win_config = {
              position = "bottom";
              height = 16;
              win_opts = {};
            };
          };
          commit_log_panel = {
            win_config = {
              win_opts = {};
            };
          };
          default_args = {
            DiffviewOpen = {};
            DiffviewFileHistory = {};
          };
          hooks = {};
          keymaps = {
            disable_defaults = false;
            view = {
              "<tab>" = "select_next_entry";
              "<s-tab>" = "select_prev_entry";
              "gf" = "goto_file_edit";
              "<C-w><C-f>" = "goto_file_split";
              "<C-w>gf" = "goto_file_tab";
              "<leader>e" = "focus_files";
              "<leader>b" = "toggle_files";
              "g<C-x>" = "cycle_layout";
              "[x" = "prev_conflict";
              "]x" = "next_conflict";
              "<leader>co" = "conflict_choose_ours";
              "<leader>ct" = "conflict_choose_theirs";
              "<leader>cb" = "conflict_choose_both";
              "<leader>c0" = "conflict_choose_none";
              "dx" = "conflict_choose_all";
              "dX" = "conflict_choose_none";
            };
            diff1 = {
              "g?" = "help";
            };
            diff2 = {
              "g?" = "help";
            };
            diff3 = {
              "g?" = "help";
            };
            diff4 = {
              "g?" = "help";
            };
            file_panel = {
              "j" = "next_entry";
              "<down>" = "next_entry";
              "k" = "prev_entry";
              "<up>" = "prev_entry";
              "<cr>" = "select_entry";
              "o" = "select_entry";
              "l" = "select_entry";
              "<2-LeftMouse>" = "select_entry";
              "-" = "toggle_stage_entry";
              "S" = "stage_all";
              "U" = "unstage_all";
              "X" = "restore_entry";
              "L" = "open_commit_log";
              "zo" = "open_fold";
              "h" = "close_fold";
              "zc" = "close_fold";
              "za" = "toggle_fold";
              "zR" = "expand_all";
              "zM" = "collapse_all";
              "<c-b>" = "scroll_view(-0.25)";
              "<c-f>" = "scroll_view(0.25)";
              "<tab>" = "select_next_entry";
              "<s-tab>" = "select_prev_entry";
              "gf" = "goto_file_edit";
              "<C-w><C-f>" = "goto_file_split";
              "<C-w>gf" = "goto_file_tab";
              "i" = "listing_style";
              "f" = "toggle_flatten_dirs";
              "g<C-x>" = "cycle_layout";
              "[x" = "prev_conflict";
              "]x" = "next_conflict";
              "g?" = "help";
              "<leader>e" = "focus_files";
              "<leader>b" = "toggle_files";
            };
            file_history_panel = {
              "g!" = "options";
              "<C-A-d>" = "open_in_diffview";
              "y" = "copy_hash";
              "L" = "open_commit_log";
              "zR" = "expand_all";
              "zM" = "collapse_all";
              "j" = "next_entry";
              "<down>" = "next_entry";
              "k" = "prev_entry";
              "<up>" = "prev_entry";
              "<cr>" = "select_entry";
              "o" = "select_entry";
              "<2-LeftMouse>" = "select_entry";
              "<c-b>" = "scroll_view(-0.25)";
              "<c-f>" = "scroll_view(0.25)";
              "<tab>" = "select_next_entry";
              "<s-tab>" = "select_prev_entry";
              "gf" = "goto_file_edit";
              "<C-w><C-f>" = "goto_file_split";
              "<C-w>gf" = "goto_file_tab";
              "g<C-x>" = "cycle_layout";
              "g?" = "help";
            };
            option_panel = {
              "<tab>" = "select_entry";
              "q" = "close";
              "g?" = "help";
            };
            help_panel = {
              "q" = "close";
            };
          };
        };
      };

      # Neogit - Magit clone
      neogit = {
        enable = true;
        settings = {
          disable_signs = false;
          disable_hint = false;
          disable_context_highlighting = false;
          disable_commit_confirmation = false;
          disable_builtin_notifications = false;
          disable_insert_on_commit = true;
          use_per_project_settings = true;
          remember_settings = true;
          fetch_after_checkout = false;
          auto_refresh = true;
          auto_show_console = true;
          use_default_keymaps = true;
          commit_editor = {
            kind = "tab";
            show_staged_diff = true;
            staged_diff_split_kind = "split";
          };
          console = {
            kind = "tab";
          };
          popup = {
            kind = "split";
          };
          signs = {
            hunk = ["", ""];
            item = ["►", "▼"];
            section = ["►", "▼"];
          };
          integrations = {
            telescope = true;
            diffview = true;
            fzf_lua = false;
          };
          sections = {
            sequencer = {
              folded = false;
              hidden = false;
            };
            untracked = {
              folded = false;
              hidden = false;
            };
            unstaged = {
              folded = false;
              hidden = false;
            };
            staged = {
              folded = false;
              hidden = false;
            };
            stashes = {
              folded = true;
              hidden = false;
            };
            unpulled_upstream = {
              folded = true;
              hidden = false;
            };
            unmerged_upstream = {
              folded = false;
              hidden = false;
            };
            unpulled_pushRemote = {
              folded = true;
              hidden = false;
            };
            unmerged_pushRemote = {
              folded = false;
              hidden = false;
            };
            recent = {
              folded = true;
              hidden = false;
            };
            rebase = {
              folded = true;
              hidden = false;
            };
          };
          mappings = {
            commit_editor = {
              "q" = "Close";
              "<c-c><c-c>" = "Submit";
              "<c-c><c-k>" = "Abort";
            };
            commit_editor_I = {
              "<c-c><c-c>" = "Submit";
              "<c-c><c-k>" = "Abort";
            };
            rebase_editor = {
              "p" = "Pick";
              "r" = "Reword";
              "e" = "Edit";
              "s" = "Squash";
              "f" = "Fixup";
              "x" = "Execute";
              "d" = "Drop";
              "b" = "Break";
              "q" = "Close";
              "<cr>" = "OpenCommit";
              "gk" = "MoveUp";
              "gj" = "MoveDown";
              "<c-c><c-c>" = "Submit";
              "<c-c><c-k>" = "Abort";
              "[c" = "OpenOrScrollUp";
              "]c" = "OpenOrScrollDown";
            };
            rebase_editor_I = {
              "<c-c><c-c>" = "Submit";
              "<c-c><c-k>" = "Abort";
            };
            finder = {
              "<cr>" = "Select";
              "<c-c>" = "Close";
              "<esc>" = "Close";
              "<c-n>" = "Next";
              "<c-p>" = "Previous";
              "<down>" = "Next";
              "<up>" = "Previous";
              "<tab>" = "MultiselectToggleNext";
              "<s-tab>" = "MultiselectTogglePrevious";
              "<c-j>" = "NOP";
            };
            popup = {
              "?" = "HelpPopup";
              "A" = "CherryPickPopup";
              "D" = "DiffPopup";
              "M" = "RemotePopup";
              "P" = "PushPopup";
              "X" = "ResetPopup";
              "Z" = "StashPopup";
              "b" = "BranchPopup";
              "c" = "CommitPopup";
              "f" = "FetchPopup";
              "l" = "LogPopup";
              "m" = "MergePopup";
              "p" = "PullPopup";
              "r" = "RebasePopup";
              "t" = "TagPopup";
              "v" = "RevertPopup";
              "w" = "WorktreePopup";
            };
            status = {
              "q" = "Close";
              "I" = "InitRepo";
              "1" = "Depth1";
              "2" = "Depth2";
              "3" = "Depth3";
              "4" = "Depth4";
              "<tab>" = "Toggle";
              "x" = "Discard";
              "s" = "Stage";
              "S" = "StageUnstaged";
              "<c-s>" = "StageAll";
              "u" = "Unstage";
              "U" = "UnstageStaged";
              "$" = "CommandHistory";
              "Y" = "YankSelected";
              "<c-r>" = "RefreshBuffer";
              "<cr>" = "GoToFile";
              "<c-v>" = "VSplitOpen";
              "<c-x>" = "SplitOpen";
              "<c-t>" = "TabOpen";
              "{" = "GoToPreviousHunkHeader";
              "}" = "GoToNextHunkHeader";
              "[c" = "OpenOrScrollUp";
              "]c" = "OpenOrScrollDown";
            };
          };
        };
      };

      # Git conflict resolution
      git-conflict = {
        enable = true;
        settings = {
          default_mappings = true;
          default_commands = true;
          disable_diagnostics = false;
          list_opener = "copen";
          highlights = {
            incoming = "DiffAdd";
            current = "DiffText";
          };
        };
      };
    };

    # Additional git configuration and keymaps
    keymaps = [
      # Lazygit
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit";
          silent = true;
        };
      }

      # Fugitive
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Git<CR>";
        options = {
          desc = "Git Status";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Git push<CR>";
        options = {
          desc = "Git Push";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gP";
        action = "<cmd>Git pull<CR>";
        options = {
          desc = "Git Pull";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Git blame<CR>";
        options = {
          desc = "Git Blame";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gB";
        action = "<cmd>GBrowse<CR>";
        options = {
          desc = "Git Browse";
          silent = true;
        };
      }

      # Diffview
      {
        mode = "n";
        key = "<leader>gd";
        action = "<cmd>DiffviewOpen<CR>";
        options = {
          desc = "Diff View";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gh";
        action = "<cmd>DiffviewFileHistory<CR>";
        options = {
          desc = "File History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gH";
        action = "<cmd>DiffviewFileHistory %<CR>";
        options = {
          desc = "Current File History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gq";
        action = "<cmd>DiffviewClose<CR>";
        options = {
          desc = "Close Diff View";
          silent = true;
        };
      }

      # Neogit
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>Neogit<CR>";
        options = {
          desc = "Neogit";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = "<cmd>Neogit commit<CR>";
        options = {
          desc = "Git Commit";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = "<cmd>Neogit log<CR>";
        options = {
          desc = "Git Log";
          silent = true;
        };
      }

      # Git-blame toggle
      {
        mode = "n";
        key = "<leader>tB";
        action = "<cmd>GitBlameToggle<CR>";
        options = {
          desc = "Toggle Git Blame";
          silent = true;
        };
      }

      # Git conflict resolution
      {
        mode = "n";
        key = "<leader>co";
        action = "<cmd>GitConflictChooseOurs<CR>";
        options = {
          desc = "Choose Ours";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ct";
        action = "<cmd>GitConflictChooseTheirs<CR>";
        options = {
          desc = "Choose Theirs";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cb";
        action = "<cmd>GitConflictChooseBoth<CR>";
        options = {
          desc = "Choose Both";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>c0";
        action = "<cmd>GitConflictChooseNone<CR>";
        options = {
          desc = "Choose None";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[x";
        action = "<cmd>GitConflictPrevConflict<CR>";
        options = {
          desc = "Previous Conflict";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]x";
        action = "<cmd>GitConflictNextConflict<CR>";
        options = {
          desc = "Next Conflict";
          silent = true;
        };
      }
    ];

    # Additional git configuration
    extraConfigLua = ''
      -- Enhanced gitsigns setup
      local gitsigns = require('gitsigns')

      -- Custom highlighting for git signs
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#9ccfd8', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#f6c177', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#eb6f92', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = '#eb6f92', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#f6c177', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#c4a7e7', bg = 'NONE' })

      -- Better git blame virtual text
      vim.api.nvim_create_user_command('GitBlameToggle', function()
        gitsigns.toggle_current_line_blame()
      end, {})

      -- Smart git operations
      vim.api.nvim_create_user_command('GitStageFile', function()
        gitsigns.stage_buffer()
        vim.notify('File staged', vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command('GitUnstageFile', function()
        gitsigns.reset_buffer_index()
        vim.notify('File unstaged', vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command('GitResetFile', function()
        gitsigns.reset_buffer()
        vim.notify('File reset', vim.log.levels.WARN)
      end, {})

      -- Auto-refresh git signs on focus
      vim.api.nvim_create_autocmd('FocusGained', {
        pattern = '*',
        callback = function()
          gitsigns.refresh()
        end
      })

      -- Show git status in statusline when in git repo
      local function git_status()
        local head = vim.b.gitsigns_head or vim.g.gitsigns_head
        if head then
          return '  ' .. head
        else
          return ''
        end
      end

      -- Enhanced diffview setup
      local actions = require("diffview.actions")

      require("diffview").setup({
        hooks = {
          diff_buf_read = function(bufnr)
            -- Change local options in diff buffers
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.colorcolumn = "80"
          end,
          view_opened = function(view)
            vim.notify(string.format("Opened %s", view.class:name()), vim.log.levels.INFO)
          end,
        },
      })

      -- Custom git commands
      vim.api.nvim_create_user_command('GitDiffBranch', function(opts)
        vim.cmd('DiffviewOpen ' .. (opts.args or 'main'))
      end, { nargs = '?' })

      vim.api.nvim_create_user_command('GitDiffCached', function()
        vim.cmd('DiffviewOpen --cached')
      end, {})

      vim.api.nvim_create_user_command('GitFileHistory', function()
        vim.cmd('DiffviewFileHistory %')
      end, {})

      -- Better integration with which-key for git mappings
      local wk = require("which-key")
      wk.add({
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git Hunks" },
        { "<leader>gh", group = "Git History" },
        { "<leader>gc", group = "Git Conflicts" },
      })

      -- Auto-open quickfix for git conflicts
      vim.api.nvim_create_autocmd('User', {
        pattern = 'GitConflictDetected',
        callback = function()
          vim.notify('Git conflicts detected', vim.log.levels.WARN)
          vim.cmd('GitConflictListQf')
        end
      })

      -- Enhanced git blame with better formatting
      vim.api.nvim_create_user_command('GitBlameFile', function()
        local file = vim.fn.expand('%:p')
        local line = vim.fn.line('.')
        local cmd = string.format('git blame -L %d,%d --date=short %s', line, line, file)
        local result = vim.fn.system(cmd)
        if vim.v.shell_error == 0 then
          local blame_info = vim.split(result, '\n')[1]
          vim.notify(blame_info, vim.log.levels.INFO)
        end
      end, {})

      -- Smart commit message templates
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'gitcommit',
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.textwidth = 72
          vim.opt_local.colorcolumn = '50,72'

          -- Insert mode mappings for common commit prefixes
          local common_prefixes = {
            ['feat'] = 'feat: ',
            ['fix'] = 'fix: ',
            ['docs'] = 'docs: ',
            ['style'] = 'style: ',
            ['refactor'] = 'refactor: ',
            ['test'] = 'test: ',
            ['chore'] = 'chore: ',
          }

          for abbr, expansion in pairs(common_prefixes) do
            vim.cmd(string.format('inoreabbrev <buffer> %s %s', abbr, expansion))
          end
        end
      })

      -- Performance optimization for large git repositories
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*',
        callback = function()
          local file_size = vim.fn.getfsize(vim.fn.expand('%'))
          if file_size > 100000 then  -- 100KB
            vim.b.gitsigns_attach = false
          end
        end
      })

      -- Git worktree integration
      vim.api.nvim_create_user_command('GitWorktreeList', function()
        vim.cmd('!git worktree list')
      end, {})

      vim.api.nvim_create_user_command('GitWorktreeAdd', function(opts)
        if opts.args == '' then
          vim.ui.input({prompt = 'Branch name: '}, function(branch)
            if branch then
              vim.cmd('!git worktree add ../' .. branch .. ' -b ' .. branch)
            end
          end)
        else
          vim.cmd('!git worktree add ' .. opts.args)
        end
      end, { nargs = '*' })

      -- Integration with terminal for git commands
      local function run_git_command(cmd)
        vim.cmd('vsplit term://git ' .. cmd)
      end

      vim.keymap.set('n', '<leader>gst', function() run_git_command('status') end, { desc = 'Git Status (Terminal)' })
      vim.keymap.set('n', '<leader>glo', function() run_git_command('log --oneline -10') end, { desc = 'Git Log (Terminal)' })
      vim.keymap.set('n', '<leader>gsh', function() run_git_command('show HEAD') end, { desc = 'Git Show HEAD (Terminal)' })
