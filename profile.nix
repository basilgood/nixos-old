{ config, lib, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};

in {
  imports = [
    ./merlin.nix
  ];
}
