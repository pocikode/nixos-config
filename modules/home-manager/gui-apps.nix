{
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  imports = [
    ./app/browser/chrome.nix
    ./app/dev/vscode.nix
    ./app/terminal/kitty.nix
  ];
}
