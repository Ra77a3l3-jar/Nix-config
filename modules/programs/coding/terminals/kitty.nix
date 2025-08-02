{ config, pkgs, ... }:

{
  programs.kitty.enable = true;

  programs.kitty.font = {
    name = "Ubuntu Nerd Font Mono"; # or substitute with fira-code-nerd-font
    size = 14;
  };

  programs.kitty.window = {
    decorations = false;
    padding = { x = 10; y = 10; };
    opacity = 0.96;
  };

  programs.kitty.cursor = {
    style = "block";
    blink = true;
    blink_interval = 0.6;
  };

  programs.kitty.extraConfig = ''
    # Put your VibrantInk config here if you want inline
  '';
}

