{ config, pkgs, pkgs-unstable, ... }:

{
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij;
    
    settings = {
      # Disable the default UI elements that take up space
      simplified_ui = true;
      
      # Remove the status bar completely
      default_layout = "compact";
      
      # Minimal theme settings
      theme = "default";
      
      # Copy on select to reduce UI interactions
      copy_on_select = true;
      
      # Mouse support for easier navigation
      mouse_mode = true;
      
      # Disable session serialization to avoid clutter
      session_serialization = false;
      

    };
  };
  
  # Optional: Create a custom layout file for maximum space efficiency
  xdg.configFile."zellij/layouts/minimal.kdl".text = ''
    layout {
      default_tab_template {
        pane size=1 borderless=true {
          plugin location="zellij:status-bar"
        }
        children
      }
      tab name="main" focus=true {
        pane
      }
    }
  '';
}
