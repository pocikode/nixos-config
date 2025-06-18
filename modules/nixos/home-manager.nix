{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  user = "agus";
  shared-programs = import ../shared/home-manager.nix { inherit config pkgs lib; };
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    enableNixpkgsReleaseCheck = false;
    packages = pkgs.callPackage ./packages.nix { inherit inputs; };
    stateVersion = "25.05";
  };

  programs = shared-programs // { };
}
