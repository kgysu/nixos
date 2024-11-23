{ config, lib, pkgs, environment, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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

    # Dev
    gcc
    gnumake
    zig
    go
  ];

  environment.shells = [ pkgs.zsh ];

  # Todo: move aliases to here

  environment.homeBinInPath = true;
  environment.localBinInPath = true;
}
