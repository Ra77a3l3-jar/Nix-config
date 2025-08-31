{ config, pkgs, pkgs-unstable, nix-gaming, ... }:

{
  # Gaming packages
  home.packages = with pkgs; [
    # Steam and gaming platforms
    pkgs-unstable.steam
    pkgs-unstable.steam-run
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
    
    # Performance monitoring
    nvtop
    radeontop
        
    # Wine and compatibility
    wine
    wine64
    wineWowPackages.waylandFull
    dxvk
    
    # Emulators (optional)
    #pcsx2
    #dolphin-emu
    #retroarch
    
    # Additional gaming tools from unstable
    pkgs-unstable.prismlauncher  # Minecraft launcher
  ] ++ (if nix-gaming ? packages.${pkgs.system} then [
    # Nix-gaming packages if available
    nix-gaming.packages.${pkgs.system}.wine-ge
    nix-gaming.packages.${pkgs.system}.proton-ge
  ] else []);

  # XDG settings for gaming
  xdg.desktopEntries = {
    steam-nvidia = {
      name = "Steam (NVIDIA)";
      exec = "prime-run steam";
      icon = "steam";
      comment = "Launch Steam with NVIDIA GPU";
      categories = [ "Game" ];
    };
    
    lutris-nvidia = {
      name = "Lutris (NVIDIA)";
      exec = "prime-run lutris";
      icon = "lutris";
      comment = "Launch Lutris with NVIDIA GPU";
      categories = [ "Game" ];
    };
  };

  # Environment variables for gaming
  home.sessionVariables = {
    # Vulkan
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json";
    
    # Steam optimizations
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    
    # MangoHud
    MANGOHUD = "1";
    MANGOHUD_DLSYM = "1";
    
    # GameMode
    GAMEMODE = "1";
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
        font_size = 24;
      };
    };
  };
}

