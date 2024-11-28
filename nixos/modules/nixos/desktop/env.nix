{ config, lib, pkgs, environment, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
  ];

  programs = {
    firefox.enable = true;
  };
}
