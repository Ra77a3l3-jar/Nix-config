{ config, lib, pkgs, ... }:

{
  # Ensure required firmware is installed
  hardware.enableRedistributableFirmware = true;

  # Enable AMD GPU driver
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Vulkan support (optional but recommended)
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa.drivers
    ];
  };
}

