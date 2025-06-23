{ pkgs, userSettings, ... }:
{
  programs.virt-manager.enable = true;
  environment.systemPackages = [ pkgs.qemu ];

  users.groups.libvirtd.members = [ userSettings.username ];

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
