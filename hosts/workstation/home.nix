{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
    ../../modules/home-manager/de_wm/hyprland
  ];

  home.packages = with pkgs; [
    dialog
    freerdp
    iproute2
    nmap
    motrix
  ];
}
