{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    #oh-my-posh
  ];

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;

    interactiveShellInit = ''
      # Remove greeting
      set -g fish_greeting ""

      set -x EDITOR hx
      set -x VISUAL hx
      set -x CPLUS_INCLUDE_PATH /nix/store/7wcghfk4fq3jqla55a1dnfibqwryxcb3-glew-2.2.0-dev/include \
                               /nix/store/w1si1zbp9f5zjbk8r7bcqm0n8kdla15i-glfw-3.4/include \
                               /nix/store/vywrcd6bq9znh1xmql9l1dz29kphg6k8-glu-9.0.3-dev/include \
                               /nix/store/n26psrbrfci8m9b35cd2090lirjchd05-libglvnd-1.7.0-dev/include

      # Explicit PATH additions
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.nix-profile/bin

      # zoxide init
      if type -q zoxide
        zoxide init fish | source
      end

      # oh-my-posh prompt initialization
      #if type -q oh-my-posh
      #  oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/zash.omp.json | source
      #end

      # Auto-start zellij only if not already inside it
      if type -q zellij
        if not set -q ZELLIJ
          exec zellij
        end
      end
    '';

    shellAliases = {
      nos-rebuild = "sudo nixos-rebuild switch --flake ./#nixos --verbose";
      nos-test = "sudo nixos-rebuild test --flake /etc/nixos#nixos";
      nos-clean = "sudo nix-collect-garbage -d";
      
      ex = "exit";
      zl = "zellij";
      cl = "clear";
      hs = "history";
      cd = "z";

      gs = "git status";
      gc = "git checkout";
      ga = "git add";
      gdf = "git diff";
      gf = "git fetch";
      gp = "git pull";
      gP = "git push";

      lgit = "lazygit";
      ldoc = "lazydocker";

      la = "eza -la --icons";
      ltree = "eza --tree --level=3 --long --git --icons";
      l = "eza -l --icons --only-files";
      ld = "eza -l --icons --only-dirs";
      lsd = "eza --icons --only-dirs";
      ls = "eza -l --icons --sort=size";
      ltime = "eza -l --icons --sort=modified";
      lnew = "eza -l --icons --sort=modified --reverse";
      lperm = "eza -l --icons --group-directories-first";
      lbig = "eza -l --icons --sort=size | head -n 10";
      lg = "eza -l --git --icons";
      lt = "eza --git --tree -l --icons";
    };

    promptInit = ''
      function fish_prompt
        # @username in red (#E36464)
        set_color E36464
        echo -n '@'(whoami)' '
        
        # Arrow in green (#62ED8B)
        set_color 62ED8B
        echo -n '➜ '
        
        # Current directory in cyan (#56B6C2)
        set_color 56B6C2
        echo -n (basename (prompt_pwd))
        
        # Git branch in purple/yellow if in a git repo
        if type -q git
          set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
          if test -n "$branch"
            # "git(" in yellow (#DDB15F)
            set_color DDB15F
            echo -n ' git('
            # Branch name in purple (#D4AAFC)
            set_color D4AAFC
            echo -n "$branch"
            # Closing ")" in yellow (#DDB15F)
            set_color DDB15F
            echo -n ')'
          end
        end
        
        # Status indicator in gold (#DCB977) if last command failed
        if test $status -ne 0
          set_color DCB977
          echo -n ' '
        end
        
        # Reset color and add space
        set_color normal
        echo -n ' '
      end
    '';
    
  };

  #users.defaultUserShell = pkgs-unstable.fish;
  users.users.raffaele.shell = pkgs-unstable.fish;
  users.users.root.shell = pkgs-unstable.fish;
}
