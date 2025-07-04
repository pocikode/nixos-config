# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../base/configuration.nix
  ];

  hyprland_wm.enable = true;
}
