{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "VibrantInk";
      
      font-family = "Ubuntu Nerd Font";
      font-size = 12;
      font-thicken = true;
      adjust-cell-width = "0%";
      
      cursor-style = "block";
      cursor-style-blink = flase;
      
      scrollback-limit = 50000;
      
      window-padding-x = 10;
      window-padding-y = 10;
      window-save-state = "always";
      window-decoration = false;
      
      background-opacity = 0.96;
      background-blur-radius = 25;
    };
  };
}
