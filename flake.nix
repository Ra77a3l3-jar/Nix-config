{
  description = "A Students Flake for NixOs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Add Home Manager as an input
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05"; # Use the stable branch corresponding to your Nixpkgs
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure it uses the same nixpkgs as your system
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          
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
