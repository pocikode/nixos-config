{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  options = {
    virtualisation_support.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable virtualisation support.";
    };
  };

  config = lib.mkIf config.virtualisation_support.enable {
    programs.virt-manager.enable = true;
    environment.systemPackages = [ pkgs.qemu ];

    users.groups.libvirtd.members = [ userSettings.username ];

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
