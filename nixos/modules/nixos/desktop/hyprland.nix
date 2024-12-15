{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    waybar
    dunst
    libnotify

    hyprpaper
    swww

    rofi-wayland
    #wofi

    networkmanagerapplet

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
