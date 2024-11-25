{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "ls -lh";
      ll = "ls -lah";
      switch = "sudo nixos-rebuild switch";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

  };
}
