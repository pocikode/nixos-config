{ pkgs, userSettings, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

  stylix.fonts = {
    monospace = {
      name = "Agave Nerd Font Mono";
      package = pkgs.nerd-fonts.agave;
    };
    sizes = {
      terminal = 11;
      applications = 11;
      popups = 11;
      desktop = 11;
    };
  };

  stylix.targets.vscode.enable = false;

  stylix.targets.kitty.enable = true;
}
