{
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
  stylix.image = ../display/hypr/woioeow/wallpapers/wall0.png;

  stylix.targets.vscode.enable = false;

  # stylix.opacity.applications = 0.95;
  # stylix.opacity.desktop = 0.95;
  # stylix.opacity.popups = 0.95;
  # stylix.opacity.terminal = 0.95;
}
