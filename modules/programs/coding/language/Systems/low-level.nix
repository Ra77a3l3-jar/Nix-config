{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    gfortran
    fortls
    
    fbc
    
    nasm
    asm-lsp
  ];

  programs.helix.languages = {

    language = [
      {
        name = "nasm";
        scope = "source.nasm";
        language-servers = [ "asm-lsp" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
      {
        name = "fortran";
        scope = "source.fortran";
        language-servers = [ "fortls" ];
        indent = {
        tab-width = 4;
        unit = "    ";
        };
      }
    ];
  };
  
}
