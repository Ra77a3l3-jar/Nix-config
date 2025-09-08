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

        # Trouble - Diagnostics list (fixed)
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
              jump = [ "<cr>" "<tab>" "<2-leftmouse>" ];
              open_split = [ "<c-x>" ];
              open_vsplit = [ "<c-v>" ];
              open_tab = [ "<c-t>" ];
              jump_close = [ "o" ];
              toggle_mode = "m";
              switch_severity = "s";
              toggle_preview = "P";
              hover = "K";
              preview = "p";
              open_code_href = "c";
              close_folds = [ "zM" "zm" ];
              open_folds = [ "zR" "zr" ];
              toggle_fold = [ "zA" "za" ];
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
            auto_jump = [ "lsp_definitions" ];
            include_declaration = [ "lsp_references" "lsp_implementations" "lsp_definitions" ];
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
      };
    };
  };
}

