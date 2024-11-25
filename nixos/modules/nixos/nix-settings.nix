{ config, lib, pkgs, ...}:

{ 
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];

    gc = { 
      automatic = true; 
      dates = "weekly"; 
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true; 
    settings.auto-optimise-store = true;
  };
}
