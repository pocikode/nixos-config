{ pkgs, lib, ... }:

{
  #home.packages = [
  #  pkgs.alacritty-theme
  #];

  programs.alacritty = {
    enable = true;
    #theme = "catppuccin_macchiato";
    settings = {
      env = {
        "TERM" = "xterm-256color";
      };

      window = {
        padding = {
          x = 10;
          y = 10;
        };

        decorations = "Buttonless";
        #opacity = 0.7;
        blur = true;
        option_as_alt = "Both";
      };

      #font = {
      #  normal.family = "Agave Nerd Font Mono";
      #  size = 11;
      #};
    };
  };
}
