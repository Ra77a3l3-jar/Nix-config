{ pkgs, pkgs-unstable, ... }:
{
  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;

    # Basic settings
    prefix = "C-a";
    baseIndex = 1;
  };
}
