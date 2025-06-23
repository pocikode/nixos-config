{ pkgs, inputs }:
with pkgs;
let
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  _1password-gui
  dbeaver-bin
  firefox-devedition
  jetbrains-toolbox
  postman
  spotify-player
]
