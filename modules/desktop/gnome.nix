{ config, pkgs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # Enable keyring
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    yaru-theme
  ];

  programs.dconf.enable = true;

  environment.gnome.excludePackages = (with pkgs; [

    cheese
    epiphany
    geary
    
    gnome-connections
    gnome-characters
    gnome-music
    gnome-photos
    gnome-tour
    gnome-weather
    gnome-contacts
    
    totem

    evince
    gnome-logs
    eog
    simple-scan
    gnome-font-viewer
    seahorse
    yelp
    gnome-calendar
    rhythmbox
  ]);

  home-manager = {
    users.raffaele = {
      dconf = {
        enable = true;
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
    };
  };
  
}
