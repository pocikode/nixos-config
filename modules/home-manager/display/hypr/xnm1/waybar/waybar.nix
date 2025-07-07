{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      ${builtins.readFile ./macchiato.css}
      ${builtins.readFile ./style.css}
    '';
    settings = [
      {
        name = "top_bar";
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [
          "clock#time"
          "custom/separator"
          "clock#week"
          "custom/separator_dot"
          "clock#month"
          "custom/separator"
          "clock#calendar"
        ];
        modules-right = [
          "bluetooth"
          "network"
          "battery"
          "group/misc"
          "custom/logout_menu"
        ];

        "hyprland/workspaces" = {
          "on-click" = "activate";
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "11" = "󰲠";
            "12" = "󰲢";
            "13" = "󰲤";
            "14" = "󰲦";
            "15" = "󰲨";
            "16" = "󰲪";
            "17" = "󰲬";
            "18" = "󰲮";
            "19" = "󰲰";
            "20" = "󰿬";
            "urgent" = "";
            "active" = ""; # focused workspace on current monitor
            "visible" = ""; # focused workspace on other monitors
            "special" = "";
          };
          "show-special" = true;
          "persistent-workspaces" = {
            "*" = 10;
          };
          "all-outputs" = false;
        };

        "hyprland/submap" = {
          format = "<span color='#a6da95'>Mode:</span> {}";
          tooltip = false;
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = [
              ""
              ""
              ""
            ];
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        "hyprland/mode" = {
          format = ''<span style="italic">{}</span>'';
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        "hyprland/window" = {
          "separate-outputs" = true;
        };

        "clock#time" = {
          "format" = "{:%I:%M %p %Ez}";
        };

        "custom/separator" = {
          "format" = "|";
          "tooltip" = false;
        };

        "custom/separator_dot" = {
          "format" = "•";
          "tooltip" = false;
        };

        "clock#week" = {
          "format" = "{:%a}";
        };

        "clock#month" = {
          "format" = "{:%h}";
        };

        "clock#calendar" = {
          "format" = "{:%F}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "actions" = {
            "on-click-right" = "mode";
          };
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#f4dbd6'><b>{}</b></span>";
              "days" = "<span color='#cad3f5'><b>{}</b></span>";
              "weeks" = "<span color='#c6a0f6'><b>W{}</b></span>";
              "weekdays" = "<span color='#a6da95'><b>{}</b></span>";
              "today" = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
            };
          };
        };

        "clock" = {
          "format" = "{:%I:%M %p %Ez | %a • %h | %F}";
          "format-alt" = "{:%I:%M %p}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "actions" = {
            "on-click-right" = "mode";
          };
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#f4dbd6'><b>{}</b></span>";
              "days" = "<span color='#cad3f5'><b>{}</b></span>";
              "weeks" = "<span color='#c6a0f6'><b>W{}</b></span>";
              "weekdays" = "<span color='#a6da95'><b>{}</b></span>";
              "today" = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
            };
          };
        };

        bluetooth = {
          "format" = "󰂯";
          "format-disabled" = "󰂲";
          "format-connected" = "󰂱 {device_alias}";
          "format-connected-battery" = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          "tooltip-format" =
            "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected";
          "tooltip-format-disabled" = "bluetooth off";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\t{device_address}\t({device_battery_percentage}%)";
          "max-length" = 35;
          "on-click" = "fish -c bluetooth_toggle";
          "on-click-right" = "overskride";
        };

        network = {
          # interval = 1;
          # format-alt = "{ifname}: {ipaddr}/{cidr}";
          # format-disconnected = "Disconnected ⚠";
          # format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
          # format-linked = "{ifname} (No IP) ";
          # format-wifi = "{essid} ({signalStrength}%) ";
          interface = "wlp0s20f3";
          "format" = "󰤭";
          "format-wifi" = "{icon} ({signalStrength}%){essid}";
          "format-icons" = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          "format-disconnected" = "󰤫 Disconnected";
          "tooltip-format" = "wifi <span color='#ee99a0'>off</span>";
          "tooltip-format-wifi" =
            "SSID: {essid}({signalStrength}%), {frequency} MHz\nInterface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>";
          "tooltip-format-disconnected" = "<span color='#ed8796'>disconnected</span>";
          "max-length" = 35;
          "on-click" = "fish -c wifi_toggle";
          "on-click-right" = "iwgtk";
        };

        battery = {
          format = "{icon}  {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "custom/media" = {
          "format" = "{icon}󰎈";
          "restart-interval" = 2;
          "return-type" = "json";
          "format-icons" = {
            "Playing" = "";
            "Paused" = "";
          };
          "max-length" = 35;
          "exec" = "~/.scripts/fetch_music_player_data.sh";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl next";
          "on-click-middle" = "playerctl prev";
          "on-scroll-up" = "playerctl volume 0.05-";
          "on-scroll-down" = "playerctl volume 0.05+";
          "smooth-scrolling-threshold" = "0.1";
        };

        "group/misc" = {
          "orientation" = "horizontal";
          "modules" = [
            "custom/webcam"
            "privacy"
            "custom/recording"
            "custom/geo"
            "custom/media"
            "custom/dunst"
            "custom/night_mode"
            "custom/airplane_mode"
            "idle_inhibitor"
          ];
        };

        privacy = {
          "icon-spacing" = 1;
          "icon-size" = 12;
          "transition-duration" = 250;
          "modules" = [
            {
              type = "audio-in";
            }
            {
              type = "screenshare";
            }
          ];
        };

        "custom/logout_menu" = {
          "return-type" = "json";
          "exec" = "echo '{ \"text\":\"󰐥\", \"tooltip\": \"logout menu\" }'";
          "interval" = "once";
          "on-click" = "fish -c wlogout_uniqe";
        };

        "custom/dunst" = {
          "return-type" = "json";
          "exec" = "fish -c dunst_pause";
          "on-click" = "dunstctl set-paused toggle";
          "restart-interval" = 1;
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "󰛐";
            "deactivated" = "󰛑";
          };
          "tooltip-format-activated" = "idle-inhibitor <span color='#a6da95'>on</span>";
          "tooltip-format-deactivated" = "idle-inhibitor <span color='#ee99a0'>off</span>";
          "start-activated" = true;
        };

      }
    ];
  };
}
