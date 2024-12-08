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
      mainBar = builtins.fromJSON (builtins.readFile ./waybar2.json);
    };

    style = ''
      ${builtins.readFile ./waybar2.css}
    '';
  };
}
