{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pypy
    python27Full
    python35Full
    pythonPackages.virtualenv
    pythonPackages.flake8
  ];
}
