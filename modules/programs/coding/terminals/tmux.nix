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
      
      # Enable true color support - enhanced glitch prevention
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB,*256col*:RGB"
      set -ag terminal-overrides ",*:U8=0"  # Disable UTF-8 mouse support to prevent glitches
      set -ag terminal-overrides ",*:Smulx=\E[4::%p1%dm"  # undercurl support
      set -ag terminal-overrides ",*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m"  # underscore colours
      set -g escape-time 0  # Reduce escape time to prevent input lag
      set -g repeat-time 500  # Reduce repeat time
      
      # Additional settings to prevent rendering glitches
      set -g allow-passthrough on
      set -ga terminal-features "*:hyperlinks"
      set -g set-titles on
      set -g set-titles-string "#T"
      
      # Status bar at the bottom (changed from top due to minimal theme)
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
      
      # minimal-tmux-status configuration - keep it simple to avoid glitches
      set -g @minimal-tmux-bg "#698DDA"
      set -g @minimal-tmux-justify "centre"
      set -g @minimal-tmux-indicator-str "  tmux  "
      set -g @minimal-tmux-status "top"
      
      # Plugin list
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'alexwforsythe/tmux-which-key'
      set -g @plugin 'omerxx/tmux-sessionx'
      set -g @plugin 'omerxx/tmux-floax'
      set -g @plugin 'sainnhe/tmux-fzf'
      set -g @plugin 'niksingh710/minimal-tmux-status'
      
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
