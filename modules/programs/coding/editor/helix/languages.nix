{ ... }:

{
  programs.helix.languages = {
    language = [
      {
        name = "c";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "cpp";
        language-servers = [ "clangd" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "java";
        language-servers = [ "jdtls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "zig";
        language-servers = [ "zls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "python";
        language-servers = [ "pylsp" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "rust";
        language-servers = [ "rust-analyzer" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "go";
        language-servers = [ "gopls" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "markdown";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "nix";
        language-servers = [ "nil" ];
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
      {
        name = "yaml";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
      {
        name = "toml";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
