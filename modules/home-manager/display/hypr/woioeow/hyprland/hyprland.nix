{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.wofi
  ];

  wayland.windowManager.hyprland.settings = {
    "$menu" = "wofi --show drun";

    general = {
      no_border_on_floating = true;
      gaps_in = 4;
      gaps_out = 8;
      border_size = 0;

      # "col.active_border" = "rgb(FF90BC) rgb(5FBDFF) 45deg";
      # "col.inactive_border" = "rgba(00000000)";
    };

    decoration = {
      rounding = 15;
      rounding_power = 4;

      active_opacity = 0.93;
      inactive_opacity = 0.87;

      shadow = {
        enabled = false;
        range = 8;
        render_power = 4;
        # color = "rgba(00000033)";
      };

      blur = {
        enabled = true;
        size = 8;
        passes = 2;
        new_optimizations = true;
        ignore_opacity = false;
        vibrancy = 0.25;
      };
    };

    animations = {
      enabled = 1;

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "overshot,0.05,0.9,0.1,1.1"
        "overshot,0.13,0.99,0.29,1.1"
      ];

      animation = [
        "windows, 1, 3, myBezier"
        "windowsOut, 1, 5, default, popin 80%"
        "border, 1, 10, default"
        "fade, 1, 5, default"
        "workspaces, 1, 7, default"
        "windowsMove, 1, 5, myBezier"
        "windowsOut, 1, 5, myBezier"
        "fade, 1, 5, default"
        "workspaces,1,4,overshot,slidevert"
      ];
    };

  };
}
