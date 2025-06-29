{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
    ../../modules/home-manager/de_wm/gnome.nix
  ];
}
