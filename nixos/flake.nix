{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    textfox.url = "github:adriankarlen/textfox";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, textfox, ... }@inputs:
    {
      # Default Machine
      nixosConfigurations = {
        template = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/template/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        skull = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/skull/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/wsl/configuration.nix
            inputs.home-manager.nixosModules.default
            nixos-wsl.nixosModules.wsl
          ];
        };
      };
    };

}
