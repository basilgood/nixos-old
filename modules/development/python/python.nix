{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pypy
    python27Full
    python35Full
    pythonPackages.virtualenv
    pythonPackages.flake8
    python27Packages.yamllint
    libffi
  ];
}
