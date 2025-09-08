{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Mini.pick - Fuzzy finder (prioritized over fzf)
      mini = {
        enable = true;
        modules = {
          # Mini.pick - Fuzzy finder with beautiful UI
          pick = {
            mappings = {
              caret_left = "<Left>";
              caret_right = "<Right>";
              choose = "<CR>";
              choose_in_split = "<C-s>";
              choose_in_tabpage = "<C-t>";
              choose_in_vsplit = "<C-v>";
              choose_marked = "<M-CR>";
              delete_char = "<BS>";
              delete_char_right = "<Del>";
              delete_left = "<C-u>";
              delete_word = "<C-w>";
              mark = "<C-x>";
              mark_all = "<C-a>";
              move_down = "<C-n>";
              move_start = "<C-g>";
              move_up = "<C-p>";
              paste = "<C-r>";
              refine = "<C-Space>";
              refine_marked = "<M-Space>";
              scroll_down = "<C-f>";
              scroll_left = "<C-h>";
              scroll_right = "<C-l>";
              scroll_up = "<C-b>";
              stop = "<Esc>";
              toggle_info = "<S-Tab>";
              toggle_preview = "<Tab>";
            };
            options = {
              content_from_bottom = false;
              use_cache = false;
            };
            source = {
              name = null;
              cwd = null;
              show = null;
              preview = null;
            };
            window = {
              config = {
                __raw = ''
                  function()
                    local height = math.floor(0.618 * vim.o.lines)
                    local width = math.floor(0.618 * vim.o.columns)
                    return {
                      anchor = 'NW',
                      height = height,
                      width = width,
                      row = math.floor(0.5 * (vim.o.lines - height)),
                      col = math.floor(0.5 * (vim.o.columns - width)),
                      border = 'rounded',
                      title = 'Pick',
                      title_pos = 'center',
                    }
                  end
                '';
              };
              prompt_cursor = "▏";
              prompt_prefix = "❯ ";
            };
          };

          # Mini.files - File explorer (alternative to nvim-tree)
          files = {
            content = {
              filter = null;
              prefix = {
                __raw = "require('mini.files').default_prefix";
              };
              sort = null;
            };
            mappings = {
              close = "q";
              go_in = "l";
              go_in_plus = "<CR>";
              go_out = "h";
              go_out_plus = "H";
              mark_goto = "'";
              mark_set = "m";
              reset = "<BS>";
              reveal_cwd = "@";
              show_help = "g?";
              synchronize = "=";
              trim_left = "<";
              trim_right = ">";
            };
            options = {
              permanent_delete = true;
              use_as_default_explorer = false;
            };
            windows = {
              max_number = 3;
              preview = false;
              width_focus = 25;
              width_nofocus = 15;
              width_preview = 25;
            };
          };

          # Mini.map - Minimap
          map = {
            integrations = {
              __raw = ''
                require('mini.map').gen_integration.builtin_search(),
                require('mini.map').gen_integration.gitsigns(),
                require('mini.map').gen_integration.diagnostic({
                  error = 'DiagnosticFloatingError',
                  warn  = 'DiagnosticFloatingWarn',
                  info  = 'DiagnosticFloatingInfo',
                  hint  = 'DiagnosticFloatingHint',
                }),
              '';
            };
            symbols = {
              encode = {
                __raw = "require('mini.map').gen_encode_symbols.dot('4x2')";
              };
              scroll_line = "█";
              scroll_view = "┃";
            };
            window = {
              focusable = false;
              side = "right";
              show_integration_count = true;
              width = 10;
              winblend = 25;
              zindex = 10;
            };
          };

          # Mini.indentscope - Indent visualization
          indentscope = {
            draw = {
              delay = 100;
              animation = {
                __raw = "require('mini.indentscope').gen_animation.quadratic({ easing = 'out', duration = 100, unit = 'total' })";
              };
            };
            mappings = {
              object_scope = "ii";
              object_scope_with_border = "ai";
              goto_top = "[i";
              goto_bottom = "]i";
            };
            options = {
              border = "both";
              indent_at_cursor = true;
              try_as_border = false;
            };
            symbol = "╎";
          };

          # Mini.surround - Text object manipulation
          surround = {
            custom_surroundings = null;
            highlight_duration = 500;
            mappings = {
              add = "sa";
              delete = "sd";
              find = "sf";
              find_left = "sF";
              highlight = "sh";
              replace = "sr";
              update_n_lines = "sn";
              suffix_last = "l";
              suffix_next = "n";
            };
            n_lines = 20;
            respect_selection_type = false;
            search_method = "cover";
            silent = false;
          };

          # Mini.comment - Smart commenting
          comment = {
            options = {
              custom_commentstring = null;
              ignore_blank_line = false;
              start_of_line = false;
              pad_comment_parts = true;
            };
            mappings = {
              comment = "gc";
              comment_line = "gcc";
              comment_visual = "gc";
              textobject = "gc";
            };
            hooks = {
              pre = {
                __raw = "function() end";
              };
              post = {
                __raw = "function() end";
              };
            };
          };

          # Mini.pairs - Auto-pairs (complementing nvim-autopairs)
          pairs = {
            mappings = {
              "(" = { action = "open"; pair = "()" };
              "[" = { action = "open"; pair = "[]" };
              "{" = { action = "open"; pair = "{}" };
              ")" = { action = "close"; pair = "()" };
              "]" = { action = "close"; pair = "[]" };
              "}" = { action = "close"; pair = "{}" };
              "\"" = { action = "closeopen"; pair = "\"\"" };
              "'" = { action = "closeopen"; pair = "''" };
              "`" = { action = "closeopen"; pair = "``" };
            };
            modes = { insert = true; command = false; terminal = false };
          };

          # Mini.statusline - Status line (alternative to lualine if preferred)
          statusline = {
            content = {
              active = null;
              inactive = null;
            };
            use_icons = true;
            set_vim_settings = true;
          };

          # Mini.tabline - Tab line
          tabline = {
            show_icons = true;
            set_vim_settings = true;
            tabpage_section = "left";
          };

          # Mini.animate - Smooth animations
          animate = {
            cursor = {
              enable = true;
              timing = {
                __raw = "require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' })";
              };
              path = {
                __raw = "require('mini.animate').gen_path.line({ predicate = function() return true end })";
              };
            };
            scroll = {
              enable = true;
              timing = {
                __raw = "require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' })";
              };
              subscroll = {
                __raw = "require('mini.animate').gen_subscroll.equal({ predicate = function(total_scroll) return total_scroll > 1 end })";
              };
            };
            resize = {
              enable = true;
              timing = {
                __raw = "require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' })";
              };
              subresize = {
                __raw = "require('mini.animate').gen_subresize.equal({ predicate = function(total_resize) return total_resize > 1 end })";
              };
            };
            open = {
              enable = true;
              timing = {
                __raw = "require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' })";
              };
              winconfig = {
                __raw = "require('mini.animate').gen_winconfig.wipe({ direction = 'from_edge' })";
              };
              winblend = {
                __raw = "require('mini.animate').gen_winblend.linear({ from = 80, to = 0 })";
              };
            };
            close = {
              enable = true;
              timing = {
                __raw = "require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' })";
              };
              winconfig = {
                __raw = "require('mini.animate').gen_winconfig.wipe({ direction = 'to_edge' })";
              };
              winblend = {
                __raw = "require('mini.animate').gen_winblend.linear({ from = 0, to = 80 })";
              };
            };
          };

          # Mini.bufremove - Better buffer deletion
          bufremove = {
            set_vim_settings = true;
          };

          # Mini.sessions - Session management
          sessions = {
            autoread = false;
            autowrite = true;
            directory = "~/.local/share/nvim/sessions";
            file = "";
            force = { read = false; write = true; delete = false };
            hooks = {
              pre = { read = null; write = null; delete = null };
              post = { read = null; write = null; delete = null };
            };
            verbose = { read = false; write = true; delete = true };
          };

          # Mini.starter - Start screen (alternative to alpha)
          starter = {
            autoopen = true;
            evaluate_single = false;
            items = {
              __raw = ''
                {
                  require('mini.starter').sections.builtin_actions(),
                  require('mini.starter').sections.recent_files(10, false),
                  require('mini.starter').sections.recent_files(10, true),
                  -- Custom sections can be added here
                }
              '';
            };
            content_hooks = {
              __raw = ''
                {
                  require('mini.starter').gen_hook.adding_bullet(),
                  require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' }),
                  require('mini.starter').gen_hook.padding(3, 2),
                }
              '';
            };
            footer = "";
            header = {
              __raw = ''
                table.concat({
                  [[                                   ]],
                  [[   ███╗   ██╗ ██╗ ██╗  ██╗       ]],
                  [[   ████╗  ██║ ██║ ╚██╗██╔╝       ]],
                  [[   ██╔██╗ ██║ ██║  ╚███╔╝        ]],
                  [[   ██║╚██╗██║ ██║  ██╔██╗        ]],
                  [[   ██║ ╚████║ ██║ ██╔╝ ██╗       ]],
                  [[   ╚═╝  ╚═══╝ ╚═╝ ╚═╝  ╚═╝       ]],
                  [[                                   ]],
                  [[       [ version : 1.0.0 ]        ]],
                  [[                                   ]],
                }, '\n')
              '';
            };
            query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.";
            silent = false;
          };

          # Mini.jump - Enhanced f/t motions
          jump = {
            mappings = {
              forward = "f";
              backward = "F";
              forward_till = "t";
              backward_till = "T";
              repeat_jump = ";";
            };
            delay = {
              highlight = 250;
              idle_stop = 10000000;
            };
          };

          # Mini.jump2d - Jump to any location
          jump2d = {
            allowed_lines = {
              blank = true;
              cursor_before = true;
              cursor_at = true;
              cursor_after = true;
              fold = true;
            };
            allowed_windows = {
              current = true;
              not_current = true;
            };
            hooks = {
              before_start = null;
              after_jump = null;
            };
            labels = "abcdefghijklmnopqrstuvwxyz";
            mappings = {
              start_jumping = "<CR>";
            };
            silent = false;
            view = {
              dim = true;
              n_steps_ahead = 0;
            };
          };

          # Mini.cursorword - Highlight word under cursor
          cursorword = {
            delay = 100;
          };

          # Mini.hipatterns - Highlight patterns
          hipatterns = {
            highlighters = {
              fixme = { pattern = "%f[%w]()FIXME()%f[%W]"; group = "MiniHipatternsFixme" };
              hack = { pattern = "%f[%w]()HACK()%f[%W]"; group = "MiniHipatternsHack" };
              todo = { pattern = "%f[%w]()TODO()%f[%W]"; group = "MiniHipatternsTodo" };
              note = { pattern = "%f[%w]()NOTE()%f[%W]"; group = "MiniHipatternsNote" };
              hex_color = {
                __raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
              };
            };
          };

          # Mini.icons - Icon provider
          icons = {
            file = null;
            filetype = null;
            lsp = null;
            os = null;
            extension = null;
            directory = null;
            default = null;
            style = "glyph";
          };

          # Mini.notify - Notification system
          notify = {
            content = {
              format = null;
              sort = null;
            };
            lsp_progress = {
              enable = true;
              duration_last = 1000;
            };
            window = {
              config = {
                border = "rounded";
                zindex = 100;
              };
              max_width_share = 0.382;
              winblend = 25;
            };
          };

          # Mini.splitjoin - Split/join arguments, arrays, etc.
          splitjoin = {
            mappings = {
              toggle = "gS";
              split = "";
              join = "";
            };
            detect = {
              brackets = null;
              separator = ",";
              exclude_regions = null;
            };
            split = {
              hooks_pre = {};
              hooks_post = {};
            };
            join = {
              hooks_pre = {};
              hooks_post = {};
            };
          };

          # Mini.trailspace - Highlight trailing whitespace
          trailspace = {
            only_in_normal_buffers = true;
          };

          # Mini.visits - Track and navigate file visits
          visits = {
            list = {
              filter = null;
              sort = null;
            };
            track = {
              event = "BufEnter";
              delay = 1000;
            };
            store = {
              autowrite = true;
              normalize = null;
              path = {
                __raw = "vim.fn.stdpath('data') .. '/mini-visits'";
              };
            };
            silent = false;
          };
        };
      };
    };

    # Additional mini.nvim configuration
    extraConfigLua = ''
      -- Configure mini.pick as primary fuzzy finder
      vim.keymap.set('n', '<leader>ff', function()
        require('mini.pick').builtin.files()
      end, { desc = 'Find Files' })

      vim.keymap.set('n', '<leader>fg', function()
        require('mini.pick').builtin.grep_live()
      end, { desc = 'Live Grep' })

      vim.keymap.set('n', '<leader>fb', function()
        require('mini.pick').builtin.buffers()
      end, { desc = 'Find Buffers' })

      vim.keymap.set('n', '<leader>fh', function()
        require('mini.pick').builtin.help()
      end, { desc = 'Find Help' })

      vim.keymap.set('n', '<leader>fr', function()
        require('mini.pick').builtin.oldfiles()
      end, { desc = 'Recent Files' })

      vim.keymap.set('n', '<leader>fc', function()
        require('mini.pick').builtin.commands()
      end, { desc = 'Find Commands' })

      vim.keymap.set('n', '<leader>fk', function()
        require('mini.pick').builtin.keymaps()
      end, { desc = 'Find Keymaps' })

      -- Configure mini.files
      vim.keymap.set('n', '<leader>e', function()
        require('mini.files').open()
      end, { desc = 'File Explorer' })

      vim.keymap.set('n', '<leader>E', function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0))
      end, { desc = 'File Explorer (current file)' })

      -- Configure mini.map
      vim.keymap.set('n', '<leader>tm', function()
        require('mini.map').toggle()
      end, { desc = 'Toggle Minimap' })

      -- Configure mini.sessions
      vim.keymap.set('n', '<leader>ss', function()
        require('mini.sessions').select()
      end, { desc = 'Select Session' })

      vim.keymap.set('n', '<leader>sw', function()
        local session_name = vim.fn.input('Session name: ')
        if session_name ~= '' then
          require('mini.sessions').write(session_name)
        end
      end, { desc = 'Write Session' })

      vim.keymap.set('n', '<leader>sd', function()
        require('mini.sessions').select('delete')
      end, { desc = 'Delete Session' })

      -- Configure mini.bufremove
      vim.keymap.set('n', '<leader>bd', function()
        require('mini.bufremove').delete()
      end, { desc = 'Delete Buffer' })

      vim.keymap.set('n', '<leader>bD', function()
        require('mini.bufremove').delete(0, true)
      end, { desc = 'Delete Buffer (Force)' })

      -- Configure mini.visits
      vim.keymap.set('n', '<leader>fv', function()
        require('mini.extra').pickers.visit_paths()
      end, { desc = 'Visit Paths' })

      -- Enhanced mini.hipatterns colors
      vim.api.nvim_set_hl(0, 'MiniHipatternsFixme', { fg = '#eb6f92', bg = '#3d1f2e', bold = true })
      vim.api.nvim_set_hl(0, 'MiniHipatternsHack', { fg = '#f6c177', bg = '#4a3324', bold = true })
      vim.api.nvim_set_hl(0, 'MiniHipatternsTodo', { fg = '#9ccfd8', bg = '#1f3a2e', bold = true })
      vim.api.nvim_set_hl(0, 'MiniHipatternsNote', { fg = '#c4a7e7', bg = '#362a3d', bold = true })

      -- Custom mini.animate configuration for better UX
      local animate = require('mini.animate')

      -- Only animate when it makes sense
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason'},
        callback = function()
          vim.b.minianimate_disable = true
        end
      })

      -- Performance optimizations for mini modules
      vim.g.mini_animate_fps = 60
      vim.g.mini_cursorword_delay = 100
      vim.g.mini_indentscope_delay = 50

      -- Auto-close mini.files when opening a file
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesActionRename',
        callback = function(event)
          require('mini.files').close()
        end
      })

      -- Enhanced mini.pick experience
      local pick = require('mini.pick')

      -- Custom source for project-specific searches
      local function project_files()
        local cwd = vim.fn.getcwd()
        return pick.builtin.files({
          source = {
            cwd = cwd,
            show = function(buf_id, items, query)
              return pick.default_show(buf_id, items, query, { show_icons = true })
            end
          }
        })
      end

      vim.keymap.set('n', '<leader>fp', project_files, { desc = 'Find Project Files' })

      -- Smart defaults for different contexts
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'gitcommit',
        callback = function()
          -- Disable certain mini modules in git commit
          vim.b.miniindentscope_disable = true
          vim.b.minitrailspace_disable = true
        end
      })

      -- Integration with LSP for better picks
      vim.keymap.set('n', '<leader>fs', function()
        pick.builtin.lsp({ scope = 'document_symbol' })
      end, { desc = 'Find Symbols' })

      vim.keymap.set('n', '<leader>fS', function()
        pick.builtin.lsp({ scope = 'workspace_symbol' })
      end, { desc = 'Find Workspace Symbols' })

      -- Better integration with diagnostics
      vim.keymap.set('n', '<leader>fd', function()
        pick.builtin.diagnostic({ scope = 'current' })
      end, { desc = 'Find Diagnostics' })

      vim.keymap.set('n', '<leader>fD', function()
        pick.builtin.diagnostic({ scope = 'all' })
      end, { desc = 'Find All Diagnostics' })
    '';
  };
}
