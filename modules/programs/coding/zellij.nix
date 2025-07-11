{config, pkgs, ... }:

{

  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
    };
  };
  
}
