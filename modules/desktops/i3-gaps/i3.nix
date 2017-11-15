{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
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

  systemd.user.services.dunst = {
    enable = true;
    description = "Lightweight and customizable notification daemon";
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.dunst ];
    serviceConfig = {
      Restart = "always";
      Environment = "DISPLAY=:0";
      ExecStart = "${pkgs.dunst}/bin/dunst";  # TODO configure theme
    };
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

  services.xserver = {
    enable = true;

    displayManager.lightdm = {
      enable = true;
    };

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
    libinput.enable = true;
   };

  services.compton = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
  };

}
