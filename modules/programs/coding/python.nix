{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python with selected packages
    (python3.withPackages (ps: with ps; [
      # Math and science
      numpy
      scipy
      matplotlib
      
      # AI/ML libraries
      tensorflow
      torch
      scikit-learn
      opencv4
      
      # YouTube transcript
      youtube-transcript-api
      
      # Basic utilities
      requests
      pip
      conda
    ]))
    
    # Python LSP server for Helix
    python3Packages.python-lsp-server
  ];
}
