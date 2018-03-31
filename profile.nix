{ config, lib, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};

in {
  imports = [
    ./merlin.nix
    #./plumelo.nix
   # ../modules/services/X11/gnome3.nix 
  ];
}
