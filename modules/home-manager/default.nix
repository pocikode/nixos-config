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
    ./style/stylix.nix
    ./shell
    ./fonts.nix
    ./cli-apps.nix
    ./gui-apps.nix
  ];
}
