{
  description = "A Students Flake for NixOsi(Laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Add Home Manager as an input
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05"; # Use the stable branch corresponding to your Nixpkgs
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure it uses the same nixpkgs as your system
    };
    
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          
        ];
      };
    };
  };
}
