{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    themeFile = "VibrantInk";
    
    font = {
      name = "Ubuntu Nerd Font";
      size = 14;
    };
    
    settings = {
      # Font settings
      adjust_line_height = "0%";
      adjust_column_width = "0%";
      
      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = "0";
      cursor_trail = "1";
      
      # Scrollback
      scrollback_lines = 20000;
      
      # Window
      window_padding_width = 10;
      remember_window_size = true;
      hide_window_decorations = true;
      
      # Background
      background_opacity = "0.96";
      background_blur = 25;
      
      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;
      
      # Bell
      enable_audio_bell = false;
      visual_bell_duration = "0.0";
      
      # Tabs
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      
      # Misc
      shell_integration = "enabled";
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
    };
    
    keybindings = {
      # Tab management
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      
      # Window management
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+n" = "new_os_window";
      
      # Font size
      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";
      
      # Copy/Paste
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
    };
  };
}
