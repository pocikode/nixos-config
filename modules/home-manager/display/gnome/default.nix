{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

let
  cfg = config.gnome_de;
in
{
  options = {
    gnome_de.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GNOME desktop environment configuration.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnomeExtensions.blur-my-shell
      gnomeExtensions.gsconnect
      gnomeExtensions.app-menu-is-back
      gnomeExtensions.xremap
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-timeout = 300;
        "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "blank";

        "org/gnome/shell" = {
          # disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            # arc-menu.extensionUuid
            blur-my-shell.extensionUuid
            gsconnect.extensionUuid
            app-menu-is-back.extensionUuid
            xremap.extensionUuid
          ];
        };

        "org/gnome/shell/extensions/blur-my-shell" = {
          brightness = 0.8;
          noise-amount = 0.12;
          sigma = 36;
        };
      };
    };
  };
}
