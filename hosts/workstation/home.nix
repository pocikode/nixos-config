{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
  ];

  home.packages = with pkgs; [
    dialog
    freerdp
    iproute2
    nmap
    motrix
  ];

  gnome_de.enable = true;
}
