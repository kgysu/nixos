{ config, lib, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];
}
