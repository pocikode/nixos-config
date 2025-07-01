{ ... }:

{
  nixpkgs.overlays = [
    (import ./dbeaver.nix)
  ];
}
