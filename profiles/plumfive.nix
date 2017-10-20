{ config, lib, pkgs, ... }:
{
  imports = [
    ./plumelo.nix
    #../devices/yoga2-pro.nix
    ../modules/development/upwork.nix
  ];

  networking.hostName = "plumfive";

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

  networking.firewall.allowedTCPPorts = [9988];
  environment.systemPackages = with pkgs; [
    transmission_gtk
    comical
    lastpass-cli
  ];

  zramSwap = {
    enable    = true;
    priority  = 6;
  };
}
