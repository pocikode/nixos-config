{ pkgs, userSettings, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

  # stylix.image = pkgs.fetchurl {
  #   url = "https://www.pixelstalk.net/wp-content/uploads/images6/The-best-Daredevil-Wallpaper-HD.jpg";
  #   hash = "sha256-xiWMNAh2jkgLboP+HZCD1/lvmtpKqyknF1ieU18IA9g=";
  # };
  stylix.image = ../wallpapers/daredevil1.jpg;

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
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
