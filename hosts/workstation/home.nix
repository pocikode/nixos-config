{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
    ../../modules/home-manager/display/hypr/woioeow
  ];

  home.packages = with pkgs; [
    dialog
    freerdp
    iproute2
    nmap
    motrix
  ];
}
