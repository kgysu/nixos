{ config, lib, pkgs, users, ... }:

{
  users.mutableUsers = true;
  users.users.main = {
    isNormalUser = true;
    description = "main";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    initialPassword = "changeme";
  };
}
