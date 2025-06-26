{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}@inputs:

{
  options = {
    hyprland_wm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hyprland wayland compositor.";
    };
  };

  config = lib.mkIf config.hyprland_wm.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
    };

    services = {
      greetd = {
        enable = true;
        settings = {
          default_session = {
            user = userSettings.username;
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          };
        };
      };
    };
  };
}
