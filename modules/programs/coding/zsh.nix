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
      export PATH=$HOME/.nix-profile/bin:$PATH
      eval "$(zoxide init zsh)"
    
      alias ex='exit'
      alias gs='git status'
      alias zl='zellij'
      alias cl='clear'
      alias hs='history'
      alias cat='bat'
      alias tx='tmux'

      alias ltree='eza --tree --level=10 --long --icons'

      alias ls='eza --icons'                            # basic ls replacement
      alias ll='eza -l'                         # long format
      alias la='eza -la'                        # long + hidden files
      alias l='eza -lah --group-directories-first --icons'  # fancy listing
      alias lt='eza --tree --level=2 --icons'  # tree view
      alias lg='eza -l --git --icons'                  # long + git status
      alias ld='eza -lD'                       # directories only
      alias lf='eza -l --only-files'           # files only

      alias lsg='eza -lah --git --icons --group-directories-first'
      alias lst='eza --tree --icons --git --group-directories-first'

      alias h='atuin search'                   # fuzzy history search
      alias hh='atuin search --interactive'    # interactive history
      alias hc='atuin clear'                   # clear history

      alias grep='rg'                          # use ripgrep instead of grep
      alias rgf='rg --files'                   # list files ripgrep would search
      alias rgi='rg -i'                        # case-insensitive search
      alias rgs='rg --smart-case'             # smart case search
      alias rgw='rg -w'                        # word match


    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
