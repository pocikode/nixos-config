{ pkgs, lib, ... }:

{
  programs.hyprlock.enable = true;

  programs.hyprlock.settings = {
    "$font" = "Agave Nerd Font";

    general = {
      hide_cursor = false;
    };

    animations = {
      enabled = true;
      bezier = "linear, 1, 1, 0, 0";
      animation = [
        "fadeIn, 1, 5, linear"
        "fadeOut, 1, 5, linear"
        "inputFieldDots, 1, 2, linear"
      ];
    };

    background = {
      monitor = "";
      path = lib.mkDefault "screenshot";
      blur_passes = 3;
    };

    input-field = {
      monitor = "";
      size = "20%, 5%";
      outline_thickness = 3;
      inner_color = lib.mkDefault "rgba(0, 0, 0, 0.0) # no fill";

      outer_color = lib.mkDefault "rgba(33ccffee) rgba(00ff99ee) 45deg";
      check_color = lib.mkDefault "rgba(00ff99ee) rgba(ff6633ee) 120deg";
      fail_color = lib.mkDefault "rgba(ff6633ee) rgba(ff0066ee) 40deg";

      font_color = lib.mkDefault "rgb(143, 143, 143)";
      fade_on_empty = false;
      rounding = 15;

      font_family = "$font";
      placeholder_text = "Input password...";
      fail_text = "$PAMFAIL";

      # uncomment to use a letter instead of a dot to indicate the typed password
      # dots_text_format = *
      # dots_size = 0.4
      dots_spacing = 0.3;

      # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
      # hide_input = true

      position = "0, -20";
      halign = "center";
      valign = "center";
    };

    label = [
      # TIME
      {
        monitor = "";
        text = "$TIME"; # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
        font_size = 90;
        font_family = "$font";

        position = "0, 150";
        halign = "center";
        valign = "center";
      }
      # DATE
      {
        monitor = "";
        text = "cmd[update:60000] date +\"%A, %d %B %Y\""; # update every 60 seconds
        font_size = 25;
        font_family = "$font";

        position = "0, 80";
        halign = "center";
        valign = "center";
      }
    ];
  };
}
