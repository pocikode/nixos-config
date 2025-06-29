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
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast

    avizo
    bc
    brightnessctl
    cliphist
    fuzzel
    hyprcursor
    kdePackages.qtwayland
    kitty
    libnotify
    mako
    nautilus
    networkmanagerapplet
    notify-desktop
    overskride
    playerctl
    rofi-wayland
    waybar
    wl-clipboard
  ];

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  services.hyprpolkitagent.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    systemd.enable = true;
    settings = {
      monitor = ",preferred,auto,auto";

      # Programs
      "$terminal" = "kitty";
      # "$fileManager" = "$terminal -e sh -c ranger";
      "$fileManager" = "nautilus";
      "$menu" = "fuzzel --show drun";

      # autostart
      exec-once = [
        "avizo-service"
        "systemctl --user start hyprpolkitagent"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\""
      ];

      # environments
      env = [
        "XCURSOR_THEME,Vanilla-DMZ"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,MyCursor"
        "HYPRCURSOR_SIZE,24"
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # https://wiki.hypr.land/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;

        # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = lib.mkDefault "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = lib.mkDefault "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = lib.mkDefault "rgba(1a1a1aee)";
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#animations
      animations = {
        enabled = "yes, please :)";

        # Default animations, see https://wiki.hypr.land/Configuring/Animations/ for more

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
      };

      #############
      ### INPUT ###
      #############
      # https://wiki.hypr.land/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = false;
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
      };

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
      # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule
      # windowrule = float,class:^(kitty)$,title:^(kitty)$
      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

    };
  };
}
