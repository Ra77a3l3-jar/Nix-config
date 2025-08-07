{ pkgs, ... }: {
  programs.helix.languages.language = [
    {
      name = "kotlin";
      scope = "source.kotlin";
      language-servers = [ "kotlin-language-server" ];
    }
  ];

  home.packages = with pkgs; [
    kotlin
    kotlin-language-server
  ];
}

