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
  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/${userSettings.username}";
    enableNixpkgsReleaseCheck = false;
    packages = pkgs.callPackage ./packages.nix { inherit inputs; };
    stateVersion = "25.05";
  };

  dconf = {
    enable = true;

    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-timeout = 300;
      "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "blank";
    };
  };

  programs = shared-programs // {
    gpg.enable = true;
  };
}
