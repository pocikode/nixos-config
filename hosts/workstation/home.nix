{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
    ../../modules/home-manager/display/hypr/xnm1
    # ../../modules/home-manager/display/hypr/sequoia
  ];

  home.packages = with pkgs; [
    dialog
    freerdp
    iproute2
    nmap
    motrix
  ];
}
