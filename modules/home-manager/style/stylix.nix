{ pkgs, userSettings, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

  stylix.fonts = {
    monospace = {
      name = "Agave Nerd Font";
      package = pkgs.nerd-fonts.agave;
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    sizes = {
      terminal = 12;
      applications = 11;
      popups = 11;
      desktop = 11;
    };
  };

  stylix.targets.vscode.enable = false;
}
