{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      user = "agus";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          inherit user;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              sharedModules = [ inputs.nvf.homeManagerModules.default ];
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} =
                {
                  config,
                  pkgs,
                  lib,
                  ...
                }:
                import ./modules/nixos/home-manager.nix {
                  inherit
                    config
                    pkgs
                    lib
                    inputs
                    ;
                };
            };
          }
          ./hosts/default
        ];
      };

      nixosConfigurations.qemu = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          inherit user;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              sharedModules = [ inputs.nvf.homeManagerModules.default ];
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} =
                {
                  config,
                  pkgs,
                  lib,
                  ...
                }:
                import ./modules/nixos/home-manager.nix {
                  inherit
                    config
                    pkgs
                    lib
                    inputs
                    ;
                };
            };
          }
          ./hosts/qemu
        ];
      };

      nixosConfigurations.vbox = nixpkgs.lib.nixosSystem {
        specialArgs = inputs // {
          inherit user;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              sharedModules = [ inputs.nvf.homeManagerModules.default ];
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} =
                {
                  config,
                  pkgs,
                  lib,
                  ...
                }:
                import ./modules/nixos/home-manager.nix {
                  inherit
                    config
                    pkgs
                    lib
                    inputs
                    ;
                };
            };
          }
          ./hosts/vbox
        ];
      };
    };
}
