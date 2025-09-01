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
      export EDITOR="hx"
      export VISUAL="hx"
      
      export GOOGLE_CLOUD_PROJECT="peak-hangout-469915-d6"
      
      eval "$(zoxide init zsh)"

      alias hm-reload='source ~/.nix-profile/etc/profile.d/hm-session-vars.sh'
      alias nos-rebuild='nixos-rebuild switch --flake ./#nixos --verbose'
      alias nos-test='sudo nixos-rebuild test --flake /etc/nixos#nixos'

      alias nos-clean='sudo nix-collect-garbage -d'
    
      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'
      alias cd='z'

      alias la='eza -la --icons'
      alias ltree='eza --tree --level=3 --long --git --icons'
      alias l='eza -l --icons --only-files'
      alias ld='eza -l --icons --only-dirs'
      alias lsd='eza --icons --only-dirs'
      alias ls='eza -l --icons --sort=size'
      alias ltime='eza -l --icons --sort=modified'
      alias lnew='eza -l --icons --sort=modified --reverse'
      alias lperm='eza -l --icons --group-directories-first'
      alias lbig='eza -l --icons --sort=size | head -n 10'
      alias lg='eza -l --git --icons'
      alias lt='eza --git --tree -l --icons'

    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
