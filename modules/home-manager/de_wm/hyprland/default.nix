{ pkgs, ... }:

{
  imports = [
    ./bind.nix
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ../../utilities/waybar.nix
  ];
}
