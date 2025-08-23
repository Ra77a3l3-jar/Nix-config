{ pkgs, ... }:

{

  home.packages = with pkgs; [
    git
  ];

  home.file.".gitconfig".text = ''
    [user]
      name = Ra77a3l3-jar
      email = raffaelemeo77@gmail.com

    [url "git@github.com:"]
      insteadOf = https://github.com/
  '';
  
}
