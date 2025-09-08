{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # Treesitter - Syntax highlighting and code parsing
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "c"
            "cpp"
            "java"
            "rust"
            "go"
            "nix"
            "markdown"
            "markdown_inline"
            "zig"
            "typescript"
            "javascript"
            "tsx"
            "jsx"
            "html"
            "css"
            "scss"
            "json"
            "jsonc"
            "toml"
            "yaml"
            "php"
            "python"
            "lua"
            "vim"
            "vimdoc"
            "bash"
            "fish"
            "dockerfile"
            "gitignore"
            "gitcommit"
            "git_config"
            "git_rebase"
            "regex"
            "sql"
            "cmake"
            "make"
            "proto"
            "graphql"
            "diff"
            "comment"
            "jsdoc"
          ];
          auto_install = true;
          sync_install = false;
          ignore_install = [];

          highlight = {
            enable = true;
            disable = [];
            additional_vim_regex_highlighting = false;
          };

          indent = {
            enable = true;
            disable = ["python" "yaml"];
          };

          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<C-space>";
              node_incremental = "<C-space>";
              scope_incremental = "<C-s>";
              node_decremental = "<M-space>";
            };
          };
        };
      };

      # Treesitter context - Show current function/class context
      treesitter-context = {
        enable = true;
        settings = {
          enable = true;
          max_lines = 0;
          min_window_height = 0;
          line_numbers = true;
          multiline_threshold = 20;
          trim_scope = "outer";
          mode = "cursor";
          separator = null;
          zindex = 20;
          on_attach = null;
        };
      };

      # Treesitter textobjects - Enhanced text objects
      treesitter-textobjects = {
        enable = true;
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
            "ab" = "@block.outer";
            "ib" = "@block.inner";
            "ai" = "@conditional.outer";
            "ii" = "@conditional.inner";
            "al" = "@loop.outer";
            "il" = "@loop.inner";
            "ak" = "@comment.outer";
            "ik" = "@comment.inner";
            "as" = "@statement.outer";
            "is" = "@statement.inner";
          };
          selection_modes = {
            "@parameter.outer" = "v";
            "@function.outer" = "V";
            "@class.outer" = "<c-v>";
          };
          include_surrounding_whitespace = true;
        };

        move = {
          enable = true;
          set_jumps = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]]" = "@class.outer";
            "]s" = "@statement.outer";
            "]z" = "@fold";
          };
          goto_next_end = {
            "]M" = "@function.outer";
            "][" = "@class.outer";
            "]S" = "@statement.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[[" = "@class.outer";
            "[s" = "@statement.outer";
            "[z" = "@fold";
          };
          goto_previous_end = {
            "[M" = "@function.outer";
            "[]" = "@class.outer";
            "[S" = "@statement.outer";
          };
        };

        swap = {
          enable = true;
          swap_next = {
            "<leader>a" = "@parameter.inner";
          };
          swap_previous = {
            "<leader>A" = "@parameter.inner";
          };
        };

        lsp_interop = {
          enable = true;
          border = "rounded";
          floating_preview_opts = {};
          peek_definition_code = {
            "<leader>df" = "@function.outer";
            "<leader>dF" = "@class.outer";
          };
        };
      };

      # Nvim-ts-autotag - Auto close and rename HTML tags
      nvim-ts-autotag = {
        enable = true;
        settings = {
          opts = {
            enable_close = true;
            enable_rename = true;
            enable_close_on_slash = false;
          };
          per_filetype = {
            html = {
              enable_close = false;
            };
          };
        };
      };

      # TS-comments - Better comment handling with treesitter
      ts-comments = {
        enable = true;
        settings = {
          lang = {
            c = "// %s";
            cpp = "// %s";
            css = "/* %s */";
            html = "<!-- %s -->";
            javascript = "// %s";
            typescript = "// %s";
            jsx = "// %s";
            tsx = "// %s";
            php = "// %s";
            python = "# %s";
            rust = "// %s";
            go = "// %s";
            java = "// %s";
            nix = "# %s";
            yaml = "# %s";
            toml = "# %s";
            json = "// %s";
            lua = "-- %s";
            vim = '" %s';
            bash = "# %s";
            fish = "# %s";
            dockerfile = "# %s";
            gitconfig = "# %s";
            make = "# %s";
            cmake = "# %s";
            sql = "-- %s";
            zig = "// %s";
            proto = "// %s";
            graphql = "# %s";
            markdown = "<!-- %s -->";
          };
        };
      };

      # Nvim-treesitter-refactor - Code refactoring features
      nvim-treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          clearOnCursorMove = false;
        };
        highlightCurrentScope = {
          enable = true;
        };
        smartRename = {
          enable = true;
          keymaps = {
            smartRename = "grr";
          };
        };
        navigation = {
          enable = true;
          keymaps = {
            gotoDefinition = "gnd";
            listDefinitions = "gnD";
            listDefinitionsTabed = "gO";
            gotoNextUsage = "<a-*>";
            gotoPreviousUsage = "<a-#>";
          };
        };
      };
    };

    # Additional treesitter configuration
    extraConfigLua = ''
      -- Enhanced treesitter configuration
      local ts_configs = require('nvim-treesitter.configs')

      -- Custom highlights for treesitter
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- Function and method highlights
          vim.api.nvim_set_hl(0, "@function", { fg = "#9ccfd8", italic = true })
          vim.api.nvim_set_hl(0, "@function.method", { fg = "#9ccfd8", italic = true })
          vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#eb6f92" })

          -- Variable highlights
          vim.api.nvim_set_hl(0, "@variable", { fg = "#e0def4" })
          vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#eb6f92" })
          vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#ea9a97", italic = true })

          -- Type highlights
          vim.api.nvim_set_hl(0, "@type", { fg = "#3e8fb0" })
          vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#eb6f92" })
          vim.api.nvim_set_hl(0, "@type.definition", { fg = "#3e8fb0", bold = true })

          -- Constant highlights
          vim.api.nvim_set_hl(0, "@constant", { fg = "#f6c177" })
          vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#eb6f92" })
          vim.api.nvim_set_hl(0, "@constant.macro", { fg = "#c4a7e7" })

          -- String highlights
          vim.api.nvim_set_hl(0, "@string", { fg = "#f6c177" })
          vim.api.nvim_set_hl(0, "@string.escape", { fg = "#c4a7e7" })
          vim.api.nvim_set_hl(0, "@string.regex", { fg = "#c4a7e7" })

          -- Comment highlights
          vim.api.nvim_set_hl(0, "@comment", { fg = "#6e6a86", italic = true })
          vim.api.nvim_set_hl(0, "@comment.documentation", { fg = "#908caa", italic = true })

          -- Keyword highlights
          vim.api.nvim_set_hl(0, "@keyword", { fg = "#31748f" })
          vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#31748f", italic = true })
          vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#eb6f92", italic = true })
          vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#31748f" })

          -- Conditional and repeat highlights
          vim.api.nvim_set_hl(0, "@conditional", { fg = "#31748f", italic = true })
          vim.api.nvim_set_hl(0, "@repeat", { fg = "#31748f", italic = true })

          -- Exception highlights
          vim.api.nvim_set_hl(0, "@exception", { fg = "#eb6f92", bold = true })

          -- Include highlights
          vim.api.nvim_set_hl(0, "@include", { fg = "#c4a7e7" })

          -- Namespace highlights
          vim.api.nvim_set_hl(0, "@namespace", { fg = "#3e8fb0" })

          -- Property highlights
          vim.api.nvim_set_hl(0, "@property", { fg = "#9ccfd8" })

          -- Constructor highlights
          vim.api.nvim_set_hl(0, "@constructor", { fg = "#f6c177", bold = true })

          -- Operator highlights
          vim.api.nvim_set_hl(0, "@operator", { fg = "#e0def4" })

          -- Punctuation highlights
          vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#908caa" })
          vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#908caa" })
          vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#c4a7e7" })

          -- Tag highlights (HTML/XML)
          vim.api.nvim_set_hl(0, "@tag", { fg = "#31748f" })
          vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#9ccfd8" })
          vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#908caa" })

          -- Text highlights
          vim.api.nvim_set_hl(0, "@text", { fg = "#e0def4" })
          vim.api.nvim_set_hl(0, "@text.strong", { bold = true })
          vim.api.nvim_set_hl(0, "@text.emphasis", { italic = true })
          vim.api.nvim_set_hl(0, "@text.underline", { underline = true })
          vim.api.nvim_set_hl(0, "@text.strike", { strikethrough = true })
          vim.api.nvim_set_hl(0, "@text.title", { fg = "#c4a7e7", bold = true })
          vim.api.nvim_set_hl(0, "@text.literal", { fg = "#f6c177" })
          vim.api.nvim_set_hl(0, "@text.uri", { fg = "#9ccfd8", underline = true })

          -- Math highlights
          vim.api.nvim_set_hl(0, "@text.math", { fg = "#3e8fb0" })

          -- Reference highlights
          vim.api.nvim_set_hl(0, "@text.reference", { fg = "#c4a7e7" })

          -- Environment highlights
          vim.api.nvim_set_hl(0, "@text.environment", { fg = "#31748f" })

          -- Note highlights
          vim.api.nvim_set_hl(0, "@text.note", { fg = "#9ccfd8", bg = "#1f3a2e" })
          vim.api.nvim_set_hl(0, "@text.warning", { fg = "#f6c177", bg = "#4a3324" })
          vim.api.nvim_set_hl(0, "@text.danger", { fg = "#eb6f92", bg = "#3d1f2e" })

          -- Language-specific highlights
          -- Rust
          vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { fg = "#c4a7e7", italic = true })
          vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword.rust", { fg = "#eb6f92", italic = true })

          -- Go
          vim.api.nvim_set_hl(0, "@lsp.type.interface.go", { fg = "#9ccfd8", italic = true })

          -- JavaScript/TypeScript
          vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", { fg = "#9ccfd8", italic = true })
          vim.api.nvim_set_hl(0, "@lsp.type.type.typescript", { fg = "#3e8fb0", italic = true })
        end
      })

      -- Fire the autocmd on startup
      vim.cmd('doautocmd ColorScheme')

      -- Custom folding with treesitter
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldnestmax = 10

      -- Better fold text
      function _G.custom_fold_text()
        local line = vim.fn.getline(vim.v.foldstart)
        local line_count = vim.v.foldend - vim.v.foldstart + 1
        local fold_text = line:gsub("^%s+", ""):gsub("%s+$", "")
        local fill_count = vim.wo.textwidth - #fold_text - #tostring(line_count) - 7
        if fill_count <= 0 then
          fill_count = 1
        end
        return fold_text .. string.rep(" ", fill_count) .. "(" .. line_count .. " lines)"
      end

      vim.opt.foldtext = "v:lua.custom_fold_text()"

      -- Enhanced treesitter context
      require('treesitter-context').setup({
        patterns = {
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
          rust = {
            'impl_item',
            'struct',
            'enum',
          },
          typescript = {
            'class_declaration',
            'abstract_class_declaration',
            'else_clause',
          },
          go = {
            'type_declaration',
            'method_declaration',
          },
        },
      })

      -- Smart treesitter selection
      local ts_utils = require 'nvim-treesitter.ts_utils'

      function _G.smart_select()
        local node = ts_utils.get_node_at_cursor()
        if node then
          ts_utils.update_selection(0, node)
        end
      end

      vim.keymap.set({'n', 'v'}, '<leader>v', '<cmd>lua smart_select()<CR>', { desc = 'Smart Select' })

      -- Treesitter-based jumping
      local function jump_to_next_class()
        local current_node = ts_utils.get_node_at_cursor()
        if not current_node then return end

        local query = vim.treesitter.query.parse(vim.bo.filetype, [[
          (class_declaration) @class
        ]])

        local parser = vim.treesitter.get_parser(0)
        local tree = parser:parse()[1]
        local root = tree:root()

        for _, match, _ in query:iter_matches(root, 0) do
          for _, node in pairs(match) do
            local start_row, _, _, _ = node:range()
            if start_row > vim.fn.line('.') - 1 then
              vim.fn.cursor(start_row + 1, 1)
              return
            end
          end
        end
      end

      vim.keymap.set('n', ']c', jump_to_next_class, { desc = 'Next Class' })

      -- Auto-save fold state
      local augroup = vim.api.nvim_create_augroup('AutoSaveFolds', {})
      vim.api.nvim_create_autocmd('BufWinLeave', {
        group = augroup,
        pattern = '*',
        command = 'silent! mkview',
      })
      vim.api.nvim_create_autocmd('BufWinEnter', {
        group = augroup,
        pattern = '*',
        command = 'silent! loadview',
      })

      -- Disable treesitter for large files
      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          local file_size = vim.fn.getfsize(vim.fn.expand('%'))
          if file_size > 500000 then  -- 500KB
            vim.treesitter.stop()
          end
        end
      })

      -- Custom treesitter queries for better highlighting
      vim.treesitter.query.set("rust", "highlights", [[
        (macro_invocation
          macro: (identifier) @macro)

        (attribute
          (meta_item) @attribute)

        (lifetime (identifier) @type.qualifier)
      ]])

      vim.treesitter.query.set("typescript", "highlights", [[
        (decorator) @function.macro

        (type_assertion
          "<" @punctuation.bracket
          ">" @punctuation.bracket)
      ]])

      -- Performance optimization
      vim.g.skip_ts_context_commentstring_module = true

      -- Enhanced incremental selection
      vim.keymap.set({'n', 'x'}, '<M-k>', function()
        require('nvim-treesitter.incremental_selection').node_decremental()
      end, { desc = 'Decrease Selection' })

      vim.keymap.set({'n', 'x'}, '<M-j>', function()
        require('nvim-treesitter.incremental_selection').node_incremental()
      end, { desc = 'Increase Selection' })

      vim.keymap.set({'n', 'x'}, '<M-h>', function()
        require('nvim-treesitter.incremental_selection').scope_incremental()
      end, { desc = 'Scope Selection' })

      -- Custom text objects for common patterns
      local function create_text_object(pattern, name)
        vim.keymap.set({'o', 'x'}, 'i' .. name, function()
          require('nvim-treesitter.textobjects.select').select_textobject('@' .. pattern .. '.inner', 'textobjects')
        end, { desc = 'Inner ' .. name })

        vim.keymap.set({'o', 'x'}, 'a' .. name, function()
          require('nvim-treesitter.textobjects.select').select_textobject('@' .. pattern .. '.outer', 'textobjects')
        end, { desc = 'Around ' .. name })
      end

      create_text_object('call', 'C')  -- iC, aC for function calls
      create_text_object('assignment', '=')  -- i=, a= for assignments
      create_text_object('return_statement', 'r')  -- ir, ar for return statements

      -- Integration with LSP for better symbol highlighting
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          -- Enable semantic highlighting
          vim.lsp.semantic_tokens.start()
        end
      })

      -- Better syntax highlighting for specific languages
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'typescript', 'typescriptreact'},
        callback = function()
          vim.treesitter.start(0, 'typescript')
        end
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'javascript', 'javascriptreact'},
        callback = function()
          vim.treesitter.start(0, 'javascript')
        end
      })
    '';
  };
}
