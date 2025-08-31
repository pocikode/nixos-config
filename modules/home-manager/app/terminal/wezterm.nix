{ lib, ... }:

{
  home.file.".config/wezterm" = {
    source = ./wezterm_config;
    recursive = true;
  };

  home.file.".config/wezterm/backdrops" = {
    source = ../../display/hypr/woioeow/wallpapers;
    recursive = true;
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;

    extraConfig =
      # lua
      ''
        local Config = require('config')

        require('utils.backdrops')
           -- :set_focus('#000000')
           -- :set_images_dir(require('wezterm').home_dir .. '/Pictures/Wallpapers/')
           :set_images()
           :random()

        require('events.left-status').setup()
        require('events.right-status').setup({ date_format = '%a %H:%M:%S' })
        require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })
        require('events.new-tab-button').setup()

        return Config:init()
           :append(require('config.appearance'))
           :append(require('config.bindings'))
           :append(require('config.domains'))
           :append(require('config.fonts'))
           :append(require('config.general'))
           :append(require('config.launch')).options
      '';
  };
}
