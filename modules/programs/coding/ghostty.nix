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
    window-padding-x = 10
    window-padding-y = 10
    window-save-state = "always"
    background-opacity = 0.93
    background-blur-radius = 30
    window-decoration = false
  '';
}

