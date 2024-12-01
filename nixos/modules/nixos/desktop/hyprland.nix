{ config, lib, pkgs, inputs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    waybar
    dunst
    libnotify

    #hyprpaper
    swww

    rofi-wayland
    #wofi

    networkmanagerapplet

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
