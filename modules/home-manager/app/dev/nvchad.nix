{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      stylua
      nil
      nixfmt-rfc-style
    ];
    hm-activation = true;
    backup = true;
  };
}
