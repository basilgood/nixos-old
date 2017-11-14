# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    rxvt_unicode
    which
    rofi
    pcmanfm
    feh
    arandr
    imagemagick
    udiskie
    pavucontrol
  ];
  services.udisks2.enable = true;
  environment.variables.GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ];
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    displayManager.lightdm = {
      enable = true;
      greeters.gtk = {
        enable = true;
      };
    };

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      default = "i3";
    };
    libinput.enable = true;
   };

  services.compton = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
  };

  systemd.user.services.udiskie = {
    enable = true;
    description = "Removable disk automounter";
    wantedBy = [ "default.target" ];
    path = with pkgs; [
      gnome3.defaultIconTheme
      gnome3.gnome_themes_standard
      pythonPackages.udiskie
    ];
    environment.XDG_DATA_DIRS="${pkgs.gnome3.defaultIconTheme}/share:${pkgs.gnome3.gnome_themes_standard}/share";
    serviceConfig = {
      Restart = "always";  # there is no tray icon
      ExecStart = "${pkgs.pythonPackages.udiskie}/bin/udiskie --automount --notify --tray --use-udisks2";
    };
  };

}
