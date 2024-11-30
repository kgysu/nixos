{ config, pkgs, ... }:

{
  imports = [
    ./../../modules/home-manager/zsh.nix
    ./../../modules/home-manager/oh-my-posh.nix
    ./../../modules/home-manager/alacritty.nix
    ./../../modules/home-manager/nvim/neovim.nix
  ];

  home = {
    username = "main";
    homeDirectory = "/home/main";
    sessionPath = [
      "$HOME/go/bin"
    ];

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
