{ config, lib, pkgs, environment, ... }:

{
  imports = [
    ./env.nix
  ];

  environment.systemPackages = with pkgs; [
    alacritty
  ];

}
