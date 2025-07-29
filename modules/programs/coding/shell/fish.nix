{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Remove greeting
      set -g fish_greeting ""

      # Explicit PATH additions
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.nix-profile/bin

      # Environment variable
      set -gx MANPAGER batman

      # zoxide init
      if type -q zoxide
        zoxide init fish | source
      end
    '';

    shellAliases = {
      ex = "exit";
      gs = "git status";
      zl = "zellij";
      cl = "clear";
      hs = "history";

      ltree = "eza --tree --level=5 --long --icons";
      lg = "eza -l --git --icons";
      ls = "eza -l --no-git --icons";
      l = "eza -l --git --icons";
      lt = "eza --git --tree -l --icons";
    };

    promptInit = ''
      function fish_prompt
        set -l cwd (prompt_pwd)
        set -l user (whoami)
        set -l host (hostname -s)
        set -l git_branch ""
        if type -q git
          set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null 2>/dev/null)
          if test -n "$branch"
            set git_branch " [$branch]"
          end
        end
        set_color blue
        echo -n "$user@$host"
        set_color normal
        echo -n ":"
        set_color cyan
        echo -n "$cwd"
        set_color green
        echo -n "$git_branch"
        set_color normal
        echo -n "\n❯ "
      end
    '';
  };

  # users.defaultUserShell = pkgs.fish;
}
