{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-music
    gnome-software
    gnome-tour
    gnome-maps
  ];
}
