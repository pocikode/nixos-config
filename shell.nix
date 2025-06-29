let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
    zsh
    nixd
    nixfmt-rfc-style
  ];

  GREETING = "Welcome to the Nix shell!";

  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';
}
