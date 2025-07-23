{ pkgs, ... }:

{
  imports = [
    ../base
    ./hyprland/hyprland.nix
    ./hyprland/hyprlock.nix
    ./waybar/waybar.nix
    ../../../utilities/file-manager.nix
  ];

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.image = ./wallpapers/wall0.png;
  stylix.targets.waybar.enable = false;
}
