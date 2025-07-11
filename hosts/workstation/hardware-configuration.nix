# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "vmd"
    "ahci"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/146c8163-d7d5-445f-93ad-7992c2b4d2d8";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-0d3f22e4-43b9-4153-935b-8734d8612563".device =
    "/dev/disk/by-uuid/0d3f22e4-43b9-4153-935b-8734d8612563";
  boot.initrd.luks.devices."luks-edcd0319-4aab-45dc-b50b-6bdfc2f56201".device =
    "/dev/disk/by-uuid/edcd0319-4aab-45dc-b50b-6bdfc2f56201";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/06D9-B5FC";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/dc0bb7e7-53ff-4905-b22d-45d646cefb9d"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp44s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
