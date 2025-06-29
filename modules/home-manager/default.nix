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
    ./cli-apps.nix
    ./fonts.nix
    ./gui-apps.nix
    ./scripts
    ./shell
    ./style/stylix.nix
  ];
}
