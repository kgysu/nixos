{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... }@inputs: 
    let
      system = "x68_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
            catppuccin.nixosModules.catppuccin

            home-manager.nixosModules.home-manager
            {
              # if you use home-manager
              home-manager.users.user = {
                imports = [
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            }
          ];
        };
        private = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/private/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

    };
}
