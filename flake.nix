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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      systemSettings = rec {
        hostname = "pocikode";
        timezone = "Asia/Jakarta";
      };

      userSettings = rec {
        username = "agus";
        name = "Agus Supriyatna";
        email = "aguzsupriyatna7@gmail.com";
        useGnome = true;
        usePlasma = false;
        useHyprland = false;
      };
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                sharedModules = [ inputs.nvf.homeManagerModules.default ];
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userSettings.username} =
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
                      systemSettings
                      userSettings
                      ;
                  };
              };
            }
            ./hosts/workstation
          ];
        };
      };
    };
}
