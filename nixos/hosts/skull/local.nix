{ config, pkgs, inputs, ... }:

{
  imports = [
    ./../../modules/users/default.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/desktop/default.nix
    ./../../modules/nixos/desktop/hyprland.nix
    # ./../../modules/nixos/neovim.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "main" = import ./home.nix;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-maps
    gnome-weather
    epiphany
  ];

  environment.shellAliases = {
    l = "ls -lh";
    ll = "ls -lah";
    nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#skull";
    nix-sys-gens = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    nix-sys-gens-cleanup = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system 5d";
  };

  hardware = {
    graphics.enable = true;
  };
}
