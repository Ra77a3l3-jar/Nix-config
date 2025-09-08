{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Toggleterm - Terminal integration
      toggleterm = {
        enable = true;
        settings = {
          size = {
            __raw = ''
              function(term)
                if term.direction == "horizontal" then
                  return 15
                elseif term.direction == "vertical" then
                  return vim.o.columns * 0.4
                end
              end
            '';
          };
          open_mapping = "[[<c-\\>]]";
          on_create = {
            __raw = ''
              function(t)
                vim.opt.foldcolumn = "0"
                vim.opt.signcolumn = "no"
              end
            '';
          };
          on_open = {
            __raw = ''
              function(t)
                vim.cmd("startinsert!")
              end
            '';
          };
          on_close = {
            __raw = ''
              function(t)
                vim.cmd("stopinsert")
              end
            '';
          };
          hide_numbers = true;
          shade_filetypes = {};
          shade_terminals = true;
          shading_factor = 2;
          start_in_insert = true;
          insert_mappings = true;
          terminal_mappings = true;
          persist_size = true;
          persist_mode = true;
          direction = "float";
          close_on_exit = true;
          shell = null;
          auto_scroll = true;
          float_opts = {
            border = "curved";
            width = {
              __raw = ''
                function()
                  return math.floor(vim.o.columns * 0.8)
                end
              '';
            };
            height = {
              __raw = ''
                function()
                  return math.floor(vim.o.lines * 0.8)
                end
              '';
            };
            winblend = 0;
            zindex = 1000;
            title_pos = "center";
          };
          winbar = {
            enabled = false;
            name_formatter = {
              __raw = ''
                function(term)
                  return term.name
                end
              '';
            };
          };
        };
      };

      # Tmux navigation
      tmux-navigator = {
        enable = true;
        settings = {
          disable_when_zoomed = true;
          save_on_switch = 2;
          no_mappings = 0;
        };
      };
    };

    # Terminal keymaps and configuration
    keymaps = [
      # Terminal toggles
      {
        mode = "n";
        key = "<leader>tf";
        action = "<cmd>ToggleTerm direction=float<CR>";
        options = {
          desc = "Float Terminal";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>ToggleTerm size=10 direction=horizontal<CR>";
        options = {
          desc = "Horizontal Terminal";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tv";
        action = "<cmd>ToggleTerm size=80 direction=vertical<CR>";
        options = {
          desc = "Vertical Terminal";
          silent = true;
        };
      }

      # Terminal mode navigation
      {
        mode = "t";
        key = "<C-h>";
        action = "<cmd>wincmd h<CR>";
        options = {
          desc = "Move to left window";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<cmd>wincmd j<CR>";
        options = {
          desc = "Move to below window";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<cmd>wincmd k<CR>";
        options = {
          desc = "Move to above window";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<cmd>wincmd l<CR>";
        options = {
          desc = "Move to right window";
          silent = true;
        };
      }

      # Terminal escape
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
          silent = true;
        };
      }
      {
        mode = "t";
        key = "jk";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
          silent = true;
        };
      }
    ];

    # Additional terminal configuration
    extraConfigLua = ''
      -- Custom terminal commands
      local Terminal = require('toggleterm.terminal').Terminal

      -- Lazygit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9)
          end,
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {desc = "LazyGit", silent = true})

      -- Node.js REPL
      local node = Terminal:new({
        cmd = "node",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _NODE_TOGGLE()
        node:toggle()
      end

      vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", {desc = "Node REPL", silent = true})

      -- Python REPL
      local python = Terminal:new({
        cmd = "python3",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _PYTHON_TOGGLE()
        python:toggle()
      end

      vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", {desc = "Python REPL", silent = true})

      -- Rust REPL (if evcxr is available)
      local rust = Terminal:new({
        cmd = "evcxr",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _RUST_TOGGLE()
        rust:toggle()
      end

      vim.keymap.set("n", "<leader>tr", "<cmd>lua _RUST_TOGGLE()<CR>", {desc = "Rust REPL", silent = true})

      -- Zig REPL
      local zig = Terminal:new({
        cmd = "zig",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _ZIG_TOGGLE()
        zig:toggle()
      end

      vim.keymap.set("n", "<leader>tz", "<cmd>lua _ZIG_TOGGLE()<CR>", {desc = "Zig REPL", silent = true})

      -- Htop
      local htop = Terminal:new({
        cmd = "htop",
        direction = "float",
        float_opts = {
          border = "double",
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9)
          end,
        },
      })

      function _HTOP_TOGGLE()
        htop:toggle()
      end

      vim.keymap.set("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<CR>", {desc = "Htop", silent = true})

      -- Enhanced terminal experience
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
          local opts = {buffer = 0}
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end,
      })

      -- Auto-insert mode for terminals
      vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter", "TermOpen"}, {
        callback = function(args)
          if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.opt_local.wrap = true
            vim.opt_local.spell = false
            vim.cmd("startinsert")
          end
        end,
      })

      -- Terminal colors matching theme
      vim.g.terminal_color_0 = "#232136"  -- black
      vim.g.terminal_color_1 = "#eb6f92"  -- red
      vim.g.terminal_color_2 = "#9ccfd8"  -- green
      vim.g.terminal_color_3 = "#f6c177"  -- yellow
      vim.g.terminal_color_4 = "#3e8fb0"  -- blue
      vim.g.terminal_color_5 = "#c4a7e7"  -- magenta
      vim.g.terminal_color_6 = "#9ccfd8"  -- cyan
      vim.g.terminal_color_7 = "#e0def4"  -- white
      vim.g.terminal_color_8 = "#6e6a86"  -- bright black
      vim.g.terminal_color_9 = "#eb6f92"  -- bright red
      vim.g.terminal_color_10 = "#9ccfd8" -- bright green
      vim.g.terminal_color_11 = "#f6c177" -- bright yellow
      vim.g.terminal_color_12 = "#3e8fb0" -- bright blue
      vim.g.terminal_color_13 = "#c4a7e7" -- bright magenta
      vim.g.terminal_color_14 = "#9ccfd8" -- bright cyan
      vim.g.terminal_color_15 = "#e0def4" -- bright white

      -- Smart terminal splitting
      vim.keymap.set('n', '<leader>t-', function()
        vim.cmd('split')
        vim.cmd('terminal')
        vim.cmd('resize 15')
      end, { desc = 'Terminal Split Below' })

      vim.keymap.set('n', '<leader>t|', function()
        vim.cmd('vsplit')
        vim.cmd('terminal')
      end, { desc = 'Terminal Split Right' })

      -- Quick terminal commands
      local function run_command_in_terminal(cmd)
        local term = Terminal:new({
          cmd = cmd,
          direction = "float",
          close_on_exit = false,
          float_opts = {
            border = "double",
          },
        })
        term:toggle()
      end

      -- Git commands in terminal
      vim.keymap.set('n', '<leader>gS', function()
        run_command_in_terminal('git status')
      end, { desc = 'Git Status (Terminal)' })

      vim.keymap.set('n', '<leader>gL', function()
        run_command_in_terminal('git log --oneline -10')
      end, { desc = 'Git Log (Terminal)' })

      -- Build commands
      vim.keymap.set('n', '<leader>bb', function()
        local ft = vim.bo.filetype
        local commands = {
          rust = 'cargo build',
          go = 'go build',
          javascript = 'npm run build',
          typescript = 'npm run build',
          python = 'python setup.py build',
          java = 'mvn compile',
          c = 'make',
          cpp = 'make',
          nix = 'nix build',
        }
        local cmd = commands[ft]
        if cmd then
          run_command_in_terminal(cmd)
        else
          vim.notify('No build command for filetype: ' .. ft, vim.log.levels.WARN)
        end
      end, { desc = 'Build Project' })

      -- Test commands
      vim.keymap.set('n', '<leader>bt', function()
        local ft = vim.bo.filetype
        local commands = {
          rust = 'cargo test',
          go = 'go test ./...',
          javascript = 'npm test',
          typescript = 'npm test',
          python = 'python -m pytest',
          java = 'mvn test',
          nix = 'nix flake check',
        }
        local cmd = commands[ft]
        if cmd then
          run_command_in_terminal(cmd)
        else
          vim.notify('No test command for filetype: ' .. ft, vim.log.levels.WARN)
        end
      end, { desc = 'Test Project' })

      -- Run commands
      vim.keymap.set('n', '<leader>br', function()
        local ft = vim.bo.filetype
        local filename = vim.fn.expand('%')
        local commands = {
          rust = 'cargo run',
          go = 'go run .',
          javascript = 'node ' .. filename,
          typescript = 'npx ts-node ' .. filename,
          python = 'python3 ' .. filename,
          java = 'java ' .. vim.fn.expand('%:t:r'),
          c = './a.out',
          cpp = './a.out',
          lua = 'lua ' .. filename,
          nix = 'nix run',
        }
        local cmd = commands[ft]
        if cmd then
          run_command_in_terminal(cmd)
        else
          vim.notify('No run command for filetype: ' .. ft, vim.log.levels.WARN)
        end
      end, { desc = 'Run File/Project' })

      -- Enhanced terminal UI
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"
          vim.opt_local.foldcolumn = "0"
          vim.opt_local.winhl = "Normal:TerminalNormal"
        end,
      })

      -- Better terminal highlights
      vim.api.nvim_set_hl(0, "TerminalNormal", { bg = "#1f1d2e" })
      vim.api.nvim_set_hl(0, "TerminalBorder", { fg = "#908caa", bg = "#1f1d2e" })

      -- Smart terminal navigation with tmux
      if vim.env.TMUX then
        vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Tmux Navigate Left' })
        vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'Tmux Navigate Down' })
        vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'Tmux Navigate Up' })
        vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'Tmux Navigate Right' })
        vim.keymap.set('n', '<C-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = 'Tmux Navigate Previous' })
      end

      -- Project-specific terminal commands
      local function get_project_type()
        local cwd = vim.fn.getcwd()
        if vim.fn.filereadable(cwd .. '/Cargo.toml') == 1 then
          return 'rust'
        elseif vim.fn.filereadable(cwd .. '/go.mod') == 1 then
          return 'go'
        elseif vim.fn.filereadable(cwd .. '/package.json') == 1 then
          return 'node'
        elseif vim.fn.filereadable(cwd .. '/pom.xml') == 1 then
          return 'java'
        elseif vim.fn.filereadable(cwd .. '/Makefile') == 1 then
          return 'make'
        elseif vim.fn.filereadable(cwd .. '/flake.nix') == 1 then
          return 'nix'
        else
          return nil
        end
      end

      -- Smart project commands
      vim.keymap.set('n', '<leader>pc', function()
        local project_type = get_project_type()
        if project_type == 'rust' then
          run_command_in_terminal('cargo clean')
        elseif project_type == 'go' then
          run_command_in_terminal('go clean')
        elseif project_type == 'node' then
          run_command_in_terminal('npm run clean')
        elseif project_type == 'java' then
          run_command_in_terminal('mvn clean')
        elseif project_type == 'make' then
          run_command_in_terminal('make clean')
        elseif project_type == 'nix' then
          run_command_in_terminal('nix store gc')
        else
          vim.notify('No clean command for this project type', vim.log.levels.WARN)
        end
      end, { desc = 'Clean Project' })

      vim.keymap.set('n', '<leader>pi', function()
        local project_type = get_project_type()
        if project_type == 'rust' then
          run_command_in_terminal('cargo install --path .')
        elseif project_type == 'go' then
          run_command_in_terminal('go install')
        elseif project_type == 'node' then
          run_command_in_terminal('npm install')
        elseif project_type == 'java' then
          run_command_in_terminal('mvn install')
        elseif project_type == 'nix' then
          run_command_in_terminal('nix develop')
        else
          vim.notify('No install command for this project type', vim.log.levels.WARN)
        end
      end, { desc = 'Install/Setup Project' })

      -- Quick access to common development tools
      vim.keymap.set('n', '<leader>tg', function()
        run_command_in_terminal('git status && echo "\nPress Enter to continue..." && read')
      end, { desc = 'Git Status' })

      vim.keymap.set('n', '<leader>td', function()
        run_command_in_terminal('docker ps -a')
      end, { desc = 'Docker PS' })

      vim.keymap.set('n', '<leader>tk', function()
        run_command_in_terminal('kubectl get pods')
      end, { desc = 'Kubectl Pods' })

      -- Terminal buffer management
      vim.api.nvim_create_autocmd("TermClose", {
        callback = function()
          vim.schedule(function()
            if vim.bo.buftype == "terminal" then
              vim.cmd("bdelete! " .. vim.fn.expand("<abuf>"))
            end
          end)
        end,
      })

      -- Enhanced terminal cursor
      vim.api.nvim_create_autocmd({"TermEnter", "TermLeave"}, {
        callback = function()
          if vim.bo.buftype == "terminal" then
            vim.opt_local.cursorline = false
          end
        end,
      })

      -- Terminal title customization
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
          vim.opt_local.statusline = "%{b:term_title}"
        end,
      })

      -- Quick terminal shortcuts
      vim.keymap.set('n', '<leader>ts', function()
        vim.ui.input({prompt = 'Shell command: '}, function(cmd)
          if cmd then
            run_command_in_terminal(cmd)
          end
        end)
      end, { desc = 'Run Shell Command' })

      -- File-specific run commands
      vim.keymap.set('n', '<F5>', function()
        local ft = vim.bo.filetype
        local filename = vim.fn.expand('%:p')

        if ft == 'rust' then
          if vim.fn.filereadable('Cargo.toml') == 1 then
            run_command_in_terminal('cargo run')
          else
            run_command_in_terminal('rustc ' .. filename .. ' && ./' .. vim.fn.expand('%:t:r'))
          end
        elseif ft == 'go' then
          run_command_in_terminal('go run ' .. filename)
        elseif ft == 'python' then
          run_command_in_terminal('python3 ' .. filename)
        elseif ft == 'javascript' then
          run_command_in_terminal('node ' .. filename)
        elseif ft == 'typescript' then
          run_command_in_terminal('npx ts-node ' .. filename)
        elseif ft == 'java' then
          local classname = vim.fn.expand('%:t:r')
          run_command_in_terminal('javac ' .. filename .. ' && java ' .. classname)
        elseif ft == 'c' then
          local output = vim.fn.expand('%:t:r')
          run_command_in_terminal('gcc ' .. filename .. ' -o ' .. output .. ' && ./' .. output)
        elseif ft == 'cpp' then
          local output = vim.fn.expand('%:t:r')
          run_command_in_terminal('g++ ' .. filename .. ' -o ' .. output .. ' && ./' .. output)
        elseif ft == 'zig' then
          run_command_in_terminal('zig run ' .. filename)
        elseif ft == 'lua' then
          run_command_in_terminal('lua ' .. filename)
        elseif ft == 'nix' then
          run_command_in_terminal('nix-instantiate --eval ' .. filename)
        else
          vim.notify('No run command for filetype: ' .. ft, vim.log.levels.WARN)
        end
      end, { desc = 'Run Current File' })

      -- Debug mode for terminals
      vim.keymap.set('n', '<F6>', function()
        local ft = vim.bo.filetype
        local filename = vim.fn.expand('%:p')

        if ft == 'rust' then
          run_command_in_terminal('cargo run --bin ' .. vim.fn.expand('%:t:r'))
        elseif ft == 'go' then
          run_command_in_terminal('dlv debug ' .. filename)
        elseif ft == 'python' then
          run_command_in_terminal('python3 -m pdb ' .. filename)
        elseif ft == 'c' or ft == 'cpp' then
          local output = vim.fn.expand('%:t:r')
          run_command_in_terminal('gcc -g ' .. filename .. ' -o ' .. output .. ' && gdb ./' .. output)
        else
          vim.notify('No debug command for filetype: ' .. ft, vim.log.levels.WARN)
        end
      end, { desc = 'Debug Current File' })

      -- Terminal session management
      local terminal_sessions = {}

      local function save_terminal_session()
        terminal_sessions[vim.fn.getcwd()] = {
          terminals = {},
          active_terminal = nil
        }
      end

      local function restore_terminal_session()
        local session = terminal_sessions[vim.fn.getcwd()]
        if session then
          -- Restore terminal session logic here
        end
      end

      vim.keymap.set('n', '<leader>tS', save_terminal_session, { desc = 'Save Terminal Session' })
      vim.keymap.set('n', '<leader>tR', restore_terminal_session, { desc = 'Restore Terminal Session' })
    '';
  };
}
