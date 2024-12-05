{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ./waybar-conf.json);
    };

    style = ''
      ${builtins.readFile ./waybar.css}
    '';
  };
}
