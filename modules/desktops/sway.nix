{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [( self: super: {
    wlcc = super.wlc.overrideAttrs(oldAttrs: rec {
      name = "wlc-${version}";
      version = "0.0.10";

      src = super.fetchFromGitHub {
        owner = "Cloudef";
        repo = "wlc";
        rev = "b730074e42f4fb31b8bec51ea29eea32575f14c0";
        sha256 = "1r6jf64gs7n9a8129wsc0mdwhcv44p8k87kg0714rhx3g2w22asg";
        fetchSubmodules = true;
       };
    });

    swaywm = super.sway.overrideAttrs(oldAttrs: rec {
      version = "0.13.0";
      name = "sway-${version}";
      src = super.fetchFromGitHub {
        owner = "Sircmpwn";
        repo = "sway";
        rev = "0.13.0";
        sha256 = "1vgk4rl51nx66yzpwg4yhnbj7wc30k5q0hh5lf8y0i1nvpal0p3q";
      };

      buildInputs = [ 
        super.wayland 
        self.wlcc
        super.libxkbcommon
        super.pixman
        super.fontconfig
        super.pcre
        super.json_c
        super.dbus_libs
        super.pango
        super.cairo
        super.libinput
        super.libcap
        super.xwayland
        super.pam
        super.gdk_pixbuf ];
      cmakeFlags = "-DVERSION=${version}";
    });
  })];

  environment.systemPackages = with pkgs; [
    swaywm
    gnome3.gnome_terminal
    dmenu
    rofi
    paper-gtk-theme
    paper-icon-theme
    gnome3.gnome-disk-utility 
  ]; 
  services.xserver.enable = true;
  services.xserver.windowManager.session = [{
    name  = "sway";
    start = ''
      export xkb_default_layout=us,ro
      export xkb_default_variant=,nodeadkeys
      export xkb_default_options=grp:alt_shift_toggle
      ${pkgs.swaywm}/bin/sway & waitPID=$!
    '';
  }];

  #setcap cap_sys_ptrace=eip ${pkgs.swaywm}/bin/sway;

  services.xserver.libinput.enable = true; 
  services.xserver.libinput.naturalScrolling = true;
  networking.networkmanager.enable = true;
}