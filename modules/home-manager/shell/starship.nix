{ lib, ... }:

let
  settings = {
    default = {
      format = lib.concatStrings [
        "[╭╴](fg:white)"
        "[░▒▓](fg:white)"
        "[   ](bg:white fg:black)"
        "$username"
        "[](bg:blue fg:white)"
        "$directory"
        "[](bg:green fg:blue)"
        "$git_branch"
        "[](bg:red fg:green)"
        "$git_status"
        "[](fg:red)"
        "$fill"
        "[](fg:yellow)"
        "$cmd_duration"
        "[](bg:yellow fg:cyan)"
        "$direnv"
        "[](bg:cyan fg:white)"
        "$time"
        "[▓▒░](fg:white)"
        "\n[╰─](fg:white)$character"
      ];

      character = {
        success_symbol = "[󰍟](fg:green)";
        error_symbol = "[󰍟](fg:red)";
      };

      username = {
        show_always = true;
        format = "[$user ](bg:white fg:black)";
        disabled = true;
      };

      directory = {
        style = "bg:blue fg:black";
        format = "[   $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = " ";
        format = "[[ $symbol $branch ](bg:green fg:black)]($style)";
      };

      git_status = {
        style = "bg:git";
        format = "[[($all_status$ahead_behind )](bg:red fg:black)]($style)";
      };

      cmd_duration = {
        style = "bg:yellow fg:black";
        format = "[ $duration 󰔟 ]($style)";
      };

      direnv = {
        disabled = false;
        symbol = "󱥿 ";
        style = "bg:cyan fg:black";
        format = "[ $symbol$loaded ]($style)";
      };

      time = {
        disabled = false;
        format = "[ $time   ](bg:white fg:black)";
        time_format = "%H:%I";
      };
    };
  };
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = settings.default // {
      add_newline = true;
      palette = lib.mkForce "tokyo-night";

      palettes = {
        tokyo-night = {
          black = "#24283B";
          white = "#A9B1D6";
          red = "#F7768E";
          orange = "#FF9E64";
          yellow = "#E0AF68";
          green = "#41A6B5";
          cyan = "#7DCFFF";
          blue = "#7AA2F7";
          magenta = "#BB9AF7";
          brown = "#D18616";
        };
      };
    };
  };
}
