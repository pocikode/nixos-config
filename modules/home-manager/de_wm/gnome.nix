{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

let
  profileID = "6c323a8b-4f47-4ee3-a0ea-70720347fc59"; # Gnome terminal profile ID
in
{
  options = {
    gnome_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GNOME desktop environment configuration.";
    };
  };

  config = lib.mkIf config.gnome_module.enable {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-timeout = 300;
        "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "blank";
      };
    };

    programs.gnome-terminal = {
      enable = true;
      profile = {
        "${profileID}" = {
          default = true;
          visibleName = "My Terminal Config";
          font = "Agave Nerd Font 11";
        };
      };
    };
  };
}
