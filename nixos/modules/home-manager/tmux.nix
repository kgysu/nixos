{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    extraConfig = ''
      set -g mouse on
      '';
  };
}
