{
  config,
  pkgs,
  lib,
  inputs,
  systemSettings,
  userSettings,
  ...
}:

let
  shared-programs = import ../shared/home-manager.nix {
    inherit
      config
      pkgs
      lib
      userSettings
      ;
  };
in
{
  imports = [
    # Load DE or WM configuration user-wide.
    (
      if userSettings.useGnome then
        ../../user/wm/gnome.nix
      else if userSettings.usePlasma then
        ../../user/wm/plasma.nix
      else if userSettings.useHyprland then
        ../../user/wm/hyprland.nix
      else
        ../../user/wm/none.nix
    )

    ../../user/app/browser/chome.nix
  ];

  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/${userSettings.username}";
    enableNixpkgsReleaseCheck = false;
    packages = pkgs.callPackage ./packages.nix { inherit inputs; };
    stateVersion = "25.05";

    file = {
      "container-services/compose.yaml".source = ../../user/container/compose.services.yaml;
    };
  };

  programs = shared-programs // {
    gpg.enable = true;
  };

  xdg.enable = true;
}
