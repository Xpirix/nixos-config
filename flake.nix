{
  description = "Xpirix's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux"; # Change this if you're using a different architecture
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = system;
          # extraSpecialArgs = { inherit inputs; };
          modules = [
            ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
