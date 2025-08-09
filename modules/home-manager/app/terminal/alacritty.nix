{ pkgs, lib, ... }:

{
  programs.zellij = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
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
        blur = true;
        option_as_alt = "Both";
      };

      terminal = {
        shell = {
          program = "${pkgs.zellij}/bin/zellij";
        };
      };
    };
  };
}
