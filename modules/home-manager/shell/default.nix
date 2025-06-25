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

    # (import ./git.nix {
    #   inherit
    #     config
    #     pkgs
    #     lib
    #     userSettings
    #     ;
    # })
  ];
}
