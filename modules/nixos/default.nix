{ pkgs, ... }:

{
  imports = [
    ./de_wm
    ./container
    ./services
    ./style/stylix.nix
    ./virtualisation.nix
  ];
}
