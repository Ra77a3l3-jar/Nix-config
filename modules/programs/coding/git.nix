{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];

  home.file.".gitconfig".text = ''
    [user]
      name = Ra77a3l3-jar
      email = raffaelemeo77@gmail.com
  '';
}

