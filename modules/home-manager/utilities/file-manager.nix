{ pkgs, ... }:

{
  home.packages = [
    pkgs.nautilus
  ];

  wayland.windowManager.hyprland.settings."$fileManager" = "nautilus";

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
  };
}
