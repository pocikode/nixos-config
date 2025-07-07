{ ... }:

############################
### Hyprland Keybindings ###
############################
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, F, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, L, exec, hyprlock"
      "$mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      # "$mainMod, 1, workspace, 1"
      # "$mainMod, 2, workspace, 2"
      # "$mainMod, 3, workspace, 3"
      # "$mainMod, 4, workspace, 4"
      # "$mainMod, 5, workspace, 5"
      # "$mainMod, 6, workspace, 6"
      # "$mainMod, 7, workspace, 7"
      # "$mainMod, 8, workspace, 8"
      # "$mainMod, 9, workspace, 9"
      # "$mainMod, 0, workspace, 10"
      "$mainMod, 1, exec, hyprsome workspace 1"
      "$mainMod, 2, exec, hyprsome workspace 2"
      "$mainMod, 3, exec, hyprsome workspace 3"
      "$mainMod, 4, exec, hyprsome workspace 4"
      "$mainMod, 5, exec, hyprsome workspace 5"
      "$mainMod, 6, exec, hyprsome workspace 6"
      "$mainMod, 7, exec, hyprsome workspace 7"
      "$mainMod, 8, exec, hyprsome workspace 8"
      "$mainMod, 9, exec, hyprsome workspace 9"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      # "$mainMod SHIFT, 1, movetoworkspace, 1"
      # "$mainMod SHIFT, 2, movetoworkspace, 2"
      # "$mainMod SHIFT, 3, movetoworkspace, 3"
      # "$mainMod SHIFT, 4, movetoworkspace, 4"
      # "$mainMod SHIFT, 5, movetoworkspace, 5"
      # "$mainMod SHIFT, 6, movetoworkspace, 6"
      # "$mainMod SHIFT, 7, movetoworkspace, 7"
      # "$mainMod SHIFT, 8, movetoworkspace, 8"
      # "$mainMod SHIFT, 9, movetoworkspace, 9"
      # "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod SHIFT, 1, exec, hyprsome move 1"
      "$mainMod SHIFT, 2, exec, hyprsome move 2"
      "$mainMod SHIFT, 3, exec, hyprsome move 3"
      "$mainMod SHIFT, 4, exec, hyprsome move 4"
      "$mainMod SHIFT, 5, exec, hyprsome move 5"
      "$mainMod SHIFT, 6, exec, hyprsome move 6"
      "$mainMod SHIFT, 7, exec, hyprsome move 7"
      "$mainMod SHIFT, 8, exec, hyprsome move 8"
      "$mainMod SHIFT, 9, exec, hyprsome move 9"

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      ", PRINT, exec, grimblast --notify --freeze copysave area"
      "$mainMod, PRINT, exec, grimblast --notify --freeze copysave active"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      # mouse
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"

      # touchpad
      "$mainMod, Control_L, movewindow"
      "$mainMod, ALT_L, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume, exec, volumectl -u up"
      ",XF86AudioLowerVolume, exec, volumectl -u down"
      ",XF86AudioMute, exec, volumectl toggle-mute"
      ",XF86AudioMicMute, exec, volumectl toggle-mute"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      # ",XF86MonBrightnessUp, exec, ~/.scripts/brightness.sh inc"
      # ",XF86MonBrightnessDown, exec, ~/.scripts/brightness.sh dec"
    ];

    # Requires playerctl
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
