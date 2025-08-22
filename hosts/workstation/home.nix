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
    quickemu
  ];

  gnome_de.enable = true;
}
