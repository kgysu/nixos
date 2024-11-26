{ config, lib, pkgs, ... }:

{
  imports = [
    ./default.nix
    ./env-desktop.nix
    ./programs-desktop.nix
  ];
}
