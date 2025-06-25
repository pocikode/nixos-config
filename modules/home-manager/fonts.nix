{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-extra

    # Nerd fonts
    nerd-fonts.agave
  ];
}
