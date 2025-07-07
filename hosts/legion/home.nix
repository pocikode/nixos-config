{ pkgs, lib, ... }:

{
  imports = [
    ../base/home.nix
    ../../modules/home-manager/display/hypr/sequoia
  ];
}
