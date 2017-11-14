{ config, pkgs, ... }:

{

  services.compton.enable = true;
  services.compton.fade = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "ati" ];

    displayManager.sddm.enable = true;
    desktopManager.lxqt.enable = true;
  };

}
