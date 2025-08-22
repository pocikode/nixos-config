{
  pkgs,
  lib,
  inputs,
  userSettings,
  ...
}:

{
  imports = [
    ../../modules/home-manager/shell
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";
  home.stateVersion = lib.mkDefault "25.11";

  home.packages = with pkgs; [
    bat
    eza
    fzf
    go
    lua-language-server
    nil
    nixfmt-rfc-style
    nix-prefetch-git
    python313
    uv
    zoxide
  ];

  services.ssh-agent.enable = true;
}
