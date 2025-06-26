{ pkgs, lib, ... }:

{
  imports = [
    ../workstation/home.nix
  ];

  # desktop settings
  gnome_module.enable = false;
  hyprland_module.enable = false;
}
