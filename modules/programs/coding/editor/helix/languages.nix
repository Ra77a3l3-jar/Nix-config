{ ... }:

{
  programs.helix.languages = {
    language = [
      {
        name = "c";
        scope = "source.c";
        language-servers = [ "clangd" "ltex-ls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "cpp";
        scope = "source.cpp";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "java";
        scope = "source.java";
        language-servers = [ "jdtls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "zig";
        scope = "source.zig";
        language-servers = [ "zls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "python";
        scope = "source.python";
        language-servers = [ "pylsp" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "rust";
        scope = "source.rust";
        language-servers = [ "rust-analyzer" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "go";
        scope = "source.go";
        language-servers = [ "gopls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "markdown";
        scope = "text.markdown";
        language-servers = [ "marksman" "ltex-ls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "nix";
        scope = "source.nix";
        language-servers = [ "nil" ];
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "yaml";
        scope = "source.yaml";
        language-servers = [ "yaml-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "toml";
        scope = "source.toml";
        language-servers = [ "taplo" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "json";
        scope = "source.json";
        language-servers = [ "vscode-json-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "javascript";
        scope = "source.js";
        language-servers = [ "typescript-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "typescript";
        scope = "source.ts";
        language-servers = [ "typescript-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "php";
        scope = "source.php";
        language-servers = [ "phpactor" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "css";
        scope = "source.css";
        language-servers = [ "vscode-css-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "html";
        scope = "text.html";
        language-servers = [ "vscode-html-language-server" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "sql";
        scope = "source.sql";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "bash";
        scope = "source.bash";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
