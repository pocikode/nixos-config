{ pkgs, ... }:

{
  imports = [
    ./de_wm
    ./container
    ./services
    ./virtualisation.nix
  ];
}
