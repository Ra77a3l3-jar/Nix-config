{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [

      numpy
      scipy
      matplotlib
      streamlit
      python-dotenv
      loguru
      restrictedpython
      
      # AI/ML libraries
      tensorflow
      torch
      scikit-learn
      opencv4

      # AI
      openai
      langchain-mistralai
      google-generativeai
      anthropic
      langchain-deepseek
      
            
      requests
      pip
    ]))
    
    # Python LSP server for Helix
    python3Packages.python-lsp-server
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
