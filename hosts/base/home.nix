{
  config,
  pkgs,
  lib,
  userSettings,
  inputs,
  ...
}:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";
  home.stateVersion = lib.mkDefault "25.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/overlays
  ];

  home.packages = with pkgs; [
    inputs.astal.packages.${system}.default

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
    zsh-autosuggestions
    zsh-completions

    # Development
    dbeaver-bin
    dbgate
    jetbrains-toolbox
    postman

    # Utilities
    jq
    nixfmt-rfc-style
  ];

  home.file = {
    "container-services/compose.yaml".source =
      ../../modules/home-manager/container/compose.services.yaml;

    # ".scripts" = {
    #   source = ../../modules/home-manager/scripts;
    #   recursive = true;
    #   executable = true;
    # };
  };

  home.sessionVariables = { };

  xdg.enable = true;

  services.ssh-agent.enable = true;

  programs.home-manager.enable = true;
  programs.gpg.enable = true;
  programs.java.enable = true;
}
