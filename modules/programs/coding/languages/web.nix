{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs

    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted  # HTML, CSS, JSON, ESLint, etc.
    nodePackages.eslint

    # Web frameworks & build tools (frontend)
    nodePackages.live-server
    nodePackages.vls
    nodePackages.tailwindcss

    # PHP & LSP
    php
    phpPackages.composer
    phpactor  # PHP LSP

    # Extra Tools (full-stack, APIs, debugging)
    httpie        # alternativa moderna a curl
    jq            # JSON CLI parser
    curl          # richieste HTTP
    sqlite        # utile per piccoli DB
  ];
}

