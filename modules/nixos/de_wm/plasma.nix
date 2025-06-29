{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    plasma_de.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable KDE Plasma desktop environment.";
    };
  };

  config = lib.mkIf config.plasma_de.enable {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.settings.General.DisplayServer = "wayland";
    
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      elisa
      khelpcenter
    ];
  };
}
