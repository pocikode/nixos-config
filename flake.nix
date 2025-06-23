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

    hyprland.url = "github:hyprwm/Hyprland";

    python38.url = "github:nixos/nixpkgs/83162ab3b97d0e13b08e28938133381a7515c1e3";
    go_1_19.url = "github:nixos/nixpkgs/160b762eda6d139ac10ae081f8f78d640dd523eb";
    go_1_22.url = "github:nixos/nixpkgs/9a9dae8f6319600fa9aebde37f340975cab4b8c0";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      forSystems =
        f:
        nixpkgs.lib.genAttrs ([
          "x86_64-linux"
          "aarch64-darwin"
        ]) f;

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

      devshell =
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          python38 = inputs.python38.legacyPackages.${system};
          go_1_19 = inputs.go_1_19.legacyPackages.${system};
          go_1_22 = inputs.go_1_22.legacyPackages.${system};
          devShellSrc = import ./user/devshell.nix {
            inherit
              pkgs
              python38
              go_1_19
              go_1_22
              ;
          };
        in
        {
          default = devShellSrc.default;
          python38 = devShellSrc.python38;
          go_1_19 = devShellSrc.go_1_19;
          go_1_22 = devShellSrc.go_1_22;
          go_1_24 = devShellSrc.go_1_24;
        };
    in
    {
      devShells = forSystems devshell;

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

        vbox = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings;
            userSettings = userSettings // {
              useGnome = false;
              useHyprland = true;
            };
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
                      ;
                    userSettings = userSettings // {
                      useGnome = false;
                      useHyprland = true;
                    };
                  };

              };
            }
            ./hosts/vbox
          ];
        };

      };
    };
}
