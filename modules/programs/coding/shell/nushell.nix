{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      lt = "eza -T";
    };

    environmentVariables = {
      PATH = "$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH";
    };
  };

  home.packages = with pkgs; [
    nushell
  ];
}
