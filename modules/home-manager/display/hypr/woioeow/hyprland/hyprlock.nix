{ ... }:

{
  home.file."Pictures.hyprlock.png".source = ../wallpapers/hyprlock.png;

  stylix.targets.hyprlock.useWallpaper = false;

  programs.hyprlock.settings = {
    background = {
      path = "~/Pictures.hyprlock.png";
      blur_passes = 0;
      contrast = 0.8916;
      brightness = 0.8916;
      vibrancy = 0.8916;
      vibrancy_darkness = 0.0;
    };

    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = false;
    };
  };
}
