{
  description = "A Students Flake for NixOs";

  inputs = {
    # Stable nixpkgs (default)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    # Unstable nixpkgs
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Flake utils
    flake-utils.url = "github:numtide/flake-utils";
    
    # NixVim
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Nix Gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Lanzaboote for Secure Boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable,
    home-manager, 
    flake-utils,
    nixvim,
    nix-gaming,
    zen-browser,
    lanzaboote,
    ... 
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          # Make unstable packages available throughout the system
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          # Pass other inputs
          inherit nixvim nix-gaming zen-browser;
        };
        modules = [
          ./configuration.nix
          
          # Home Manager as NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              
              # Pass specialArgs to home-manager
              extraSpecialArgs = {
                pkgs-unstable = import nixpkgs-unstable {
                  system = "x86_64-linux";
                  config.allowUnfree = true;
                };
                inherit nixvim nix-gaming zen-browser;
              };
              
              # Import home.nix directly here
              users.raffaele = import ./home.nix;
            };
          }
          
          # Lanzaboote module
          lanzaboote.nixosModules.lanzaboote
          ({ pkgs, lib, ... }: {
            environment.systemPackages = [
              pkgs.sbctl
            ];
            boot.loader.systemd-boot.enable = lib.mkForce false;
            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
        ];
      };
    };
  };
}
