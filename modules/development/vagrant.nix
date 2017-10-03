/* { config, lib, pkgs, ... }: */
/* { */
/*   environment.systemPackages = with pkgs; [ */
/*     vagrant */
/*     ansible_2_3 */
/*     redir */
/*     bridge-utils */
/*   ]; */
/* } */
{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [( self: super: {
    vagrant = super.vagrant.overrideAttrs(oldAttrs: rec {
      name = "vagrant-${version}";
      version = "1.20.1";

      src = super.fetchurl {
        url = "https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb?_ga=2.255525633.866558957.1507055038-610589412.1507055038";
        sha256 = "1f0b4eabe3df4a5c1ac20c36ced16b30ecf3a986e2e35093e980281a65a921a7";
        name = "${name}.deb";
      };
    });
  })];

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
