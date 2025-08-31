{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    
    # Basic settings
    clock24 = true;
    mouse = true;
    terminal = "screen-256color";
    baseIndex = 1;  # Start windows at index 1, not 0
    
    # Key bindings
    prefix = "C-a";  # Change prefix from C-b to C-a (more ergonomic)
    keyMode = "vi";  # Use vi-style key bindings
    
    # Additional configuration
    extraConfig = ''
      # Pane numbering starts at 1
      set -g pane-base-index 1
      
      # Renumber windows when one is closed
      set -g renumber-windows on
      
      # Increase scrollback buffer size
      set -g history-limit 50000
      
      # Display messages for 4 seconds
      set -g display-time 4000
      
      # Refresh status bar every 5 seconds
      set -g status-interval 5
      
      # Enable focus events for terminals that support them
      set -g focus-events on
      
      # Aggressive resize
      setw -g aggressive-resize on
      
      # Don't rename windows automatically
      set-option -g allow-rename off
      
      # Enable true color support
      set -ga terminal-overrides ",*256col*:Tc"
      
      # Key bindings
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      
      # Vim-like pane switching
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      
      # Resize panes with vim-like keys
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      
      # Copy mode improvements
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      
      # Plugin configurations
      
      # tmux-which-key configuration
      set -g @tmux-which-key-xdg-enable 1
      set -g @tmux-which-key-disable-autoreload 0
      
      # Catppuccin theme configuration (minimal - uses good defaults)
      set -g @catppuccin_date_time_text "%H:%M"
      
      # Plugin list
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'alexwforsythe/tmux-which-key'
      set -g @plugin 'omerxx/catppuccin-tmux'
      
      # Initialize TMUX plugin manager (keep this line at the very bottom)
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
  
  # Install tmux plugin manager and plugins
  home.file.".tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.1.0";
      sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
    };
    recursive = true;
  };
  
  # Additional tmux-related packages
  home.packages = with pkgs; [
    tmux
    tmuxinator  # Session manager
  ];
}
