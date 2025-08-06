{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell
  ];

  environment.pathsToLink = [ "/share/nushell" ];

  programs.nushell = {
    enable = true;

    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      lg = "eza --icons --git -l";
      lt = "eza --icons --gt -l --tree";
    };

    environmentVariables = {
      PATH = "$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH";
    };
  };
}

