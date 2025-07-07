{ pkgs, ... }:

{
  imports = [
    ../base/bind.nix
    ../base/hypridle.nix
    ../base/hyprland.nix
    ../base/hyprlock.nix
    ./waybar/waybar.nix
  ];

  stylix.image = ./wallpapers/wallpaper-dark.png;

  home.packages = with pkgs; [
    pkgs.wofi
  ];
}
