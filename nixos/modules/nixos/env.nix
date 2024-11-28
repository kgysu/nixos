{ config, lib, pkgs, environment, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      curl
      lf
      zsh
      git
      gnutar
      unzip
      (nerdfonts.override { fonts = [ "Meslo" "JetBrainsMono" ]; })

      fzf
      bat
      tldr
      lazygit
      ripgrep
      pass

      # Dev
      gcc
      gnumake
      zig
      go
      rustc
      cargo
      rustfmt
      clippy
      lua
    ];


    shells = [ pkgs.zsh ];

    # Todo: move aliases to here
    shellAliases = {
      l = "ls -lh";
      ll = "ls -lah";
      nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#test";
    };

    homeBinInPath = true;
    localBinInPath = true;
  };
}
