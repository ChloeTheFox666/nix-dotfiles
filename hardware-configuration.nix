# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = ["btrfs" "vfat" "ext4" "ntfs-3g"];

  fileSystems = {
   	"/" = {
   		device = "/dev/disk/by-uuid/7687638a-f55d-4c9d-926f-1730f796086e";
   		fsType = "btrfs";
   		neededForBoot = true;
   		options = ["subvol=@" "noatime"];
   	};
  	"/nix" = {
  		device = "/dev/disk/by-uuid/7687638a-f55d-4c9d-926f-1730f796086e";
  		fsType = "btrfs";
  		neededForBoot = true;
  		options = ["subvol=@nix" "noatime"];
  	};
  	"/home" = {
  		device = "/dev/disk/by-uuid/7687638a-f55d-4c9d-926f-1730f796086e";
  		fsType = "btrfs";
  		neededForBoot = true;
  		options = ["subvol=@home" "noatime"];
  	};
  	"/boot" = {
  		device = "/dev/disk/by-uuid/7BB9-BA4B";
  		fsType = "vfat";
  		neededForBoot = true;
  		options = ["fmask=0077" "dmask=0077"];
  	};
  };

  swapDevices = [{
  	device = "/dev/disk/by-uuid/23ac2a41-e05f-46bb-bfac-cdad5f5e75ee";
  }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s20f0u2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
