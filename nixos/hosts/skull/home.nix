{ config, pkgs, inputs, ... }:

{
  imports = [
    ./../../modules/home-manager/zsh.nix
    ./../../modules/home-manager/oh-my-posh.nix
    ./../../modules/home-manager/alacritty.nix
    ./../../modules/home-manager/textfox.nix
    ./../../modules/home-manager/brave.nix
    ./../../modules/home-manager/nixvim/nixvim.nix
    ./../../modules/home-manager/hyprland/hyprland.nix
  ];

  home = {
    username = "main";
    homeDirectory = "/home/main";
    sessionPath = [
      "$HOME/go/bin"
    ];

    stateVersion = "24.05";

    packages = [
      inputs.zen-browser.packages."${pkgs.system}".default
    ];
  };
  programs.home-manager.enable = true;
}
