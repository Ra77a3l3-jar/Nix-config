{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ nushell ];

  environment.pathsToLink = [ "/share/nushell" ];
}
