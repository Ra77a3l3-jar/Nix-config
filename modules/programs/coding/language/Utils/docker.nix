{ pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    docker
    docker-compose
  ];
  
  # Only needed if using rootless Docker
  home.sessionVariables = {
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };
}
