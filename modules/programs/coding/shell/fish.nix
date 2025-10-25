{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    oh-my-posh
  ];

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;

    interactiveShellInit = ''
      # Remove greeting
      set -g fish_greeting ""

      # Explicit PATH additions
      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.nix-profile/bin

      # zoxide init
      if type -q zoxide
        zoxide init fish | source
      end

      # oh-my-posh prompt initialization
      if type -q oh-my-posh
        oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/zash.omp.json | source
      end

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
      gs = "git status";
      zl = "zellij";
      cl = "clear";
      hs = "history";

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
  };

  #users.defaultUserShell = pkgs-unstable.fish;
}
