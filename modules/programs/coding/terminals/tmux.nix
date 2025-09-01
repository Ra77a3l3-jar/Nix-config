{ pkgs, ... }:
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

    # Additional configuration
    extraConfig = ''
      # ============================================================================
      # TERMINAL & COLOR CONFIGURATION
      # ============================================================================

      # Proper terminal color support
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -ga terminal-overrides ",alacritty:RGB"
      set -ga terminal-overrides ",kitty:RGB"
      set -ga terminal-overrides ",ghostty:RGB"

      # Cursor configuration - maintain bar/line cursor
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set -ga terminal-overrides '*:Cs=\E]12;%p1%s\007'
      set -ga terminal-overrides '*:Cr=\E]112\007'

      # Prevent cursor shape changes
      set -g cursor-style bar

      # Selection colors to avoid highlighting conflicts
      set -g mode-style "fg=#f8f8f2,bg=#44475a"

      # ============================================================================
      # BASIC TMUX SETTINGS
      # ============================================================================

      # Pane numbering starts at 1
      set -g pane-base-index 1

      # Renumber windows when one is closed
      set -g renumber-windows on

      # Increase scrollback buffer size
      set -g history-limit 50000

      # Display messages for 2 seconds
      set -g display-time 2000

      # Refresh status bar every 5 seconds
      set -g status-interval 5

      # Enable focus events for terminals that support them
      set -g focus-events on

      # Aggressive resize
      setw -g aggressive-resize on

      # Don't rename windows automatically
      set-option -g allow-rename off

      # Escape time for neovim
      set -sg escape-time 10

      # ============================================================================
      # KEY BINDINGS
      # ============================================================================

      # Reload configuration
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Split panes with intuitive keys
      bind | split-window -h -c "#{pane_current_path}"
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"

      # New window in current path
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

      # Window navigation
      bind -n M-h previous-window
      bind -n M-l next-window

      # Copy mode improvements
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi Escape send-keys -X cancel

      # Clear screen and history
      bind C-l send-keys 'C-l'
      bind C-k send-keys 'C-k'

      # ============================================================================
      # THEME CONFIGURATION - MINIMAL CLEAN THEME
      # ============================================================================

      # Status bar configuration
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "fg=#f8f8f2,bg=#282a36"

      # Window status
      set -g window-status-current-style "fg=#50fa7b,bg=#44475a,bold"
      set -g window-status-style "fg=#f8f8f2,bg=#282a36"
      set -g window-status-separator ""

      # Window status format
      set -g window-status-current-format " #I:#W#F "
      set -g window-status-format " #I:#W#F "

      # Pane borders
      set -g pane-border-style "fg=#6272a4"
      set -g pane-active-border-style "fg=#50fa7b"

      # Message style
      set -g message-style "fg=#f8f8f2,bg=#6272a4"
      set -g message-command-style "fg=#f8f8f2,bg=#6272a4"

      # Status bar content
      set -g status-left-length 20
      set -g status-left "#[fg=#50fa7b,bg=#282a36,bold] #{session_name} #[default]"

      set -g status-right-length 50
      set -g status-right "#[fg=#f8f8f2,bg=#44475a] %H:%M #[fg=#50fa7b,bg=#282a36,bold] %d/%m "

      # ============================================================================
      # PLUGIN CONFIGURATION
      # ============================================================================

      # Plugin settings must be set before plugin list

      # tmux-which-key configuration
      set -g @tmux-which-key-xdg-enable 1
      set -g @tmux-which-key-disable-autoreload 0
      set -g @tmux-which-key-prefix-key-map "C-a"

      # sessionX configuration
      set -g @sessionx-bind 'o'
      set -g @sessionx-x-path '~/Documenti'
      set -g @sessionx-window-height '85%'
      set -g @sessionx-window-width '75%'
      set -g @sessionx-zoxide-mode 'on'
      set -g @sessionx-filter-current 'false'
      set -g @sessionx-preview-enabled 'true'

      # floaX configuration
      set -g @floax-bind 'p'
      set -g @floax-width '80%'
      set -g @floax-height '80%'
      set -g @floax-border-color 'magenta'
      set -g @floax-text-color 'blue'

      # fzf configuration
      set -g @fzf-url-bind 'u'
      set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'

      # ============================================================================
      # PLUGIN LIST
      # ============================================================================

      # TPM - Tmux Plugin Manager
      set -g @plugin 'tmux-plugins/tpm'

      # Essential plugins
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'

      # Required plugins as specified
      set -g @plugin 'omerxx/tmux-sessionx'     # Session management
      set -g @plugin 'omerxx/tmux-floax'        # Floating windows
      set -g @plugin 'sainnhe/tmux-fzf'         # FZF integration
      set -g @plugin 'alexwforsythe/tmux-which-key' # Key binding hints

      # Additional useful plugins
      set -g @plugin 'tmux-plugins/tmux-yank'   # Copy to system clipboard
      set -g @plugin 'joshmedeski/tmux-fzf-url' # Open URLs with fzf
      set -g @plugin 'tmux-plugins/tmux-prefix-highlight' # Highlight when prefix is pressed

      # ============================================================================
      # PLUGIN SPECIFIC CONFIGURATIONS
      # ============================================================================

      # tmux-resurrect configuration
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-strategy-vim 'session'

      # tmux-continuum configuration
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15'

      # tmux-yank configuration
      set -g @yank_selection_mouse 'clipboard'
      set -g @yank_action 'copy-pipe-no-clear'

      # Prefix highlight
      set -g @prefix_highlight_fg 'black'
      set -g @prefix_highlight_bg 'yellow'
      set -g @prefix_highlight_show_copy_mode 'on'
      set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow,bold'

      # ============================================================================
      # CUSTOM KEY BINDINGS FOR PLUGINS
      # ============================================================================

      # SessionX bindings
      bind-key o run-shell "tmux neww tmux-sessionx"

      # FloaX bindings
      bind-key p run-shell "tmux-floax"

      # FZF bindings
      bind-key f run-shell -b "tmux-fzf-pane"
      bind-key w run-shell -b "tmux-fzf-window"
      bind-key s run-shell -b "tmux-fzf-session"

      # Which-key trigger
      bind-key Space run-shell "tmux-which-key"

      # ============================================================================
      # ADVANCED CONFIGURATIONS
      # ============================================================================

      # Smart pane switching with awareness of vim splits
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R

      # ============================================================================
      # INITIALIZE TPM (KEEP AT BOTTOM)
      # ============================================================================

      # Initialize TMUX plugin manager (keep this line at the very bottom)
      run '~/.tmux/plugins/tpm/tpm'
    '';

    # Additional tmux plugins through Nix
    plugins = with pkgs.tmuxPlugins; [
      # Core plugins
      sensible
      resurrect
      continuum
      yank
      prefix-highlight
    ];
  };

  # ============================================================================
  # NIX PACKAGES & HOME MANAGER CONFIGURATION
  # ============================================================================

  # Install TPM and configure plugin directory
  home.file.".tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.1.0";
      sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
    };
    recursive = true;
  };

  # SessionX plugin
  home.file.".tmux/plugins/tmux-sessionx" = {
    source = pkgs.fetchFromGitHub {
      owner = "omerxx";
      repo = "tmux-sessionx";
      rev = "main";
      sha256 = "sha256-BdJFEyy5FYdaYIYUDTNRZUJsIjQd5bCQ14gLS8xCQFw=";
    };
    recursive = true;
  };

  # FloaX plugin
  home.file.".tmux/plugins/tmux-floax" = {
    source = pkgs.fetchFromGitHub {
      owner = "omerxx";
      repo = "tmux-floax";
      rev = "main";
      sha256 = "sha256-NyAFfbEH9ICPbKH8m7aUpF1DdQWNLh1ycBc1oMdF2wQ=";
    };
    recursive = true;
  };

  # FZF plugin
  home.file.".tmux/plugins/tmux-fzf" = {
    source = pkgs.fetchFromGitHub {
      owner = "sainnhe";
      repo = "tmux-fzf";
      rev = "main";
      sha256 = "sha256-fXFp8n+Nqp6tRbOW0znyKBhw6YHCjwVw/HtHXNLVb8Y=";
    };
    recursive = true;
  };

  # Which-key plugin
  home.file.".tmux/plugins/tmux-which-key" = {
    source = pkgs.fetchFromGitHub {
      owner = "alexwforsythe";
      repo = "tmux-which-key";
      rev = "main";
      sha256 = "sha256-slz8wlTcBM7DNKGJGnvHW/HgKWKfE9+WgUqo64bMcT4=";
    };
    recursive = true;
  };

  # FZF URL plugin
  home.file.".tmux/plugins/tmux-fzf-url" = {
    source = pkgs.fetchFromGitHub {
      owner = "joshmedeski";
      repo = "tmux-fzf-url";
      rev = "main";
      sha256 = "sha256-IbF/jjLRFOeQOV4YJJsKo6yOLu9zZuWXNZ8z8y8G6Z4=";
    };
    recursive = true;
  };

  # Required packages for tmux functionality
  home.packages = with pkgs; [
    # Core tmux
    tmux

    # Session management
    tmuxinator
    tmuxp

    # Required for plugins
    fzf               # For fzf integration
    zoxide            # For sessionX directory jumping
    gum               # For sessionX UI
    fd                # Better find for fzf
    ripgrep           # Better grep for fzf
    bat               # Better cat for previews

    # Terminal tools that work well with tmux
    tree              # Directory tree view
    htop              # Process viewer
    ncdu              # Disk usage analyzer
  ];

  # ============================================================================
  # SHELL INTEGRATION
  # ============================================================================

  # Add tmux aliases and functions to shell
  programs.zsh.shellAliases = {
    # Tmux session management
    ta = "tmux attach-session -t";
    tl = "tmux list-sessions";
    tn = "tmux new-session -d -s";
    tk = "tmux kill-session -t";

    # Quick tmux shortcuts
    tmux = "tmux -2";  # Force 256 color mode
    t = "tmux";
  };

  # Tmux integration functions
  programs.zsh.initExtra = ''
    # Auto-start tmux for interactive shells
    if [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
      tmux attach-session -t ssh_tmux 2>/dev/null || tmux new-session -s ssh_tmux
    fi

    # Function to create tmux session with project
    project_tmux() {
      if [[ -z "$1" ]]; then
        echo "Usage: project_tmux <project_name> [directory]"
        return 1
      fi

      local session_name="$1"
      local project_dir="''${2:-$(pwd)}"

      if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
      else
        cd "$project_dir"
        tmux new-session -d -s "$session_name" -c "$project_dir"
        tmux send-keys -t "$session_name" "clear" Enter
        tmux attach-session -t "$session_name"
      fi
    }

    alias pt=project_tmux
  '';
}
