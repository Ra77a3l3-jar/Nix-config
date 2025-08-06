{ config, pkgs, ... }:

{
  # Install nushell system-wide
  environment.systemPackages = with pkgs; [ nushell ];

  # Deploy global Nushell environment config
  environment.etc."nushell/env.nu".text = ''
    let-env PATH = ($env.PATH | prepend "~/.local/bin" | prepend "~/.nix-profile/bin")
    let-env MANPAGER = "batman"
    let-env EDITOR = "hx"
    let-env VISUAL = "hx"
  '';
