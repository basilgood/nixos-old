# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>];
  
  boot =  {
    initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ]; 
    blacklistedKernelModules = [ "ideapad-laptop"];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/sda3";
        preLVM = true;
        allowDiscards = true;
      }
    ];

  };
  
  hardware = {
    cpu.intel.updateMicrocode = true;
    bluetooth.enable = false;
    
    opengl.extraPackages = [ pkgs.vaapiIntel ];
    
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
  
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5aff498f-db92-4140-b87f-df89aa139cd7";
    fsType = "ext4";
    options = ["noatime" "nodiratime" "discard"]l
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D071-6B9C";
    fsType = "vfat";
  };

  fileSystems."/tmp" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = ["nosuid" "nodev" "relatime" "mode=1777"];
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/4542bf42-66d5-49f7-a698-6f6cfd335444"; } ];

  nix.maxJobs = lib.mkDefault 4;
}
