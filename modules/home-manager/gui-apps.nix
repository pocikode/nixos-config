{
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  imports = [
    ./app/browser/chrome.nix
    ./app/terminal/alacritty.nix
    ./app/terminal/kitty.nix
    ./app/terminal/wezterm.nix
  ];
}
