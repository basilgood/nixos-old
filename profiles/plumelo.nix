{ config, lib, pkgs, ... }:
{
  imports = [
    ../modules/desktops/gnome.nix
    ../modules/development/vagrant.nix
    ../modules/development/lxc.nix
    ../modules/development/lxd/lxd.nix
    ../modules/development/gitkraken.nix
    #../modules/development/atom.nix
    ../modules/development/vim.nix
    ../modules/development/python/python.nix
    #../modules/development/tilix/tilix.nix
    #../modules/desktops/sway.nix
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
    java.enable = true; 
  };

  environment.systemPackages = with pkgs; [
    acl
    p7zip
    wget
    git
    slack
    skype
    atom
    firefox
    chromium
    google-chrome
    lm_sensors
    nodejs
    libreoffice-fresh
    python35Packages.mps-youtube
    python35Packages.youtube-dl
    mpv
    ruby
    zlib
    xsel
    ag
    ack
    ripgrep
    ranger
    cmake
    clang
    gnumake
    automake
    autobuild
    gcc_multi
    glibc_multi
  ];
}
