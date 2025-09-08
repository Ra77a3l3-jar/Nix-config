{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # LSP Configuration
      lsp = {
        enable = true;

        servers = {
          # C/C++
          clangd = {
            enable = true;
            settings = {
              cmd = [
                "clangd"
                "--background-index"
                "--clang-tidy"
                "--header-insertion=iwyu"
                "--completion-style=detailed"
                "--function-arg-placeholders"
                "--fallback-style=llvm"
              ];
              filetypes = ["c" "cpp" "objc" "objcpp" "cuda" "proto"];
              rootPatterns = [
                ".clangd"
                ".clang-tidy"
                ".clang-format"
                "compile_commands.json"
                "compile_flags.txt"
                "configure.ac"
                ".git"
              ];
              capabilities = {
                offsetEncoding = ["utf-16"];
              };
            };
          };

          # Java
          jdtls = {
            enable = true;
            settings = {
              java = {
                eclipse = {
                  downloadSources = true;
                };
                configuration = {
                  updateBuildConfiguration = "interactive";
                };
                maven = {
                  downloadSources = true;
                };
                implementationsCodeLens = {
                  enabled = true;
                };
                referencesCodeLens = {
                  enabled = true;
                };
                references = {
                  includeDecompiledSources = true;
                };
                format = {
                  enabled = true;
                };
              };
              signatureHelp = {
                enabled = true;
              };
              completion = {
                favoriteStaticMembers = [
                  "org.hamcrest.MatcherAssert.assertThat"
                  "org.hamcrest.Matchers.*"
                  "org.hamcrest.CoreMatchers.*"
                  "org.junit.jupiter.api.Assertions.*"
                  "java.util.Objects.requireNonNull"
                  "java.util.Objects.requireNonNullElse"
                  "org.mockito.Mockito.*"
                ];
                importOrder = [
                  "java"
                  "javax"
                  "com"
                  "org"
                ];
              };
              extendedClientCapabilities = {
                progressReportsSupport = true;
                classFileContentsSupport = true;
                generateToStringPromptSupport = true;
                hashCodeEqualsPromptSupport = true;
                advancedExtractRefactoringSupport = true;
                advancedOrganizeImportsSupport = true;
                generateConstructorsPromptSupport = true;
                generateDelegateMethodsPromptSupport = true;
                moveRefactoringSupport = true;
              };
            };
          };

          # Rust
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
            settings = {
              "rust-analyzer" = {
                imports = {
                  granularity = {
                    group = "module";
                  };
                  prefix = "self";
                };
                cargo = {
                  buildScripts = {
                    enable = true;
                  };
                };
                procMacro = {
                  enable = true;
                };
                diagnostics = {
                  enable = true;
                  experimental = {
                    enable = true;
                  };
                };
                assist = {
                  importGranularity = "module";
                  importPrefix = "by_self";
                };
                lens = {
                  enable = true;
                };
                checkOnSave = {
                  command = "clippy";
                };
              };
            };
          };

          # Go
          gopls = {
            enable = true;
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true;
                };
                staticcheck = true;
                gofumpt = true;
              };
            };
          };

          # Nix
          nil-ls = {
            enable = true;
            settings = {
              nil = {
                diagnostics = {
                  ignored = ["unused_binding" "unused_with"];
                };
                formatting = {
                  command = ["nixfmt"];
                };
              };
            };
          };

          # Markdown
          marksman = {
            enable = true;
          };

          # Zig
          zls = {
            enable = true;
          };

          # TypeScript/JavaScript
          ts-ls = {
            enable = true;
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal";
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayVariableTypeHints = false;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayEnumMemberValueHints = true;
                };
              };
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all";
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayVariableTypeHints = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayEnumMemberValueHints = true;
                };
              };
            };
          };

          # HTML
          html = {
            enable = true;
            settings = {
              html = {
                format = {
                  templating = true;
                  wrapLineLength = 120;
                  wrapAttributes = "auto";
                };
                hover = {
                  documentation = true;
                  references = true;
                };
              };
            };
          };

          # CSS
          cssls = {
            enable = true;
            settings = {
              css = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
              scss = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
              less = {
                validate = true;
                lint = {
                  unknownAtRules = "ignore";
                };
              };
            };
          };

          # JSON
          jsonls = {
            enable = true;
            settings = {
              json = {
                schemas = [
                  {
                    fileMatch = ["package.json"];
                    url = "https://json.schemastore.org/package.json";
                  }
                  {
                    fileMatch = ["tsconfig*.json"];
                    url = "https://json.schemastore.org/tsconfig.json";
                  }
                  {
                    fileMatch = [".prettierrc" ".prettierrc.json" "prettier.config.json"];
                    url = "https://json.schemastore.org/prettierrc.json";
                  }
                  {
                    fileMatch = [".eslintrc" ".eslintrc.json"];
                    url = "https://json.schemastore.org/eslintrc.json";
                  }
                  {
                    fileMatch = [".babelrc" ".babelrc.json" "babel.config.json"];
                    url = "https://json.schemastore.org/babelrc.json";
                  }
                  {
                    fileMatch = ["lerna.json"];
                    url = "https://json.schemastore.org/lerna.json";
                  }
                  {
                    fileMatch = ["now.json" "vercel.json"];
                    url = "https://json.schemastore.org/now.json";
                  }
                  {
                    fileMatch = [".github/workflows/*.json"];
                    url = "https://json.schemastore.org/github-workflow.json";
                  }
                ];
              };
            };
          };

          # TOML
          taplo = {
            enable = true;
          };

          # YAML
          yamlls = {
            enable = true;
            settings = {
              yaml = {
                keyOrdering = false;
                format = {
                  enable = true;
                };
                validate = true;
                schemaStore = {
                  enable = false;
                  url = "";
                };
                schemas = {
                  kubernetes = "*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                  "http://json.schemastore.org/prettierrc" = ".prettierrc.{yml,yaml}";
                  "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json" = "*gitlab-ci*.{yml,yaml}";
                  "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json" = "*api*.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" = "*flow*.{yml,yaml}";
                };
              };
            };
          };

          # PHP
          intelephense = {
            enable = true;
            settings = {
              intelephense = {
                files = {
                  maxSize = 1000000;
                };
              };
            };
          };

          # Python
          pyright = {
            enable = true;
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true;
                  diagnosticMode = "workspace";
                  useLibraryCodeForTypes = true;
                };
              };
            };
          };
        };

        # LSP keymaps
        keymaps = {
          silent = true;
          lspBuf = {
            gd = "definition";
            gr = "references";
            gD = "declaration";
            gI = "implementation";
            gt = "type_definition";
            K = "hover";
            "<leader>cw" = "workspace_symbol";
            "<leader>cr" = "rename";
            "<leader>ca" = "code_action";
            "<leader>cf" = "format";
          };
          diagnostic = {
            "<leader>cd" = "open_float";
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };
        };

        # Additional LSP configuration
        onAttach = ''
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Highlight symbol under cursor
          if client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", { clear = false })
            vim.api.nvim_create_autocmd("CursorHold", {
              callback = vim.lsp.buf.document_highlight,
              buffer = bufnr,
              group = group,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              callback = vim.lsp.buf.clear_references,
              buffer = bufnr,
              group = group,
            })
          end

          -- Enable inlay hints if supported
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        '';

        # Global LSP settings
        capabilities = ''
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
              'documentation',
              'detail',
              'additionalTextEdits',
            }
          }
          capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
          return capabilities
        '';

        # Enhance LSP UI
        setupWrappers = [
          (luaCode: ''
            -- Enhanced borders for LSP floating windows
            local border_style = {
              {"╭", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╮", "FloatBorder"},
              {"│", "FloatBorder"},
              {"╯", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╰", "FloatBorder"},
              {"│", "FloatBorder"},
            }

            -- Override handlers for better UI
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
              vim.lsp.handlers.hover, {
                border = border_style,
                focusable = false,
              }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
              vim.lsp.handlers.signature_help, {
                border = border_style,
                focusable = false,
              }
            )

            -- Enhanced diagnostics
            vim.diagnostic.config({
              virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
              },
              signs = true,
              underline = true,
              update_in_insert = false,
              severity_sort = true,
              float = {
                focusable = false,
                style = "minimal",
                border = border_style,
                source = "always",
                header = "",
                prefix = "",
              },
            })

            -- Define diagnostic signs
            local signs = {
              { name = "DiagnosticSignError", text = "" },
              { name = "DiagnosticSignWarn", text = "" },
              { name = "DiagnosticSignHint", text = "" },
              { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
              vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            ${luaCode}
          '')
        ];
      };

      # LSP Signature help
      lsp-signature = {
        enable = true;
        settings = {
          bind = true;
          doc_lines = 4;
          max_height = 12;
          max_width = 80;
          noice = false;
          wrap = true;
          floating_window = true;
          floating_window_above_cur_line = true;
          floating_window_off_x = 1;
          floating_window_off_y = 0;
          close_timeout = 4000;
          fix_pos = false;
          hint_enable = true;
          hint_prefix = "🐼 ";
          hint_scheme = "String";
          hi_parameter = "LspSignatureActiveParameter";
          handler_opts = {
            border = "rounded";
          };
          always_trigger = false;
          auto_close_after = null;
          extra_trigger_chars = {};
          zindex = 200;
          padding = "";
          transparency = null;
          shadow_blend = 36;
          shadow_guibg = "Black";
          timer_interval = 200;
          toggle_key = null;
          select_signature_key = null;
          move_cursor_key = null;
        };
      };

      # Trouble - Diagnostics list
      trouble = {
        enable = true;
        settings = {
          position = "bottom";
          height = 10;
          width = 50;
          icons = true;
          mode = "workspace_diagnostics";
          severity = null;
          fold_open = "";
          fold_closed = "";
          group = true;
          padding = true;
          cycle_results = true;
          action_keys = {
            close = "q";
            cancel = "<esc>";
            refresh = "r";
            jump = { "<cr>"; "<tab>"; "<2-leftmouse>"; };
            open_split = { "<c-x>"; };
            open_vsplit = { "<c-v>"; };
            open_tab = { "<c-t>"; };
            jump_close = { "o"; };
            toggle_mode = "m";
            switch_severity = "s";
            toggle_preview = "P";
            hover = "K";
            preview = "p";
            open_code_href = "c";
            close_folds = { "zM"; "zm"; };
            open_folds = { "zR"; "zr"; };
            toggle_fold = { "zA"; "za"; };
            previous = "k";
            next = "j";
            help = "?";
          };
          multiline = true;
          indent_lines = true;
          win_config = { border = "single"; };
          auto_open = false;
          auto_close = false;
          auto_preview = true;
          auto_fold = false;
          auto_jump = { "lsp_definitions"; };
          include_declaration = {
            "lsp_references";
            "lsp_implementations";
            "lsp_definitions";
          };
          signs = {
            error = "";
            warning = "";
            hint = "";
            information = "";
            other = "";
          };
          use_diagnostic_signs = false;
        };
      };

      # LSP Lines - Show diagnostics using virtual lines
      lsp-lines = {
        enable = true;
      };
    };

    # Additional LSP configuration
    extraConfigLua = ''
      -- Better LSP experience
      vim.lsp.set_log_level("off")

      -- Auto-format on save for specific filetypes
      local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_on_save_group,
        pattern = { "*.lua", "*.nix", "*.rs", "*.go", "*.ts", "*.js", "*.json", "*.yaml", "*.yml" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Show line diagnostics automatically in hover window
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
          }
          vim.diagnostic.open_float(nil, opts)
        end
      })

      -- Toggle diagnostics
      local diagnostics_active = true
      local function toggle_diagnostics()
        diagnostics_active = not diagnostics_active
        if diagnostics_active then
          vim.diagnostic.show()
        else
          vim.diagnostic.hide()
        end
      end

      vim.keymap.set('n', '<leader>td', toggle_diagnostics, { desc = 'Toggle Diagnostics' })

      -- Toggle virtual text
      local virtual_text_active = true
      local function toggle_virtual_text()
        virtual_text_active = not virtual_text_active
        vim.diagnostic.config({
          virtual_text = virtual_text_active
        })
      end

      vim.keymap.set('n', '<leader>tv', toggle_virtual_text, { desc = 'Toggle Virtual Text' })

      -- Better fold text for LSP
      local function custom_fold_text()
        local line = vim.fn.getline(vim.v.foldstart)
        local line_count = vim.v.foldend - vim.v.foldstart + 1
        return string.format("   %s ... (%d lines)", line:gsub("^%s+", ""), line_count)
      end

      vim.opt.foldtext = "v:lua.require'custom_fold_text'()"
      _G.custom_fold_text = custom_fold_text

      -- Enhanced LSP progress notifications
      local function lsp_progress_handler(err, result, ctx)
        local client_id = ctx.client_id
        local val = result.value

        if not val.kind then
          return
        end

        local notif_data = {
          client_id = client_id,
          result = result,
        }

        if val.kind == "begin" then
          local message = string.format("%s: %s", val.title, val.message or "")
          notif_data.notification = vim.notify(message, "info", {
            title = "LSP Progress",
            icon = "",
            timeout = false,
            hide_from_history = false,
          })
        elseif val.kind == "report" and notif_data then
          if val.message then
            vim.notify(val.message, "info", {
              replace = notif_data.notification,
              hide_from_history = false,
            })
          end
        elseif val.kind == "end" and notif_data then
          vim.notify(val.message and string.format("Completed: %s", val.message) or "Completed", "info", {
            icon = "",
            replace = notif_data.notification,
            timeout = 3000,
          })
        end
      end

      vim.lsp.handlers["$/progress"] = lsp_progress_handler
    '';
  };
}
