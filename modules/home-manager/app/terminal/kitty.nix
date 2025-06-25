{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = lib.mkForce {
    enable = true;
    themeFile = "Catppuccin-Macchiato";

    font = {
      name = "Agave Nerd Font";
      size = 11.0;
      package = pkgs.nerd-fonts.agave;
    };

    settings = {
      font_family = "Agave Nerd Font";
      font_size = 11.0;

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

      symbol_map =
        let
          mappings = [
            "U+23FB-U+23FE"
            "U+2B58"
            "U+E200-U+E2A9"
            "U+E0A0-U+E0A3"
            "U+E0B0-U+E0BF"
            "U+E0C0-U+E0C8"
            "U+E0CC-U+E0CF"
            "U+E0D0-U+E0D2"
            "U+E0D4"
            "U+E700-U+E7C5"
            "U+F000-U+F2E0"
            "U+2665"
            "U+26A1"
            "U+F400-U+F4A8"
            "U+F67C"
            "U+E000-U+E00A"
            "U+F300-U+F313"
            "U+E5FA-U+E62B"
          ];
        in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
    };
  };
}
