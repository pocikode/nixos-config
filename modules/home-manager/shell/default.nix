{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./git.nix
  ];
}
