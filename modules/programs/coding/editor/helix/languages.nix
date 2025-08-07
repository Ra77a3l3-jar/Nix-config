{ ... }:

{
  programs.helix.languages = {
    language = [
      {
        name = "c";
        scope = "source.c";
        language-servers = [ "clangd" ];
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
    ];
  };
}
