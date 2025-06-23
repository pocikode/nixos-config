{ pkgs, userSettings, ... }@inputs:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = userSettings.username;
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
  };
}
