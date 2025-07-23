{
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  imports = [
    ./app/browser/chrome.nix
    ./app/dev/neovide.nix
    ./app/dev/vscode.nix
    ./app/terminal/alacritty.nix
    ./app/terminal/kitty.nix
  ];
}
