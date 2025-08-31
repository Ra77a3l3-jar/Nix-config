{ config, lib, pkgs, ... }:

{
  # Enable graphics (simplified for NVIDIA-only)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # NVIDIA only configuration
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    # Use the open source version of the kernel module (for RTX 30 series)
    open = true;
    
    # Enable the nvidia settings menu
    nvidiaSettings = true;
    
    # Use the stable nvidia driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    # Power management (simplified for single GPU)
    powerManagement = {
      enable = true;
      finegrained = false;  # Not needed without hybrid graphics
    };
    
    # No PRIME configuration needed since iGPU is disabled
  };

  # Kernel parameters for NVIDIA optimization
  boot.kernelParams = [
    # NVIDIA optimizations
    "nvidia.NVreg_UsePageAttributeTable=1"
    "nvidia.NVreg_InitializeSystemMemoryAllocations=0"
  ];

  # Additional packages for GPU support
  environment.systemPackages = with pkgs; [
    # NVIDIA tools
    nvidia-vaapi-driver
    config.boot.kernelPackages.nvidia_x11.settings  # nvidia-settings
    nvtopPackages.nvidia
    
    # Vulkan tools
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    
    # GPU monitoring
    glxinfo
    mesa-demos
  ];

  # Environment variables for NVIDIA-only setup
  environment.sessionVariables = {
    # NVIDIA
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    
    # Vulkan (NVIDIA only)
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json";
    
    # General
    WLR_NO_HARDWARE_CURSORS = "1";  # Fix for some Wayland compositors
  };

  # Services for power management
  services = {
    # TLP for power management
    tlp = {
      enable = true;
      settings = {
        # CPU settings
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        
        # PCI Express power management
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
        
        # USB autosuspend
        USB_AUTOSUSPEND = "1";
        
        # WiFi power saving
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
      };
    };
    
    # Thermald for thermal management
    thermald.enable = true;
  };

  # Enable GameMode system service
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
        ioprio = 7;
        inhibit_screensaver = 1;
        softrealtime = "auto";
        reaper_freq = 5;
      };
      
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        nvidia_performance_mode = "MaxPerformanceMode";
      };
      
      cpu = {
        park_cores = "no";
        pin_cores = "no";
      };
    };
  };

  # Disable power-profiles-daemon if using TLP
  services.power-profiles-daemon.enable = false;
  
  # Enable udev rules for gaming devices
  services.udev.packages = with pkgs; [
    game-devices-udev-rules
  ];
}
