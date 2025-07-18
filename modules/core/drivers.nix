{ config, lib, pkgs, ... }:

{
  hardware.enableRedistributableFirmware = true;

  # Load AMDGPU early
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # New NixOS 25.05 graphics options
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ mesa ];
  };

  # Tools to verify GPU and Vulkan support
  environment.systemPackages = with pkgs; [
    pciutils       # for lspci
    mesa-demos     # for glxinfo, glxgears
    vulkan-tools   # for vulkaninfo
    radeontop
    glmark2
    vkmark
  ];
}
