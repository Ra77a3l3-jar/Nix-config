{ config, pkgs, ... }:

{
  xdg.configFile."ghostty/config".text = ''
    theme = "VibrantInk"

    font-family = "Ubuntu Nerd Font"
    font-size = 14
    font-thicken = true
    adjust-cell-width = 0%
    cursor-style = "bar"
    cursor-style-blink = true
    scrollback-limit = 20000
    window-padding-x = 15
    window-padding-y = 15
    window-save-state = "always"
    background-opacity = 0.98
    background-blur-radius = 25
    window-decoration = false
  '';
}

