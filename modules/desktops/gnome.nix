{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    paper-gtk-theme
    paper-icon-theme
    gnome3.gnome-disk-utility
  ];
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
   # libinput.enable = false;
   # synaptics.enable = true;
   # synaptics.tapButtons = true;
   # synaptics.fingersMap = [ 0 0 0 ];
   # synaptics.buttonsMap = [ 1 3 2 ];
   # synaptics.twoFingerScroll = true;
   # synaptics.additionalOptions = ''
   #   Option "VertScrollDelta" "-100"
   #   Option "HorizScrollDelta" "-100"
   # '';
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome3.enable = true;
      kodi.enable = true;
    };
    videoDrivers = ["ati"];
   };

  services.gnome3 = {
    gnome-documents.enable = false;
    gnome-user-share.enable = false;
    gnome-online-miners.enable = false;
    gnome-keyring.enable = true;
  };
}
