{ config, lib, pkgs, ... }:
{

  imports = [
    ./virtualisation/lxc.nix
    ./virtualisation/lxd.nix
    ./virtualisation/docker.nix
    ./hardware/zram.nix
  ];

  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Bucharest";

  environment.systemPackages = with pkgs; [
    acl
    tree
    wget
    xsel
    p7zip
    lm_sensors
  ];

  programs = {
    tmux.enable = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  services.xserver = {
    enable = true;

    displayManager.sddm = {
      enable = true;
    };
    desktopManager.xterm.enable = false;
    desktopManager.lxqt.enable = true;
    # desktopManager.default = "none";
    # windowManager = {
    #   i3 = {
    #     enable = true;
    #     package = pkgs.i3-gaps;
    #   };
    #   openbox = {
    #     enable = true;
    #   };
    #   default = "i3";
    # };
   };

  services.compton = {
    enable = true;
    fade = true;
    fadeDelta = 3;

    extraOptions = ''
	blur-kern = "11x11gaussian";
    '';
  };

  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  users = {
    defaultUserShell = "/run/current-system/sw/bin/fish";
    groups.vasy = { gid = 1000; };
    users.vasy = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["vasy" "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "lxd" ];
      initialPassword = "vasy";
    };
  };

}
