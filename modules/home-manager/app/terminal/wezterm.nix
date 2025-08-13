{ lib, ... }:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;

    extraConfig = ''
      return {
        font = wezterm.font { family = 'Agave Nerd Font' },
        font_rules = {
          {
            italic = true,
            font = wezterm.font { family = 'UbuntuMono Nerd Font', style = 'Italic', },
          },
        },

        enable_wayland = true,
        hide_tab_bar_if_only_one_tab = true,
        window_decorations = "NONE",
        window_background_opacity = 0.9,
      }
    '';
  };
}
