{ config, pkgs, ... }:
{
  system.stateVersion = "23.11";
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "bcachefs" "vfat" ];
  
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General = {
      EnableNetworkConfiguration = true;
    };
  };

  users.users.root.password = "nixos";
}
