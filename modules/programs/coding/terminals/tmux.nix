{ config, pkgs, pkgs-unstable, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;

    plugins = with pkgs-unstable; [
      tmuxPlugins.tmux-sessionx
      tmuxPlugins.tmux-which-key
      tmuxPlugins.tmux-floax
      tmuxPlugins.dotbar
      tmuxPlugins.tmux-fzf
    ];
    
    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    historyLimit= 50000;
    terminal = "screen-256color";
    
  };
}
