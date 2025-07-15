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
    inputs.nixvim.packages.${system}.default

    # Common
    bitwarden-cli
    bitwarden-desktop
    firefox-devedition
    kdePackages.ark
    spotify-player
    tomato-c

    # Terminal, shell and CLI
    bat
    oh-my-zsh
    zsh-autosuggestions
    zsh-completions

    # Development
    dbeaver-bin
    dbgate
    jetbrains-toolbox
    postman
    uv

    # Utilities
    eza
    fzf
    fzf-zsh
    jq
    lazygit
    nix-prefetch-git
    nixfmt-rfc-style
    zoxide
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
