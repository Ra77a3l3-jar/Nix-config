{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # Basic settings
    clock24 = true;
    mouse = true;
    terminal = "tmux-256color";
    baseIndex = 1;  # Start windows at index 1, not 0

    # Key bindings
    prefix = "C-a";  # Change prefix from C-b to C-a (more ergonomic)
    keyMode = "vi";  # Use vi-style key bindings
  };
}
