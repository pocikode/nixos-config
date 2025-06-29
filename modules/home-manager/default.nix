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
    ./fonts.nix
    ./cli-apps.nix
    ./gui-apps.nix
  ];
}
