{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };
    
    interactiveShellInit = ''

      eval "$(zoxide init zsh)"
    
      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'
    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
