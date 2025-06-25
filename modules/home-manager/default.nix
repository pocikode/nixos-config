{
  config,
  pkgs,
  lib,
  inputs,
  userSettings,
  ...
}:

{
  imports = [
    ./shell
    ./de_wm
    ./fonts.nix
    ./cli-apps.nix
    ./gui-apps.nix
  ];
}
