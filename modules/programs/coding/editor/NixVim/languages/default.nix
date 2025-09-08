{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # Language-specific configurations
    filetype = {
      extension = {
        mdx = "markdown";
        conf = "conf";
        env = "sh";
        tiltfile = "python";
        cls = "tex";
      };
      filename = {
        ".envrc" = "sh";
        "Tiltfile" = "python";
        "Dockerfile.prod" = "dockerfile";
        "Dockerfile.dev" = "dockerfile";
        ".gitignore" = "gitignore";
        ".dockerignore" = "gitignore";
        "flake.lock" = "json";
      };
      pattern = {
        ".*%.env%..*" = "sh";
        ".*%.conf" = "conf";
        ".*/waybar/config" = "jsonc";
        ".*/kitty/*.conf" = "bash";
        ".*/hypr/.*%.conf" = "hyprlang";
        "%.kv$" = "kvlang";
      };
    };

    # Language-specific auto commands
    autoCmd = [
      # C/C++ specific settings
      {
        event = "FileType";
        pattern = ["c" "cpp" "h" "hpp"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.cindent = true
              vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
              vim.opt_local.textwidth = 80
              vim.opt_local.colorcolumn = "80"
              vim.opt_local.commentstring = "// %s"
            end
          '';
        };
      }

      # Java specific settings
      {
        event = "FileType";
        pattern = "java";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 4
              vim.opt_local.tabstop = 4
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
              vim.opt_local.makeprg = "javac %"
            end
          '';
        };
      }

      # Rust specific settings
      {
        event = "FileType";
        pattern = "rust";
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 100
              vim.opt_local.colorcolumn = "100"
              vim.opt_local.makeprg = "cargo build"

              -- Rust-specific keymaps
              vim.keymap.set('n', '<leader>rc', '<cmd>!cargo check<CR>', { buffer = true, desc = 'Cargo Check' })
              vim.keymap.set('n', '<leader>rb', '<cmd>!cargo build<CR>', { buffer = true, desc = 'Cargo Build' })
              vim.keymap.set('n', '<leader>rr', '<cmd>!cargo run<CR>', { buffer = true, desc = 'Cargo Run' })
              vim.keymap.set('n', '<leader>rt', '<cmd>!cargo test<CR>', { buffer = true, desc = 'Cargo Test' })
              vim.keymap.set('n', '<leader>rd', '<cmd>!cargo doc --open<CR>', { buffer = true, desc = 'Cargo Doc' })
              vim.keymap.set('n', '<leader>ru', '<cmd>!cargo update<CR>', { buffer = true, desc = 'Cargo Update' })
              vim.keymap.set('n', '<leader>rf', '<cmd>!cargo fmt<CR>', { buffer = true, desc = 'Cargo Format' })
              vim.keymap.set('n', '<leader>rl', '<cmd>!cargo clippy<CR>', { buffer = true, desc = 'Cargo Clippy' })
            end
          '';
        };
      }

      # Go specific settings
      {
        event = "FileType";
        pattern = "go";
        callback = {
          __raw = ''
            function()
              vim.opt_local.tabstop = 4
              vim.opt_local.shiftwidth = 4
              vim.opt_local.softtabstop = 4
              vim.opt_local.expandtab = false
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
              vim.opt_local.makeprg = "go build"

              -- Go-specific keymaps
              vim.keymap.set('n', '<leader>gb', '<cmd>!go build<CR>', { buffer = true, desc = 'Go Build' })
              vim.keymap.set('n', '<leader>gr', '<cmd>!go run .<CR>', { buffer = true, desc = 'Go Run' })
              vim.keymap.set('n', '<leader>gt', '<cmd>!go test ./...<CR>', { buffer = true, desc = 'Go Test' })
              vim.keymap.set('n', '<leader>gf', '<cmd>!go fmt<CR>', { buffer = true, desc = 'Go Format' })
              vim.keymap.set('n', '<leader>gm', '<cmd>!go mod tidy<CR>', { buffer = true, desc = 'Go Mod Tidy' })
              vim.keymap.set('n', '<leader>gi', '<cmd>!go get .<CR>', { buffer = true, desc = 'Go Install' })
              vim.keymap.set('n', '<leader>gv', '<cmd>!go vet<CR>', { buffer = true, desc = 'Go Vet' })
            end
          '';
        };
      }

      # Python specific settings
      {
        event = "FileType";
        pattern = "python";
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 88
              vim.opt_local.colorcolumn = "88"
              vim.opt_local.makeprg = "python3 %"

              -- Python-specific keymaps
              vim.keymap.set('n', '<leader>pr', '<cmd>!python3 %<CR>', { buffer = true, desc = 'Python Run' })
              vim.keymap.set('n', '<leader>pt', '<cmd>!python3 -m pytest<CR>', { buffer = true, desc = 'Python Test' })
              vim.keymap.set('n', '<leader>pf', '<cmd>!black %<CR>', { buffer = true, desc = 'Python Format' })
              vim.keymap.set('n', '<leader>pl', '<cmd>!flake8 %<CR>', { buffer = true, desc = 'Python Lint' })
              vim.keymap.set('n', '<leader>pi', '<cmd>!pip install -r requirements.txt<CR>', { buffer = true, desc = 'Pip Install' })
            end
          '';
        };
      }

      # Nix specific settings
      {
        event = "FileType";
        pattern = "nix";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 100
              vim.opt_local.colorcolumn = "100"

              -- Nix-specific keymaps
              vim.keymap.set('n', '<leader>nb', '<cmd>!nix build<CR>', { buffer = true, desc = 'Nix Build' })
              vim.keymap.set('n', '<leader>nf', '<cmd>!nix flake check<CR>', { buffer = true, desc = 'Nix Flake Check' })
              vim.keymap.set('n', '<leader>nu', '<cmd>!nix flake update<CR>', { buffer = true, desc = 'Nix Flake Update' })
              vim.keymap.set('n', '<leader>ns', '<cmd>!nix-shell<CR>', { buffer = true, desc = 'Nix Shell' })
              vim.keymap.set('n', '<leader>nd', '<cmd>!nix develop<CR>', { buffer = true, desc = 'Nix Develop' })
              vim.keymap.set('n', '<leader>nr', '<cmd>!nix run<CR>', { buffer = true, desc = 'Nix Run' })
            end
          '';
        };
      }

      # JavaScript/TypeScript specific settings
      {
        event = "FileType";
        pattern = ["javascript" "typescript" "javascriptreact" "typescriptreact"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 100
              vim.opt_local.colorcolumn = "100"

              local ft = vim.bo.filetype
              -- JS/TS-specific keymaps
              if ft == "javascript" or ft == "javascriptreact" then
                vim.keymap.set('n', '<leader>jr', '<cmd>!node %<CR>', { buffer = true, desc = 'Node Run' })
                vim.keymap.set('n', '<leader>jt', '<cmd>!npm test<CR>', { buffer = true, desc = 'NPM Test' })
                vim.keymap.set('n', '<leader>jb', '<cmd>!npm run build<CR>', { buffer = true, desc = 'NPM Build' })
                vim.keymap.set('n', '<leader>ji', '<cmd>!npm install<CR>', { buffer = true, desc = 'NPM Install' })
                vim.keymap.set('n', '<leader>jd', '<cmd>!npm run dev<CR>', { buffer = true, desc = 'NPM Dev' })
              elseif ft == "typescript" or ft == "typescriptreact" then
                vim.keymap.set('n', '<leader>tr', '<cmd>!npx ts-node %<CR>', { buffer = true, desc = 'TS-Node Run' })
                vim.keymap.set('n', '<leader>tt', '<cmd>!npm test<CR>', { buffer = true, desc = 'NPM Test' })
                vim.keymap.set('n', '<leader>tb', '<cmd>!npm run build<CR>', { buffer = true, desc = 'NPM Build' })
                vim.keymap.set('n', '<leader>tc', '<cmd>!npx tsc<CR>', { buffer = true, desc = 'TypeScript Compile' })
              end
            end
          '';
        };
      }

      # Markdown specific settings
      {
        event = "FileType";
        pattern = "markdown";
        callback = {
          __raw = ''
            function()
              vim.opt_local.wrap = true
              vim.opt_local.linebreak = true
              vim.opt_local.textwidth = 80
              vim.opt_local.colorcolumn = "80"
              vim.opt_local.spell = true
              vim.opt_local.conceallevel = 2

              -- Markdown-specific keymaps
              vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { buffer = true, desc = 'Markdown Preview' })
              vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<CR>', { buffer = true, desc = 'Toggle Preview' })
              vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<CR>', { buffer = true, desc = 'Stop Preview' })
            end
          '';
        };
      }

      # YAML specific settings
      {
        event = "FileType";
        pattern = "yaml";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
              vim.opt_local.indentkeys = vim.opt_local.indentkeys - "<:>"
            end
          '';
        };
      }

      # JSON specific settings
      {
        event = "FileType";
        pattern = ["json" "jsonc"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.conceallevel = 0
            end
          '';
        };
      }

      # HTML/CSS specific settings
      {
        event = "FileType";
        pattern = ["html" "css" "scss" "less"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"

              -- Web dev keymaps
              if vim.bo.filetype == "html" then
                vim.keymap.set('n', '<leader>wb', '<cmd>!open %<CR>', { buffer = true, desc = 'Open in Browser' })
              end
            end
          '';
        };
      }

      # PHP specific settings
      {
        event = "FileType";
        pattern = "php";
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
              vim.opt_local.commentstring = "// %s"

              -- PHP-specific keymaps
              vim.keymap.set('n', '<leader>pr', '<cmd>!php %<CR>', { buffer = true, desc = 'PHP Run' })
              vim.keymap.set('n', '<leader>pl', '<cmd>!php -l %<CR>', { buffer = true, desc = 'PHP Lint' })
              vim.keymap.set('n', '<leader>pf', '<cmd>!php-cs-fixer fix %<CR>', { buffer = true, desc = 'PHP Format' })
            end
          '';
        };
      }

      # Zig specific settings
      {
        event = "FileType";
        pattern = "zig";
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 100
              vim.opt_local.colorcolumn = "100"
              vim.opt_local.commentstring = "// %s"

              -- Zig-specific keymaps
              vim.keymap.set('n', '<leader>zr', '<cmd>!zig run %<CR>', { buffer = true, desc = 'Zig Run' })
              vim.keymap.set('n', '<leader>zb', '<cmd>!zig build<CR>', { buffer = true, desc = 'Zig Build' })
              vim.keymap.set('n', '<leader>zt', '<cmd>!zig test %<CR>', { buffer = true, desc = 'Zig Test' })
              vim.keymap.set('n', '<leader>zf', '<cmd>!zig fmt %<CR>', { buffer = true, desc = 'Zig Format' })
            end
          '';
        };
      }

      # TOML specific settings
      {
        event = "FileType";
        pattern = "toml";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.commentstring = "# %s"
            end
          '';
        };
      }

      # Git commit specific settings
      {
        event = "FileType";
        pattern = "gitcommit";
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 72
              vim.opt_local.colorcolumn = "50,72"
              vim.opt_local.spell = true
              vim.cmd('startinsert')

              -- Commit message helpers
              vim.keymap.set('i', '<C-f>', 'feat: ', { buffer = true, desc = 'Feature prefix' })
              vim.keymap.set('i', '<C-x>', 'fix: ', { buffer = true, desc = 'Fix prefix' })
              vim.keymap.set('i', '<C-d>', 'docs: ', { buffer = true, desc = 'Docs prefix' })
              vim.keymap.set('i', '<C-s>', 'style: ', { buffer = true, desc = 'Style prefix' })
              vim.keymap.set('i', '<C-r>', 'refactor: ', { buffer = true, desc = 'Refactor prefix' })
              vim.keymap.set('i', '<C-t>', 'test: ', { buffer = true, desc = 'Test prefix' })
              vim.keymap.set('i', '<C-c>', 'chore: ', { buffer = true, desc = 'Chore prefix' })
            end
          '';
        };
      }

      # Configuration files
      {
        event = "FileType";
        pattern = ["conf" "config"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.commentstring = "# %s"
            end
          '';
        };
      }

      # Shell scripts
      {
        event = "FileType";
        pattern = ["sh" "bash" "zsh" "fish"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.textwidth = 80
              vim.opt_local.colorcolumn = "80"
              vim.opt_local.makeprg = "shellcheck %"

              -- Shell-specific keymaps
              vim.keymap.set('n', '<leader>sr', '<cmd>!bash %<CR>', { buffer = true, desc = 'Run Shell Script' })
              vim.keymap.set('n', '<leader>sc', '<cmd>!shellcheck %<CR>', { buffer = true, desc = 'Shell Check' })
            end
          '';
        };
      }

      # Dockerfile
      {
        event = "FileType";
        pattern = "dockerfile";
        callback = {
          __raw = ''
            function()
              vim.opt_local.commentstring = "# %s"

              -- Docker-specific keymaps
              vim.keymap.set('n', '<leader>db', '<cmd>!docker build -t temp .<CR>', { buffer = true, desc = 'Docker Build' })
              vim.keymap.set('n', '<leader>dr', '<cmd>!docker run -it temp<CR>', { buffer = true, desc = 'Docker Run' })
            end
          '';
        };
      }

      # SQL specific settings
      {
        event = "FileType";
        pattern = "sql";
        callback = {
          __raw = ''
            function()
              vim.opt_local.commentstring = "-- %s"
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
            end
          '';
        };
      }

      # XML specific settings
      {
        event = "FileType";
        pattern = "xml";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"
            end
          '';
        };
      }

      # Lua specific settings
      {
        event = "FileType";
        pattern = "lua";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 120
              vim.opt_local.colorcolumn = "120"

              -- Lua-specific keymaps
              vim.keymap.set('n', '<leader>lr', '<cmd>!lua %<CR>', { buffer = true, desc = 'Lua Run' })
              vim.keymap.set('n', '<leader>lf', '<cmd>!stylua %<CR>', { buffer = true, desc = 'Lua Format' })
            end
          '';
        };
      }

      # Make specific settings
      {
        event = "FileType";
        pattern = ["make" "cmake"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.expandtab = false
              vim.opt_local.shiftwidth = 8
              vim.opt_local.tabstop = 8
              vim.opt_local.softtabstop = 8

              if vim.bo.filetype == "make" then
                vim.keymap.set('n', '<leader>mr', '<cmd>!make<CR>', { buffer = true, desc = 'Make' })
                vim.keymap.set('n', '<leader>mc', '<cmd>!make clean<CR>', { buffer = true, desc = 'Make Clean' })
                vim.keymap.set('n', '<leader>mi', '<cmd>!make install<CR>', { buffer = true, desc = 'Make Install' })
              else
                vim.keymap.set('n', '<leader>cb', '<cmd>!cmake --build build<CR>', { buffer = true, desc = 'CMake Build' })
                vim.keymap.set('n', '<leader>cc', '<cmd>!cmake -B build<CR>', { buffer = true, desc = 'CMake Configure' })
              end
            end
          '';
        };
      }

      # Assembly specific settings
      {
        event = "FileType";
        pattern = ["asm" "nasm"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.commentstring = "; %s"
              vim.opt_local.textwidth = 80
              vim.opt_local.colorcolumn = "80"
            end
          '';
        };
      }

      # Terraform/HCL specific settings
      {
        event = "FileType";
        pattern = ["terraform" "hcl"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.commentstring = "# %s"

              -- Terraform-specific keymaps
              vim.keymap.set('n', '<leader>tf', '<cmd>!terraform fmt<CR>', { buffer = true, desc = 'Terraform Format' })
              vim.keymap.set('n', '<leader>tv', '<cmd>!terraform validate<CR>', { buffer = true, desc = 'Terraform Validate' })
              vim.keymap.set('n', '<leader>tp', '<cmd>!terraform plan<CR>', { buffer = true, desc = 'Terraform Plan' })
              vim.keymap.set('n', '<leader>ta', '<cmd>!terraform apply<CR>', { buffer = true, desc = 'Terraform Apply' })
            end
          '';
        };
      }

      # Protocol Buffers specific settings
      {
        event = "FileType";
        pattern = "proto";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.textwidth = 80
              vim.opt_local.colorcolumn = "80"
              vim.opt_local.commentstring = "// %s"
            end
          '';
        };
      }

      # GraphQL specific settings
      {
        event = "FileType";
        pattern = "graphql";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2
              vim.opt_local.commentstring = "# %s"
            end
          '';
        };
      }

      # Large file optimization
      {
        event = "BufReadPre";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              local file_size = vim.fn.getfsize(vim.fn.expand('<afile>'))
              if file_size > 1024 * 1024 then  -- 1MB
                vim.opt_local.eventignore:append({
                  'FileType',
                  'Syntax',
                  'BufNewFile',
                  'BufReadPost',
                })
                vim.opt_local.undolevels = -1
                vim.opt_local.undoreload = 0
                vim.opt_local.list = false
                vim.cmd('syntax clear')
                vim.notify('Large file detected: disabled features for performance', vim.log.levels.WARN)
              end
            end
          '';
        };
      }

      # Binary file detection
      {
        event = "BufReadPost";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              if vim.fn.search('\%u0000', 'nw') > 0 then
                vim.bo.filetype = 'xxd'
                vim.cmd('silent! %!xxd')
                vim.bo.binary = true
                vim.notify('Binary file detected: switched to hex view', vim.log.levels.INFO)
              end
            end
          '';
        };
      }

      # Auto-reload files changed outside vim
      {
        event = ["FocusGained" "BufEnter" "CursorHold" "CursorHoldI"];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              if vim.fn.mode() ~= 'c' then
                vim.cmd('checktime')
              end
            end
          '';
        };
      }

      # Smart indentation per language
      {
        event = "FileType";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              local indent_settings = {
                -- 2 spaces
                lua = {2, true},
                nix = {2, true},
                yaml = {2, true},
                json = {2, true},
                jsonc = {2, true},
                html = {2, true},
                css = {2, true},
                scss = {2, true},
                javascript = {2, true},
                typescript = {2, true},
                javascriptreact = {2, true},
                typescriptreact = {2, true},
                vue = {2, true},
                svelte = {2, true},
                xml = {2, true},
                terraform = {2, true},
                hcl = {2, true},
                proto = {2, true},
                graphql = {2, true},

                -- 4 spaces
                python = {4, true},
                java = {4, true},
                c = {4, true},
                cpp = {4, true},
                rust = {4, true},
                go = {4, false}, -- Go uses tabs
                php = {4, true},
                zig = {4, true},
                sql = {4, true},

                -- 8 spaces / tabs
                make = {8, false},
                cmake = {4, true},
              }

              local ft = vim.bo.filetype
              local settings = indent_settings[ft]

              if settings then
                local width, use_spaces = settings[1], settings[2]
                vim.opt_local.shiftwidth = width
                vim.opt_local.tabstop = width
                vim.opt_local.softtabstop = use_spaces and width or 0
                vim.opt_local.expandtab = use_spaces
              end
            end
          '';
        };
      }
    ];

    # Language-specific keymaps
    keymaps = [
      # Quick filetype switching
      {
        mode = "n";
        key = "<leader>ft";
        action = {
          __raw = ''
            function()
              vim.ui.input({prompt = 'Set filetype: '}, function(ft)
                if ft then
                  vim.bo.filetype = ft
                  vim.notify('Filetype set to: ' .. ft, vim.log.levels.INFO)
                end
              end)
            end
          '';
        };
        options = {
          desc = "Set Filetype";
          silent = true;
        };
      }

      # Language-specific documentation
      {
        mode = "n";
        key = "<leader>ld";
        action = {
          __raw = ''
            function()
              local ft = vim.bo.filetype
              local doc_commands = {
                rust = 'cargo doc --open',
                go = 'go doc',
                python = 'python3 -m pydoc',
                javascript = 'npm docs',
                typescript = 'npm docs',
                java = 'javadoc',
                nix = 'man nixos-option',
              }

              local cmd = doc_commands[ft]
              if cmd then
                vim.cmd('!' .. cmd)
              else
                vim.notify('No documentation command for filetype: ' .. ft, vim.log.levels.WARN)
              end
            end
          '';
        };
        options = {
          desc = "Language Documentation";
          silent = true;
        };
      }
    ];

    # Additional language configuration
    extraConfigLua = ''
      -- Enhanced language detection
      vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
        pattern = {'*.tsx', '*.jsx'},
        callback = function()
          local content = vim.api.nvim_buf_get_lines(0, 0, 50, false)
          local has_jsx = false

          for _, line in ipairs(content) do
            if line:match('<%w') or line:match('React') then
              has_jsx = true
              break
            end
          end

          if has_jsx then
            if vim.fn.expand('%:e') == 'tsx' then
              vim.bo.filetype = 'typescriptreact'
            else
              vim.bo.filetype = 'javascriptreact'
            end
          end
        end
      })

      -- Smart comment toggling per language
      local function get_comment_string(ft)
        local comment_strings = {
          c = '// %s',
          cpp = '// %s',
          java = '// %s',
          rust = '// %s',
          go = '// %s',
          javascript = '// %s',
          typescript = '// %s',
          php = '// %s',
          zig = '// %s',
          python = '# %s',
          nix = '# %s',
          lua = '-- %s',
          sql = '-- %s',
          vim = '" %s',
          yaml = '# %s',
          toml = '# %s',
          bash = '# %s',
          fish = '# %s',
          html = '<!-- %s -->',
          xml = '<!-- %s -->',
          css = '/* %s */',
          scss = '/* %s */',
          markdown = '<!-- %s -->',
        }
        return comment_strings[ft] or '# %s'
      end

      -- Auto-set comment string
      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function()
          local ft = vim.bo.filetype
          vim.opt_local.commentstring = get_comment_string(ft)
        end
      })

      -- Smart bracket matching per language
      local function setup_
