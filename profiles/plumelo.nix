{ config, lib, pkgs, ... }:
{
  imports = [
    ../modules/desktops/gnome.nix
    ../modules/development/vagrant.nix
  ];

  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Bucharest";

  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };

  programs = {
    tmux.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    acl
    p7zip
    wget
    git
    gitkraken
    neovim
    atom
    slack
    skype
    firefox
    chromium
    lm_sensors
  ];
}
