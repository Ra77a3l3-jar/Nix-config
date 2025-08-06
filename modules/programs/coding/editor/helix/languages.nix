{ ... }:

{
  programs.helix.languages = {
    language = [
      # C
      {
        name = "c";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # C++
      {
        name = "cpp";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Java
      {
        name = "java";
        language-servers = [ "jdtls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Zig
      {
        name = "zig";
        language-servers = [ "zls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Python
      {
        name = "python";
        language-servers = [ "pylsp" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Rust
      {
        name = "rust";
        language-servers = [ "rust-analyzer" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Go
      {
        name = "go";
        language-servers = [ "gopls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Markdown
      {
        name = "markdown";
        language-servers = [ "marksman" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Nix
      {
        name = "nix";
        language-servers = [ "nil" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # YAML
      {
        name = "yaml";
        language-servers = [ "yaml-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # TOML
      {
        name = "toml";
        language-servers = [ "taplo" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # JSON
      {
        name = "json";
        language-servers = [ "vscode-json-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # XML
      {
        name = "xml";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # JavaScript
      {
        name = "javascript";
        language-servers = [ "vscode-html-language-server" "vscode-css-language-server" "vscode-eslint-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # TypeScript
      {
        name = "typescript";
        language-servers = [ "typescript-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # PHP
      {
        name = "php";
        language-servers = [ "phpactor" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Vue
      {
        name = "vue";
        language-servers = [ "vls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # CSS
      {
        name = "css";
        language-servers = [ "vscode-css-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # HTML
      {
        name = "html";
        language-servers = [ "vscode-html-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Tailwind (as CSS, but you can add a comment)
      {
        name = "tailwindcss";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # SQL (for sqlite)
      {
        name = "sql";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      # Shell (for httpie, curl, etc.)
      {
        name = "sh";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
