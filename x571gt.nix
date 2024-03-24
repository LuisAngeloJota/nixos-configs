{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  system.stateVersion = "23.11";

  boot.kernelParams = [
    "mitigations=off"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  environment.systemPackages = with pkgs; [
    brave
    ffmpeg
    harfbuzz
    idevicerestore
    ifuse
    libimobiledevice
    unzip
    wget
    yt-dlp
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
  ];

  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = false;
  networking.hostName = "X571GT";
  networking.networkmanager.wifi.powersave = false;
  networking.timeServers = [
    "time.cloudflare.com"
  ];

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libadwaita
    harfbuzz
    libimobiledevice
    libplist    
  ];
  programs.virt-manager.enable = true;

  security.rtkit.enable = true;

  services.flatpak.enable = true;
  services.printing.enable = true;
  services.usbmuxd.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.enable = true;
  services.xserver.layout = "us";
  #services.xserver.videoDrivers = [
  #  "nvidia"
  #];
  services.xserver.xkbVariant = "colemak_dh";

  time.timeZone = "Asia/Manila";

  users.users.la.extraGroups = [
    "libvirtd"
    "networkmanager"
    "wheel"
  ];
  users.users.la.isNormalUser = true;
  users.users.la.initialPassword = "nixos";

  virtualisation.libvirtd.enable = true;

  zramSwap.enable = true;
}
