{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    extraConfig = ''
      set -g mouse on
      set -g status-style 'bg=#333333 fg=#5eacd3'
    '';

  };
}
