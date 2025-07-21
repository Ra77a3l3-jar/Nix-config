{ config, pkgs, lib, ... }:

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
      export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"

      eval "$(zoxide init zsh)"

      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'

      alias ltree='eza --tree --level=5 --long --icons'
      alias lg='eza -l --git --icons'
      alias ls='eza --icons'
    '';
  };

}

