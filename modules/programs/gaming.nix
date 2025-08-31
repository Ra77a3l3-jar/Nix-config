{ config, pkgs, pkgs-unstable, nix-gaming, ... }:

{
  # Gaming packages
  home.packages = with pkgs; [
    # Gaming platforms (Steam from unstable)
    lutris
    bottles
    heroic
    legendary-gl
    
    # Gaming utilities
    mangohud
    goverlay
    gamemode
    gamescope
    protontricks
    winetricks
    
    # Wine and compatibility
    wineWowPackages.waylandFull  # This includes both 32-bit and 64-bit wine
    dxvk
    
    # Emulators (optional)
    # pcsx2
    # dolphin-emu
    # retroarch
    
    # Additional gaming tools and Steam from unstable
    pkgs-unstable.steam
    pkgs-unstable.steam-run
    pkgs-unstable.prismlauncher  # Minecraft launcher
  ];

  # Simplified desktop entries (no GPU switching needed)
  xdg.desktopEntries = {
    steam-gaming = {
      name = "Steam Gaming";
      exec = "steam";
      icon = "steam";
      comment = "Launch Steam (automatically uses NVIDIA)";
      categories = [ "Game" ];
    };
    
    lutris-gaming = {
      name = "Lutris Gaming";
      exec = "lutris";
      icon = "lutris";
      comment = "Launch Lutris (automatically uses NVIDIA)";
      categories = [ "Game" ];
    };
  };

  # Environment variables for gaming (simplified)
  home.sessionVariables = {
    # Steam optimizations
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    
    # MangoHud
    MANGOHUD = "1";
    MANGOHUD_DLSYM = "1";
    
    # GameMode
    GAMEMODE = "1";
    
    # NVIDIA optimizations
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # Gaming-specific dconf settings (for GNOME users)
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "variable-refresh-rate" ];
    };
  };

  # Gaming directories
  home.file = {
    ".steam/root/compatibilitytools.d/.keep".text = "";
    ".local/share/lutris/.keep".text = "";
  };

  # Programs configuration
  programs = {
    # Configure MangoHud
    mangohud = {
      enable = true;
      enableSessionWide = false;  # Only enable for specific games
      settings = {
        gpu_stats = true;
        gpu_temp = true;
        gpu_power = true;
        cpu_stats = true;
        cpu_temp = true;
        ram = true;
        vram = true;
        fps = true;
        frametime = true;
        frame_timing = true;
        gamemode = true;
        position = "top-left";
        text_color = "FFFFFF";
        gpu_color = "2E9762";
        cpu_color = "2E97CB";
        vram_color = "AD64C1";
        ram_color = "C26693";
        engine_color = "EB5B5B";
        io_color = "A491D3";
        background_color = "020202";
        background_alpha = "0.4";
        font_size = 16;
      };
    };
  };
}
