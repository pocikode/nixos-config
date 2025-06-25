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

    (import ./git.nix {
      inherit
        config
        pkgs
        lib
        userSettings
        ;
    })
  ];
}
