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
            
      eval "$(zoxide init zsh)"

      alias nos-rebuild='nixos-rebuild switch --flake ./#nixos --verbose'
      alias nos-test='sudo nixos-rebuild test --flake /etc/nixos#nixos'
      alias nos-clean='sudo nix-collect-garbage -d'
    
      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'
      alias cd='z'

      alias lgit='lazygit'
      alias ldoc='lazydocker'

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

      export CPLUS_INCLUDE_PATH=/nix/store/7wcghfk4fq3jqla55a1dnfibqwryxcb3-glew-2.2.0-dev/include:/nix/store/w1si1zbp9f5zjbk8r7bcqm0n8kdla15i-glfw-3.4/include:/nix/store/vywrcd6bq9znh1xmql9l1dz29kphg6k8-glu-9.0.3-dev/include

    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
