# modules/programs/coding/terminals/tmux.nix
{ config, pkgs, pkgs-unstable, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;
        
    # Enable mouse support
    mouse = true;
    
    # Set prefix key to Ctrl-a
    prefix = "C-a";
    
    # Start windows and panes at 1 instead of 0
    baseIndex = 1;
    
    # Increase scrollback buffer
    historyLimit = 10000;
    
    # Faster command sequences
    escapeTime = 10;
    
    # Terminal settings
    terminal = "xterm-ghostty";
    
    # Vi-style key bindings
    keyMode = "vi";
    
    # Plugins configuration
    plugins = with pkgs-unstable.tmuxPlugins; [
      # Fuzzy finding
      {
        plugin = tmux-fzf;
      }
      
      # Session management
      {
        plugin = tmux-sessionx;
        extraConfig = ''
          set -g @sessionx-bind 'C-f'
        '';
      }
      
      # Which-key functionality
      {
        plugin = tmux-which-key;
        extraConfig = ''
          set -g @which-key-show-on-prefix 'true'
          set -g @which-key-position 'bottom'
        '';
      }
      
      # Dotbar theme
      {
        plugin = dotbar;
        extraConfig = ''
          set -g @dotbar_theme 'default'
        '';
      }
      
      # Additional useful plugins
      {
        plugin = yank;
        extraConfig = ''
          # Copy to system clipboard
          set -g @yank_selection_mouse 'clipboard'
        '';
      }
      
      {
        plugin = copycat;
      }
      
      {
        plugin = open;
      }
      
      # Pain control for better pane management
      {
        plugin = pain-control;
      }
    ];
  };
}
