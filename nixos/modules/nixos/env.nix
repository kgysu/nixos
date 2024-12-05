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
      fd

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

    homeBinInPath = true;
    localBinInPath = true;
  };
}
