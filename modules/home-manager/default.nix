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
    ./de_wm
    ./fonts.nix
    ./gui-apps.nix
    ./scripts
    ./shell
    # ./style/stylix.nix
  ];
}
