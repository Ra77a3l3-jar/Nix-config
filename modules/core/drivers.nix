{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;  # use closed-source kernel module
  };

  environment.systemPackages = with pkgs; [
    vulkan-loader
  ];
}

