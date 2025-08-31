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
      
      # Enable true color support - fixed to prevent glitches
      set -g default-terminal "screen-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      
      # Status bar at the bottom
      set -g status-position bottom
      
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
      
      # sessionx configuration
      set -g @sessionx-bind 'o'
      set -g @sessionx-window-height '85%'
      set -g @sessionx-window-width '75%'
      set -g @sessionx-zoxide-mode 'on'
      
      # floax configuration
      set -g @floax-bind 'p'
      set -g @floax-width '80%'
      set -g @floax-height '80%'
      set -g @floax-border-color 'magenta'
      set -g @floax-text-color 'blue'
      
      # tmux-fzf configuration
      TMUX_FZF_LAUNCH_KEY="C-f"
      
      # Simple built-in theme - no glitches with Ghostty
      # Status bar styling
      set -g status-style 'bg=#2e3440 fg=#d8dee9'
      set -g status-left-length 40
      set -g status-right-length 50
      set -g status-left '#[bg=#5e81ac,fg=#2e3440,bold] #S #[bg=#2e3440,fg=#5e81ac]'
      set -g status-right '#[fg=#81a1c1]%H:%M #[bg=#81a1c1,fg=#2e3440,bold] %Y-%m-%d '
      
      # Window status
      set -g window-status-format ' #I:#W '
      set -g window-status-current-format '#[bg=#88c0d0,fg=#2e3440,bold] #I:#W '
      set -g window-status-separator ''
      
      # Pane borders
      set -g pane-border-style 'fg=#4c566a'
      set -g pane-active-border-style 'fg=#5e81ac'
      
      # Message styling
      set -g message-style 'bg=#bf616a,fg=#eceff4,bold'
      
      # Plugin list
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'alexwforsythe/tmux-which-key'
      set -g @plugin 'omerxx/tmux-sessionx'
      set -g @plugin 'omerxx/tmux-floax'
      set -g @plugin 'sainnhe/tmux-fzf'
      
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
  
  home.packages = with pkgs; [
    tmuxinator  # Session manager
  ];
}
