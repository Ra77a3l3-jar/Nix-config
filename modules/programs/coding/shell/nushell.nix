{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    shellAliases = {
      ls = "eza --icons";
      l = "eza -l";
      lg = "eza --icons --git -l";
      lt = "eza --tree --icons --git -l";

      cl = "clear";
      ex = "exit";
      tx = "tmux";
      
      
    };

     # Zoxide init hook for Nushell
    extraConfig = ''
      zoxide init nushell | save --raw ~/.config/nushell/zoxide.nu
      source ~/.config/nushell/zoxide.nu
    '';

    environmentVariables = {
      PATH = "$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH";
    };
  };

  home.packages = with pkgs; [
    nushell
  ];
}
