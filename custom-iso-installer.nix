{ config, pkgs, ... }:
{ 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "bcachefs" "vfat" ];
  
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General = {
      EnableNetworkConfiguration = true;
    };
  };

  services.getty.autologinUser = "root";

  users.users.root.initialHashedPassword = "";
}
