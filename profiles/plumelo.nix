{ config, lib, pkgs, ... }:
{
  imports = [
#    ../modules/desktops/gnome.nix
    ../modules/development/vagrant.nix
    ../modules/development/lxc.nix
    ../modules/development/lxd/lxd.nix
    ../modules/development/gitkraken.nix
    ../modules/development/vim.nix
    ../modules/development/python/python.nix
    ../modules/development/tilix.nix
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

  # Enable the OpenSSH
    services.openssh.enable = true;
    programs.ssh.startAgent = true;

    environment.systemPackages = with pkgs; [
      pcmanfm
      acl
      unzip
      p7zip
      xarchiver
      wget
      git
      gitAndTools.tig
      atom
      neovim
      python27Packages.neovim
      python36Packages.neovim
      firefox
      google-chrome
      lm_sensors
      nodejs
      libreoffice-fresh
      python35Packages.mps-youtube
      python35Packages.youtube-dl
      glibc
      glibc_multi
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
      libcxx
      libstdcxx5
      glxinfo
      termite
      networkmanagerapplet
  ];

  environment.variables = {
    BROWSER = "google-chrome-stable";
  };

  fonts = {
      enableFontDir = true;

      fonts = with pkgs; [
        dejavu_fonts
        fira-code
        inconsolata
        font-awesome-ttf
        nerdfonts
        source-code-pro
      ];

      fontconfig.defaultFonts.monospace = [ "DejaVu Sans Mono" ];
    };
}
