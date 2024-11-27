{ config, lib, pkgs, environment, ... }:

{
  environment = {
   systemPackages = with pkgs; [
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
    rustc
    cargo
    rustfmt
    clippy
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
