{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      # Data Science & Scientific Computing
      numpy
      scipy
      matplotlib
      pandas
      sympy
      seaborn
      plotly
      scikit-learn
      statsmodels
      networkx
      numba
      manim
      
      # Data handling
      pillow
      imageio
      h5py
      openpyxl
      xlrd
      
      # Development & Analysis
      jupyter
      ipython
      notebook
      
     # AI/ML libraries
      tensorflow
      torch
      opencv4

     # Utilities
      requests
      pip
      virtualenv
      
      # Python LSP packages
      python-lsp-server
      # pylsp-mypy
      # python-lsp-black
      # pylsp-rope
    ]))
  ];

  programs.helix.languages = {
    language = [
      {
        name = "python";
        scope = "source.python";
        language-servers = [ "pylsp" ];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
