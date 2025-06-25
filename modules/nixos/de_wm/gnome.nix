{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    gnome_de.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GNOME desktop environment.";
    };
  };

  config = lib.mkIf config.gnome_de.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [
      epiphany
      gnome-music
      gnome-software
      gnome-tour
      gnome-maps
    ];
  };
}
