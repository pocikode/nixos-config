{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  imports = [ ];

  home.packages = with pkgs; [
    # Common
    bitwarden-cli
    bitwarden-desktop
    firefox-devedition
    spotify-player

    # Terminal, shell and CLI
    alacritty
    bat
    kitty
    oh-my-zsh
    zsh-completions

    # Development
    dbeaver-bin
    jetbrains-toolbox
    postman

    # Utilities
    jq
    nixfmt-rfc-style
  ];

  home.file = {
    "container-services/compose.yaml".source =
      ../../modules/home-manager/container/compose.services.yaml;
  };

  home.sessionVariables = { };

  xdg.enable = true;

  # gnome settings
  gnome_module.enable = lib.mkDefault true;

  programs.home-manager.enable = true;
  programs.gpg.enable = true;
}
