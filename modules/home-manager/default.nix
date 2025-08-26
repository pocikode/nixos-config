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
    ./app/dev/neovide.nix
    ./app/dev/nvchad.nix
    ./app/dev/vscode.nix

    ./cli-apps.nix
    ./fonts.nix
    ./gui-apps.nix
    ./scripts
    ./shell
    ./style/stylix.nix
    ./display/gnome
  ];
}
