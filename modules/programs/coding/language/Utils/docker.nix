{ pkgs-unstable, ... }:

{

  programs.helix.languages = {

    language = [
      {
        name = "dockerfile";
        scope = "source.dockerfile";
        language-servers = [ "docker-language-server" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "docker-compose";
        scope = "source.docker-compose";
        language-servers = [ "docker-compose-langserver" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };

  home.packages = with pkgs-unstable; [
    docker
    docker-language-server
    
    docker-compose
    docker-compose-language-service
    
    lazydocker
  ];
  
  # Only needed if using rootless Docker
  home.sessionVariables = {
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };
}
