# modules/programs/coding/terminals/tmux.nix
{ config, pkgs, pkgs-unstable, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs-unstable.tmux;
    
    # Use zsh as the default shell in tmux
    shell = "${pkgs.zsh}/bin/zsh";
    
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
    
    # Custom configuration
    extraConfig = ''
      # Unbind default prefix
      unbind C-b
      
      # Send prefix key through
      bind C-a send-prefix
      
      # Pane base index
      setw -g pane-base-index 1
      
      # Renumber windows when one is closed
      set -g renumber-windows on
      
      # Use 256 color mode and enable RGB/truecolor support
      set -as terminal-features ",xterm-ghostty:RGB"
      set -as terminal-overrides ",xterm-ghostty:Tc"
      
      # Cursor style → vertical bar instead of block
      set -g cursor-style 6
      
      # Enhanced vi-mode copy bindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
      
      # Refresh status line every 5 seconds
      set -g status-interval 5
      
      # Focus events enabled for terminals that support them
      set -g focus-events on
      
      # Super useful when using "grouped sessions" and multi-monitor setup
      setw -g aggressive-resize on
      
      # Activity monitoring
      setw -g monitor-activity on
      set -g visual-activity off
      
      # Pane navigation with vim-like keys
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      
      # Pane resizing with vim-like keys (repeatable)
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      
      # Split panes with more intuitive keys
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      
      # New window with current path
      bind c new-window -c "#{pane_current_path}"
      
      # Reload config file
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
      
      # Clear screen and scrollback
      bind C-l send-keys C-l \; run 'sleep 0.1' \; clear-history
    '';
    
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
        plugin = tmux-dotbar;
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
  
  # Install fzf as it's required for tmux-fzf plugin
  home.packages = with pkgs-unstable; [

  ];
}
