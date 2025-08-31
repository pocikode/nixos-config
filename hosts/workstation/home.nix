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
    pcsx2
    quickemu
    vlc
    xremap
  ];

  gnome_de.enable = true;
}
