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
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/.nix-profile/bin:$PATH"
      export MANPAGER="batman"
      eval "$(zoxide init zsh)"

      alias hm-reload='source ~/.nix-profile/etc/profile.d/hm-session-vars.sh'
      alias nos-rebuild='nixos-rebuild switch --flake ./#nixos --verbose'
    
      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'

      alias ltree='eza --tree --level=5 --long --icons'
      alias lg='eza -l --git --icons'
      alias ls='eza -l --no-git --icons'
      alias l='eza  -l --git --icons'
      alias lt='eza --git --tree -l --icons'
    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
