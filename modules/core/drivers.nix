{ config, lib, pkgs, ... }:

{
  # Enable OpenGL/Mesa (updated for newer NixOS)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    
    # AMD GPU support
    extraPackages = with pkgs; [
      amdvlk              # AMD Vulkan driver
      rocmPackages.clr    # OpenCL support (replaces rocm-opencl-icd/runtime)
    ];
    
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk  # 32-bit AMD Vulkan
    ];
  };

  # NVIDIA configuration
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
  
  hardware.nvidia = {
    # Use the open source version of the kernel module (for RTX 30 series)
    open = true;
    
    # Enable the nvidia settings menu
    nvidiaSettings = true;
    
    # Use the stable nvidia driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    # Power management (important for laptops)
    powerManagement = {
      enable = true;
      finegrained = true;  # Enable fine-grained power management
    };
    
    # PRIME configuration for hybrid graphics
    prime = {
      # Enable NVIDIA Optimus support
      #offload = {
        #enable = true;
        #enableOffloadCmd = true;  # Enables prime-run command
      #};
      
      # Make sure to get the right bus IDs for your system
      # Run: lspci | grep -E "(VGA|3D)" to find these values
      amdgpuBusId = "PCI:6:0:0";    # Usually the integrated AMD GPU
      nvidiaBusId = "PCI:1:0:0";    # Usually the discrete NVIDIA GPU
      
      # Uncomment if you want to use sync mode instead of offload
      sync.enable = true;
      
      # Uncomment if you want NVIDIA as primary (not recommended for battery life)
      # reverseSync.enable = true;
    };
  };

  # AMD GPU specific configuration
  boot.initrd.kernelModules = [ "amdgpu" ];
  
  # Kernel parameters for better AMD GPU support
  boot.kernelParams = [
    # AMD GPU optimizations
    "amd_pstate=active"           # Use AMD P-State driver
    "amdgpu.ppfeaturemask=0xffffffff"  # Enable all power play features
    
    # General performance
    "mitigations=off"             # Disable CPU mitigations for better performance (less secure)
  ];

  # Additional packages for GPU support
  environment.systemPackages = with pkgs; [
    # NVIDIA tools
    nvidia-vaapi-driver
    config.boot.kernelPackages.nvidia_x11.settings  # nvidia-settings
    nvtopPackages.full
    
    # AMD tools  
    radeontop
    amdgpu_top
    
    # Vulkan tools
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    
    # GPU monitoring
    glxinfo
    mesa-demos
  ];

  # Environment variables for proper GPU detection
  environment.sessionVariables = {
    # Vulkan
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json";
    
    # NVIDIA
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    
    # General
    WLR_NO_HARDWARE_CURSORS = "1";  # Fix for some Wayland compositors
    
    # Force specific applications to use NVIDIA GPU
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
  };

  # Services for better power management
  services = {
    # TLP for power management (conflicts with power-profiles-daemon)
    tlp = {
      enable = true;
      settings = {
        # CPU settings
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        
        # AMD GPU power management
        RADEON_DPM_STATE_ON_AC = "performance";
        RADEON_DPM_STATE_ON_BAT = "battery";
        RADEON_POWER_PROFILE_ON_AC = "high";
        RADEON_POWER_PROFILE_ON_BAT = "low";
        
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
        amd_performance_level = "high";
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
