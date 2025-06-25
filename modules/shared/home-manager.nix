{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
