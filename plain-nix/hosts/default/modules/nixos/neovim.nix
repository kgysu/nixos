{ config,  lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    configure = {
      customRC = ''

      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [];
      };

    };

  };
}
