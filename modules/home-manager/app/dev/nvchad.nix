{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      # lsp
      clang-tools
      docker-language-server
      gopls
      lua-language-server
      nil
      pyright
      vscode-langservers-extracted
      yaml-language-server

      # formatters
      nixfmt-rfc-style
      ruff
      stylua
    ];
    hm-activation = true;
    backup = true;
  };
}
