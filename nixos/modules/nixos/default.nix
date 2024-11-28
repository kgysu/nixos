{ config, lib, pkgs, ... }:

{
  imports = [
    ./nix-settings.nix
    ./env.nix
    ./zsh.nix
    ./tmux.nix
  ];
}
