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

  stylix.override = {
    base08 = "#F7768E";
    base09 = "#FF9E64";
    base0A = "#E0AF68";
    base0B = "#41A6B5";
    base0D = "#7AA2F7";
    base0F = "#D18616";
  };
}
