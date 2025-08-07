{ pkgs, ... }: {
  programs.helix.languages.language = [
    {
      name = "html";
      scope = "text.html";
      language-servers = [ "vscode-html-language-server" ];
    }
    {
      name = "css";
      scope = "source.css";
      language-servers = [ "vscode-css-language-server" ];
    }
  ];

  home.packages = with pkgs; [
    vscode-html-language-server
    vscode-css-language-server
  ];
}

