{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      scrollback_lines = 8000;
      paste_actions = "quote-urls-at-prompt";
      strip_trailing_spaces = "never";
      select_by_word_characters = "@-./_~?&=%+#";
      show_hyperlink_targets = true;
      remote_kitty = "if-needed";

      # TODO: mouse map

      remember_window_size = true;
      initial_window_width = 640;
      initial_window_height = 400;
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      window_border_width = "0.5pt";

      visual_window_select_characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";

      tab_bar_style = "powerline";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{index}:{'🇿' if layout_name == 'stack' and num_windows > 1 else ''}{title}";

      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;

      background_opacity = "0.95";
      background_blur = 5;

      allow_remote_control = true;

      kitty_mod = "ctrl+shift";
    };
  };
}
