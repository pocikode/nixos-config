{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = "${builtins.readFile ./style.css}";
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "height" = 32;
        "spacing" = 0;
        "modules-left" = [
          "hyprland/workspaces"
          "tray"
          "custom/lock"
          "custom/reboot"
          "custom/power"
        ];
        "modules-center" = [ "hyprland/window" ];
        "modules-right" = [
          "network"
          "battery"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "custom/temperature"
          "memory"
          "cpu"
          "clock"
        ];
        "hyprland/workspaces" = {
          "disable-scroll" = false;
          "all-outputs" = false;
          "format" = "{icon}";
          "on-click" = "activate";
          "show-special" = true;
          "persistent-workspaces" = {
            "*" = 10;
          };
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
        };
        "custom/lock" = {
          "format" = "<span color='#00FFFF'>  </span>";
          "on-click" = "hyprlock";
          "tooltip" = true;
          "tooltip-format" = "Lock Screen";
        };
        "custom/reboot" = {
          "format" = "<span color='#FFD700'>  </span>";
          "on-click" = "systemctl reboot";
          "tooltip" = true;
          "tooltip-format" = "Reboot";
        };
        "custom/power" = {
          format = "<span color='#FF4040'>  </span>";
          "on-click" = "systemctl poweroff";
          "tooltip" = true;
          "tooltip-format" = "Power Off";
        };
        "hyprland/window" = {
          "max-length" = 40;
          "rewrite" = {
            "(.*) - Mozilla Firefox" = "🌎 $1";
            "(.*) - vim" = " $1";
            "(.*) - zsh" = " [$1]";
          };
        };
        "network" = {
          "format-wifi" = "<span color='#00FFFF'> 󰤨 </span>{essid} ";
          "format-ethernet" = "<span color='#7FFF00'>   </span>Wired ";
          "tooltip-format" =
            "<span color='#FF1493'> 󰅧 </span>{bandwidthUpBytes}  <span color='#00BFFF'> 󰅢 </span>{bandwidthDownBytes}";
          "format-linked" = "<span color='#FFA500'> 󱘖 </span>{ifname} (No IP) ";
          "format-disconnected" = "<span color='#FF4040'>  </span>Disconnected ";
          "format-alt" = "<span color='#00FFFF'> 󰤨 </span>{signalStrength}% ";
          "interval" = 1;
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "<span color='#28CD41'> {icon} </span>{capacity}% ";
          "format-charging" = " 󱐋{capacity}%";
          "interval" = 1;
          "format-icons" = [
            "󰂎"
            "󰁼"
            "󰁿"
            "󰂁"
            "󰁹"
          ];
          "tooltip" = true;
        };
        "pulseaudio" = {
          "format" = "<span color='#00FF7F'>{icon}</span>{volume}% ";
          "format-muted" = "<span color='#FF4040'> 󰖁 </span>0% ";
          "format-icons" = {
            "headphone" = "<span color='#BF00FF'>  </span>";
            "hands-free" = "<span color='#BF00FF'>  </span>";
            "headset" = "<span color='#BF00FF'>  </span>";
            "phone" = "<span color='#00FFFF'>  </span>";
            "portable" = "<span color='#00FFFF'>  </span>";
            "car" = "<span color='#FFA500'>  </span>";
            "default" = [
              "<span color='#808080'>  </span>"
              "<span color='#FFFF66'>  </span>"
              "<span color='#00FF7F'>  </span>"
            ];
          };
          "on-click-right" = "pavucontrol -t 3";
          "on-click" = "pactl -- set-sink-mute 0 toggle";
          "tooltip" = true;
          "tooltip-format" = "Volume: {volume}%";
        };
        "custom/temperature" = {
          "exec" = "sensors | awk '/^Package id 0:/ {print int($4)}'";
          "format" = "<span color='#FFA500'> </span>{}°C ";
          "interval" = 5;
          "tooltip" = true;
          "tooltip-format" = "CPU Temperature: {}°C";
        };
        "memory" = {
          "format" = "<span color='#8A2BE2'>  </span>{used:0.1f}G/{total:0.1f}G ";
          "tooltip" = true;
          "tooltip-format" = "Memory Usage: {used:0.2f}G/{total:0.2f}G";
        };
        "cpu" = {
          "format" = "<span color='#FF9F0A'>  </span>{usage}% ";
          "tooltip" = true;
        };
        "clock" = {
          "interval" = 1;
          "timezone" = "Asia/Chengdu";
          "format" = "<span color='#BF00FF'>  </span>{:%H:%M} ";
          "tooltip" = true;
          "tooltip-format" = "{:L%Y 年 %m 月 %d 日, %A}";
        };
        "tray" = {
          "icon-size" = 17;
          "spacing" = 6;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "<span color='#FFD700'>{icon}</span>{percent}% ";
          "tooltip" = true;
          "tooltip-format" = "Screen Brightness: {percent}%";
          "format-icons" = [
            "<span color='#696969'> 󰃞 </span>"
            "<span color='#A9A9A9'> 󰃝 </span>"
            "<span color='#FFFF66'> 󰃟 </span>"
            "<span color='#FFD700'> 󰃠 </span>"
          ];
        };
        "bluetooth" = {
          "format" = "<span color='#00BFFF'>  </span>{status} ";
          "format-connected" = "<span color='#00BFFF'>  </span>{device_alias} ";
          "format-connected-battery" =
            "<span color='#00BFFF'>  </span>{device_alias}{device_battery_percentage}% ";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };
      }
    ];
  };
}
