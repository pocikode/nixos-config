{ pkgs, ... }:

{
  imports = [
    ../base
    ./waybar/waybar.nix
  ];

  stylix.image = ./wallpapers/wallpaper-dark.png;

  home.packages = with pkgs; [
    pkgs.wofi
  ];
}
