{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Ubuntu Nerd Font Mono"; # or any Nerd Font you have installed
      size = 14;
    };

    window = {
      decorations = false;
      padding = {
        x = 10;
        y = 10;
      };
      opacity = 0.96;
    };

    cursor = {
      style = "block";
      blink = true;
      blink_interval = 0.6;
    };

    extraConfig = ''
      include themes/VibrantInk.conf
    '';
  };
}
