{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = "${builtins.readFile ./style.css}";
    settings = [
      # Top bar configuration
      {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 5;
        "modules-left" = [
          "custom/launcher"
          "hyprland/window"
          "custom/textone"
          "custom/texttwo"
          "custom/textthree"
          "custom/textfour"
        ];
        "modules-center" = [
          "sway/window"
        ];
        "modules-right" = [
          "mpd"
          "idle_inhibitor"
          "temperature"
          "cpu"
          "memory"
          "network"
          "pulseaudio"
          "backlight"
          "keyboard-state"
          "battery"
          "battery#bat2"
          "tray"
          "clock"
        ];
        "hyprland/window" = {
          "format" = "{class}";
          "max-length" = 20;
          "rewrite" = {
            "^(?!.*\\S).*" = "Finder";
          };
        };
        "custom/launcher" = {
          "format" = "🔍";
          "on-click" = "wofi --show drun";
          "tooltip" = false;
        };
        "custom/texttwo" = {
          "exec" = "echo 'File'";
          "interval" = 60;
          "return-type" = "plain";
          "on-click" = "nautilus";
        };
        "custom/textthree" = {
          "exec" = "echo 'Edit'";
          "interval" = 60;
          "return-type" = "plain";
          "on-click" = "gimp";
        };
        "custom/textfour" = {
          "exec" = "echo 'View'";
          "interval" = 60;
          "return-type" = "plain";
        };
        "custom/textfive" = {
          "exec" = "echo 'Help'";
          "interval" = 60;
          "return-type" = "plain";
          "on-click" = "gio open https://github.com/kamlendras/waybar/issues/new";
        };
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "sway/mode" = {
          "format" = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          "format" = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = [
            ""
            ""
          ];
          "tooltip" = true;
          "tooltip-format" = "{app}: {title}";
        };
        "mpd" = {
          "format" =
            "  {title} - {artist} {stateIcon} [{elapsedTime:%M:%S}/{totalTime:%M:%S}] {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}[{songPosition}/{queueLength}] [{volume}%]";
          "format-disconnected" = " Disconnected";
          "format-stopped" = " {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped";
          "unknown-tag" = "N/A";
          "interval" = 2;
          "consume-icons" = {
            "on" = " ";
          };
          "random-icons" = {
            "on" = " ";
          };
          "repeat-icons" = {
            "on" = " ";
          };
          "single-icons" = {
            "on" = "1 ";
          };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
          "on-click" = "mpc toggle";
          "on-click-right" = "foot -a ncmpcpp ncmpcpp";
          "on-scroll-up" = "mpc volume +2";
          "on-scroll-down" = "mpc volume -2";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          "spacing" = 10;
        };
        "clock" = {
          "format" = "{:%A %B %d %H:%M %p}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu" = {
          "format" = "  {usage}%";
        };
        "memory" = {
          "format" = " {}%";
        };
        "temperature" = {
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "critical-threshold" = 80;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };
        "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery#bat2" = {
          "bat" = "BAT2";
        };
        "network" = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = " {ifname}";
          "tooltip-format" = " {ifname} via {gwaddr}";
          "format-linked" = " {ifname} (No IP)";
          "format-disconnected" = "Disconnected ⚠ {ifname}";
          "format-alt" = " {ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}  {volume}% {format_source}";
          "format-bluetooth" = " {icon} {volume}% {format_source}";
          "format-bluetooth-muted" = "  {icon} {format_source}";
          "format-muted" = "  {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
          "on-click-right" = "foot -a pw-top pw-top";
        };
      }

      # Bottom bar configuration
      {
        "layer" = "top";
        "position" = "bottom";
        "height" = 41;
        "width" = 2;
        "modules-left" = [
          "custom/os_button"
        ];
        "modules-center" = [
          "sway/mode"
          "wlr/taskbar"
        ];
        "margin" = "4";
        "spacing" = "5";
        "sway/window" = {
          "max-length" = 50;
        };
        "custom/os_button" = {
          "format" = "🔍";
          "on-click" = "wofi --show drun";
          "tooltip" = false;
        };
        "wlr/taskbar" = {
          "format" = "{icon}";
          "icon-size" = 36;
          "spacing" = 3;
          "on-click-middle" = "close";
          "tooltip-format" = "{title}";
          "ignore-list" = [ ];
          "on-click" = "activate";
        };
      }
    ];
  };
}
