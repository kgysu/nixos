{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';

  };
}
