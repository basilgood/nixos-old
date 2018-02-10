{ config, lib, pkgs, ... }:
{
  imports = [
    ../modules/desktops/gnome.nix
#   ../modules/development/vagrant.nix
    ../modules/development/lxc.nix
    # ../modules/development/lxd/lxd.nix
    ../modules/development/gitkraken.nix
    ../modules/development/vim.nix
#    ../modules/development/python/python.nix
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
    light.enable = true;
  };


  # Enable the OpenSSH
  # programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    glxinfo
      networkmanagerapplet
  ];

  fonts = {
      enableFontDir = true;

      fonts = with pkgs; [
        dejavu_fonts
        fira-code
        inconsolata
        font-awesome-ttf
        nerdfonts
        source-code-pro
        meslo-lg
      ];

      fontconfig.defaultFonts.monospace = [ "DejaVu Sans Mono" ];
    };
}
