{ pkgs, ... }: {
  programs.helix.languages.language = [
    {
      name = "javascript";
      scope = "source.js";
      language-servers = [ "typescript-language-server" ];
    }
    {
      name = "typescript";
      scope = "source.ts";
      language-servers = [ "typescript-language-server" ];
    }
    {
      name = "tsx";
      scope = "source.tsx";
      language-servers = [ "typescript-language-server" ];
    }
  ];

  home.packages = with pkgs; [
    typescript
    typescript-language-server
  ];
}

