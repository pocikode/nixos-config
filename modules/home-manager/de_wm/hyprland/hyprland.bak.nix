{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};
in
{
  options = {
    hyprland_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hyprland desktop environment configuration.";
    };
  };

  config = lib.mkIf config.hyprland_module.enable {
    home.packages = with pkgs; [
      waybar
      eww
      mako # notification daemon
      libnotify
      alacritty
      kitty
      swww # wallpaper manager
      fuzzel # application launcher
      ranger # file manager
      wl-clipboard
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      settings = {
        "$fileManager" = "$terminal -e sh -c ranger";
        "$mainMod" = "SUPER";
        "$menu" = "fuzzel";
        "$terminal" = "kitty";
        monitor = [
          ",prefered,auto,1"
          "eDP-1,preferred,auto-left,1"
          "HDMI-A-1,highrr,auto-right,1"
        ];

        env = [
          "NIXOS_OZONE_WL,1"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "QT_QPA_PLATFORM,wayland"
          "XDG_SCREENSHOTS_DIR,$HOME/screens"
        ];

        exec-once = [
          "waybar"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        decoration = {
          blur = {
            enabled = true;
            passes = 1;
            size = 3;
            vibrancy = 0.1696;
          };

          shadow = {
            color = "rgba(1a1a1aee)";
            enabled = true;
            range = 4;
            render_power = 3;
          };

          active_opacity = 1.0;
          inactive_opacity = 0.9;
          rounding = 10;
        };

        dwindle = {
          preserve_split = true;
          pseudotitle = true;
        };

        general = {
          allow_tearing = false;
          border_size = 5;
          "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
          "col.inactive_border" = "rgba(3c3836ff)";
          gaps_in = 5;
          gaps_out = 20;
          layout = "master";
          resize_on_border = true;
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_forever = true;
          workspace_swipe_inverted = false;
        };

        input = {
          kb_layout = "us";
          kb_options = "grp:caps_toggle";
        };

        master = {
          mfact = 0.5;
          new_on_top = "true";
          new_statue = "slave";
        };

        misc = {
          disable_hyprland_logo = true;
          force_default_wallpaper = 0;
        };

        bind = [
          "$mainMod SHIFT, Return, exec, $terminal"
          "$mainMod SHIFT, C, killactive,"
          "$mainMod SHIFT, Q, exit,"
          "$mainMod,       R, exec, $fileManager"
          "$mainMod,       F, togglefloating,"
          "$mainMod,       D, exec, $menu --show drun"
          "$mainMod,       P, pin,"
          "$mainMod,       J, togglesplit,"
          "$mainMod,       E, exec, bemoji -cn"
          "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
          "$mainMod,       B, exec, pkill -SIGUSR2 waybar"
          "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar"
          "$mainMod,       L, exec, loginctl lock-session"
          "$mainMod SHIFT  L, exec, makoctl toggle"
          "$mainMod,       P, exec, hyprpicker -an"
          "$mainMod,       N, exec, swaync-client -t"
          ", Print, exec, grimblast --notify --freeze copysave area"

          # Moving focus
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Moving windows
          "$mainMod SHIFT, left,  swapwindow, l"
          "$mainMod SHIFT, right, swapwindow, r"
          "$mainMod SHIFT, up,    swapwindow, u"
          "$mainMod SHIFT, down,  swapwindow, d"

          # Resizeing windows                   X  Y
          "$mainMod CTRL, left,  resizeactive, -60 0"
          "$mainMod CTRL, right, resizeactive,  60 0"
          "$mainMod CTRL, up,    resizeactive,  0 -60"
          "$mainMod CTRL, down,  resizeactive,  0  60"

          # Switching workspaces
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Moving windows to workspaces
          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

          # Scratchpad
          "$mainMod,       S, togglespecialworkspace,  magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
        ];

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        # Laptop multimedia keys for volume and LCD brightness
        bindel = [
          ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          "$mainMod, bracketright, exec, brightnessctl s 10%+"
          "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
        ];

        # Audio playback
        bindl = [
          ", XF86AudioNext,  exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay,  exec, playerctl play-pause"
          ", XF86AudioPrev,  exec, playerctl previous"
        ];

      };
    };
  };
}
