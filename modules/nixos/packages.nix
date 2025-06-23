{ pkgs, inputs }:
with pkgs;
let
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  _1password-gui # Password manager with a graphical interface

  firefox-devedition # Firefox Developer Edition, a version of Firefox with developer tools and features

  jetbrains-toolbox # JetBrains Toolbox, a tool for managing JetBrains IDEs
]
