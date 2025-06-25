{
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  imports = [
    ./app/neovim/nvf.nix
  ];
}
